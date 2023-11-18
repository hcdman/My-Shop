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
            get { return _revenues; } set { _revenues = value; }    
        }


        public StatisticViewModel(string check)
        {
            if (check == "year")
            {
                Revenues = Revenue.Revenues("year");
            }
            else if(check=="month")
            {
                Revenues = Revenue.Revenues("month");
            }
            else
            {
                Revenues = Revenue.Revenues("week");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
