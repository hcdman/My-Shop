using CommunityToolkit.WinUI.UI;
using Microsoft.Toolkit.Uwp.Notifications;
using MyShop.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;
using static System.Net.Mime.MediaTypeNames;

namespace MyShop.Model
{
    public class Sale
    {
        public string product { get; set; }

        public double sl { get; set; }
    }

    public class ListSales
    {
        public List<Sale> data { get; set; }
    }

    public class Sales
    {
        public string Product { get; set; }

        public double SalesRate { get; set; }

        public Sales(string name, double count)
        {
            Product = name;
            SalesRate = count;
        }

        public async static Task<List<Sales>> Saless(string check)
        {
            HandleAPI api = new HandleAPI();
            if (check == "year")
            {
                
                ListSales getPieceYear;
                while (true){
                    getPieceYear = await api.PieceStatistics("year");
                    if (getPieceYear.data.Count > 0) break;
                }

                var resYear = new List<Sales>();

                for (int i = 0; i < getPieceYear.data.Count; i++)
                {
                    var item = getPieceYear.data[i];
                    if (i < 4) resYear.Add(new Sales(item.product, item.sl));
                    else if (i == 4) resYear.Add(new Sales("Orders", item.sl));
                    else resYear[4].SalesRate += item.sl;
                }
                
                return resYear;
            }
            else if (check == "month")
            {
                ListSales getPieceMonth;
                while (true)
                {
                    getPieceMonth = await api.PieceStatistics("month");
                    if (getPieceMonth.data.Count > 0) break;
                }


                var resMonth = new List<Sales>();

                for (int i = 0; i < getPieceMonth.data.Count; i++)
                {
                    var item = getPieceMonth.data[i];
                    if (i < 4) resMonth.Add(new Sales(item.product, item.sl));
                    else if (i == 4) resMonth.Add(new Sales("Orders", item.sl));
                    else resMonth[4].SalesRate += item.sl;
                }

                return resMonth;
            }

            ListSales getPieceWeek;
            while (true)
            {
                getPieceWeek = await api.PieceStatistics("week");
                if (getPieceWeek.data.Count > 0) break;
            }


            var resWeek = new List<Sales>();

            for (int i = 0; i < getPieceWeek.data.Count; i++)
            {
                var item = getPieceWeek.data[i];
                if (i < 4) resWeek.Add(new Sales(item.product, item.sl));
                else if (i == 4) resWeek.Add(new Sales("Orders", item.sl));
                else resWeek[4].SalesRate += item.sl;
            }

            return resWeek;
        }
    }

    
}