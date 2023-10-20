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
        private List<Order> _orders;
        public List<Order> Orders
        { get { return _orders; }
            set { _orders = value; }
        }
        public OrdersViewModel()
        {
            Orders = Order.Orders();
        }
        public event PropertyChangedEventHandler PropertyChanged;
    }
}
