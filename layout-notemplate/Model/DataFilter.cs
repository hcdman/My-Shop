using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    public class DataFilter
    {
        public string name {  get; set; }
        public string price {  get; set; }
        public string maloai { get; set; }
        public string SortBy {  get; set; }
        public int per_page { get; set; }
        public int page { get; set; }
    }
}
