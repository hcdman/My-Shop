using MyShop.API;
using MyShop.Model;
using MyShop.ViewModel.command;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MyShop.ViewModel
{
    public class addDetailOrderViewModel : INotifyPropertyChanged
    {
        public DetailOrder detailOrder { get; set; }
        public event PropertyChangedEventHandler PropertyChanged;
        public bool isShowProgres { get; set; }

        public string mess { get; set; }
 

        public addDetailOrderViewModel()
        {
            detailOrder = new DetailOrder();
            isShowProgres = false;
        }
        HandleAPI api = new HandleAPI();
     
        public async void add_detaiOrder(DetailOrder detail_order)
        {
            
        }

        public async void add_ListDetailOrder(List<DetailOrder> ls)
        {
            mess = "";
            var temp = "";
            isShowProgres = true;

           // Tuple<bool, string> rs = new Tuple<bool, string>();
            for (int i = 0; i < ls.Count; i++)
            {
                var  (success, message) = await api.addOrderDetail(ls[i]);
                temp = message;
            }
                          
            isShowProgres = false;
            mess = temp;
        }
    }
}
