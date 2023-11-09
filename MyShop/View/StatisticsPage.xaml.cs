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
using Syncfusion.UI.Xaml.Charts;
using Windows.Foundation;
using Windows.Foundation.Collections;


// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class StatisticsPage : Page
{
    private string currentPage = "revenue";
    private string type = "year";
    public StatisticsPage()
    {
        this.InitializeComponent();

        //Default show revenue by year
        this.DataContext = new StatisticViewModel(type, currentPage);
    }

    private void MonthClick(object sender, RoutedEventArgs e)
    {
        Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        type = "month";
        this.DataContext = new StatisticViewModel(type, currentPage);
    }

    private void YearClick(object sender, RoutedEventArgs e)
    {
        Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        type = "year";
        this.DataContext = new StatisticViewModel(type, currentPage);
    }
    private void WeekClick(object sender, RoutedEventArgs e)
    {
        Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        type = "week";
        this.DataContext = new StatisticViewModel(type, currentPage);
    }

    private void ProfitClick(object sender, RoutedEventArgs e)
    {
        Revenue.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Profit.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        //Convert to show profit
        SfCartesianChart chart = this.FindName("chart") as SfCartesianChart;
        chart.Header = "Profit";
        NumericalAxis yAxis = chart.YAxes[0] as NumericalAxis;
        yAxis.Header = "Profit (tr)";

        currentPage = "profit";
        this.DataContext = new StatisticViewModel(type, currentPage);
    }

    private void RevenueClick(object sender, RoutedEventArgs e)
    {
        Profit.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
        Revenue.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        //Convert to show revenue
        SfCartesianChart chart = this.FindName("chart") as SfCartesianChart;
        chart.Header = "Revenue";
        NumericalAxis yAxis = chart.YAxes[0] as NumericalAxis;
        yAxis.Header = "Revenue (tr)";
        // Update the header
        currentPage = "revenue";
        this.DataContext = new StatisticViewModel(type, currentPage);
    }

    private void OtherView(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.StasticsChild));
    }
}

