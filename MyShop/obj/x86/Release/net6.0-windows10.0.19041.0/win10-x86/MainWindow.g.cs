﻿#pragma checksum "C:\Users\hoai0\source\repos\My Shop\My-Shop\MyShop\MainWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "739C0772A565B19850BB0CB7C5F0B7ED4F1C3CBADDDA75CEA45E9244D8DFD03B"
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
            case 2: // MainWindow.xaml line 16
                {
                    this.mainFrame = global::WinRT.CastExtensions.As<global::Microsoft.UI.Xaml.Controls.Frame>(target);
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

