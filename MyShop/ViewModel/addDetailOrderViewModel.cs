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
    public class addDetailOrderViewModel : INotifyPropertyChanged
    {
        public DetailOrder detailOrder { get; set; }
        public event PropertyChangedEventHandler PropertyChanged;
        public bool isShowProgres { get; set; }

        public string mess { get; set; }
        public ICommand addDetailOrder { get; set; }

        public addDetailOrderViewModel()
        {
            detailOrder = new DetailOrder();
            isShowProgres = false;
            addDetailOrder = new relayCommand(handleAdd, canAdd);
        }


        public bool canAdd(object obj)
        {
            return true;
        }

        HandleAPI api = new HandleAPI();
        public void handleAdd(object obj)
        {
            add_detaiOrder(detailOrder);
        }

        public async void add_detaiOrder(DetailOrder detail_order)
        {
            mess = "";
            // mess = order.makh + " " + order.nghd + order.trigia;
            isShowProgres = true;
            var (success, message) = await api.addOrderDetail(detail_order);
            mess = message;
            isShowProgres = false;
        }
    }
}
