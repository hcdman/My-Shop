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

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class AddOrderPage : Page
    {
        addOrderViewModel addOrder;
        public AddOrderPage()
        {
            this.InitializeComponent();
            addOrder = new addOrderViewModel();
            this.DataContext = addOrder;
            form.DataContext = addOrder.order;
        }

    
        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(View.OrdersPage));
        }

        private async void addOrders(object sender, RoutedEventArgs e)
        {
             DateTimeOffset d = (DateTimeOffset)dateOrder.Date;
             DateTime dateTime = d.DateTime;
            //messageTextBlock.Text = dateTime.Day + " " + dateTime.Month + " " + dateTime.Year;
            bool success = await addOrder.addOneOrder(dateTime);
            if (success)
            {
                ContentDialog addDialog = new ContentDialog
                {
                    XamlRoot = this.XamlRoot,
                    Style = Microsoft.UI.Xaml.Application.Current.Resources["DefaultContentDialogStyle"] as Microsoft.UI.Xaml.Style,
                    Title = "Add successfully !",
                    Content = "You will be redirected to main page.",
                    CloseButtonText = "OK",
                    DefaultButton = ContentDialogButton.Close
                };

                ContentDialogResult result = await addDialog.ShowAsync();
                Frame.Navigate(typeof(View.OrdersPage));
            };
          
        }
    }
}
