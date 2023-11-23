using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
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
using System.Windows;
using Microsoft.UI.Xaml.Controls;

namespace MyShop.ViewModel
{
    class CategoryViewModel : INotifyPropertyChanged
    {
        public BindingList<Category> categories { get; set; }
        public BindingList<Category> temp = new BindingList<Category>();
        public int _rowsPerPage { get; set; }
        public int _totalPages { get; set; }
        public int _totalItems { get; set; }
        public int _currentPage { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;
         public string mess { get; set; }
        public string keyword {  get; set; }
        public bool? isShowProgressBar { get; set; }


       
        public CategoryViewModel()
        {
            //categories = new BindingList<Category>();
            keyword = "";
            _rowsPerPage = 10;
            _totalPages = -1;
            _totalItems = -1;
            _currentPage = 1;
            isShowProgressBar = false;
            loadData();
        }
        public async void loadData()
        {
            isShowProgressBar = true;
            temp = await Task.Run(() => { return api.getAllCategory(); });
            isShowProgressBar = false;
            loadDataByPage();
        }

        public async void loadDataByPage()
        {
            _totalItems = temp.Count;
            _totalPages = (_totalItems / _rowsPerPage);
            if (_totalItems % _rowsPerPage != 0)
            {
                _totalPages++;
            }
             categories = new BindingList<Category>();
            for (int i = (_currentPage - 1) * _rowsPerPage; i < (_currentPage - 1) * _rowsPerPage + _rowsPerPage; i++)
            {
                if (i >= temp.Count)
                {
                    break;
                }
                categories.Add(temp[i]);
            }
        }

        HandleAPI api = new HandleAPI();
     

        public async void deleteCategory(string id)
        {
            mess = "";
            var (success, message) = await api.deleteCate(id);
            isShowProgressBar = true;
            temp = await Task.Run(() => { return api.getAllCategory(); });
            isShowProgressBar = false;
            loadDataByPage();
            mess = message;
        }
        public void next()
        {
            if (_currentPage < _totalPages)
            {
                _currentPage++;
                loadDataByPage();
            }
        }
        public void pre()
        {
            if (_currentPage > 1)
            {
                _currentPage--;
                loadDataByPage();
            }
        }
        public async void search()
        {
       
            isShowProgressBar = true;
            BindingList<Category> arr = await Task.Run(() => { return api.getAllCategory(); });
            isShowProgressBar = false;
            temp = new BindingList<Category>();
            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i].tenloai.Contains(keyword, StringComparison.OrdinalIgnoreCase))
                {
                    temp.Add(arr[i]);
                }
            }
            loadDataByPage();
        }


        /// get cell value
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

        public async void importDataFromExcel()
        {
            // Open dialog and choose file excel
            OpenFileDialog openFile = new OpenFileDialog();
            openFile.Filter = "Excel Files|*.xls;*.xlsx;*.xlsm";
            var dialogResult = openFile.ShowDialog();
            if (dialogResult == false) return;

            // read data from file excel
            DataTable table = readEx(openFile.FileName, "Category");

            // add data to database
            isShowProgressBar = true;
          //  var temp = "";
            var isSuccess = true;
            var temp = "";
            foreach (DataRow row in table.Rows)
            {
                Category cate = new Category()
                {
                    maloai = row["maloai"].ToString(),
                    tenloai = row["tenloai"].ToString()
                };

               // temp += cate.maloai + " " + cate.tenloai + " ";
                var (success, mess) = await api.addCategory(cate);
                isSuccess = isSuccess && success;
            }
           // mess = temp;
            isShowProgressBar = false;
            if(isSuccess)
            {
                mess = "Import thành công";
                System.Threading.Thread.Sleep(2000);
                loadData();
            }
            else
            {
                mess = "Import thất bại";
            }

        }
    }
}
