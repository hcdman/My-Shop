using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml;
using MyShop.API;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using MyShop.View;
using System.Diagnostics;
using System.ComponentModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Runtime.CompilerServices;

namespace MyShop.ViewModel
{
    internal  class LoginViewModel : ObservableObject
    {
        public ICommand login {  get; set; }

        private string _user;
        public string User
        {
            get { return _user; }
            set
            {
                SetProperty(ref _user, value);
                OnPropertyChanged(nameof(User));
            }
        }

        private string _pass;
        public string Pass
        {
            get { return _pass; }
            set
            {
                SetProperty(ref _pass, value);
                OnPropertyChanged(nameof(Pass));
            }
        }

        private string _mess;
        public string Mess
        {
            get { return _mess; }
            set
            {
                SetProperty(ref _mess, value);
                OnPropertyChanged(nameof(Mess));
            }
        }
       

        public LoginViewModel()
        {
            LoginPage_Loaded();
            Mess = "";
        }

        private void LoginPage_Loaded()
        {
           var passwordIn64 = ConfigurationManager.AppSettings["Password"];

            if (passwordIn64.Length != 0)
            {
                var entropyIn64 = ConfigurationManager.AppSettings["Entropy"];

                var cyperTextInBytes = Convert.FromBase64String(passwordIn64);
                var entropyInBytes = Convert.FromBase64String(entropyIn64);

                var passwordInBytes = ProtectedData.Unprotect(cyperTextInBytes, entropyInBytes,
                    DataProtectionScope.CurrentUser);
                var password = Encoding.UTF8.GetString(passwordInBytes);
                Pass = password;
                User = ConfigurationManager.AppSettings["Username"];

               handleLogin();
            }
        }
        HandleAPI api = new HandleAPI();

        private readonly RelayCommand _login;
        public RelayCommand Login
        {
            get
            {
                return _login ?? (new RelayCommand(() => handleLogin())) ;
            }
        }

        public async void handleLogin()
        {
            var (success, message) = await api.Login(User, Pass);
            if (success == true)
            {
                Frame f = new Frame();
                f.Navigate(typeof(View.ShellPage));
                App.m_window.Content = f;
                App.m_window.Activate();
            }
            else
            {
                Mess = message;
                await Task.Run(() =>
                {
                    System.Threading.Thread.Sleep(2000);
                });
                Mess = "";
            }
        }

    }
}
