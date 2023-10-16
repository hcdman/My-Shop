using Microsoft.UI.Xaml.Controls;

using My_Shop.ViewModels;

namespace My_Shop.Views;

public sealed partial class StatisticsPage : Page
{
    public StatisticsViewModel ViewModel
    {
        get;
    }

    public StatisticsPage()
    {
        ViewModel = App.GetService<StatisticsViewModel>();
        InitializeComponent();
    }
}
