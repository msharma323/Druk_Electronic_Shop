<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="manage_order.aspx.cs" Inherits="Electronics_shop.manage_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-wrapper {
            background: #1b263b;
            padding: 40px;
            border-radius: 12px;
            color: #ffffff;
            width: 90%;
            margin: 40px auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #ffffff;
            font-size: 26px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: #f8fafc;
            border-radius: 10px;
            overflow: hidden;
        }

        .gridview th {
            background-color: #0d6efd;
            color: white;
            padding: 12px;
            text-align: left;
            font-size: 15px;
        }

        .gridview td {
            padding: 10px 12px;
            background-color: #f1f5f9;
            color: #1e293b;
        }

        .gridview tr:nth-child(even) td {
            background-color: #e2e8f0;
        }

        .gridview tr:hover td {
            background-color: #dbeafe;
            transition: all 0.3s ease;
        }

        .btn-update {
            background-color: #10b981;
            color: white;
            border: none;
            padding: 6px 14px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-update:hover {
            background-color: #059669;
        }

        .btn-cancel {
            background-color: #ef4444;
            color: white;
            border: none;
            padding: 6px 14px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-cancel:hover {
            background-color: #dc2626;
        }

        .gridview .edit-row {
            background-color: #fff7ed !important;
        }

        .status-dropdown {
            padding: 6px;
            border-radius: 6px;
            border: 1px solid #94a3b8;
        }

        /* Responsive for smaller screens */
        @media (max-width: 768px) {
            .admin-wrapper {
                width: 100%;
                padding: 25px;
            }
            h2 {
                font-size: 22px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-wrapper">
        <h2>Manage Orders</h2>

        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" 
            CssClass="gridview table table-bordered"
            DataKeyNames="OrderId" 
            OnRowEditing="gvOrders_RowEditing" 
            OnRowUpdating="gvOrders_RowUpdating" 
            OnRowCancelingEdit="gvOrders_RowCancelingEdit">

            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order ID" ReadOnly="True" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="TotalAmount" HeaderText="Total (₹)" DataFormatString="{0:N2}" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:dd MMM yyyy}" />

                <asp:TemplateField HeaderText="Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-dropdown">
                            <asp:ListItem Text="Pending" />
                            <asp:ListItem Text="Delivered" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" EditText="Edit" CancelText="Cancel" UpdateText="Update" 
                    ControlStyle-CssClass="btn-update" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
