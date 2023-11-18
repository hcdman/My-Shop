using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MyShop.API;
using MyShop.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MyShop.ViewModel
{
    internal class ProductPageViewModel : ObservableObject
    {
        HandleAPI api = new HandleAPI();

        private List<Product> _tmpProducts = new List<Product>();

        private BindingList<Product> _products;
        public BindingList<Product> Products
        {
            get { return _products; }
            set
            {
                SetProperty(ref _products, value);
                OnPropertyChanged(nameof(Products));
            }
        }

        private string _searchName;
        public string SearchName
        {
            get { return _searchName; }
            set
            {
                SetProperty(ref _searchName, value);
                OnPropertyChanged(nameof(SearchName));
            }
        }

        private string _option1;
        public string Option1
        {
            get { return _option1; }
            set
            {
                SetProperty(ref _option1, value);
                OnPropertyChanged(nameof(Option1));
            }
        }

        private string _option2;
        public string Option2
        {
            get { return _option2; }
            set
            {
                SetProperty(ref _option2, value);
                OnPropertyChanged(nameof(Option2));
            }
        }

        private readonly RelayCommand _filter;
        public RelayCommand Filter
        {
            get
            {
                return _filter ?? (new RelayCommand(() => FilterFunc()));
            }
        }

        private readonly RelayCommand _clearFilter;
        public RelayCommand ClearFilter
        {
            get
            {
                return _clearFilter ?? (new RelayCommand(() => ClearFilterFunc()));
            }
        }

        private readonly RelayCommand _prev;
        public RelayCommand Prev
        {
            get
            {
                return _prev ?? (new RelayCommand(() => NewPage(-1)));
            }
        }

        private readonly RelayCommand _next;
        public RelayCommand Next
        {
            get
            {
                return _next ?? (new RelayCommand(() => NewPage(1)));
            }
        }

        public ProductPageViewModel()
        {
            SelectOption1 = new BindingList<string>();
            SelectOption1.Add("Below 2.000.000");
            SelectOption1.Add("2.000.000 - 3.999.999");
            SelectOption1.Add("4.000.000 - 6.999.999");
            SelectOption1.Add("7.000.000 - 12.999.999");
            SelectOption1.Add("13.000.000 - 20.000.000");
            SelectOption1.Add("Over 20.000.000");

            SelectOption2 = new BindingList<string>();
            SelectOption2.Add("Hot");
            SelectOption2.Add("Price descending");
            SelectOption2.Add("Price ascending");

            Option1 = SearchName = Option2 = "";
            Type = new TypeProduct();
            Type.maloai = "";
            Page = 1;
            PerPage = 15;
            ProductPageViewModel_Loaded();
        }

        private BindingList<string> _selectOption1;
        public BindingList<string> SelectOption1
        {
            get { return _selectOption1; }
            set
            {
                SetProperty(ref _selectOption1, value);
                OnPropertyChanged(nameof(SelectOption1));
            }
        }

        private BindingList<string> _selectOption2;
        public BindingList<string> SelectOption2
        {
            get { return _selectOption2; }
            set
            {
                SetProperty(ref _selectOption2, value);
                OnPropertyChanged(nameof(SelectOption2));
            }
        }

        private TypeProduct _type;
        public TypeProduct Type
        {
            get { return _type; }
            set
            {
                SetProperty(ref _type, value);
                OnPropertyChanged(nameof(Type));
            }
        }

        private BindingList<TypeProduct> _allType;
        public BindingList<TypeProduct> AllType
        {
            get { return _allType; }
            set
            {
                SetProperty(ref _allType, value);
                OnPropertyChanged(nameof(AllType));
            }
        }

        private int _perPage;
        public int PerPage
        {
            get { return _perPage; }
            set
            {
                SetProperty(ref _perPage, value);
                OnPropertyChanged(nameof(PerPage));
            }
        }

        private int TotalPage;
        private int Page;
        private int TotalItem;

        private string _page2k;
        public string Page2k
        {
            get { return _page2k; }
            set
            {
                SetProperty(ref _page2k, value);
                OnPropertyChanged(nameof(Page2k));
            }
        }

        private async void ProductPageViewModel_Loaded()
        {
            FilterFunc();

            ListTypeProduct listTypeProduct = await api.GetAllType();
            AllType = new BindingList<TypeProduct>();
            foreach (var item in listTypeProduct.data)
                AllType.Add(item);
        }

        public async void FilterFunc(bool reload = true)
        {
            if (reload) Page = 1;
            ListProduct products = await api.Filter(SearchName, Option1, maloai: Type.maloai, SortBy: Option2, per_page: PerPage, page: Page);
            Products = new BindingList<Product>();
            foreach (var item in products.product)
            {
                Products.Add(item);
                _tmpProducts.Add(item);
            }
            if (products.product.Count > 0) TotalItem = products.product[0].Total;
            else { TotalItem = Page = 0; }

            TotalPage = (TotalItem / PerPage) + (((TotalItem % PerPage) == 0) ? 0 : 1);
            Page2k = Page + "/" + TotalPage;
        }

        private void ClearFilterFunc()
        {
            Option1 = Option2 = null;
            Type = null;
            Option1 = Option2 = "";
            Type = new TypeProduct();
            Type.maloai = "";
            FilterFunc();
        }

        private void NewPage(int num)
        {
            if (num == 1 && Page == TotalPage) return;
            if (num == -1 && Page == 1) return;
            Page += num;
            FilterFunc(false);
        }
    }
}
