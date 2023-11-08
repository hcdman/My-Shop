using MyShop.API;
using MyShop.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

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
    }
}
