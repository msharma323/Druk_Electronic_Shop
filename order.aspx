<%@ Page Title="orders" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Electronics_shop.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .order-container {
            background-color: #f5f7fa;
            border-radius: 10px;
            padding: 25px;
            width: 90%;
            margin: 30px auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            font-family: 'Segoe UI', sans-serif;
        }
        .order-section {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        h2, h3 {
            color: #1a2035;
            border-bottom: 2px solid #3b82f6;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        .order-label {
            display: block;
            font-size: 16px;
            margin: 5px 0;
            color: #333;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .gridview th {
            background: #1a2035;
            color: white;
            padding: 8px;
            text-align: left;
        }
        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        .history-title {
            margin-top: 20px;
            color: #1a2035;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="order-container">

            <!-- CURRENT ORDER SECTION -->
            <div class="order-section">
                <h2>Current Order Details</h2>
                <asp:Label ID="lblOrderInfo" runat="server" CssClass="order-label"></asp:Label>
                <asp:Label ID="lblAddress" runat="server" CssClass="order-label"></asp:Label>
                <asp:Label ID="lblStatus" runat="server" CssClass="order-label"></asp:Label>

                <h3>Items in this Order</h3>
                <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="Price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total (₹)" DataFormatString="{0:N2}" />
                    </Columns>
                </asp:GridView>

                <asp:Label ID="lblTotalAmount" runat="server" CssClass="order-label" Font-Bold="true"></asp:Label>
            </div>

<!-- ORDER HISTORY SECTION -->
<div class="order-section">
    <h2 class="history-title">Orders History</h2>
    <asp:Label ID="lblHistoryMsg" runat="server" ForeColor="Gray" Font-Italic="true"></asp:Label>

    <asp:GridView ID="gvOrderHistory" runat="server" AutoGenerateColumns="False" CssClass="gridview"
        OnRowDataBound="gvOrderHistory_RowDataBound">
        <Columns>
            <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:dd MMM yyyy}" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount (₹)" DataFormatString="{0:N2}" />
            <asp:TemplateField HeaderText="Products">
                <ItemTemplate>
                    <asp:GridView ID="gvHistoryItems" runat="server" AutoGenerateColumns="False" CssClass="gridview" ShowHeader="false">
                        <Columns>
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
    </form>
</asp:Content>
