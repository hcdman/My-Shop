using MyShop.Helpers;

using Microsoft.UI.Xaml;
using System.Threading.Tasks;
using System;
using System.Configuration;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI;
using Microsoft.UI.Xaml.Media.Animation;

namespace MyShop.Services;

public class ThemeSelectorService : IThemeSelectorService
{
    private const string SettingsKey = "AppBackgroundRequestedTheme";

    public ElementTheme Theme { get; set; } = ElementTheme.Default;


    //public ThemeSelectorService(ILocalSettingsService localSettingsService)
    //{
    //    _localSettingsService = localSettingsService;
    //}

    public async Task InitializeAsync()
    {
        Theme = LoadThemeFromSettings();
        await Task.CompletedTask;
    }

    public async Task SetThemeAsync(ElementTheme theme)
    {
        Theme = theme;

        await SetRequestedThemeAsync();
        SaveThemeInSettings(Theme);
    }

    public async Task SetRequestedThemeAsync()
    {
        if (App.MainWindow.Content is FrameworkElement rootElement)
        {
            Application.Current.Resources["MyBackgroundThemeBrush"] = Theme switch
            {
                ElementTheme.Dark => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 17, 18, 30)),
                ElementTheme.Light => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 243, 243, 243)),
                _ => new SolidColorBrush(Colors.Transparent)
            };

            Application.Current.Resources["MyBlockBackgroundThemeBrush"] = Theme switch
            {
                ElementTheme.Dark => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 30, 29, 41)),
                ElementTheme.Light => new SolidColorBrush(Colors.White),
                _ => new SolidColorBrush(Colors.Transparent)
            };

            Application.Current.Resources["MyForegroundThemeBrush"] = Theme switch
            {
                ElementTheme.Dark => new SolidColorBrush(Colors.White),
                ElementTheme.Light => new SolidColorBrush(Colors.Black),
                _ => new SolidColorBrush(Colors.Transparent)
            };

            if (App.MainWindow.Content is Frame frame)
            {
                if (!(frame.Content is MyShop.View.LoginPage)) { 
                   frame.Navigate(typeof(View.ShellPage), null, null);
                }

            }
            rootElement.RequestedTheme = Theme;
            TitleBarHelper.UpdateTitleBar(Theme);

        }

        await Task.CompletedTask;
    }

    private ElementTheme LoadThemeFromSettings()
    {
        var themeName = ConfigurationManager.AppSettings["Theme"];

        if (Enum.TryParse(themeName, out ElementTheme cacheTheme))
        {
            return cacheTheme;
        }

        return ElementTheme.Default;
    }

    private void SaveThemeInSettings(ElementTheme theme)
    {
        var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        config.AppSettings.Settings["Theme"].Value = theme.ToString();
        config.Save(ConfigurationSaveMode.Minimal);
        ConfigurationManager.RefreshSection("appSettings");
    }
}
