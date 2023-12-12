using MyShop.API;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    public class RevenueWeek
    {
        public int id { get; set; }
        public double tong { get; set; }
    }

    public class ListRevenueWeek
    {
        public List<RevenueWeek> data { get; set; }
    }

    public class Revenue
    {

        public string Year { get; set; }

        public double Counts { get; set; }

        public Revenue(string name, double count)
        {
            Year = name;
            Counts = count;
        }


        public async static Task<List<Revenue>> Revenues(string check, string page, int currentDay, int currentMonth, int currentYear)
        {
            HandleAPI api = new HandleAPI();
            if (check == "year")
            {
                var resultYear = new List<Revenue>(new Revenue[12]
                {
                    new Revenue("Jan", 0),
                    new Revenue("Feb.", 0),
                    new Revenue("Mar.", 0),
                    new Revenue("Apr.", 0),
                    new Revenue("May", 0),
                    new Revenue("Jun.", 0),
                    new Revenue("Jul.", 0),
                    new Revenue("Aug.", 0),
                    new Revenue("Sep.", 0),
                    new Revenue("Oct.", 0),
                    new Revenue("Nov.", 0),
                    new Revenue("Dec.", 0)
                });
                ListRevenueWeek getYear = await api.RevenueStatistics("year", page, currentDay, currentMonth, currentYear);
                foreach (var item in getYear.data)
                {
                    resultYear[item.id - 1].Counts = item.tong;
                }
                return resultYear;
            }
            else if (check == "month")
            {

                var resultMonth = new List<Revenue>();
                for (int i = 1; i <= 31; i++) resultMonth.Add(new Revenue($"Day {i}", 0));
                ListRevenueWeek getMonth = await api.RevenueStatistics("month", page, currentDay, currentMonth, currentYear);
                foreach (var item in getMonth.data)
                {
                    resultMonth[item.id - 1].Counts = item.tong;
                }
                return resultMonth;

            }

            var result = new List<Revenue>(new Revenue[7]
                {
                    new Revenue("Mon", 0),
                    new Revenue("Tue", 0),
                    new Revenue("Wed", 0),
                    new Revenue("Thur", 0),
                    new Revenue("Fri", 0),
                    new Revenue("Sat", 0),
                    new Revenue("Sun", 0)
                });

            ListRevenueWeek getWeek = await api.RevenueStatistics("week", page, currentDay, currentMonth, currentYear);
            foreach (var item in getWeek.data)
            {
                result[item.id].Counts = item.tong;
            }
            return result;
        }
    }
}
