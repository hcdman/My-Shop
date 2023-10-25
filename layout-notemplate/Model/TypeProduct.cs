using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Xml.Linq;

namespace MyShop.Model
{
    public class TypeProduct
    {
        public string maloai { get; set; }
        public string tenloai { get; set; }

        public override string ToString()
        {
            return tenloai;
        }
    }

    public class ListTypeProduct
    {
        public BindingList<TypeProduct> data {  get; set; }
    }
}
