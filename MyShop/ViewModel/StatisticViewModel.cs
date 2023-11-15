using MyShop.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace MyShop.ViewModel
{

    class StatisticViewModel : INotifyPropertyChanged
    {
        private List<Revenue> _revenues;
        public List<Revenue> Revenues
        {
            get { return _revenues; }
            set { _revenues = value; }
        }


        public StatisticViewModel(string check, string page, int currentDay, int currentMonth, int currentYear)
        {
           loadData(check, page, currentDay, currentMonth, currentYear);
        }

        public async void loadData(string check, string page, int currentDay, int currentMonth, int currentYear)
        {
            if (check == "year")
            {
                Revenues = await Revenue.Revenues("year", page, currentDay, currentMonth, currentYear);
            }
            else if (check == "month")
            {
                Revenues = await Revenue.Revenues("month", page, currentDay, currentMonth, currentYear);
            }
            else
            {
                Revenues = await Revenue.Revenues("week", page, currentDay, currentMonth, currentYear);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
