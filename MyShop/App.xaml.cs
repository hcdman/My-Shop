using System;
using Microsoft.Extensions.DependencyInjection;
using System.Threading.Tasks;
using Microsoft.UI.Xaml;
using WinUIEx;
using MyShop.Contracts.Services;
using MyShop.Services;
using MyShop.ViewModel;
using System.Runtime.InteropServices;
using Windows.UI.ViewManagement;
using Windows.Graphics.Display;
using Windows.Devices.Display;
using Windows.Devices.Enumeration;
using Windows.Graphics;
using System.Linq;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop;

public partial class App : Application
{

    public static WindowEx MainWindow { get; } = new MainWindow();
    public static IServiceProvider Services
    {
        get; private set;
    }
    public static UIElement? AppTitlebar
    {
        get; set;
    }

    public App()
    {
        InitializeComponent();
    }

    protected async override void OnLaunched(Microsoft.UI.Xaml.LaunchActivatedEventArgs args)
    {
        base.OnLaunched(args);

        // Initialize services asynchronously
        Services = await InitializeServicesAsync();

        IActivationService activationService = Services.GetService<IActivationService>();
        await activationService.ActivateAsync(args);
        MainWindow.IsResizable = false;
        SetWindowSize();
    }

    private Task<IServiceProvider> InitializeServicesAsync()
    {
        var services = new ServiceCollection();
        services.AddSingleton<IThemeSelectorService, ThemeSelectorService>();
        services.AddSingleton<IActivationService, ActivationService>();
        services.AddSingleton<SettingsViewModel>();
        return Task.FromResult<IServiceProvider>(services.BuildServiceProvider());
    }

    public static void SetWindowSize()
    {
        //set center screen
        var hWnd = WinRT.Interop.WindowNative.GetWindowHandle(MainWindow);
        Microsoft.UI.WindowId windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(hWnd);
        Microsoft.UI.Windowing.AppWindow appWindow = Microsoft.UI.Windowing.AppWindow.GetFromWindowId(windowId);
        Task.Run(async () => await SizeWindow(appWindow));

        //var bounds = ApplicationView.GetForCurrentView().VisibleBounds;
        //var scaleFactor = DisplayInformation.GetForCurrentView().RawPixelsPerViewPixel;
        //appWindow.Resize(new Windows.Graphics.SizeInt32 { Width = 1500, Height = 1060 });

        if (appWindow is not null)
        {
            Microsoft.UI.Windowing.DisplayArea displayArea = Microsoft.UI.Windowing.DisplayArea.GetFromWindowId(windowId, Microsoft.UI.Windowing.DisplayAreaFallback.Nearest);
            if (displayArea is not null)
            {
                var CenteredPosition = appWindow.Position;
                CenteredPosition.X = ((displayArea.WorkArea.Width - appWindow.Size.Width) / 2);
                CenteredPosition.Y = 60;
                appWindow.Move(CenteredPosition);
            }
        }
    }

    private static async Task SizeWindow(Microsoft.UI.Windowing.AppWindow appWindow)
    {
        var displayList = await DeviceInformation.FindAllAsync
                          (DisplayMonitor.GetDeviceSelector());

        if (!displayList.Any())
            return;

        var monitorInfo = await DisplayMonitor.FromInterfaceIdAsync(displayList[0].Id);

        var winSize = new SizeInt32();

        if (monitorInfo == null)
        {
            winSize.Width = 1400;
            winSize.Height = 900;
        }
        else
        {
            winSize.Height = monitorInfo.NativeResolutionInRawPixels.Height;
            winSize.Width = monitorInfo.NativeResolutionInRawPixels.Width;

            var widthInInches = Convert.ToInt32(10 * monitorInfo.RawDpiX);
            var heightInInches = Convert.ToInt32(6.8 * monitorInfo.RawDpiY);

            winSize.Height = winSize.Height > heightInInches ?
                             heightInInches : winSize.Height;
            winSize.Width = winSize.Width > widthInInches ? widthInInches : winSize.Width;
        }

        appWindow.Resize(winSize);
    }

    private const int WAINACTIVE = 0x00;
    private const int WAACTIVE = 0x01;
    private const int WMACTIVATE = 0x0006;

    [DllImport("user32.dll")]
    private static extern IntPtr GetActiveWindow();

    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    private static extern IntPtr SendMessage(IntPtr hWnd, int msg, int wParam, IntPtr lParam);

    public static void ReloadWindow()
    {
        var hwnd = WinRT.Interop.WindowNative.GetWindowHandle(App.MainWindow);
        if (hwnd == GetActiveWindow())
        {
            SendMessage(hwnd, WMACTIVATE, WAINACTIVE, IntPtr.Zero);
            SendMessage(hwnd, WMACTIVATE, WAACTIVE, IntPtr.Zero);
        }
        else
        {
            SendMessage(hwnd, WMACTIVATE, WAACTIVE, IntPtr.Zero);
            SendMessage(hwnd, WMACTIVATE, WAINACTIVE, IntPtr.Zero);
        }
    }
}
