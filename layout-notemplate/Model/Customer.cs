using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
   public class Customer
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public static List<Customer> Customers()
        {
            return new List<Customer>(new Customer[6]
                {
            new Customer { Id = 1, Name = "John Doe", Address = "123 Main St", Email = "johndoe@example.com", Phone = "123-456-7890" },
            new Customer { Id = 2, Name = "Jane Doe", Address = "456 Maple Dr", Email = "janedoe@example.com", Phone = "234-567-8901" },
            new Customer { Id = 3, Name = "Jim Smith", Address = "789 Oak Ln", Email = "jimsmith@example.com", Phone = "345-678-9012" },
             new Customer { Id = 4, Name = "John Doe", Address = "123 Main St", Email = "johndoe@example.com", Phone = "123-456-7890" },
            new Customer { Id = 5, Name = "Jane Doe", Address = "456 Maple Dr", Email = "janedoe@example.com", Phone = "234-567-8901" },
            new Customer { Id = 6, Name = "Jim Smith", Address = "789 Oak Ln", Email = "jimsmith@example.com", Phone = "345-678-9012" }

            });

        }

    }
   
  
}
