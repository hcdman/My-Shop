using System;
using System.Globalization;
using Microsoft.UI.Xaml.Data;

namespace MyShop.Converter
{
    class PriceToCurrencyConverters : IValueConverter
    {

        public object Convert(object value, Type targetType, object parameter, string language)
        {
            int price = (int)value;
            CultureInfo cultureInfo = CultureInfo.GetCultureInfo("vi-VN");

            string result = price.ToString("#,### đ", cultureInfo.NumberFormat);
            return result;
        } 
        public object ConvertBack(object value, Type targetType, object parameter, string language) => throw new NotImplementedException();
    }
}
