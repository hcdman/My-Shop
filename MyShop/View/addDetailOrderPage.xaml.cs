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
using MyShop.Model;
using System.Windows;
using RoutedEventArgs = Microsoft.UI.Xaml.RoutedEventArgs;
using System.Collections.ObjectModel;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace MyShop.View
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class addDetailOrderPage : Page
    {
        ObservableCollection<ProductOrder> orderProducts = new ObservableCollection<ProductOrder>();
        ObservableCollection<ProductOrder> filterProducts = new ObservableCollection<ProductOrder>();
        ProductPageViewModel pm = new ProductPageViewModel();
        public addDetailOrderPage()
        {
            this.InitializeComponent();

        }

        public addDetailOrderViewModel viewModel { get; set; }
        public Order order { get; set; }

        int amount = 0;

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            order = (Order)e.Parameter;
            viewModel = new addDetailOrderViewModel();
            if (order != null) { viewModel.detailOrder.sohd = order.sohd; }
            form.DataContext = viewModel.detailOrder;
            this.DataContext = viewModel;
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Frame.Navigate(typeof(View.detailOrderPage), order);
        }

        private void mainLoad(object sender, RoutedEventArgs e)
        {
            orderProducts.Clear();
            for (int i = 0; i < pm.Products.Count; i++)
            {
                orderProducts.Add(new ProductOrder(pm.Products[i].masp, pm.Products[i].tensp, pm.Products[i].anh));
            }
            productListBox.ItemsSource = orderProducts;
        }


        private void addDetailOrder(object sender, RoutedEventArgs e)
        {

        }


        private void Option_Checked(object sender, RoutedEventArgs e)
        {

            //chage property checked to true
            CheckBox checkBox = (CheckBox)sender;
            if (checkBox.IsChecked == true)
            {
                string id = checkBox.Tag.ToString();
                var product = orderProducts.FirstOrDefault(e => e.masp == id);
                product.check = true;
                //var product = (ProductOrder)checkBox.DataContext;

                if (selectedProductListBox.Items.Contains(product) == false)
                {
                    selectedProductListBox.Items.Add(product);
                }

                //Check product filter
                if (filterProducts.Count > 0)
                {
                    var temp = filterProducts.FirstOrDefault(e => e.masp == id);
                    temp.check = true;
                }
            }

        }


        private void Option_Unchecked(object sender, RoutedEventArgs e)
        {
            //chage property checked to false
            CheckBox checkBox = (CheckBox)sender;
            if (checkBox.IsChecked == false)
            {
                string id = checkBox.Tag.ToString();
                var product = orderProducts.FirstOrDefault(e => e.masp == id);
                product.check = false;
                //var product = (ProductOrder)checkBox.DataContext;
                if (selectedProductListBox.Items.Contains(product))
                {
                    selectedProductListBox.Items.Remove(product);
                }

                //Check product filter
                if (filterProducts.Count > 0)
                {
                    var temp = filterProducts.FirstOrDefault(e => e.masp == id);
                    temp.check = false;
                }
            }

        }

        private void Search(object sender, RoutedEventArgs e)
        {

            string nameFilter = Filter.Text;
            if (nameFilter.Length != 0)
            {
                // add product filter to filterProducts
                for (int i = 0; i < orderProducts.Count; i++)
                {
                    if (orderProducts[i].tensp.ToLower().Contains(nameFilter.ToLower()))
                    {
                        filterProducts.Add(orderProducts[i]);
                    }
                }
                productListBox.ItemsSource = filterProducts;
            }


        }

        private void BackUp(object sender, KeyRoutedEventArgs e)
        {
            //add new product checked after filter
            for (int i = 0; i < filterProducts.Count; i++)
            {
                if (filterProducts[i].check == true)
                {
                    var product = orderProducts.FirstOrDefault(e => e.masp == filterProducts[i].masp);
                    product.check = true;
                    product.sl = filterProducts[i].sl;
                }
            }
            productListBox.ItemsSource = orderProducts;
            filterProducts.Clear();
        }
    }
}
