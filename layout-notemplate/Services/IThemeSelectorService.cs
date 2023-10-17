using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.UI.Xaml;

namespace MyShop.Services;
public interface IThemeSelectorService
{
    ElementTheme GetTheme();
    void SetTheme(ElementTheme theme);
}
