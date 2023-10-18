﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    internal class Product
    {
        public String Id { get; set; }
        public String Name { get; set; }
        public String Manufacture { get; set; }
        public Boolean Import { get; set; }

        public Product(String id, String name, String manufacture, Boolean import)
        {
            this.Id = id;
            this.Name = name;
            this.Manufacture = manufacture;
            this.Import = import;
        }
        public static List<Product> Products()
        {
            return new List<Product>(new Product[5] {
            new Product("1", "Iphone 15",
                "China",
                false),
           new Product("2", "Iphone 15",
                "China",
                false),
            new Product("3", "Iphone 15",
                "China",
                false),
             new Product("4", "Iphone 15",
                "China",
                false),
            new Product("5", "Iphone 15",
                "China",
                false),
        });
        }
    }
}
