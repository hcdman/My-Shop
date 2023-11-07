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

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class OrdersPage : Page
{
    OrdersViewModel orderVMD = new OrdersViewModel();
    public OrdersPage()
    {
        this.InitializeComponent();
        this.DataContext = orderVMD;
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.AddOrderPage));
    }

    private void TextBox_KeyDown(object sender, KeyRoutedEventArgs e)
    {

    }

    private void Update(object sender, RoutedEventArgs e)
    {
        var btn = sender as Button;
        string id = btn.Tag as string;
        Order order = new Order();
        for (int i = 0; i < orderVMD.Orders.Count; i++)
        {
            if (id == orderVMD.Orders[i].OrderId)
            {
                order = orderVMD.Orders[i];
                break;
            }
        }

        Frame.Navigate(typeof(View.UpdateOrderPage),order);
    }
}
