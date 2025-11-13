<%@ Page Title="Admin Contact" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminContact.aspx.cs" Inherits="Electronics_shop.AdminContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contact-table {
            margin: 40px auto;
            width: 95%;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        .contact-table th {
            background-color: #0d6efd;
            color: white;
            padding: 10px;
            text-align: left;
        }
        .contact-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .contact-table tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="text-align:center; margin-top:20px;">&nbsp;&nbsp;&nbsp;&nbsp; Contact Messages</h2>

    <asp:GridView ID="gvContact" runat="server" AutoGenerateColumns="False" CssClass="contact-table" GridLines="None">
        <Columns>
            <asp:BoundField DataField="ContactID" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:BoundField DataField="Message" HeaderText="Message" />
            <asp:BoundField DataField="DateSent" HeaderText="Date Sent" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
