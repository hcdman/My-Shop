using System;
using System.Diagnostics;
using System.IO;
using Microsoft.UI;
using Microsoft.UI.Windowing;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Automation;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Media.Animation;
using MyShop.Helpers;
using Windows.UI.ViewManagement;
using WinRT.Interop;
using WinUIEx;


namespace MyShop;
/// <summary>
/// An empty window that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class MainWindow : WindowEx
{
    private Microsoft.UI.Windowing.AppWindow _appWindow;

    private Microsoft.UI.Dispatching.DispatcherQueue dispatcherQueue;

    private UISettings settings;

    public MainWindow()
    {
        InitializeComponent();
        this.AppWindow.SetIcon(Path.Combine(AppContext.BaseDirectory, "Assets\\icon-shop-64.ico"));
        Content = null;
        Title = Windows.ApplicationModel.Package.Current.DisplayName;

        // Theme change code picked from https://github.com/microsoft/WinUI-Gallery/pull/1239
        dispatcherQueue = Microsoft.UI.Dispatching.DispatcherQueue.GetForCurrentThread();
        settings = new UISettings();
        settings.ColorValuesChanged += Settings_ColorValuesChanged; // cannot use FrameworkElement.ActualThemeChanged event

        _appWindow = GetAppWindowForCurrentWindow();
        Debug.WriteLine(_appWindow.Presenter);
        //_appWindow.SetPresenter(AppWindowPresenterKind.FullScreen);

    }

    // this handles updating the caption button colors correctly when indows system theme is changed
    // while the app is open
    private void Settings_ColorValuesChanged(UISettings sender, object args)
    {
        // This calls comes off-thread, hence we will need to dispatch it to current app's thread
        dispatcherQueue.TryEnqueue(() =>
        {
            TitleBarHelper.ApplySystemThemeToCaptionButtons();
        });
    }

    private Microsoft.UI.Windowing.AppWindow GetAppWindowForCurrentWindow()
    {
        IntPtr hWnd = WindowNative.GetWindowHandle(this);
        WindowId myWndId = Win32Interop.GetWindowIdFromWindow(hWnd);
        return Microsoft.UI.Windowing.AppWindow.GetFromWindowId(myWndId);
    }

    private void WindowEx_SizeChanged(object sender, Microsoft.UI.Xaml.WindowSizeChangedEventArgs args)
    {
        if(Bounds._width > 1300)
        {
            Application.Current.Resources["OpenPaneLength"] = 300;
            Application.Current.Resources["Top5ImageWidth"] = 100;
            Application.Current.Resources["Top5SoldMargin"] = new Thickness(68,0,68,0);
            Application.Current.Resources["DataGridTextWidth"] = 110;
            Application.Current.Resources["DataGridAddressWidth"] = 300;

        } else
        { 
            Application.Current.Resources["OpenPaneLength"] = 200;
            Application.Current.Resources["Top5ImageWidth"] = 50;
            Application.Current.Resources["Top5SoldMargin"] = new Thickness(33, 5, 33, 5);
            Application.Current.Resources["DataGridTextWidth"] = 85;
            Application.Current.Resources["DataGridAddressWidth"] = 110;
        }
        if (this.Content is Frame frame)
        {
            if (frame.Content is not MyShop.View.LoginPage && frame.Content is not MyShop.View.LoginExpiredPage)
            {
                frame.Navigate(typeof(View.ShellPage), null, new SlideNavigationTransitionInfo() { Effect = SlideNavigationTransitionEffect.FromLeft });
            }

        }
    }

}
