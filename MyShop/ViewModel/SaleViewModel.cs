using MyShop.Model;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{
    class SaleViewModel : INotifyCollectionChanged
    {
        private List<Sales> _sales;
        public List<Sales> Saless
        {
            get { return _sales; }
            set { _sales = value; }
        }
        public SaleViewModel(string check)
        {
            if (check == "year")
            {
                Saless = Sales.Saless("year");
            }
            else if (check == "month")
            {

                Saless = Sales.Saless("month");
            }
            else
            {

                Saless = Sales.Saless("week");
            }
        }
        public event NotifyCollectionChangedEventHandler CollectionChanged;
    }
}
