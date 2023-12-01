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
using System.Windows.Controls.Primitives;
using System.Linq;

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

            Application.Current.Resources["ButtonBackgroundPointerOver"] = Theme switch
            {
                ElementTheme.Light => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 17, 18, 30)),
                ElementTheme.Dark => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 243, 243, 243)),
                _ => new SolidColorBrush(Colors.Transparent)
            };

            Application.Current.Resources["ButtonBackgroundPressed"] = Theme switch
            {
                ElementTheme.Light => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 17, 18, 30)),
                ElementTheme.Dark => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 243, 243, 243)),
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

            Application.Current.Resources["ButtonForegroundPointerOver"] = Theme switch
            {
                ElementTheme.Light => new SolidColorBrush(Colors.White),
                ElementTheme.Dark => new SolidColorBrush(Colors.Black),
                _ => new SolidColorBrush(Colors.Transparent)
            };

            Application.Current.Resources["ButtonForegroundPressed"] = Theme switch
            {
                ElementTheme.Light => new SolidColorBrush(Colors.White),
                ElementTheme.Dark => new SolidColorBrush(Colors.Black),
                _ => new SolidColorBrush(Colors.Transparent)
            };
            BrushCollection customBrush = new BrushCollection();

            switch (Theme)
            {
                case ElementTheme.Dark:
                    customBrush.Add(new SolidColorBrush(Windows.UI.Color.FromArgb(255, 174, 223, 247)));
                    break;

                case ElementTheme.Light:
                    customBrush.Add(new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 60, 114)));
                    break;
            }
            Application.Current.Resources["customBrushes"] = customBrush;
            //Application.Current.Resources["customBrushes"] = Theme switch
            //{
            //    ElementTheme.Dark => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 174, 223, 247)),
            //    ElementTheme.Light => new SolidColorBrush(Windows.UI.Color.FromArgb(255, 0, 60, 114)),
            //    _ => new SolidColorBrush(Colors.Transparent)
            //};
            
            if (MainWindow.frame.Content is not MyShop.View.LoginPage && MainWindow.frame.Content is not MyShop.View.LoginExpiredPage) { 
                MainWindow.WindowFrameNavigate(typeof(View.ShellPage));
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
