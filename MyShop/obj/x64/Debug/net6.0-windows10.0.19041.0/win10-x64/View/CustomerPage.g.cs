﻿#pragma checksum "E:\DoAn\Win\Myshop-current-2\My-Shop\MyShop\View\CustomerPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "298C208DCC8E878FDAB444776120B4C305ABB5F4007E66C47A65A56193C11613"
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
    partial class CustomerPage : 
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
            case 2: // View\CustomerPage.xaml line 184
                {
                    global::Microsoft.UI.Xaml.Controls.Button element2 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element2).Click += this.prePage;
                }
                break;
            case 3: // View\CustomerPage.xaml line 197
                {
                    global::Microsoft.UI.Xaml.Controls.Button element3 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element3).Click += this.nextPage;
                }
                break;
            case 4: // View\CustomerPage.xaml line 153
                {
                    this.loading = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.ProgressBar>(target);
                }
                break;
            case 5: // View\CustomerPage.xaml line 75
                {
                    this.CustomerDataGrid = global::WinRT.CastExtensions.As<global::CommunityToolkit.WinUI.UI.Controls.DataGrid>(target);
                }
                break;
            case 6: // View\CustomerPage.xaml line 121
                {
                    this.ope = global::WinRT.CastExtensions.As<global::CommunityToolkit.WinUI.UI.Controls.DataGridTemplateColumn>(target);
                }
                break;
            case 8: // View\CustomerPage.xaml line 130
                {
                    global::Microsoft.UI.Xaml.Controls.Button element8 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element8).Click += this.update;
                }
                break;
            case 9: // View\CustomerPage.xaml line 138
                {
                    global::Microsoft.UI.Xaml.Controls.Button element9 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element9).Click += this.del;
                }
                break;
            case 10: // View\CustomerPage.xaml line 58
                {
                    global::Microsoft.UI.Xaml.Controls.Button element10 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element10).Click += this.addCus;
                }
                break;
            case 11: // View\CustomerPage.xaml line 51
                {
                    global::Microsoft.UI.Xaml.Controls.Button element11 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element11).Click += this.searchCus;
                }
                break;
            case 12: // View\CustomerPage.xaml line 41
                {
                    this.orderNameTextBox = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBox>(target);
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

