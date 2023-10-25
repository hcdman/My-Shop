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
using MyShop.ViewModel;
using Windows.Foundation;
using Windows.Foundation.Collections;


namespace MyShop.View;

public sealed partial class ProductsPage : Page
{
    public ProductsPage()
    {
        this.InitializeComponent();
        this.DataContext = new ProductPageViewModel();
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.AddProductPage));
    }

}

