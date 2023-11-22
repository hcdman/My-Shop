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
using MyShop.API;
using MyShop.Model;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class CategoryPage : Page
{
    CategoryViewModel cateVM = new CategoryViewModel();
    
    public CategoryPage()
    {
        this.InitializeComponent();
        this.DataContext = cateVM;
    }

    private async void deleteCate(object sender, RoutedEventArgs e)
    {
        ContentDialog deleteDialog = new ContentDialog
        {
            XamlRoot = this.XamlRoot,
            Style = Application.Current.Resources["DefaultContentDialogStyle"] as Style,
            Title = "Delete this category?",
            Content = "All information of this category will be delete and can not recover",
            CloseButtonText = "Cancel",
            PrimaryButtonText = "Delete",
            DefaultButton = ContentDialogButton.Close
        };

        ContentDialogResult result = await deleteDialog.ShowAsync();
        if (result == ContentDialogResult.Primary)
        {
            var btn = sender as Button;
            string id = btn.Tag as string;
            //deleteCategory(id);

            cateVM.deleteCategory(id);
        }
    }

    private void updateCate(object sender, RoutedEventArgs e)
    {
        var btn = sender as Button;
        string id = btn.Tag as string;
        Category cate = new Category();
        for (int i = 0; i < cateVM.categories.Count; i++)
        {
            if (id == cateVM.categories[i].maloai)
            {
                //cus = cusViewModel.customers[i];
                cate = cateVM.categories[i];
                break;
            }
        }


        // updateCustomer screen = new updateCustomer();//how to navigate with parameter in winUI
        ///screen.cus = cus;
        // screen.cus.makh = "KH02";
        Frame.Navigate(typeof(UpdateCategoryPage), cate);
    }

    private void search(object sender, RoutedEventArgs e)
    {
        cateVM.search();
    }

    private void nextC(object sender, RoutedEventArgs e)
    {
        cateVM.next();
    }

    private void preC(object sender, RoutedEventArgs e)
    {
        cateVM.pre();
    }

    private void AddButton_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.AddCategoryPage));
    }

    private void TextBox_KeyDown(object sender, KeyRoutedEventArgs e)
    {
        if (e.Key != Windows.System.VirtualKey.Enter) return;
        cateVM.loadDataByPage();
    }

    private void Import_Click(object sender, RoutedEventArgs e)
    {
        cateVM.importDataFromExcel();
    }
}