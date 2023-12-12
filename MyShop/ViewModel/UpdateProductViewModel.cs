﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Win32;
using MyShop.API;
using MyShop.Model;

namespace MyShop.ViewModel
{
    class UpdateProductViewModel : ObservableObject
    {
        private string _id;
        public string Id
        {
            get
            {
                return _id;
            }
            set
            {
                SetProperty(ref _id, value);
                OnPropertyChanged(nameof(Id));
            }
        }

        private string _name;
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                SetProperty(ref _name, value);
                OnPropertyChanged(nameof(Name));
            }
        }

        private int _price;
        public int Price
        {
            get
            {
                return _price;
            }
            set
            {
                SetProperty(ref _price, value);
                OnPropertyChanged(nameof(Price));
            }
        }

        private int _cost;
        public int Cost
        {
            get
            {
                return _cost;
            }
            set
            {
                SetProperty(ref _cost, value);
                OnPropertyChanged(nameof(Cost));
            }
        }

        private string _manufactuer;
        public string Manufactuer
        {
            get
            {
                return _manufactuer;
            }
            set
            {
                SetProperty(ref _manufactuer, value);
                OnPropertyChanged(nameof(Manufactuer));
            }
        }

        private int _quantity;
        public int Quantity
        {
            get
            {
                return _quantity;
            }
            set
            {
                SetProperty(ref _quantity, value);
                OnPropertyChanged(nameof(Quantity));
            }
        }

        private int _discount;
        public int Discount
        {
            get
            {
                return _discount;
            }
            set
            {
                SetProperty(ref _discount, value);
                OnPropertyChanged(nameof(Discount));
            }
        }

        private TypeProduct _type;
        public TypeProduct Type
        {
            get
            {
                return _type;
            }
            set
            {
                SetProperty(ref _type, value);
                OnPropertyChanged(nameof(Type));
            }
        }

        private string _mess;
        public string Mess
        {
            get
            {
                return _mess;
            }
            set
            {
                SetProperty(ref _mess, value);
                OnPropertyChanged(nameof(Mess));
            }
        }

        private string _image;
        public string Image
        {
            get
            {
                return _image;
            }
            set
            {
                SetProperty(ref _image, value);
                OnPropertyChanged(nameof(Image));
            }
        }

        private bool _isLoading;
        public bool IsLoading
        {
            get
            {
                return _isLoading;
            }
            set
            {
                SetProperty(ref _isLoading, value);
                OnPropertyChanged(nameof(IsLoading));
            }
        }

        private BindingList<TypeProduct> _allType;
        public BindingList<TypeProduct> AllType
        {
            get
            {
                return _allType;
            }
            set
            {
                SetProperty(ref _allType, value);
                OnPropertyChanged(nameof(AllType));
            }
        }
        HandleAPI api = new HandleAPI();
        public static async Task<UpdateProductViewModel> CreateAsync(Product pro)
        {
            var viewModel = new UpdateProductViewModel();
            await viewModel.InitializeAsync(pro);
            return viewModel;
        }
        public UpdateProductViewModel()
        {
            IsLoading = false;
            Mess = "";
            Type = new TypeProduct();
            Id = Name = Manufactuer = Image = "";
            Price = Cost = 0; // Set default values as needed
        }
        private async Task InitializeAsync(Product pro)
        {
            string ml = null;
            if (pro != null)
            {
                Id = pro.masp;
                Name = pro.tensp;
                Manufactuer = pro.hangsx;
                Image = pro.anh;
                Price = pro.gia / 100 * 100 / (100 - pro.giamgia) * 100;
                Cost = pro.gia_goc;
                Quantity = pro.sl;
                ml = pro.maloai;
                Discount = pro.giamgia;
            }

            await AddProductPageViewModel_Loaded(ml);
        }

        private async Task AddProductPageViewModel_Loaded(string ml)
        {
            ListTypeProduct listTypeProduct = await api.GetAllType();
            AllType = new BindingList<TypeProduct>();
            foreach (var item in listTypeProduct.data)
            {
                AllType.Add(item);
                if (ml != null && ml.Equals(item.maloai))
                {
                    Type.maloai = item.maloai;
                    Type.tenloai = item.tenloai;
                }
            }

        }

        private readonly RelayCommand _loadImage;
        public RelayCommand LoadImage
        {
            get
            {
                return _loadImage ?? (new RelayCommand(() => selectImage()));
            }
        }

        private void selectImage()
        {
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = "Images only. | *.jpg; *.jpeg; *.png; *.gif;";

            var dialogResult = openFile.ShowDialog();

            Image = "";
            if (dialogResult == true)
                Image = openFile.FileName;
            else return;

        }

        public async Task<bool> updateProduct()
        {
            if (Image == "")
            {
                Mess = "Chưa có ảnh";
                return false;
            }
            Mess = "";
            IsLoading = true;
            Product product = new Product()
            {
                masp = Id,
                anh = Image,
                tensp = Name,
                hangsx = Manufactuer,
                gia_goc = Cost,
                gia = Price,
                sl = Quantity,
                maloai = Type.maloai,
                giamgia = Discount
            };
            using StringContent jsonContent = new(
            JsonSerializer.Serialize(product),
            Encoding.UTF8,
                "application/json");

            var content = new MultipartFormDataContent();
            // Thêm tệp ảnh vào nội dung multipart lay tu local
            if (!Image.Contains("http"))
            {
                var imageContent = new StreamContent(System.IO.File.OpenRead(_image));
                imageContent.Headers.ContentDisposition = new ContentDispositionHeaderValue("form-data")
                {
                    Name = "file",
                    FileName = "image.jpg"
                };
                content.Add(imageContent);
            }

            // Thêm các tham số khác nếu cần
            content.Add(jsonContent, "data");
            bool success = false;
            (success, Mess) = await api.UpdateProduct(content, Id);
            IsLoading = false;
            return success;
        }
    }
}