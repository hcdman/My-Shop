using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.UI.Xaml;
using MyShop.Services;

namespace MyShop.ViewModel;
public class SettingsViewModel:ObservableObject
{
    private readonly IThemeSelectorService _themeSelectorService;
    public ICommand SetThemeCommand
    {
        get;
    }
    public SettingsViewModel(IThemeSelectorService themeSelectorService)
    {
        SetThemeCommand = new RelayCommand<string>((theme) => UpdateTheme(theme));
        _themeSelectorService = themeSelectorService;

    }
    private void UpdateTheme(string themeName)
    {
        if(Enum.TryParse(themeName, out ElementTheme theme) is true)
        {

            _themeSelectorService.SetTheme(theme);
        }
    }
}
