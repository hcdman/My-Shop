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
using MyShop.Model;
using MyShop.ViewModel;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class detailOrderPage : Page
    {
        public detailOrderPage()
        {
            this.InitializeComponent();
        }

        public Order order = new Order();



        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            order = (Order)e.Parameter;
        }


        DetailOrderViewModel vm;
        private void mainLoad(object sender, RoutedEventArgs e)
        {
            if (order != null)
            {
                vm = new DetailOrderViewModel(order.sohd);
            }

            this.DataContext = vm;
        }

        private async void deteleOrderpage(object sender, RoutedEventArgs e)
        {


            ContentDialog deleteDialog = new ContentDialog
            {
                XamlRoot = this.XamlRoot,
                Style = Application.Current.Resources["DefaultContentDialogStyle"] as Style,
                Title = "Delete this detail order?",
                Content = "All information of this detail order will be delete and can not recover",
                CloseButtonText = "Cancel",
                PrimaryButtonText = "Delete",
                DefaultButton = ContentDialogButton.Close
            };

            ContentDialogResult result = await deleteDialog.ShowAsync();
            if (result == ContentDialogResult.Primary)
            {
                if (sender is Button button)
                {
                    int id = (int)button.Tag;
                    //mess.Text = id.ToString()+ "";
                    vm.deleteDetaiOrder(id, order.sohd);
                }
            }
        }
        private void addDetailOrder(object sender, RoutedEventArgs e)
        {
             Frame.Navigate(typeof(addDetailOrderPage), order);
        }
    }
}
