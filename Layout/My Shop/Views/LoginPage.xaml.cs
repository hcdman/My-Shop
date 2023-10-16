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
using My_Shop.Activation;
using My_Shop.Contracts.Services;
using My_Shop.ViewModels;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace My_Shop.Views;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class LoginPage : Page
{
    private UIElement? _shell = null;
    public LoginViewModel ViewModel
    {
        get;
    }

    public LoginPage()
    {
       ViewModel=App.GetService<LoginViewModel>();  
       InitializeComponent();
    }

    private void Click(object sender, RoutedEventArgs e)
    {
        _shell = App.GetService<ShellPage>();
        App.MainWindow.Content = _shell ?? new Frame();
    }
}
