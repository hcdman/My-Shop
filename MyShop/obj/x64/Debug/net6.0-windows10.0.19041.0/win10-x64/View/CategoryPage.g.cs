﻿#pragma checksum "C:\Users\hoai0\source\repos\Project 1\My-Shop\MyShop\View\CategoryPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "A2F80F438CA5205E39B2D12DE68B39AB464035ED2D0E5B28CB06CE1203C5AB37"
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
    partial class CategoryPage : 
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
            case 2: // View\CategoryPage.xaml line 120
                {
                    global::Microsoft.UI.Xaml.Controls.TextBox element2 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBox>(target);
                    ((global::Microsoft.UI.Xaml.Controls.TextBox)element2).KeyDown += this.TextBox_KeyDown;
                }
                break;
            case 3: // View\CategoryPage.xaml line 59
                {
                    this.CustomerDataGrid = global::WinRT.CastExtensions.As<global::CommunityToolkit.WinUI.UI.Controls.DataGrid>(target);
                }
                break;
            case 5: // View\CategoryPage.xaml line 87
                {
                    global::Microsoft.UI.Xaml.Controls.Button element5 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element5).Click += this.updateCate;
                }
                break;
            case 6: // View\CategoryPage.xaml line 93
                {
                    global::Microsoft.UI.Xaml.Controls.Button element6 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element6).Click += this.deleteCate;
                }
                break;
            case 7: // View\CategoryPage.xaml line 44
                {
                    global::Microsoft.UI.Xaml.Controls.Button element7 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)element7).Click += this.AddButton_Click;
                }
                break;
            case 8: // View\CategoryPage.xaml line 34
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

