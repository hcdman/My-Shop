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

    public sealed partial class StatisticsChild : Page
    {
        DateTime currentDate;
        int currentYear = 2023;
        int currentMonth = 11;
        int currentDay = 1;

        public StatisticsChild()
        {
            this.InitializeComponent();
            this.DataContext = new SaleViewModel("year");
            currentDate = DateTime.Now.Date;
            currentYear = currentDate.Year;
            currentMonth = currentDate.Month;
            currentDay = currentDate.Day;
            showFilter.Text = $"{currentYear}";

        }

        private void MonthClick(object sender, RoutedEventArgs e)
        {
            Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
          
            showFilter.Text = $"{currentMonth}/{currentYear}";
           
        }

        private void YearClick(object sender, RoutedEventArgs e)
        {
            Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
          
            showFilter.Text = $"{currentYear}";
           
        }
        private void WeekClick(object sender, RoutedEventArgs e)
        {
            Month.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Year.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 255, 255, 255));
            Week.Background = new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 255, 0));
           
            UpdateWeek();
        }

        private void OtherView(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(View.StatisticsPage));
        }

      
        private void UpdateWeek()
        {
            // Get the date for the current day
            DateTime date = new DateTime(currentYear, currentMonth, currentDay);

            // Calculate the start and end of the week
            DayOfWeek firstDayOfWeek = DayOfWeek.Monday;
            int offset = firstDayOfWeek - date.DayOfWeek;
            DateTime startOfWeek = date.AddDays(offset);
            DateTime endOfWeek = startOfWeek.AddDays(7);

            // Update the TextBlock
            showFilter.Text = $"{startOfWeek.ToString("dd/MM/yyyy")} to {endOfWeek.ToString("dd/MM/yyyy")}";

           
        }

        private void minusClick(object sender, RoutedEventArgs e)
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
               

            }
            else
            {
                currentYear--;
                showFilter.Text = $"{currentYear}";
               

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
              
            }
            else
            {
                currentYear++;
                

                showFilter.Text = $"{currentYear}";
            }
        }
    }
}
