﻿#pragma checksum "C:\Users\hoai0\Downloads\temp\My-Shop\MyShop\View\StatisticsPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "A5E0CEB16C010C09519C61EF9ECF83A3B3E7CF9765273B6A41ECFC0A8F71EC27"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyShop.View
{
    partial class StatisticsPage : 
        global::Microsoft.UI.Xaml.Controls.Page, 
        global::Microsoft.UI.Xaml.Markup.IComponentConnector
    {

        /// <summary>
        /// Connect()
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.UI.Xaml.Markup.Compiler"," 1.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void Connect(int connectionId, object target)
        {
            switch(connectionId)
            {
            case 2: // View\StatisticsPage.xaml line 156
                {
                    this.Revenue = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Revenue).Click += this.RevenueClick;
                }
                break;
            case 3: // View\StatisticsPage.xaml line 162
                {
                    this.Profit = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Profit).Click += this.ProfitClick;
                }
                break;
            case 4: // View\StatisticsPage.xaml line 69
                {
                    this.chart = global::WinRT.CastExtensions.As<global::Syncfusion.UI.Xaml.Charts.SfCartesianChart>(target);
                }
                break;
            case 6: // View\StatisticsPage.xaml line 39
                {
                    this.ViewProduct = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.ViewProduct).Click += this.OtherView;
                }
                break;
            case 7: // View\StatisticsPage.xaml line 45
                {
                    this.Week = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Week).Click += this.WeekClick;
                }
                break;
            case 8: // View\StatisticsPage.xaml line 51
                {
                    this.Month = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Month).Click += this.MonthClick;
                }
                break;
            case 9: // View\StatisticsPage.xaml line 57
                {
                    this.Year = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Year).Click += this.YearClick;
                }
                break;
            default:
                break;
            }
            this._contentLoaded = true;
        }

        /// <summary>
        /// GetBindingConnector(int connectionId, object target)
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.UI.Xaml.Markup.Compiler"," 1.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::Microsoft.UI.Xaml.Markup.IComponentConnector GetBindingConnector(int connectionId, object target)
        {
            global::Microsoft.UI.Xaml.Markup.IComponentConnector returnValue = null;
            return returnValue;
        }
    }
}

