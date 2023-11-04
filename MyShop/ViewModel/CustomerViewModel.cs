using MyShop.API;
using MyShop.Model;
using System;
using System.ComponentModel;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{

    public class CustomerViewModel : INotifyPropertyChanged
    {

        public int _rowsPerPage {get; set; }
        public int _totalPages { get; set; }
        public int _totalItems { get; set; }
        public int _currentPage { get; set; }
        public BindingList<Customer> customers { get; set; }
        public BindingList<Customer> temp = new BindingList<Customer>(); 
       // public ICommand addCus {get; set;}
       

        public string? mess  {  get; set;}
        public string? keyword { get; set;}     
        public bool? isShowProgressBar {  get; set; }   
 
        public  CustomerViewModel() {
            
            //customers.Add(new Customer() {makh = "KH01", hoten = "Le Minh Hoang", dchi = "Khanh Hoa", email = "leminhhoang123456sds", ngdk = "21/212/12" , ngsinh = "21/21/21", sodt = "0213231231"});
            keyword = "";
            _rowsPerPage = 10;
            _totalPages = -1; 
            _totalItems = -1;
            _currentPage = 1;
            isShowProgressBar = false;
            // addCus = new RelayCommand(handleAdd,canAdd);

            //mess = "le minh hoang";
            // renderData();
            loadData();
        }

        public async void loadData()
        {
            isShowProgressBar = true;
            temp = await Task.Run(() =>  { return api.GetAllCustomer(); });
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
            customers = new BindingList<Customer>();
            for (int i = (_currentPage - 1) * _rowsPerPage; i < (_currentPage - 1) * _rowsPerPage + _rowsPerPage; i++)
            {
                if(i >= temp.Count)
                {
                    break;
                }
                customers.Add(temp[i]);
            }
        }

        public void next()
        {
            if(_currentPage < _totalPages)
            {
                _currentPage++;
                loadDataByPage();
            }
        }
        public void pre()
        {
            if(_currentPage > 1)
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


        public async void deleteCustomer(string id)
        {
            mess = "";
            var (success, message) = await api.deleteCustomer(id);
            isShowProgressBar = true;
            temp =  await Task.Run(() => { return api.GetAllCustomer(); });
            isShowProgressBar = false;
            loadDataByPage();
            mess = message;
           // System.Threading.Thread.Sleep(3000);
           // mess = "";
        }
        public async void search()
        {
            isShowProgressBar = true;
            BindingList<Customer> arr = await Task.Run(() => { return api.GetAllCustomer(); }) ;
            isShowProgressBar = false;
            temp = new BindingList<Customer>();   
            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i].hoten.Contains(keyword, StringComparison.OrdinalIgnoreCase))
                {
                    temp.Add(arr[i]);
                }
            }
            loadDataByPage() ;
        }
    }
    
}
