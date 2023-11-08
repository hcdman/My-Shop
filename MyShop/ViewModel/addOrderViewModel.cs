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

        public ICommand addOrder { get; set; }

        public addOrderViewModel()
        {
            order = new Order();
            isShowProgres = false;
            addOrder = new relayCommand(handleAdd, canAdd);
        }


        public bool canAdd(object obj)
        {
            return true;
        }

        HandleAPI api = new HandleAPI();
        public void handleAdd(object obj)
        {
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
