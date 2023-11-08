using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Windows.Controls;
using System.Windows.Input;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.API;
using MyShop.Model;
using MyShop.ViewModel;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Popups;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class ProductsPage : Microsoft.UI.Xaml.Controls.Page
{
    HandleAPI api = new HandleAPI();
    public ProductsPage()
    {
        this.InitializeComponent();
        this.DataContext = new ProductPageViewModel();
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.AddProductPage));
    }

    private void EditMenuFlyoutItem_Click(object sender, RoutedEventArgs e)
    {
        var item = sender as MenuFlyoutItem;
        var id = item.Tag.ToString();
        var dataSource = (ProductPageViewModel)DataContext;
        Product pro = new Product();
        for (int i = 0; i < dataSource.Products.Count; i++)
        {
            if (id == dataSource.Products[i].masp)
            {
                pro = dataSource.Products[i];
                break;
            }
        }


        Frame.Navigate(typeof(UpdateProductPage), pro);
    }

    private async void DeleteMenuFlyoutItem_Click(object sender, RoutedEventArgs e)
    {
        ContentDialog deleteDialog = new ContentDialog
        {
            XamlRoot = this.XamlRoot,
            Style = Application.Current.Resources["DefaultContentDialogStyle"] as Style,
            Title = "Delete this product?",
            Content = "All information of this product will be delete and can not recover",
            CloseButtonText = "Cancel",
            PrimaryButtonText = "Delete",
            DefaultButton = ContentDialogButton.Close
        };

        ContentDialogResult result = await deleteDialog.ShowAsync();
        if (result == ContentDialogResult.Primary)
        {
            var item = sender as MenuFlyoutItem;
            var id = item.Tag.ToString();
            var (success, message) = await api.DeleteProduct(id);

            var dataSource = (ProductPageViewModel)DataContext;
            dataSource.FilterFunc();
        }
    }

    private void TextBox_KeyDown(object sender, KeyRoutedEventArgs e)
    {
        if (e.Key != Windows.System.VirtualKey.Enter) return;
        var dataSource = (ProductPageViewModel)DataContext;
        dataSource.FilterFunc();
    }
}

