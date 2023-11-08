using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    public class Category : INotifyPropertyChanged
    {
        public string maloai { get; set; }
        public string tenloai { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
