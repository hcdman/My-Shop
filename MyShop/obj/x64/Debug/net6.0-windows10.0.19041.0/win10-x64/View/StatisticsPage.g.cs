﻿#pragma checksum "E:\DoAn\Win\Myshop-current-3\My-Shop\MyShop\View\StatisticsPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "66373DB0AAFD160A9F9F1D6EA935A7523856F781539AE744E2D002C955946C98"
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
            case 2: // View\StatisticsPage.xaml line 129
                {
                    this.Revenue = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Revenue).Click += this.RevenueClick;
                }
                break;
            case 3: // View\StatisticsPage.xaml line 130
                {
                    this.Profit = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Profit).Click += this.ProfitClick;
                }
                break;
            case 4: // View\StatisticsPage.xaml line 61
                {
                    this.chart = global::WinRT.CastExtensions.As<global::Syncfusion.UI.Xaml.Charts.SfCartesianChart>(target);
                }
                break;
            case 6: // View\StatisticsPage.xaml line 39
                {
                    this.showFilter = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBlock>(target);
                }
                break;
            case 7: // View\StatisticsPage.xaml line 44
                {
                    this.ViewProduct = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.ViewProduct).Click += this.OtherView;
                }
                break;
            case 8: // View\StatisticsPage.xaml line 45
                {
                    this.Week = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Week).Click += this.WeekClick;
                }
                break;
            case 9: // View\StatisticsPage.xaml line 46
                {
                    this.Month = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Month).Click += this.MonthClick;
                }
                break;
            case 10: // View\StatisticsPage.xaml line 47
                {
                    this.Year = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.Year).Click += this.YearClick;
                }
                break;
            case 11: // View\StatisticsPage.xaml line 36
                {
                    global::Microsoft.UI.Xaml.Controls.Button element11 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element11).Click += this.minusClick;
                }
                break;
            case 12: // View\StatisticsPage.xaml line 37
                {
                    global::Microsoft.UI.Xaml.Controls.Button element12 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element12).Click += this.addClick;
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

