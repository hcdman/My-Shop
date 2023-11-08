using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading.Tasks;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.API;
using MyShop.Model;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View;
/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
public sealed partial class UpdateCategoryPage : Page, INotifyPropertyChanged
{
    public Category cate = new Category();
    public UpdateCategoryPage()
    {
        this.InitializeComponent();
    }




    private void mainLoaded(object sender, RoutedEventArgs e)
    {
        this.DataContext = cate;
    }


    HandleAPI api = new HandleAPI();

   
    public async void updateCateory()
    {
        mess.Text = "";
       
        var (success, message) = await Task.Run(() => { return api.updateCategory(cate); });
       
        mess.Text = message;
    }
    protected override void OnNavigatedTo(NavigationEventArgs e)
    {
        cate = (Category)e.Parameter;
    }

    private void Cancel_Click(object sender, RoutedEventArgs e)
    {
        Frame.Navigate(typeof(View.CategoryPage));
    }

    private void Update_Click(object sender, RoutedEventArgs e)
    {
        updateCateory();
    }
}
