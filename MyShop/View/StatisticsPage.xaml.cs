using System;
using System.Collections.Generic;
using System.ComponentModel;
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
public sealed partial class StatisticsPage : Page, INotifyPropertyChanged
{
    private string currentPage = "revenue";
    private string type = "year";
    DateTime currentDate;
    int currentYear = 2023;
    int currentMonth = 11;
    int currentDay = 1;

    public StatisticsPage()
    {
        this.InitializeComponent();

        //Default show revenue by year
        currentDate = DateTime.Now.Date;
        currentYear = currentDate.Year;
        currentMonth = currentDate.Month;
        currentDay = currentDate.Day;
        this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);
        showFilter.Text = $"{currentYear}";
    }

    private void MonthClick(object sender, RoutedEventArgs e)
    {
        Year.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Week.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        type = "month";
        showFilter.Text = $"{currentMonth}/{currentYear}";
        this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);
    }

    private void YearClick(object sender, RoutedEventArgs e)
    {
        Month.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Week.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        type = "year";
        showFilter.Text = $"{currentYear}";
        this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);
    }
    private void WeekClick(object sender, RoutedEventArgs e)
    {
        Month.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Year.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        type = "week";

        UpdateWeek();
    }
    private void UpdateWeek()
    {
        // Get the date for the current day
        DateTime date = new DateTime(currentYear, currentMonth, currentDay);

        // Calculate the start and end of the week
        DayOfWeek firstDayOfWeek = DayOfWeek.Monday;
        int offset = firstDayOfWeek - date.DayOfWeek;
        DateTime startOfWeek = date.AddDays(offset);
        DateTime endOfWeek = startOfWeek.AddDays(6);

        // Update the TextBlock
        showFilter.Text = $"{startOfWeek.ToString("dd/MM/yyyy")} to {endOfWeek.ToString("dd/MM/yyyy")}";

        // Update the DataContext
        this.DataContext = new StatisticViewModel(type, currentPage, startOfWeek.Day, startOfWeek.Month, startOfWeek.Year);
    }
    private void ProfitClick(object sender, RoutedEventArgs e)
    {
        Revenue.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Profit.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        //Convert to show profit
        SfCartesianChart chart = this.FindName("chart") as SfCartesianChart;
        chart.Header = "Profit";
        NumericalAxis yAxis = chart.YAxes[0] as NumericalAxis;
        yAxis.Header = "Profit (tr)";

        currentPage = "profit";
        this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);
    }

    private void RevenueClick(object sender, RoutedEventArgs e)
    {
        Profit.Background = (Brush)Application.Current.Resources["MyBlockBackgroundThemeBrush"];
        Revenue.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        //Convert to show revenue
        SfCartesianChart chart = this.FindName("chart") as SfCartesianChart;
        chart.Header = "Revenue";
        NumericalAxis yAxis = chart.YAxes[0] as NumericalAxis;
        yAxis.Header = "Revenue (tr)";
        // Update the header
        currentPage = "revenue";
        this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);
    }

    private void OtherView(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.StatisticsChild));
    }

    private async void minusClick(object sender, RoutedEventArgs e)
    {
        SolidColorBrush compareBrush = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        SolidColorBrush weekBackgroundBrush = Week.Background as SolidColorBrush;
        SolidColorBrush monthBackgroundBrush = Month.Background as SolidColorBrush;
        SolidColorBrush yearBackgroundBrush = Year.Background as SolidColorBrush;

        // Check if the colors are the same
        if (weekBackgroundBrush.Color == compareBrush.Color)
        {
            currentDate = new DateTime(currentYear, currentMonth, currentDay);
            currentDate = currentDate.AddDays(-7);
            // Update the current day, month, and year
            currentDay = currentDate.Day;
            currentMonth = currentDate.Month;
            currentYear = currentDate.Year;
            UpdateWeek();
        }
        else if (monthBackgroundBrush.Color == compareBrush.Color)
        {
            currentMonth--;
            if (currentMonth == 0)
            {
                currentYear--;
                currentMonth = 12;
            }
            showFilter.Text = $"{currentMonth}/{currentYear}";
            this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);

        }
        else
        {
            currentYear--;
            showFilter.Text = $"{currentYear}";
            this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);

        }
    }

    private void addClick(object sender, RoutedEventArgs e)
    {
        SolidColorBrush compareBrush = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
        SolidColorBrush weekBackgroundBrush = Week.Background as SolidColorBrush;
        SolidColorBrush monthBackgroundBrush = Month.Background as SolidColorBrush;
        SolidColorBrush yearBackgroundBrush = Year.Background as SolidColorBrush;

        // Check if the colors are the same
        if (weekBackgroundBrush.Color == compareBrush.Color)
        {
            currentDate = new DateTime(currentYear, currentMonth, currentDay);
            currentDate = currentDate.AddDays(7);
            // Update the current day, month, and year
            currentDay = currentDate.Day;
            currentMonth = currentDate.Month;
            currentYear = currentDate.Year;
            UpdateWeek();
        }
        else if (monthBackgroundBrush.Color == compareBrush.Color)
        {
            currentMonth++;
            if (currentMonth == 13)
            {
                currentYear++;
                currentMonth = 1;
            }
            this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);

            showFilter.Text = $"{currentMonth}/{currentYear}";
        }
        else
        {
            currentYear++;
            this.DataContext = new StatisticViewModel(type, currentPage, currentDay, currentMonth, currentYear);

            showFilter.Text = $"{currentYear}";
        }
    }
}

