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


        public StatisticViewModel(string check, string page)
        {
            loadData(check, page);
        }

        public async void loadData(string check, string page)
        {
            if (check == "year")
            {
                Revenues = await Revenue.Revenues("year", page);
            }
            else if (check == "month")
            {
                Revenues = await Revenue.Revenues("month", page);
            }
            else
            {
                Revenues = await Revenue.Revenues("week", page);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
