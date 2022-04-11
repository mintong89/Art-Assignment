using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment.UserControls
{
    public partial class GalleryItem : System.Web.UI.UserControl
    {
        public string isSold;

        protected void Page_Load(object sender, EventArgs e)
        {
            bool _isSold = isSold == "True";

            Price.Font.Strikeout = _isSold;
            SoldOutNotice.Visible = _isSold;
        }
    }
}