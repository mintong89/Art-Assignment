<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="StockDetails.aspx.cs" Inherits="Art_Assignment.Pages.Profile.StockDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Stock Details
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        th, td {
            border-top: 1px solid black;
            border-left: 1px solid black;
        }

            th:last-child, td:last-child {
                border-right: 1px solid black;
            }

        tr:last-child {
            border-bottom: 1px solid black;
        }

       
    </style>


    <form runat="server">   
        <asp:HyperLink ID="StockAdd" runat="server" NavigateUrl="~/Pages/Profile/AddStock.aspx">
            <div class="button-22 w-auto  float-right">Add Stock</div></asp:HyperLink>

        <br />
        <asp:SqlDataSource ID="ArtProdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>"
            SelectCommand="SELECT
             concat('~/Pages/Profile/StockDetails.aspx?ID=', [ArtProd].ID) as Url,
ROW_NUMBER() OVER(ORDER BY [ArtProd].ID) AS [Row],
[ArtProd].ID,
  [ArtProd].Name,
  [ArtProd].Description,
  [ArtProd].Price
FROM
  [ArtProd]
            INNER JOIN Artist ON [ArtProd].ArtistOwner = Artist.ID
WHERE Artist.UserID = @UserID">
            
            <SelectParameters>
                <asp:Parameter DefaultValue="-1" Name="UserID" Type="Int32" />
            </SelectParameters>

        </asp:SqlDataSource>

       
        <table class="mt-8 mx-auto" style="width: 70%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price(RM)</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <%--<th>Edit</th>
                    <th>Delete</th>--%>
                </tr>
            </thead>
            <tbody>

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ArtProdDataSource" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="px-1">
                                <asp:Label ID="ArtProdRow" runat="server"
                                    Text='<%# Eval("Row") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="ArtProdName" runat="server"
                                    Text='<%# Eval("Name") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="ArtProdDescription" runat="server"
                                    Text='<%# Eval("Description") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="ArtProdPrice" runat="server"
                                    Text='<%# string.Format("{0:n2}", Eval("Price")) %>' />
                            </td>
                            <td class="text-center"><a href='<%# "DisplayStock.aspx?ID=" + Eval("ID") %>'><i class="fas fa-info"></i></a></td>
                            <td class="text-center"><a href='<%# "EditStock.aspx?ID=" + Eval("ID") %>'><i class="far fa-edit"></i></a></td>
                            <td  class="text-center"><a href='<%# "DeleteStock.aspx?ID=" + Eval("ID") %>'><i class="far fa-trash-alt"></i></a></td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </tbody>
        </table>



    </form>

</asp:Content>
