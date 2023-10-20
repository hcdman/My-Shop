using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Instock { get; set; }
        public static List<Category> Categories()
        {
            return new List<Category>(new Category[6]
                {
            new Category { Id = 1, Name = "Iphone",Instock =1000},
             new Category { Id = 1, Name = "Iphone",Instock =1000},
              new Category { Id = 1, Name = "Iphone",Instock =1000},
              new Category { Id = 1, Name = "Iphone",Instock =1000},
             new Category { Id = 1, Name = "Iphone",Instock =1000},
              new Category { Id = 1, Name = "Iphone",Instock =1000}

            });

        }
    }
}
