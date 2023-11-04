using System.ComponentModel;

namespace MyShop.Model
{
    public class TypeProduct
    {
        public string maloai { get; set; }
        public string tenloai { get; set; }

        public override string ToString()
        {
            return tenloai;
        }
    }

    public class ListTypeProduct
    {
        public BindingList<TypeProduct> data {  get; set; }
    }
}
