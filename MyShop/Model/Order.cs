using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.RightsManagement;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    public class Order
    {
<<<<<<< HEAD
       public int sohd {  get; set; }
       public string nghd {  get; set; }
       public string makh { get; set; }
       public int trigia { get; set; } 
=======
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
            new Order { Product="Iphone 13 pro",OrderId="#11231",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11230",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11234",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11235",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11236",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11237",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"},
            new Order { Product="Iphone 13 pro",OrderId="#11238",Date="Jun 19, 2022",CustomerName="Ung Chang Im",Status="Deleveried",Amount="$400.00"}
            });

        }


>>>>>>> e74e5883a489ed174a4d041384b2d181cbf406e7
    }
}
