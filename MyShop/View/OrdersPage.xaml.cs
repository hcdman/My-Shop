using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using Windows.Foundation;
using MyShop.ViewModel;
using Windows.Foundation.Collections;
using MyShop.Model;
using System.Windows;
using RoutedEventArgs = Microsoft.UI.Xaml.RoutedEventArgs;
using System.Windows.Input;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class OrdersPage : Page
{
    OrdersViewModel vm = new OrdersViewModel();

    public OrdersPage()
    {
        this.InitializeComponent();
        this.DataContext = vm;
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {

        Frame.Navigate(typeof(View.AddOrderPage));
    }

    private void TextBox_KeyDown(object sender, KeyRoutedEventArgs e)
    {

    }

    private void detailOrder(object sender, RoutedEventArgs e)
    {
        var btn = sender as Button;
        // id = btn.Tag as int;
        int id = 0;
        if (btn.Tag != null)
        {
            id = (int)btn.Tag;
        }
        Order order = new Order();
        for (int i = 0; i <  vm.orders.Count; i++)
        {
            if (id == vm.orders[i].sohd)
            {
                order = vm.orders[i];
                break;
            }
        }

         Frame.Navigate(typeof(View.detailOrderPage), order);
    }

    private void next(object sender, RoutedEventArgs e)
    {
        vm.next();
    }

    private void pre(object sender, RoutedEventArgs e)
    {
        vm.pre();
    }

    private void SearchByID(object sender, RoutedEventArgs e)
    {
        vm.search();
    }



    private async void filter(object sender, RoutedEventArgs e)
    {

        // vm.filterByDate();
        DateTimeOffset strDate = (DateTimeOffset)startDate.Date;
        DateTimeOffset eDate = (DateTimeOffset)endDate.Date;
        DateTime d1 = strDate.Date;
        DateTime d2 = eDate.Date;

        /*ContentDialog deleteDialog = new ContentDialog
        {
            XamlRoot = this.XamlRoot,
            Style = Microsoft.UI.Xaml.Application.Current.Resources["DefaultContentDialogStyle"] as Microsoft.UI.Xaml.Style,
            Title = "",
            Content = d1.Day + " " + d1.Month + " " + d1.Year + " " + d2.Day + " " + d2.Month + " " + d2.Year,
            CloseButtonText = "Cancel",
            PrimaryButtonText = "Delete",
            DefaultButton = ContentDialogButton.Close
        };

        ContentDialogResult result = await deleteDialog.ShowAsync();*/
        vm.filterByDate(d1, d2);
    }

    private void RemoveFilter(object sender, RoutedEventArgs e)
    {
           vm.removeFilter();
          //startDate.Date =
          
    }



    private async void deleteOrder(object sender, RoutedEventArgs e)
    {

        ContentDialog deleteDialog = new ContentDialog
        {
            XamlRoot = this.XamlRoot,
            Style = Microsoft.UI.Xaml.Application.Current.Resources["DefaultContentDialogStyle"] as Microsoft.UI.Xaml.Style,
            Title = "Delete this order?",
            Content = "All information of this order will be delete and can not recover",
            CloseButtonText = "Cancel",
            PrimaryButtonText = "Delete",
            DefaultButton = ContentDialogButton.Close
        };

        ContentDialogResult result = await deleteDialog.ShowAsync();
        if (result == ContentDialogResult.Primary)
        {

            var btn = sender as Button;
            // id = btn.Tag as int;
            int id = 0;
            if (btn.Tag != null)
            {
                id = (int)btn.Tag;
            }

            // info.Text = id + "";

            if (btn != null)
            {
                vm.deleteOrder(id + "");
            }
          
        }
    }

  
    private void searchByKey(object sender, KeyRoutedEventArgs e)
    {
       if(e.Key == Windows.System.VirtualKey.Enter)
        {
            vm.search();
        }
    }

}
