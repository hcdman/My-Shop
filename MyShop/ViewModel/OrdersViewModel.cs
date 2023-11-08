using MyShop.API;
using MyShop.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{
    class OrdersViewModel : INotifyPropertyChanged
    {
        public int _rowsPerPage { get; set; }
        public int _totalPages { get; set; }
        public int _totalItems { get; set; }
        public int _currentPage { get; set; }
        public BindingList<Order> orders { get; set; }
        public BindingList<Order> temp = new BindingList<Order>();
        // public ICommand addCus {get; set;}

        public string start_date { get; set; }
        public string end_date { get; set; }    

        public string? mess { get; set; }
        public string? keyword { get; set; }
        public bool? isShowProgressBar { get; set; }

        public OrdersViewModel()
        {

            //customers.Add(new Customer() {makh = "KH01", hoten = "Le Minh Hoang", dchi = "Khanh Hoa", email = "leminhhoang123456sds", ngdk = "21/212/12" , ngsinh = "21/21/21", sodt = "0213231231"});
            keyword = "";
            start_date = "";
            end_date = "";
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
            temp = await Task.Run(() => { return api.getAllOrder();});
            isShowProgressBar = false;
            loadDataByPage();
        }
        public async void loadDataByPage()
        {
            mess = temp.Count + "";
            _totalItems = temp.Count;
            _totalPages = (_totalItems / _rowsPerPage);
            if (_totalItems % _rowsPerPage != 0)
            {
                _totalPages++;
            }
            orders = new BindingList<Order>();
            for (int i = (_currentPage - 1) * _rowsPerPage; i < (_currentPage - 1) * _rowsPerPage + _rowsPerPage; i++)
            {
                if (i >= temp.Count)
                {
                    break;
                }
                orders.Add(temp[i]);
            }
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

        /* public async A renderData()
         {
           //listCustomer rs = await api.GetAllCustomer();
           // mess = await api.GetAllCustomer(); 
            temp = await api.GetAllCustomer();
         }*/


        HandleAPI api = new HandleAPI();

        public event PropertyChangedEventHandler PropertyChanged;


        public async void deleteOrder(string id)
        {
            mess = "";
            var (success, message) = await api.deleteOrder(id);
            isShowProgressBar = true;
            temp = await Task.Run(() => { return api.getAllOrder(); });
            isShowProgressBar = false;
            loadDataByPage();
            mess = message;
      
        }

        
        public async void search()
        {
            isShowProgressBar = true;
            BindingList<Order> arr = await Task.Run(() => { return api.getAllOrder(); });
            isShowProgressBar = false;
            temp = new BindingList<Order>();
            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i].makh.Contains(keyword, StringComparison.OrdinalIgnoreCase))
                {
                    temp.Add(arr[i]);
                }
            }
            loadDataByPage();
        }

        public async void filterByDate()
        {
            isShowProgressBar = true;
            BindingList<Order> arr = await Task.Run(() => { return api.getAllOrder(); });
            isShowProgressBar = false;
            temp = new BindingList<Order>();
            for (int i = 0; i < arr.Count; i++)
            {
                DateTime dateHD = DateTime.Parse(arr[i].nghd);
                DateTime dateStart = DateTime.Parse(start_date);
                DateTime dateEnd = DateTime.Parse(end_date);

                if (dateHD >= dateStart && dateHD <= dateEnd)
                {
                    temp.Add(arr[i]);
                }
            }
            loadDataByPage();
        }

        public void removeFilter()
        {
            start_date = end_date = "";
            loadData();
        }




    }
}
