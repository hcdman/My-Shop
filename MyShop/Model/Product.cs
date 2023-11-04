using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    public class Product
    {
        public string masp {  get; set; }   
        public string anh { get; set; }
        public string tensp { get; set; }
        public string hangsx { get; set; }
        public int gia_goc { get; set; }
        public int gia {  get; set; }
        public int sl { get; set; } 
        public string maloai { get; set; }
        public int giamgia {  get; set; }
        public int Total
        {
            get; set;
        }
    }
}
