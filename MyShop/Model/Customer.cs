using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MyShop.Model
{
   public class Customer  :  INotifyPropertyChanged, ICloneable
    {
        public string makh { get; set; }
        public string hoten { get; set; }
        public string dchi { get; set; }
        public string sodt { get; set; }
        public string ngsinh { get; set; }    
        public string email { get; set;}
        public string ngdk { get; set;}

        

       



        public event PropertyChangedEventHandler PropertyChanged;

        public object Clone()
        {
            return MemberwiseClone();
        }
    }
   
  
}
