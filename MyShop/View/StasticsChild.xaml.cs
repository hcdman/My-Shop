using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.ViewModel;
using MyShop.Model;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    /// 

    public sealed partial class StasticsChild : Page
    {


        public StasticsChild()
        {
            this.InitializeComponent();
            this.DataContext = new SaleViewModel("year");

        }

        private void MonthClick(object sender, RoutedEventArgs e)
        {
            Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
            this.DataContext = new SaleViewModel("month");
        }

        private void YearClick(object sender, RoutedEventArgs e)
        {
            Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
            this.DataContext = new SaleViewModel("year");
        }
        private void WeekClick(object sender, RoutedEventArgs e)
        {
            Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
            this.DataContext = new SaleViewModel("week");
        }

        private void OtherView(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(View.StatisticsPage));
        }
    }
}