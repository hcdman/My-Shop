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
using MyShop.ViewModel;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class AddCustomerPage : Page
{
    public AddCustomerPage()
    {
        this.InitializeComponent();
        vm = new AddCustomerViewModel();
        RegistrationCalendar.Date = DateTime.Now;
        DateofBirth.Date = DateTime.Now;

        form.DataContext = vm.cus;
        this.DataContext = vm;
    }

     AddCustomerViewModel vm;

    private void CancelBtn_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(CustomerPage));
    }

    private void AddBtn_Click(object sender, RoutedEventArgs e)
    {
        //TODO: Add Customer
        DateTimeOffset d1 = (DateTimeOffset)DateofBirth.Date;
        DateTimeOffset d2 = (DateTimeOffset)RegistrationCalendar.Date;

        DateTime dob = d1.DateTime;
        DateTime dor = d2.DateTime;
         vm.addCustomer(dob, dor);

    }
}
