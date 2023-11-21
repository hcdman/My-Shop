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
        public SaleViewModel(string check, int currentDay, int currentMonth, int currentYear)
        {
            loadData(check, currentDay, currentMonth, currentYear);
        }

        public async void loadData(string check, int currentDay, int currentMonth, int currentYear)
        {
            if (check == "year")
            {
                Saless = await Sales.Saless("year", currentDay, currentMonth, currentYear);
            }
            else if (check == "month")
            {
                Saless = await Sales.Saless("month", currentDay, currentMonth, currentYear);
            }
            else
            {
                Saless = await Sales.Saless("week", currentDay, currentMonth, currentYear);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}