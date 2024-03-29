﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="OrderApproval.aspx.cs" Inherits="Art_Assignment.Pages.Profile.OrderApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="subtitle" runat="server">
    Order
    
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

    <%--  <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx">Show All</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx?filter=PENDING">Show Pending Only</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx?filter=ACCEPTED">Show Accepted Only</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx?filter=REJECTED">Show Rejected Only</a>--%>

    
    <asp:SqlDataSource ID="OrderItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>">

        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>

        <UpdateParameters>
            <asp:QueryStringParameter Name="OrderID" QueryStringField-="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table class="mt-8 mx-auto" style="width: 90%">
        <thead>
            <tr>
                <th>Art Name</th>
                <th>Address1</th>
                <th>Address2</th>
                <th>State</th>
                <th>Country</th>
                <th>Order Total</th>
                <th>Order Made By</th>
                <th>Delivery Fee</th>
                <th>Tax Fee</th>
                <th>Status</th>
                <th></th>
                <th></th>

            </tr>
        </thead>

        <tbody>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="OrderItemDataSource" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td class="px-1">
                            <asp:Label ID="ArtProdName" runat="server"
                                Text='<%# Eval("Name") %>' />
                        </td>
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
                        <%--<td class="text-center"><asp:Button class="btnAccept" text="" runat="server" onserverclick="AcceptOrder_OnClick"><i class="fas fa-thumbs-up"></i></asp:Button></td>
                        <td class="text-center"><asp:Button class="btnReject" runat="server" onserverclick="RejectOrder_OnClick"><i class="fas fa-thumbs-down"></i></asp:Button></td>
                        --%>
                        <td class="text-center">
                            <asp:Button class="btnAccept bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" text="Accept" runat="server" data-ID='<%# Eval("ID") %>' onCommand="AcceptOrder_OnClick" CommandName="Accept" UseSubmitBehavior="False" CausesValidation="False" /></td>
                        <td class="text-center">
                            <asp:Button class="btnReject bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" text="Reject" runat="server" data-ID='<%# Eval("ID") %>' onCommand="RejectOrder_OnClick" CommandName="Reject" UseSubmitBehavior="False" CausesValidation="False" /></td></td>


                    </tr>

                </ItemTemplate>

            </asp:Repeater>
        </tbody>
    </table>

</asp:Content>
