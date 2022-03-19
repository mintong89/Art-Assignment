<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="DeleteStock.aspx.cs" Inherits="Art_Assignment.Pages.Profile.DeleteStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Delete Stock
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        th, td {
            border-top: 1px solid black;
            border-left: 1px solid black;
            padding: 0px 10px 0px 10px;
        }

            th:last-child, td:last-child {
                border-right: 1px solid black;
            }

        tr:last-child {
            border-bottom: 1px solid black;
        }
    </style>


    <form runat="server">
        <asp:SqlDataSource ID="ArtProdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>"
            SelectCommand="SELECT
             concat('~/Pages/Profile/StockDetails.aspx?ID=', ID) as Url,
ROW_NUMBER() OVER(ORDER BY ID) AS [Row],
ID,
 Name,
 Description,
 Price
FROM
  [ArtProd]
            
WHERE ID = @ArtProdID"
            
            DeleteCommand="DELETE FROM ArtProd WHERE ID = @ArtProdID"
            
            
            >

            <SelectParameters>
                <asp:QueryStringParameter Name="ArtProdID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>

            <DeleteParameters>
                <asp:QueryStringParameter Name="ArtProdID" QueryStringField="ID" Type="Int32" />
            </DeleteParameters>


        </asp:SqlDataSource>
        <table class="mt-8 mx-auto" style="width: 90%">
            <thead>
                <tr>
                    <th>Art ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price(RM)</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ArtProdDataSource" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="px-1">
                                <asp:Label ID="ArtProdID" runat="server"
                                    Text='<%# Eval("ID") %>' />
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

                            <td class="text-center">
                                <asp:Button class="btnReject bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" Text="Delete" runat="server" data-ID='<%# Eval("ID") %>' OnCommand="DeleteStock_OnClick" CommandName="Delete" UseSubmitBehavior="False" CausesValidation="False" /></td>


                        </tr>

                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>

    </form>

</asp:Content>
