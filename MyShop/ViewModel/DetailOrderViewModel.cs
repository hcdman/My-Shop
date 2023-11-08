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
    public class DetailOrderViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public int _rowsPerPage { get; set; }
        public int _totalPages { get; set; }
        public int _totalItems { get; set; }
        public int _currentPage { get; set; }
        public BindingList<DetailOrderAndProduct> detailOrderProduct { get; set; }

        public BindingList<DetailOrderAndProduct> temp = new BindingList<DetailOrderAndProduct>();


        public string? mess { get; set; }
        public string? keyword { get; set; }
        public bool? isShowProgressBar { get; set; }

        public int sohd { get; set; }   

        public DetailOrderViewModel(int sohd)
        {

            //customers.Add(new Customer() {makh = "KH01", hoten = "Le Minh Hoang", dchi = "Khanh Hoa", email = "leminhhoang123456sds", ngdk = "21/212/12" , ngsinh = "21/21/21", sodt = "0213231231"});
            keyword = "";
            _rowsPerPage = 10;
            _totalPages = -1;
            _totalItems = -1;
            _currentPage = 1;
            isShowProgressBar = false;
            // addCus = new RelayCommand(handleAdd,canAdd);
            this.sohd = sohd;
            //mess = "le minh hoang";
            // renderData();
            loadData();
          
        }

        public async void loadData()
        {
            isShowProgressBar = true;
            temp = await Task.Run(() => { return api.getDetailOrderByID(sohd.ToString()); });
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
            detailOrderProduct = new BindingList<DetailOrderAndProduct>();
            for (int i = (_currentPage - 1) * _rowsPerPage; i < (_currentPage - 1) * _rowsPerPage + _rowsPerPage; i++)
            {
                if (i >= temp.Count)
                {
                    break;
                }
                detailOrderProduct.Add(temp[i]);
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


        public async void deleteDetaiOrder(int id_cthd, int id_order)
        {
            mess = "";
            var (success, message) = await api.deleteDetailOrder(id_cthd.ToString());
            isShowProgressBar = true;
            temp = await Task.Run(() => { return api.getDetailOrderByID(id_order.ToString()); });
            isShowProgressBar = false;
            loadDataByPage();
            mess = message;
        }
        HandleAPI api = new HandleAPI();
    }
}
