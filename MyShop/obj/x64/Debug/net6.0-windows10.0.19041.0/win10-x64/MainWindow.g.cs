﻿#pragma checksum "E:\DoAn\Win\MyShop-current\My-Shop\MyShop\MainWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "057FB9613F17E9E5D861F38965F72D087A4D70345DB8C50054F7A15D5221B2A3"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyShop
{
    partial class MainWindow : 
        global::WinUIEx.WindowEx, 
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
            case 1: // MainWindow.xaml line 2
                {
                    global::WinUIEx.WindowEx element1 = global::WinRT.CastExtensions.As<global::WinUIEx.WindowEx>(target);
                    ((global::WinUIEx.WindowEx)element1).SizeChanged += this.WindowEx_SizeChanged;
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

