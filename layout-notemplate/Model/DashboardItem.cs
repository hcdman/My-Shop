using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace MyShop.Model
{
    public class DashboardItem
    {
        public int Id { get; set; }
        public int sohd { get; set; }
        public string nghd { get; set; }
        public string hoten { get; set; }
        public string Status { get; set; }
        public int trigia { get; set; }
    }

    public class DashboardItemList
    {
        public BindingList<DashboardItem> bill { get; set; }
    }
}
