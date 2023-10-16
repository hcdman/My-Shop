using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Media.Animation;
using Microsoft.UI.Xaml.Navigation;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.ApplicationSettings;
using static System.Net.WebRequestMethods;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class ShellPage : Page
{
    public ShellPage()
    {
        this.InitializeComponent();
        var window = App.m_window;
        window.ExtendsContentIntoTitleBar = true;
        window.SetTitleBar(AppTitleBar);
    }
    public string GetAppTitleFromSystem()
    {
        return Windows.ApplicationModel.Package.Current.DisplayName;
    }
    private void NavView_Loaded(object sender, RoutedEventArgs e)
    {

        // NavView doesn't load any page by default, so load home page.
        NavView.SelectedItem = NavView.MenuItems[0];

        // If navigation occurs on SelectionChanged, this isn't needed.
        // Because we use ItemInvoked to navigate, we need to call Navigate
        // here to load the home page.
        NavView_Navigate(typeof(DashboardPage), new EntranceNavigationTransitionInfo());
    }
    private void NavView_ItemInvoked(NavigationView sender, NavigationViewItemInvokedEventArgs args)
    {
        if (args.IsSettingsInvoked == true)
        {
            NavView_Navigate(typeof(View.SettingsPage), args.RecommendedNavigationTransitionInfo);
        }
        else if (args.InvokedItemContainer != null)
        {
            Type navPageType = Type.GetType(args.InvokedItemContainer.Tag.ToString());
            NavView_Navigate(navPageType, args.RecommendedNavigationTransitionInfo);
        }
    }

    private void NavView_Navigate(
    Type navPageType,
    NavigationTransitionInfo transitionInfo)
    {
        // Get the page type before navigation so you can prevent duplicate
        // entries in the backstack.
        Type preNavPageType = ContentFrame.CurrentSourcePageType;

        // Only navigate if the selected page isn't currently loaded.
        if (navPageType is not null && !Type.Equals(preNavPageType, navPageType))
        {
            ContentFrame.Navigate(navPageType, null, transitionInfo);
        }
    }
}
