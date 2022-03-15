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
            <div class="button-22 w-1/6  float-right">Add Stock</div></asp:HyperLink>
        
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" SelectCommand="SELECT
  ROW_NUMBER() OVER(
    ORDER BY
      [ID]
  ) AS [Row],
  [ID],
  [Name],
  [Description],
  [Price]
FROM
  [ArtProd]
WHERE ([ID] = @ID)
            ">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField-="ID" Type="Int32" />
            </SelectParameters>

        </asp:SqlDataSource>

        <%--ORDER BY
  [Name] ASC--%>
        <table class="mt-8" style="width: 100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price(RM)</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
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
                                    Text='<%# Eval("Price") %>' />
                            </td>
                            <td><a href='<%# "EditStock.aspx?ID=" + Eval("ID") %>'>Edit</a></td>
                            <td><a href='<%# "DeleteStock.aspx?ID=" + Eval("ID") %>'>Delete</a></td>
                         
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </tbody>
        </table>



    </form>

</asp:Content>
