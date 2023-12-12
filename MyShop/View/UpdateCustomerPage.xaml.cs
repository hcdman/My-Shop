using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading.Tasks;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.API;
using MyShop.Model;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class UpdateCustomerPage : Page, INotifyPropertyChanged
{
    public Customer cus = new Customer();

    public UpdateCustomerPage()

    {
        this.InitializeComponent();

    }

    HandleAPI api = new HandleAPI();


    private void updateCus(object sender, RoutedEventArgs e)
    {
        updateCus();
    }


    public async void updateCus()
    {
        mess.Text = "";
        var (success, message) = await Task.Run(() => { return api.updateCustomer(cus); });
        mess.Text = message;
        if(success)
        {
            ContentDialog addDialog = new ContentDialog
            {
                XamlRoot = this.XamlRoot,
                Style = Microsoft.UI.Xaml.Application.Current.Resources["DefaultContentDialogStyle"] as Microsoft.UI.Xaml.Style,
                Title = "Update successfully !",
                Content = "Your data will be update.",
                CloseButtonText = "OK",
                DefaultButton = ContentDialogButton.Close
            };
            _ = await addDialog.ShowAsync();
            Frame.Navigate(typeof(View.CustomerPage));
        }
    }

    private void mainLoad(object sender, RoutedEventArgs e)
    {
        form.DataContext = cus;
        BirthCalendar.Date = DateTime.Parse(cus.ngsinh);
        RegistrationCalendar.Date = DateTime.Parse(cus.ngdk);
    }



    protected override void OnNavigatedTo(NavigationEventArgs e)
    {
        cus = (Customer)e.Parameter;
    }

    private void CancelBtn_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.CustomerPage));
    }
}
