using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.WindowsRuntime;
using CommunityToolkit.WinUI.UI.Controls;
using Microsoft.UI;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Media.Animation;
using Microsoft.UI.Xaml.Navigation;
using MyShop.Model;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI;
using Windows.UI.ApplicationSettings;
using Windows.UI.Popups;
using WinUIEx;
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
        var window = App.MainWindow;
        window.ExtendsContentIntoTitleBar = true;
        window.SetTitleBar(AppTitleBar);
        
    }
    public string GetAppTitleFromSystem()
    {
        return Windows.ApplicationModel.Package.Current.DisplayName;
    }
    private void NavView_Loaded(object sender, RoutedEventArgs e)
    {
        var oldPage = ConfigurationManager.AppSettings["currentNavigationViewItem"];

        //NavView doesn't load any page by default, so load old page.
        for(var i = 0; i< NavView.MenuItems.Count; i++)
        {
            var menuItem = (Microsoft.UI.Xaml.Controls.NavigationViewItem) NavView.MenuItems[i];
            if(menuItem.Tag.Equals(oldPage))
            {
                NavView.SelectedItem = NavView.MenuItems[i];
            }
        }

        // If navigation occurs on SelectionChanged, this isn't needed.
        // Because we use ItemInvoked to navigate, we need to call Navigate
        // here to load the old page.
        NavView_Navigate(Type.GetType(oldPage), new EntranceNavigationTransitionInfo());
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
            ContentFrame.Navigate(navPageType, null, new SlideNavigationTransitionInfo() { Effect = SlideNavigationTransitionEffect.FromLeft});
            SaveCurrentNavPage();
        }
    }

    private void NavigationViewItem_Tapped(object sender, TappedRoutedEventArgs e)
    {
        var currentPage = ContentFrame.SourcePageType.FullName;

        var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        config.AppSettings.Settings["currentNavigationViewItem"].Value = currentPage;
        config.Save(ConfigurationSaveMode.Minimal);
        ConfigurationManager.RefreshSection("appSettings");
        if (App.MainWindow.Content is Frame frame)
        {
            frame.Navigate(typeof(View.LoginPage), null, new SlideNavigationTransitionInfo() { Effect = SlideNavigationTransitionEffect.FromLeft });
        }
        App.MainWindow.Restore();
    }
    
    private void Page_Unloaded(object sender, RoutedEventArgs e)
    {
        SaveCurrentNavPage();
    }

    public void SaveCurrentNavPage()
    {
        var currentPage = ContentFrame.SourcePageType.FullName;

        if(currentPage == "MyShop.View.AddCustomerPage"|| currentPage == "MyShop.View.UpdateCustomerPage")
        {
            currentPage = "MyShop.View.CustomerPage";
        }
        if (currentPage == "MyShop.View.AddProductPage" || currentPage == "MyShop.View.UpdateProductPage")
        {
            currentPage = "MyShop.View.ProductsPage";
        }
        if (currentPage == "MyShop.View.AddCategoryPage" || currentPage == "MyShop.View.UpdateCategoryPage")
        {
            currentPage = "MyShop.View.CategoryPage";
        }
        var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        config.AppSettings.Settings["currentNavigationViewItem"].Value = currentPage;
        config.Save(ConfigurationSaveMode.Minimal);
        ConfigurationManager.RefreshSection("appSettings");
    }
}
