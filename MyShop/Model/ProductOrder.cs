using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace MyShop.Model
{
    internal class ProductOrder : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private string _masp;
        public string tensp { get; set; }
        public string anh { get; set; }
        public bool check { get; set; } = false;
        public ProductOrder(string id, string tensp, string anh)
        {
            masp = id;
            this.tensp = tensp;
            this.anh = anh;
        }
        public string masp
        {
            get { return _masp; }
            set
            {
                if (_masp != value)
                {
                    _masp = value;
                    OnPropertyChanged(nameof(masp));
                }
            }
        }

        private int _sl = 1;
        public int sl
        {
            get { return _sl; }
            set
            {
                if (_sl != value)
                {
                    _sl = value;
                    OnPropertyChanged(nameof(sl));
                }
            }
        }

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
