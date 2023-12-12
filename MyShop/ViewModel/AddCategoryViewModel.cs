using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.UI.Xaml.Controls;
using MyShop.API;
using MyShop.Model;
using MyShop.ViewModel.command;
using Windows.UI.Popups;

namespace MyShop.ViewModel;
public class AddCategoryViewModel:INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;

    public Category cate
    {
        get; set;
    }

    public string mess
    {
        get; set;
    }
    public bool isShowProgres
    {
        get; set;
    }
    public AddCategoryViewModel()
    {
        cate = new Category();
        isShowProgres = false;
        addCate = new relayCommand(handleAdd, canAdd);
    }


    public ICommand addCate
    {
        get; set;
    }

    public bool canAdd(object obj)
    {
        return true;
    }

    HandleAPI api = new HandleAPI();
    public void handleAdd(object obj)
    {
        addCategory(cate);
    }
    public async void addCategory(Category cate)
    {
        mess = "";
        isShowProgres = true;
        var (success, message) = await api.addCategory(cate);
        mess = message;
        isShowProgres = false;
       

    }
}
