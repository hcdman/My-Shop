using System.Threading.Tasks;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using MyShop.Contracts.Services;

namespace MyShop.Services;

public class ActivationService : IActivationService
{
    private readonly IThemeSelectorService _themeSelectorService;
    private UIElement? _login = null;

    public ActivationService(IThemeSelectorService themeSelectorService)
    {
        _themeSelectorService = themeSelectorService;
    }

    public async Task ActivateAsync(object activationArgs)
    {
        // Execute tasks before activation.
        await InitializeAsync();

        // Set the MainWindow Content.
        Frame rootFrame = new Frame();
        rootFrame.Navigate(typeof(View.LoginPage));
        App.MainWindow.Content = rootFrame ?? new Frame();

        App.SetWindowSize();

        // Activate the MainWindow.
        App.MainWindow.Activate();

        // Execute tasks after activation.
        await StartupAsync();
    }


    private async Task InitializeAsync()
    {
        await _themeSelectorService.InitializeAsync().ConfigureAwait(false);
        await Task.CompletedTask;
    }

    private async Task StartupAsync()
    {
        await _themeSelectorService.SetRequestedThemeAsync();
        await Task.CompletedTask;
    }
}
