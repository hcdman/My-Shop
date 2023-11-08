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
using Microsoft.UI.Xaml.Media.Animation;
using WinUIEx;

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

        private bool _remember;
        public Boolean Remember
        {
            get
            {
                return _remember;
            }
            set
            {
                SetProperty(ref _remember, value);
                OnPropertyChanged(nameof(Remember));
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
                Remember = true;
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
                if(Remember == true)
                {
                    var passwordInBytes = Encoding.UTF8.GetBytes(Pass);
                    var entropy = new byte[20];
                    using (var rng = new RNGCryptoServiceProvider())
                    {
                        rng.GetBytes(entropy);
                    }
                    var cypherText = ProtectedData.Protect(passwordInBytes, entropy,
                        DataProtectionScope.CurrentUser);
                    var passwordIn64 = Convert.ToBase64String(cypherText);
                    var entropyIn64 = Convert.ToBase64String(entropy);

                    var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                    config.AppSettings.Settings["Username"].Value = User;
                    config.AppSettings.Settings["Password"].Value = passwordIn64;
                    config.AppSettings.Settings["Entropy"].Value = entropyIn64;
                    config.Save(ConfigurationSaveMode.Minimal);

                    ConfigurationManager.RefreshSection("appSettings");
                } else
                {
                    var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                    config.AppSettings.Settings["Username"].Value = "";
                    config.AppSettings.Settings["Password"].Value = "";
                    config.AppSettings.Settings["Entropy"].Value = "";
                    config.Save(ConfigurationSaveMode.Minimal);

                    ConfigurationManager.RefreshSection("appSettings");
                }

     
                if (App.MainWindow.Content is Frame frame)
                {
                    frame.Navigate(typeof(View.ShellPage), null, null);
                    App.MainWindow.Maximize();
                }
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
