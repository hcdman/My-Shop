using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.ViewModel;
using System.Threading;
using System.Threading.Tasks;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class AddProductPage : Page
    {
        public AddProductPage()
        {
            this.InitializeComponent();
            this.DataContext = new AddProductViewModel();
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            var dataSource = (AddProductViewModel)DataContext;
            var success = await dataSource.addNewProduct();

            if (success)
            {
                await Task.Delay(1000);
                Frame.Navigate(typeof(View.ProductsPage));
            }

        }
    }
}
