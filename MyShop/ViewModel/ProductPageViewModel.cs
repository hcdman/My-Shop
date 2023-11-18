using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Win32;
using MyShop.API;
using MyShop.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Input;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;

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


        // import data from excel file
        private readonly RelayCommand _import;
        public RelayCommand Import
        {
            get
            {
                return _import ?? (new RelayCommand(() => importDataFromExcel()));
            }
        }

        // read excel file
        private static string GetCellValue(SpreadsheetDocument document, Cell cell)
        {
            SharedStringTablePart stringTablePart = document.WorkbookPart.SharedStringTablePart;
            string value = cell.CellValue.InnerXml;

            if (cell.DataType != null && cell.DataType.Value == CellValues.SharedString)
            {
                return stringTablePart.SharedStringTable.ChildElements[Int32.Parse(value)].InnerText;
            }
            else
            {
                return value;
            }
        }

        private DataTable readEx(string filename, string sheetName)
        {
            DataTable dataTable = new DataTable();
            using (SpreadsheetDocument spreadSheetDocument = SpreadsheetDocument.Open(filename, false))
            {
                WorkbookPart workbookPart = spreadSheetDocument.WorkbookPart;
                IEnumerable<Sheet> sheets = spreadSheetDocument.WorkbookPart.Workbook.GetFirstChild<Sheets>().Elements<Sheet>();

                var sheet = sheets.FirstOrDefault(s => s.Name == sheetName);
                string relationshipId = sheet.Id.Value;
                WorksheetPart worksheetPart = (WorksheetPart)spreadSheetDocument.WorkbookPart.GetPartById(relationshipId);
                Worksheet workSheet = worksheetPart.Worksheet;
                SheetData sheetData = workSheet.GetFirstChild<SheetData>();
                IEnumerable<Row> rows = sheetData.Descendants<Row>();

                foreach (Cell cell in rows.ElementAt(0))
                {
                    dataTable.Columns.Add(GetCellValue(spreadSheetDocument, cell));
                }

                foreach (Row row in rows)
                {
                    DataRow dataRow = dataTable.NewRow();
                    for (int i = 0; i < row.Descendants<Cell>().Count(); i++)
                    {
                        dataRow[i] = GetCellValue(spreadSheetDocument, row.Descendants<Cell>().ElementAt(i));
                    }

                    dataTable.Rows.Add(dataRow);
                }

            }
            dataTable.Rows.RemoveAt(0);

            return dataTable;
        }

        private async void importDataFromExcel()
        {
            // Open dialog and choose file excel
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = "Excel Files|*.xls;*.xlsx;*.xlsm";
            var dialogResult = openFile.ShowDialog();
            if (dialogResult == false) return;

            // read data from file excel
            DataTable table = readEx(openFile.FileName, "Product");

            // add data to database
            foreach (DataRow row in table.Rows)
            {
                string anh = row["anh"].ToString();
                Product product = new Product()
                {
                    masp = row["masp"].ToString(),
                    anh = anh,
                    tensp = row["tensp"].ToString(),
                    hangsx = row["hangsx"].ToString(),
                    gia_goc = int.Parse(row["gia_goc"].ToString()),
                    gia = int.Parse(row["gia"].ToString()),
                    sl = int.Parse(row["sl"].ToString()),
                    maloai = row["maloai"].ToString(),
                    giamgia = int.Parse(row["giamgia"].ToString())
                };

                using StringContent jsonContent = new(
                JsonSerializer.Serialize(product),
                Encoding.UTF8,
                    "application/json");

                var content = new MultipartFormDataContent();

                // Thêm tệp ảnh vào nội dung multipart
                var imageContent = new StreamContent(System.IO.File.OpenRead(anh));
                imageContent.Headers.ContentDisposition = new ContentDispositionHeaderValue("form-data")
                {
                    Name = "file",
                    FileName = "image.jpg"
                };
                content.Add(imageContent);
                // Thêm các tham số khác nếu cần
                content.Add(jsonContent, "data");

                var (success, mess) = await api.AddNewProduct(content);
                // load page
                if (success) FilterFunc();
            }
        }
    }
}
