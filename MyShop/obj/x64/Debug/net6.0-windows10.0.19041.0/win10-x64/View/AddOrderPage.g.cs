﻿#pragma checksum "F:\HK3_Nam1\windowPropraming\MyShopUpdate3\My-Shop\MyShop\View\AddOrderPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "30D22AB97786FA02F3C285CACB2E10D666C20D06922318E8B2FE0A64C96A8DF9"
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
    partial class AddOrderPage : 
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
            case 2: // View\AddOrderPage.xaml line 124
                {
                    this.loading = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.ProgressBar>(target);
                }
                break;
            case 3: // View\AddOrderPage.xaml line 30
                {
                    this.form = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Grid>(target);
                }
                break;
            case 4: // View\AddOrderPage.xaml line 113
                {
                    this.messageTextBlock = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBlock>(target);
                }
                break;
            case 5: // View\AddOrderPage.xaml line 91
                {
                    this.AddBtn = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.AddBtn).Click += this.addOrders;
                }
                break;
            case 6: // View\AddOrderPage.xaml line 102
                {
                    this.CancelBtn = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.CancelBtn).Click += this.Cancel_Click;
                }
                break;
            case 7: // View\AddOrderPage.xaml line 62
                {
                    this.dateOrder = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.CalendarDatePicker>(target);
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

