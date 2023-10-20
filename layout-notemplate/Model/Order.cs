using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    class Order
    {
        public String Product { get; set; }
        public String OrderId { get; set; }

        public String Date {  get; set; }
        public String CustomerName{ get; set; }
        public String Status { get; set; } 
        public String Amount { get; set; }
        public static List<Order> Orders()
        {
            return new List<Order>(new Order[]
                {
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11232",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"}
            });

        }


    }
}
