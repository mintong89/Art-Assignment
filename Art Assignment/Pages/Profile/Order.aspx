<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserProfile.master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Art_Assignment.Pages.Profile.Order" %>

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


    <%--<<%--button id="dropdownbutton" data-dropdown-toggle="dropdown" class="text-white bg-blue-700 hover:bg-blue-800 f<%--ocus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">dropdown button
        <svg class="ml-2 w-4 h-4" fill="none" stroke="currentcolor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 9l-7 7-7-7"></path></svg></button>
    --%>
    <%--<div id="dropdown" class="hidden z-10 w-44 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700">
        <ul class="py-1" aria-labelledby="dropdownButton">
            <li>
                <a href="#" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Dashboard</a>
            </li>
            <li>
                <a href="#" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Settings</a>
            </li>
            <li>
                <a href="#" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Earnings</a>
            </li>
            <li>
                <a href="#" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Sign out</a>
            </li>
        </ul>
    </div>--%>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx">Show All</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx?filter=PENDING">Show Pending Only</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx?filter=ACCEPTED">Show Accepted Only</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="Order.aspx?filter=REJECTED">Show Rejected Only</a>
    <a class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" href="OrderApproval.aspx">Make Approvals</a>

    <form runat="server">
        <asp:SqlDataSource ID="OrderItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtDBContext %>">

            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
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
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>
        
    </form>

</asp:Content>
