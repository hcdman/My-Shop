using Microsoft.UI;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Media;
using MyShop.ViewModel;
using System.Configuration;
using System.Windows;
using Windows.System;
using WinUIEx;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;

public sealed partial class LoginPage : Page
{
    public LoginPage()
    {
        this.InitializeComponent();
        var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        config.AppSettings.Settings["Uri"].Value = "http://localhost:8080/";
        config.Save(ConfigurationSaveMode.Minimal);
        ConfigurationManager.RefreshSection("appSettings");
        this.DataContext = new LoginViewModel();
      
        //App.MainWindow.ExtendsContentIntoTitleBar = true;
        //App.MainWindow.SetTitleBar(AppTitleBar);
    }
    public string GetAppTitleFromSystem()
    {
        return Windows.ApplicationModel.Package.Current.DisplayName;
    }

    private void HandleCheck(object sender, Microsoft.UI.Xaml.RoutedEventArgs e)
    {
        RadioButton rb = sender as RadioButton;
       
        if (rb.Name=="server")
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["Uri"].Value = "https://myshop-api-pmrd.onrender.com/";
            config.Save(ConfigurationSaveMode.Minimal);
            ConfigurationManager.RefreshSection("appSettings");
        }
        else
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["Uri"].Value = "http://localhost:8080/";
            config.Save(ConfigurationSaveMode.Minimal);
            ConfigurationManager.RefreshSection("appSettings");
        }
        
    }
}
