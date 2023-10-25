using Microsoft.UI.Xaml.Controls;
using MyShop.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Configuration;
using System.Windows;
using System.Security.Cryptography;
using System.Net;
using System.Net.Http.Headers;
using System.Xml.Linq;

namespace MyShop.API
{
    public class HandleAPI
    {
        HttpClient client = new HttpClient();

        public HandleAPI() 
        {

            //client.BaseAddress = new Uri("http://localhost:5000/");

            client.BaseAddress = new Uri("https://test-deploy-jbnz-k72rintab-nxhawk.vercel.app/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json")
            );
        }

        public async Task<bool> hasAccount()
        {
            return false;
        }

        public async Task<Tuple<bool, string>> Login(string username, string password)
        {
            
            Admin admin = new Admin() { username = username, password = password };
            using StringContent jsonContent = new(
            JsonSerializer.Serialize(admin),
            Encoding.UTF8,
                "application/json");

            var response = await client.PostAsync("auth/login", jsonContent);
            var returnValue = await response.Content.ReadAsStringAsync();

            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);

                       

            //Write file using StreamWriter - store local
            if (response.StatusCode.ToString() == "OK")
            {


                var passwordInBytes = Encoding.UTF8.GetBytes(password);
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
                config.AppSettings.Settings["Username"].Value = username;
                config.AppSettings.Settings["Password"].Value = passwordIn64;
                config.AppSettings.Settings["Entropy"].Value = entropyIn64;
                config.Save(ConfigurationSaveMode.Minimal);

                ConfigurationManager.RefreshSection("appSettings");

                return new Tuple<bool, string>(true, res.message);
            }

            return new Tuple<bool, string>(false, res.message);
        }

        public void Logout()
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["Username"].Value = "";
            config.AppSettings.Settings["Password"].Value = "";
            config.AppSettings.Settings["Entropy"].Value = "";
            config.Save(ConfigurationSaveMode.Minimal);

            ConfigurationManager.RefreshSection("appSettings");
        }


        public async Task<ListProduct> GetAllProduct()
        {
            var response = await client.GetAsync("product/getall");
            var returnValue = await response.Content.ReadAsStringAsync();
            ListProduct res = JsonSerializer.Deserialize<ListProduct>(returnValue);

            return res;
        }

        public async Task<ListProduct> GetTop5()
        {
            var response = await client.GetAsync("product/top5");
            var returnValue = await response.Content.ReadAsStringAsync();
            ListProduct res = JsonSerializer.Deserialize<ListProduct>(returnValue);

            return res;
        }

        public async Task<string> AddNewProduct(MultipartFormDataContent content)
        {
            var response = await client.PostAsync("product/add", content);
            var returnValue = await response.Content.ReadAsStringAsync();

            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);
            
            return res.message;
        }

        public async Task<Tuple<bool, string>> DeleteProduct(string id)
        {
            var response = await client.DeleteAsync($"product/delete/{id}");
            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);

            if (response.StatusCode.ToString() == "OK") return Tuple.Create(true, res.message);
            return Tuple.Create(false, res.message);
        }

        public async Task<DashboardItemList> GetLatestOrder()
        {
            var response = await client.GetAsync("bill/latest");
            var returnValue = await response.Content.ReadAsStringAsync();
            DashboardItemList res = JsonSerializer.Deserialize<DashboardItemList>(returnValue);

            return res;
        }

        public async Task<int> GetNumNewOrderW()
        {
            var response = await client.GetAsync("bill/currentWeek");
            var returnValue = await response.Content.ReadAsStringAsync();
            int res = JsonSerializer.Deserialize<int>(returnValue);

            return res;
        }

        public async Task<int> GetNumNewOrderM()
        {
            var response = await client.GetAsync("bill/currentMonth");
            var returnValue = await response.Content.ReadAsStringAsync();
            int res = JsonSerializer.Deserialize<int>(returnValue);

            return res;
        }

        public async Task<int> GetMoneyCurrentDay()
        {
            var response = await client.GetAsync("bill/todayMoney");
            var returnValue = await response.Content.ReadAsStringAsync();
            int res = JsonSerializer.Deserialize<int>(returnValue);

            return res;
        }

        //----------------------Type
        public async Task<ListTypeProduct> GetAllType()
        {
            var response = await client.GetAsync("type/getall");
            var returnValue = await response.Content.ReadAsStringAsync();
            ListTypeProduct res = JsonSerializer.Deserialize<ListTypeProduct>(returnValue);

            return res;
        }


        //----- get product per_page/page
        public async Task<ListProduct> Filter(string name="", string price="", string maloai="", string SortBy="", int per_page=6, int page=1)
        {
            DataFilter dataFilter = new DataFilter() { name = name, price = price, maloai = maloai, SortBy = SortBy, per_page = per_page, page = page };
            using StringContent jsonContent = new(
            JsonSerializer.Serialize(dataFilter),
            Encoding.UTF8,
                "application/json");

            var response = await client.PostAsync("product/filter", jsonContent);
            var returnValue = await response.Content.ReadAsStringAsync();
            ListProduct res = JsonSerializer.Deserialize<ListProduct>(returnValue);

            return res;
        }
        //-------------------------------
    }
}
