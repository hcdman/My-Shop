using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.UI.Xaml;

namespace MyShop.Services;
internal class ThemeSelectorService:IThemeSelectorService
{
    public ElementTheme GetTheme()
    {
        if(App.m_window?.Content is FrameworkElement frameworkElement)
        {
            return frameworkElement.ActualTheme;
        }
        return ElementTheme.Default;
    }

    public void SetTheme(ElementTheme theme)
    {
        if (App.m_window?.Content is FrameworkElement frameworkElement)
        {
            frameworkElement.RequestedTheme = theme;
        }
    }
}
