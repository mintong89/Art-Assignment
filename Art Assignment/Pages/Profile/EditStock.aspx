<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="EditStock.aspx.cs" Inherits="Art_Assignment.Pages.Profile.EditStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Edit Stock
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        #notFormView th, #notFormView td {
            border-top: 1px solid black;
            border-left: 1px solid black;
            padding: 0px 10px 0px 10px;
        }

            #notFormView th:last-child, #notFormView td:last-child {
                border-right: 1px solid black;
            }

        #notFormView tr:last-child {
            border-bottom: 1px solid black;
        }

        table{
            width:100%;
        }
    </style>


    <form runat="server" autocomplete="off">
        <%--<asp:HyperLink ID="StockAdd" runat="server" NavigateUrl="~/Pages/Profile/AddStock.aspx">
            <div class="button-22 w-1/6  float-right">Add Stock</div></asp:HyperLink>

        <asp:GridView ID="GridView1"
            runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>"
            SelectCommand="SELECT [ID], [Name], [Description], [Price] FROM [ArtProd] WHERE ([ID] = @ID)"
            UpdateCommand="UPDATE [ArtProd] SET [Name]=@Name,[Description]=@Description,[Price]=@Price,[DateModified]=getDate() WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField-="ID" Type="Int32" />
            </SelectParameters>

            <UpdateParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField-="ID" Type="Int32" />
            </UpdateParameters>

        </asp:SqlDataSource>--%>
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
            UpdateCommand="UPDATE [ArtProd] SET [Name]=@Name,[Description]=@Description,[Price]=@Price,[DateModified]=getDate() WHERE ID = @ArtProdID">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtProdID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>

            <UpdateParameters>
                <asp:QueryStringParameter Name="ArtProdID" QueryStringField-="ID" Type="Int32" />
            </UpdateParameters>

        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataSourceID="ArtProdDataSource" OnItemUpdating="FormView1_ItemUpdating">
            <ItemTemplate>
                <table id="notFormView">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <asp:Label ID="ArtProdName" runat="server"
                                    Text='<%# Eval("Name") %>' />

                            </td>
                            <td>
                                <asp:Label ID="ArtProdDescription" runat="server"
                                    Text='<%# Eval("Description") %>' />

                            </td>

                            <td>
                                <asp:Label ID="ArtProdPrice" runat="server"
                                    Text='<%# Eval("Price") %>' />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="mt-2 float-right justify-center">
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CssClass="button-22 "
                        CommandName="Edit" Text="Edit" />
                </div>
            </ItemTemplate>
            <EditItemTemplate>

                <div class="input-label">
                    Stock Name<span style="color: red">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtArtProdName" ForeColor="Red">Name is required.</asp:RequiredFieldValidator>
                </div>
                <asp:TextBox class="input" runat="server" ID="txtArtProdName" Text='<%# Bind("Name") %>'></asp:TextBox>
                <div class="input-label">
                    Description
                </div>
                <asp:TextBox class="input" runat="server" ID="txtArtProdDescription" TextMode="MultiLine" Text='<%# Bind("Description") %>'></asp:TextBox>
                <div class="input-label">
                    Price<span style="color: red">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtArtProdPrice" ForeColor="Red">Price is required.</asp:RequiredFieldValidator>
                </div>
                <asp:TextBox class="input" runat="server" ID="txtArtProdPrice" Text='<%# Bind("Price") %>'></asp:TextBox>

                <div class="mt-2 float-right justify-center mx-1">
                    <asp:LinkButton ID="btnEditStockUpdate" runat="server" CausesValidation="True" ClientIDMode="Static"
                        CommandName="Update" Text="Update" CssClass="button-22 button-22-success" />
                </div>
                <div class="mt-2 float-right justify-center">
                    <asp:LinkButton ID="btnEditStockCancel" runat="server" CssClass="button-22 button-22-danger" ClientIDMode="Static"
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </div>

            </EditItemTemplate>

        </asp:FormView>

    </form>

</asp:Content>
