using MyShop.Model;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{
    class SaleViewModel : INotifyPropertyChanged
    {
        private List<Sales> _sales;
        public List<Sales> Saless
        {
            get { return _sales; }
            set { _sales = value; }
        }
        public SaleViewModel(string check)
        {
            loadData(check);
        }

        public async void loadData(string check)
        {
            if (check == "year")
            {
                Saless = await Sales.Saless("year");
            }
            else if (check == "month")
            {
                Saless = await Sales.Saless("month");
            }
            else
            {
                Saless = await Sales.Saless("week");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}