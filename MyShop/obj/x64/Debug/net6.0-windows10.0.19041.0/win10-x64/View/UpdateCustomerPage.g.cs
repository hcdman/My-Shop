﻿#pragma checksum "C:\Users\ADMIN\Workspace\Windows-C#\Project1-MyShop\My-Shop\MyShop\View\UpdateCustomerPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "0725F26DC96E7989062F913145AF5DD165BAA7D76CDD2B30DA043D4C99748322"
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
    partial class UpdateCustomerPage : 
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
            case 1: // View\UpdateCustomerPage.xaml line 2
                {
                    global::Microsoft.UI.Xaml.Controls.Page element1 = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Page>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Page)element1).Loaded += this.mainLoad;
                }
                break;
            case 2: // View\UpdateCustomerPage.xaml line 27
                {
                    this.form = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Grid>(target);
                }
                break;
            case 3: // View\UpdateCustomerPage.xaml line 139
                {
                    this.mess = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.TextBlock>(target);
                }
                break;
            case 4: // View\UpdateCustomerPage.xaml line 118
                {
                    this.AddBtn = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.AddBtn).Click += this.updateCus;
                }
                break;
            case 5: // View\UpdateCustomerPage.xaml line 128
                {
                    this.CancelBtn = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Button>(target);
                    ((global::Microsoft.UI.Xaml.Controls.Button)this.CancelBtn).Click += this.CancelBtn_Click;
                }
                break;
            case 6: // View\UpdateCustomerPage.xaml line 87
                {
                    this.BirthCalendar = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.CalendarDatePicker>(target);
                }
                break;
            case 7: // View\UpdateCustomerPage.xaml line 111
                {
                    this.RegistrationCalendar = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.CalendarDatePicker>(target);
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

