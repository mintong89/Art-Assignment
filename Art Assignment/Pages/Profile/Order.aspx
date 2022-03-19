<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Art_Assignment.Pages.Profile.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Order
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        th, td {
            border-top: 1px solid black;
            border-left: 1px solid black;
            padding:0px 10px 0px 10px;
        }

            th:last-child, td:last-child {
                border-right: 1px solid black;
            }

        tr:last-child {
            border-bottom: 1px solid black;
        }

       
    </style>


    <form runat="server">
        <asp:SqlDataSource ID="OrderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>"></asp:SqlDataSource>
        <table>
            <thead>
                <tr>
                    <th>Address1</th>
                    <th>Address2</th>
                    <th>State</th>
                    <th>Country</th>
                    <th>Order Total</th>
                    <th>Order Made By</th>
                    <th>Delivery Fee</th>
                    <th>Tax Fee</th>
                    <th>Status</th>

                </tr>
            </thead>

            <tbody>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="OrderDataSource" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="px-1">
                                <asp:Label ID="OrderAddress1" runat="server"
                                    Text='<%# Eval("Address1") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="OrderAddress2" runat="server"
                                    Text='<%# Eval("Address2") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="OrderState" runat="server"
                                    Text='<%# Eval("State") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# Eval("Country") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="Label6" runat="server"
                                    Text='<%# Eval("OrderTotal") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="Label5" runat="server"
                                    Text='<%# Eval("OrderMadeBy") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="Label4" runat="server"
                                    Text='<%# Eval("DeliveryFee") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="Label3" runat="server"
                                    Text='<%# Eval("TaxFee") %>' />
                            </td>
                            <td class="px-1">
                                <asp:Label ID="Label2" runat="server"
                                    Text='<%# Eval("Status") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>
    </form>

</asp:Content>
