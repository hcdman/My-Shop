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
using MyShop.Model;
using System.ComponentModel;

namespace MyShop.API
{
    public class HandleAPI
    {
        HttpClient client = new HttpClient();

        public HandleAPI()
        {

            client.BaseAddress = new Uri("http://localhost:5000/");

            //client.BaseAddress = new Uri("https://test-deploy-jbnz-k72rintab-nxhawk.vercel.app/");
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

        public async Task<Tuple<bool, string>> AddNewProduct(MultipartFormDataContent content)
        {
            var response = await client.PostAsync("product/add", content);
            var returnValue = await response.Content.ReadAsStringAsync();

            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);

            if (response.StatusCode.ToString() == "OK") return Tuple.Create(true, res.message);
            return Tuple.Create(false, res.message);
        }

        public async Task<Tuple<bool, string>> UpdateProduct(MultipartFormDataContent content, string id)
        {
            var response = await client.PutAsync($"product/update/{id}", content);
            var returnValue = await response.Content.ReadAsStringAsync();

            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);

            if (response.StatusCode.ToString() == "OK") return Tuple.Create(true, res.message);
            return Tuple.Create(false, res.message);
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
            var res = JsonSerializer.Deserialize<int>(returnValue);

            return res;
        }

        public async Task<int> GetNumNewOrderM()
        {
            var response = await client.GetAsync("bill/currentMonth");
            var returnValue = await response.Content.ReadAsStringAsync();
            var res = JsonSerializer.Deserialize<int>(returnValue);

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
        public async Task<ListProduct> Filter(string name = "", string price = "", string maloai = "", string SortBy = "", int per_page = 6, int page = 1)
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

        /// get all customer
        /// 
        // public async Task<listCustomer> GetAllCustomer()
        public async Task<BindingList<Customer>> GetAllCustomer()
        {

            listCustomer res = new listCustomer();
            res.customer = null;
            while (res.customer == null)
            {

                var response = await client.GetAsync("customer/getall");
                var returnValue = await response.Content.ReadAsStringAsync();
                res = JsonSerializer.Deserialize<listCustomer>(returnValue);
                //return res;
            }


            // Dinh dang lai ngay thang
            for (var i = 0; i < res.customer.Count; i++)
            {
                res.customer[i].ngsinh = res.customer[i].ngsinh.Substring(0, 10);
                res.customer[i].ngdk = res.customer[i].ngdk.Substring(0, 10);
            }
            return new BindingList<Customer>(res.customer);
            //return returnValue;
        }

        public async Task<Tuple<bool, string>> addCustomer(Customer cus)
        {

            using StringContent jsonContent = new(
            JsonSerializer.Serialize(cus),
            Encoding.UTF8,
                "application/json");
            var response = await client.PostAsync("customer/add", jsonContent);
            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);
            if (response.StatusCode.ToString() == "OK")
            {
                return new Tuple<bool, string>(true, res.message);
            }
            return new Tuple<bool, string>(false, res.message);
        }


        public async Task<Tuple<bool, string>> deleteCustomer(string id)
        {
            var response = await client.DeleteAsync($"customer/delete/{id}");

            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);

            if (response.StatusCode.ToString() == "OK") return Tuple.Create(true, res.message);
            return Tuple.Create(false, res.message);
        }

        // get all category
        public async Task<BindingList<Category>> getAllCategory()
        {
            var response = await client.GetAsync("type/getall");
            var returnValue = await response.Content.ReadAsStringAsync();
            listcate res = JsonSerializer.Deserialize<listcate>(returnValue);
            //return res;
            return new BindingList<Category>(res.data);
        }

        // add category
        public async Task<Tuple<bool, string>> addCategory(Category cate)
        {

            using StringContent jsonContent = new(
            JsonSerializer.Serialize(cate),
            Encoding.UTF8,
                "application/json");


            var response = await client.PostAsync("type/add", jsonContent);
            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);
            if (response.StatusCode.ToString() == "OK")
            {
                return new Tuple<bool, string>(true, res.message);
            }
            return new Tuple<bool, string>(false, res.message);
        }

        // edit customer
        public async Task<Tuple<bool, string>> updateCustomer(Customer cus)
        {

            using StringContent jsonContent = new(
            JsonSerializer.Serialize(cus),
            Encoding.UTF8,
                "application/json");
            var response = await client.PutAsync($"customer/update/{cus.makh}", jsonContent);
            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);
            if (response.StatusCode.ToString() == "OK")
            {
                return new Tuple<bool, string>(true, res.message);
            }
            return new Tuple<bool, string>(false, res.message);
        }
        // delete category
        public async Task<Tuple<bool, string>> deleteCate(string id)
        {
            var response = await client.DeleteAsync($"type/delete/{id}");

            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);

            if (response.StatusCode.ToString() == "OK") return Tuple.Create(true, res.message);
            return Tuple.Create(false, res.message);
        }


        // update category
        public async Task<Tuple<bool, string>> updateCategory(Category cate)
        {

            using StringContent jsonContent = new(
            JsonSerializer.Serialize(cate),
            Encoding.UTF8,
                "application/json");


            var response = await client.PutAsync($"type/update/{cate.maloai}", jsonContent);
            var returnValue = await response.Content.ReadAsStringAsync();
            Json_Response res = JsonSerializer.Deserialize<Json_Response>(returnValue);
            if (response.StatusCode.ToString() == "OK")
            {
                return new Tuple<bool, string>(true, res.message);
            }
            return new Tuple<bool, string>(false, res.message);
        }


    }
}
