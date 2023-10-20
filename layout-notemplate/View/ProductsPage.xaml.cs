using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using MyShop.Model;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class ProductsPage : Page
{
    public ProductsPage()
    {
        this.InitializeComponent();
    }


    BindingList<Product> phones;
    private void Page_Loaded(object sender, RoutedEventArgs e)
    {
         phones = new BindingList<Product>()
         {
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           new Product("1", "Iphone 15", "China", false, "$1499"),
           
         };
            ContentGridView.ItemsSource = phones;
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.AddProductPage));
    }
}

