using Microsoft.UI.Xaml.Controls;

using My_Shop.ViewModels;

namespace My_Shop.Views;

public sealed partial class ProductsPage : Page
{
    public ProductsViewModel ViewModel
    {
        get;
    }

    public ProductsPage()
    {
        ViewModel = App.GetService<ProductsViewModel>();
        InitializeComponent();
    }
}
