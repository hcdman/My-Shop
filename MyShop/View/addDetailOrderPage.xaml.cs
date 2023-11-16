using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.ViewModel;
using MyShop.Model;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class addDetailOrderPage : Page
    {

        public addDetailOrderPage()
        {
            this.InitializeComponent();
        }

         public addDetailOrderViewModel viewModel { get; set; }
         public Order order { get; set; }    
       

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            order = (Order)e.Parameter;
            viewModel = new addDetailOrderViewModel();
            if(order != null ) { viewModel.detailOrder.sohd = order.sohd;} 
            form.DataContext = viewModel.detailOrder;
            this.DataContext = viewModel;
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(View.detailOrderPage), order);
        }

        private void mainLoad(object sender, RoutedEventArgs e)
        {

        }

        private void add_detailOrder(object sender, RoutedEventArgs e)
        {

        }
    }
}
