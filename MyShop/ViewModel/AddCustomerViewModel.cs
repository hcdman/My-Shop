using MyShop.API;
using MyShop.Model;
using MyShop.ViewModel.command;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.System;

namespace MyShop.ViewModel
{
    class AddCustomerViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public bool isShowProgres { get; set; }   

        public string mess { get; set; }
        public Customer cus { get; set; }

        public ICommand addCus {  get; set; }   

        public AddCustomerViewModel()
        {
            cus = new Customer();
            isShowProgres = false;  
            cus.ngsinh = "yyyy-MM-dd";
            cus.ngdk = "yyyy-MM-dd";
            addCus = new relayCommand(handleAdd, canAdd);
        }
        

        public bool canAdd(object obj)
        {
            return true;
        }

        HandleAPI api = new HandleAPI();
        public void handleAdd(object obj)
        {
            addCusTomer(cus);
        }
     
        public async void addCusTomer(Customer cus)
        {
            mess = "";
            isShowProgres = true;
           var (success, message) = await api.addCustomer(cus);
            mess = message;
            isShowProgres = false;
            
        }
    }
}
