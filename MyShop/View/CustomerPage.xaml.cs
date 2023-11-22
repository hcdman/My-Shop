using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using CommunityToolkit.Mvvm.DependencyInjection;
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

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class CustomerPage : Page
{
    public CustomerViewModel cusViewModel;


    public CustomerPage()
    {
        this.InitializeComponent();

        cusViewModel = new CustomerViewModel();
        this.DataContext = cusViewModel;


    }

    private void addCus(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(AddCustomerPage));
    }

    private async void del(object sender, RoutedEventArgs e)
    {
        ContentDialog deleteDialog = new ContentDialog
        {
            XamlRoot = this.XamlRoot,
            Style = Application.Current.Resources["DefaultContentDialogStyle"] as Style,
            Title = "Delete this customer?",
            Content = "All information of this customer will be delete and can not recover",
            CloseButtonText = "Cancel",
            PrimaryButtonText = "Delete",
            DefaultButton = ContentDialogButton.Close
        };

    ContentDialogResult result = await deleteDialog.ShowAsync();
        if(result == ContentDialogResult.Primary)
        {
            var btn = sender as Button;
            string id = btn.Tag as string;

            if (btn != null)
            {
                bool success = await cusViewModel.deleteCustomer(btn.Tag as string);
                if(success)
                {
                    ContentDialog addDialog = new ContentDialog
                    {
                        XamlRoot = this.XamlRoot,
                        Style = Microsoft.UI.Xaml.Application.Current.Resources["DefaultContentDialogStyle"] as Microsoft.UI.Xaml.Style,
                        Title = "Delete successfully !",
                        Content = "Your data will be update.",
                        CloseButtonText = "OK",
                        DefaultButton = ContentDialogButton.Close
                    };
                    _ = await addDialog.ShowAsync();
                }

            }
         
        }
    }

    private void update(object sender, RoutedEventArgs e)
{
    var btn = sender as Button;
    string id = btn.Tag as string;
    Customer cus = new Customer();
    for (int i = 0; i < cusViewModel.customers.Count; i++)
    {
        if (id == cusViewModel.customers[i].makh)
        {
            cus = cusViewModel.customers[i];
            break;
        }
    }


    //updateCustomer screen = new updateCustomer();//how to navigate with parameter in winUI
    ///screen.cus = cus;
    // screen.cus.makh = "KH02";
    Frame.Navigate(typeof(UpdateCustomerPage), cus);


    /* if (screen.ShowDialog()!.Value == true)
     {
         var updateItem = screen.editedBook;
         updateItem.CopyProperties(b);
         var sql = "update book set name = @name, image = @image, author = @author, publishYear = @year where id = @id";
         var command = new SqlCommand(sql, DB.Instance.Connection);
         command.Parameters.Add("@name", System.Data.SqlDbType.NVarChar)
             .Value = updateItem.name;
         command.Parameters.Add("@image", System.Data.SqlDbType.VarChar)
            .Value = updateItem.image;
         command.Parameters.Add("@author", System.Data.SqlDbType.NVarChar)
            .Value = updateItem.author;
         command.Parameters.Add("@year", System.Data.SqlDbType.Int)
            .Value = updateItem.publishYear;
         command.Parameters.Add("@id", System.Data.SqlDbType.Int)
            .Value = updateItem.id;

         int check = command.ExecuteNonQuery();
         if (check > 0)
         {
             updateItem.CopyProperties(b);
         }
     }
     else
     {

         temp.CopyProperties(b);
     }*/
}

private void searchCus(object sender, RoutedEventArgs e)
{
    cusViewModel.search();
}

private void nextPage(object sender, RoutedEventArgs e)
{
    cusViewModel.next();
}

private void prePage(object sender, RoutedEventArgs e)
{
    cusViewModel.pre();
}

  private void TextBox_KeyDown(object sender, KeyRoutedEventArgs e)
  {
        if (e.Key != Windows.System.VirtualKey.Enter) return;
        cusViewModel.loadDataByPage();
  }
}
