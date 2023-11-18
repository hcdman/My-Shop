using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace MyShop.Model
{
    public class Sales
    {
        public string Product { get; set; }

        public double SalesRate { get; set; }


        public static List<Sales> Saless(string check)
        {
            if (check == "year")
            {
                return new List<Sales>(new Sales[5]
                {
                 new Sales() { Product = "iPad", SalesRate = 25},
                  new Sales() { Product = "iPhone", SalesRate = 35},
                  new Sales() { Product = "MacBook", SalesRate = 15},
                  new Sales() { Product = "Mac", SalesRate = 25},
                    new Sales() { Product = "Others", SalesRate = 30},
                });
            }
            else if (check == "month")
            {
                return new List<Sales>(new Sales[5]
                {
                 new Sales() { Product = "iPad", SalesRate = 20},
                  new Sales() { Product = "iPhone", SalesRate = 40},
                  new Sales() { Product = "MacBook", SalesRate = 10},
                  new Sales() { Product = "Mac", SalesRate = 20},
                    new Sales() { Product = "Others", SalesRate = 15},
                });
            }
            return new List<Sales>(new Sales[5]
                {
                 new Sales() { Product = "iPad", SalesRate = 20},
                  new Sales() { Product = "iPhone", SalesRate = 35},
                  new Sales() { Product = "MacBook", SalesRate = 20},
                  new Sales() { Product = "Mac", SalesRate = 30},
                    new Sales() { Product = "Others", SalesRate = 20},
                });
        }
    }

}
