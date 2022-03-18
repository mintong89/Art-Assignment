using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Art_Assignment.Utility;
namespace Art_Assignment.Pages.Profile
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 userid = Auth.getLogonUserUID(Request, Response);
            WishListDataSource.SelectCommand = @"SELECT
  WishlistItem.ArtProdID as ArtProdID,
  [ArtProd].[Name] as [Name],
  [Artist].[Name] as [ArtistName],
  [ArtProd].[Price] as Price,
  case
    when [ArtProd].[ArtPicture] IS NULL THEN '~/resources/Blank_Art.jpg'
    else concat('~/upload/', [ArtProd].ArtPicture)
  end AS ArtPicture
FROM
  [WishlistItem]
INNER JOIN [ArtProd] ON [WishlistItem].ArtProdID = ArtProd.ID
INNER JOIN [Artist] ON [ArtProd].ArtistOwner = Artist.ID
WHERE
  WishlistItem.UserID = @UserID";
            WishListDataSource.SelectParameters["UserID"].DefaultValue = userid.ToString();
        }
    }
}