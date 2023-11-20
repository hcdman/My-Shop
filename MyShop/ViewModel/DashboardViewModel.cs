using CommunityToolkit.Mvvm.ComponentModel;
using MyShop.API;
using MyShop.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{
    internal class DashboardViewModel : ObservableObject
    {
        HandleAPI api = new HandleAPI();

        private BindingList<Product> _most5List;
        public BindingList<Product> Most5List
        {
            get
            {
                return _most5List;
            }
            set
            {
                SetProperty(ref _most5List, value);
                OnPropertyChanged(nameof(Most5List));
            }
        }

        private BindingList<DashboardItem> _dashboard;
        public BindingList<DashboardItem> Dashboard
        {
            get
            {
                return _dashboard;
            }
            set
            {
                SetProperty(ref _dashboard, value);
                OnPropertyChanged(nameof(Dashboard));
            }
        }

        private string _inStock;
        public string InStock
        {
            get
            {
                return _inStock;
            }
            set
            {
                SetProperty(ref _inStock, value);
                OnPropertyChanged(nameof(InStock));
            }
        }

        private string _newOrder;
        public string NewOrder
        {
            get
            {
                return _newOrder;
            }
            set
            {
                SetProperty(ref _newOrder, value);
                OnPropertyChanged(nameof(NewOrder));
            }
        }

        private int _moneyToday;
        public int MoneyToday
        {
            get
            {
                return _moneyToday;
            }
            set
            {
                SetProperty(ref _moneyToday, value);
                OnPropertyChanged(nameof(MoneyToday));
            }
        }

        public DashboardViewModel()
        {
            DashboardViewModel_Loaded();
        }

        private async void DashboardViewModel_Loaded()
        {
            ListProduct products = await api.GetAllProduct();
            ListProduct _tmp = await api.GetTop5();
            DashboardItemList _db = await api.GetLatestOrder();
            int _tt = await api.GetNumNewOrderW();
            NewOrder = _tt + " New Order";
            MoneyToday = await api.GetMoneyCurrentDay();

            Most5List = new BindingList<Product>();
            Dashboard = new BindingList<DashboardItem>();


            for (int i = 0; i < _db.bill.Count; i++)
                _db.bill[i].Id = i + 1;

            foreach (var item in _tmp.product) 
            {
                if (item.giamgia > 0) item.gia = item.gia - item.gia * item.giamgia / 100;
                Most5List.Add(item);
            } 

            foreach (var item in _db.bill) Dashboard.Add(item);

            InStock = products.product.Count().ToString() + " Products";
        }

    }
}
