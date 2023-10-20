using MyShop.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.ViewModel
{
    class CategoryViewModel : INotifyPropertyChanged
    {
        private List<Category> _categories;
        public List<Category> Categories
        { get { return _categories; } 
            set
            { _categories = value;
            }
        }
        public CategoryViewModel()
        {
            Categories = Category.Categories();
        }
        public event PropertyChangedEventHandler PropertyChanged;
    }
}
