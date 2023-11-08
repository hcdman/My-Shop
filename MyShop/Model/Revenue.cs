using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyShop.Model
{
    public class Revenue
    {
        public string Year { get; set; }

        public double Counts { get; set; }

        public Revenue(string name, double count)
        {
            Year = name;
            Counts = count;
        }

        public static List<Revenue> Revenues(string check)
        {
            if (check == "year")
            {
                return new List<Revenue>(new Revenue[12]
                {
                 new Revenue("Jan", 415),
            new Revenue("Feb.", 408),
            new Revenue("Mar.", 415),
            new Revenue("Apr.", 350),
            new Revenue("May", 0),
            new Revenue("Jun.", 0),
            new Revenue("Jul.", 0),
            new Revenue("Aug.", 0),
            new Revenue("Sep.", 500),
            new Revenue("Oct.", 600),
            new Revenue("Nov.", 690),
            new Revenue("Dec.", 500)
                });
            }
            else if (check == "month")
            {
                return new List<Revenue>(new Revenue[12]
                {
                    new Revenue("Day 1", 77),
                    new Revenue("Day 2", 50),
                    new Revenue("Day 3", 20),
                    new Revenue("Day 4", 50),
                    new Revenue("Day 5", 75),
                    new Revenue("Day 6", 50),
                    new Revenue("Day 7", 30),
                    new Revenue("Day 8", 50),
                    new Revenue("Day 9", 50),
                    new Revenue("Day 10", 60),
                    new Revenue("Day 11", 70),
                    new Revenue("Day 12", 59)
                });
            }
            return new List<Revenue>(new Revenue[7]
                {
                    new Revenue("Mon", 212),
                    new Revenue("Tue", 210),
                    new Revenue("Wed", 315),
                    new Revenue("Thur", 250),
                    new Revenue("Fri", 375),
                    new Revenue("Sat", 500),
                    new Revenue("Sun", 390)
                });
        }
    }
}
