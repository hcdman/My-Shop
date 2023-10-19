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
    public ObservableCollection<DashboardItem> DashboardItems { get; } = new ObservableCollection<DashboardItem>();

    public DashboardPage()
    {
        
        InitializeComponent();
        // Create some sample data items
        DashboardItems.Add(new DashboardItem
        {
            Id = 1,
            OrderId = 101,
            Date = DateTime.Now,
            Name = "John Doe",
            Status = "In Progress",
            Amount = 100.00
        });

        DashboardItems.Add(new DashboardItem
        {
            Id = 2,
            OrderId = 102,
            Date = DateTime.Now.AddDays(-1),
            Name = "Jane Smith",
            Status = "Shipped",
            Amount = 150.50
        });

        // Set the DataGrid's ItemsSource
        Dashboard.ItemsSource = DashboardItems;
    }
}
