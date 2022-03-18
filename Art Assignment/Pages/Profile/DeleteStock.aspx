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
        <%--<asp:HyperLink ID="StockAdd" runat="server" NavigateUrl="~/Pages/Profile/AddStock.aspx">
            <div class="button-22 w-1/6  float-right">Add Stock</div></asp:HyperLink>--%>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Art ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price(RM)" SortExpression="Price" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>"
            SelectCommand="SELECT [ID], [Name], [Description], [Price] FROM [ArtProd] WHERE ([ID]=@ID)"
            DeleteCommand="DELETE [ArtProd] WHERE ([ID]=@ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField-="ID" Type="Int32" />
            </SelectParameters>

            <DeleteParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField-="ID" Type="Int32" />
            </DeleteParameters>

        </asp:SqlDataSource>
        <%--<table class="mt-8" style="width: 100%">
            <thead>
                <tr>
                    <th>Art ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price(RM)</th>
                   
                </tr>
            </thead>
            <tbody>

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
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
                            
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </tbody>
        </table>--%>

        <%--<asp:Label ID="lblConfirm" runat="server" Text="Are you sure?">
            <div class="inline-block">
                    <button runat="server" class="button-22 button-22-danger" onserverclick="DeleteArtProd_OnClick" >
                        <i class="fa-solid fa-trash"></i>&nbsp;
                            Delete
                    </button>
                </div></asp:Label>--%>
    </form>

</asp:Content>
