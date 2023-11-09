using CommunityToolkit.Mvvm.ComponentModel;
using System.ComponentModel;

namespace MyShop.Model
{
    public class TypeProduct : ObservableObject
    {
        private string _maloai, _tenloai;
        public string maloai
        {
            get
            {
                return _maloai;
            }
            set
            {
                SetProperty(ref _maloai, value);
                OnPropertyChanged(nameof(maloai));
            }
        }
        public string tenloai
        {
            get
            {
                return _tenloai;
            }
            set
            {
                SetProperty(ref _tenloai, value);
                OnPropertyChanged(nameof(tenloai));
            }
        }

        public override string ToString()
        {
            return tenloai;
        }
    }

    public class ListTypeProduct
    {
        public BindingList<TypeProduct> data { get; set; }
    }
}
