using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using MyShop.API;
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
public sealed partial class DashboardPage : Page
{
    
    public DashboardPage()
    {
        InitializeComponent();
        this.DataContext = new DashboardViewModel();
    }

    private async void AwesomeToggleSwitch_Toggled(object sender, RoutedEventArgs e)
    {
        var dataSource = (DashboardViewModel)DataContext;
        HandleAPI api = new HandleAPI();

        ToggleSwitch toggleSwitch = sender as ToggleSwitch;
        if (toggleSwitch != null)
        {
            int _tmp = 0; 
            if (toggleSwitch.IsOn == false)
            {
                newOrderTitle.Text = "This Week Order";
                _tmp = await api.GetNumNewOrderW();
            }    
            else
            {
                newOrderTitle.Text = "This Month Order";
                _tmp = await api.GetNumNewOrderM();
            }
                dataSource.NewOrder = _tmp + " New Order";
        }
    }
}
