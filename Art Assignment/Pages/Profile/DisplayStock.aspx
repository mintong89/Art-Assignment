<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="DisplayStock.aspx.cs" Inherits="Art_Assignment.Pages.Profile.DisplayStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Display Stock
    
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

        table {
            width: 100%;
        }
    </style>


    <form runat="server" autocomplete="off">
        <asp:SqlDataSource ID="ArtProdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>" SelectCommand="SELECT
             concat('~/Pages/Profile/StockDetails.aspx?ID=', ID) as Url,
ROW_NUMBER() OVER(ORDER BY ID) AS [Row],
ID,
 Name,
 Description,
 Price,
 case
    when [ArtPicture] IS NULL THEN '~/resources/Blank_Art.jpg'
    else concat('~/upload/', ArtPicture)
  end AS ArtPicture
FROM
  [ArtProd]
            
WHERE ID = @ArtProdID">
            <SelectParameters>
                <asp:QueryStringParameter Name="ArtProdID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>

        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataSourceID="ArtProdDataSource">
            <ItemTemplate>
                <%-- <div class="flex justify-center">
                        <div class="rounded-full overflow-hidden h-32 w-32">
                            <img style="width:100%; height:100%" alt="profile_pic" src="<%= getImageURL() %>" />
                        </div>
                    </div>--%>

                <div class="flex justify-center">
                    <div class="rounded-md overflow-hidden h-40 w-40">
                        <img id="ArtPicture" style="width: 100%; height: 100%" alt="profile_pic" src='<%# Eval("ArtPicture") %>' runat="server" />
                    </div>
                </div>

                <table id="notFormView" class="mt-2">
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


            </ItemTemplate>

        </asp:FormView>

    </form>

</asp:Content>
