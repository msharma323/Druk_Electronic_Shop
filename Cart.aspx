<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Electronics_shop.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .cart-container {
            max-width: 950px;
            margin: 30px auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .cart-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #222;
        }

        .cart-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-grid th, .cart-grid td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .cart-grid th {
            background: #007bff;
            color: #fff;
        }

        .cart-grid img {
            width: 70px;
            height: 70px;
            object-fit: contain;
        }

        .btn-remove {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-remove:hover {
            background: #c0392b;
        }

        .btn-order {
            background: #28a745;
            color: #fff;
            padding: 12px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            border: none;
        }

        .btn-order:hover {
            background: #218838;
        }

        .continue-shopping {
            margin-left: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 15px;
        }

        .continue-shopping:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <form id="form1" runat="server">

    <div class="cart-container">
        <h2 class="cart-title">🛒 Your Cart</h2>

        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="cart-grid" 
            OnRowCommand="gvCart_RowCommand">
            <Columns>
                <asp:ImageField DataImageUrlField="img" HeaderText="Product Image">
                    <ControlStyle Width="70px" Height="70px" />
                </asp:ImageField>

                <asp:BoundField DataField="Prod_Name" HeaderText="Product Name" />
                <asp:BoundField DataField="Prod_Price" HeaderText="Price" />
                <asp:BoundField DataField="Prod_Quantity" HeaderText="Quantity" />

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" runat="server" CssClass="btn-remove"
                            Text="Remove" CommandName="RemoveItem" 
                            CommandArgument='<%# Eval("Prod_Cart_Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div style="margin-top:20px; text-align:center;">
            <asp:Button ID="Button1" runat="server" CssClass="btn-order" Text="Proceed to Order" OnClick="btnOrder_Click" />
            <a href="LaptopCollection.aspx" class="continue-shopping">← Continue Shopping</a>
        </div>
    </div>
     </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const removeButtons = document.querySelectorAll(".btn-remove");
            removeButtons.forEach(btn => {
                btn.addEventListener("click", function (e) {
                    if (!confirm("Are you sure you want to remove this item from your cart?")) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</asp:Content>
