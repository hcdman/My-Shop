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

     

        public AddCustomerViewModel()
        {
            cus = new Customer();
            isShowProgres = false;  
            cus.ngsinh = "yyyy-MM-dd";
            cus.ngdk = "yyyy-MM-dd";
          
        }
        

        public Task<bool> addCustomer(DateTime d1, DateTime d2)
        {
            cus.ngsinh = d1.Year + "-" + d1.Month + "-" + d1.Day;
            cus.ngdk = d2.Year + "-" + d2.Month + "-" + d2.Day;

            return addCusTomer(cus);   
        }

        HandleAPI api = new HandleAPI();

     
        public async Task<bool> addCusTomer(Customer cus)
        {
            mess = "";
            isShowProgres = true;
           var (success, message) = await api.addCustomer(cus);
            mess = message;
            isShowProgres = false;
            return success;
            
        }
    }
}
