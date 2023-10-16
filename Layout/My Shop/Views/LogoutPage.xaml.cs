using Microsoft.UI.Xaml.Controls;

using My_Shop.ViewModels;

namespace My_Shop.Views;

public sealed partial class LogoutPage : Page
{
    public LogoutViewModel ViewModel
    {
        get;
    }

    public LogoutPage()
    {
        ViewModel = App.GetService<LogoutViewModel>();
        InitializeComponent();
    }
}
