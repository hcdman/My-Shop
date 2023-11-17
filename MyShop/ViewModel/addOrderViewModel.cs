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

namespace MyShop.ViewModel
{
    public class addOrderViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        public bool isShowProgres { get; set; }

        public string mess { get; set; }
        public Order order { get; set; }

      

        public addOrderViewModel()
        {
            order = new Order();
            isShowProgres = false;
            
        }


    

        HandleAPI api = new HandleAPI();
        public void addOneOrder(DateTime date)
        {
            order.nghd = date.Year + "-" + date.Month + "-"  + date.Day;
            add_Order(order);

        }

        public async void add_Order(Order order)
        {
            mess = "";
            // mess = order.makh + " " + order.nghd + order.trigia;
            isShowProgres = true;
            var (success, message) = await api.addOrder(order);
            mess = message;
            isShowProgres = false;
        }
    }
}
