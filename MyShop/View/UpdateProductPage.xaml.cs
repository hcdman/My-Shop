using ColorCode.Compilation.Languages;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using MyShop.API;
using MyShop.Model;
using MyShop.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading;
using System.Threading.Tasks;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class UpdateProductPage : Page
    {
        public Product pro = new Product();
        HandleAPI api = new HandleAPI();
        public UpdateProductPage()
        {
            this.InitializeComponent();
            Loaded += UpdateProductPage_Loaded;
        }

        private void UpdateProductPage_Loaded(object sender, RoutedEventArgs e)
        {
            this.DataContext = new UpdateProductViewModel(pro);
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            pro = (Product)e.Parameter;
        }

        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            var dataSource = (UpdateProductViewModel)DataContext;
            var success = await dataSource.updateProduct();

            if (success)
            {
                await Task.Delay(1000);
                Frame.Navigate(typeof(View.ProductsPage));
            }
        }
    }
}
