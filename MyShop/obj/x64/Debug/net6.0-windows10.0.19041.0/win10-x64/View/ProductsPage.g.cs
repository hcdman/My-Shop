﻿#pragma checksum "C:\Users\ADMIN\Workspace\Windows-C#\Project1-MyShop\My-Shop\MyShop\View\ProductsPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "3FCDA7BED370BEEE8664FA66A19735D5C2A002E2D3202A46CA2C11B0046ED916"
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
    partial class ProductsPage : 
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
            case 2: // View\ProductsPage.xaml line 197
                {
                    global::Microsoft.UI.Xaml.Controls.TextBox element2 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBox>(target);
                    ((global::Microsoft.UI.Xaml.Controls.TextBox)element2).KeyDown += this.TextBox_KeyDown;
                }
                break;
            case 3: // View\ProductsPage.xaml line 117
                {
                    this.ContentGridView = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.GridView>(target);
                }
                break;
            case 6: // View\ProductsPage.xaml line 143
                {
                    global::Microsoft.UI.Xaml.Controls.MenuFlyoutItem element6 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.MenuFlyoutItem>(target);
                    ((global::Microsoft.UI.Xaml.Controls.MenuFlyoutItem)element6).Click += this.EditMenuFlyoutItem_Click;
                }
                break;
            case 7: // View\ProductsPage.xaml line 151
                {
                    global::Microsoft.UI.Xaml.Controls.MenuFlyoutItem element7 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.MenuFlyoutItem>(target);
                    ((global::Microsoft.UI.Xaml.Controls.MenuFlyoutItem)element7).Click += this.DeleteMenuFlyoutItem_Click;
                }
                break;
            case 8: // View\ProductsPage.xaml line 63
                {
                    this.productNameTextBox = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBox>(target);
                }
                break;
            case 9: // View\ProductsPage.xaml line 42
                {
                    global::Microsoft.UI.Xaml.Controls.Button element9 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element9).Click += this.AddButton_Click;
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

