using MyShop.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{
    internal class DashboardViewModel : INotifyPropertyChanged
    {
        private List<Product> _procucts;

        public List<Product> Products
        {
            get { return _procucts; }
            set
            {
                _procucts = value;
                OnPropertyChanged();
            }
        }

        public DashboardViewModel()
        {
            Products = Product.Products();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

    }
}
