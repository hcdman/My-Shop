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
    private static Frame frame1;

    public static Frame frame
    {
        get => frame1; set => frame1 = value;
    }

    public MainWindow()
    {
        InitializeComponent();
        ExtendsContentIntoTitleBar = true;
        frame = mainFrame;
        this.AppWindow.SetIcon(Path.Combine(AppContext.BaseDirectory, "Assets\\icon-shop-64.ico"));
        Title = "MyShop";


        _appWindow = GetAppWindowForCurrentWindow();
        Debug.WriteLine(_appWindow.Presenter);
        //_appWindow.SetPresenter(AppWindowPresenterKind.FullScreen);

    }

    public static void WindowFrameNavigate(System.Type page)
    {
        frame.Navigate(page);
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
            var windowWidth = (int) Bounds._width;
            var space = (windowWidth - 300 - 150*5 - 40) / 10;
            Application.Current.Resources["Top5SoldMargin"] = new Thickness(space,0,space,0);
            Application.Current.Resources["DataGridTextWidth"] = 110;
            Application.Current.Resources["OrderGridTextWidth"] = (windowWidth -300 - 300 - 40 - 100)/3;
            Application.Current.Resources["DataGridAddressWidth"] = 280;

        } else
        { 
            Application.Current.Resources["OpenPaneLength"] = 200;
            Application.Current.Resources["Top5ImageWidth"] = 60;
            var windowWidth = (int)Bounds._width;
            var space = (windowWidth - 200 - 150 * 5 - 40) / 10;
            Application.Current.Resources["Top5SoldMargin"] = new Thickness(space, 0, space, 0);
            Application.Current.Resources["DataGridTextWidth"] = 85;
            Application.Current.Resources["OrderGridTextWidth"] = (windowWidth - 300 - 40 -200 - 100) / 3;
            Application.Current.Resources["DataGridAddressWidth"] = 100;
        }
        
        if (frame is not null && frame.Content is not MyShop.View.LoginPage && frame.Content is not MyShop.View.LoginExpiredPage)
        {
            MainWindow.WindowFrameNavigate(typeof(View.ShellPage));
        }
    }

}
