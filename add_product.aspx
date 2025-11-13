<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="Electronics_shop.add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ===== CLEAN, MODERN ADMIN FORM DESIGN ===== */
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #0b1020;
            color: #e8ecf8;
        }

        .main-content {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 40px;
        }

        .admin-form {
            width: 100%;
            max-width: 650px;
            background: linear-gradient(135deg, #12182b, #1c2440);
            padding: 2rem 2.5rem;
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.35);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .admin-form h2 {
            text-align: center;
            margin-bottom: 2rem;
            color: #fff;
            font-weight: 700;
        }

        label {
            color: #6c8cff;
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }

        .admin-form input[type="text"],
        .admin-form input[type="number"],
        .admin-form textarea,
        .admin-form select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.15);
            background: rgba(255, 255, 255, 0.05);
            color: #e8ecf8;
            margin-bottom: 1.2rem;
            transition: all 0.2s ease;
        }

        .admin-form input[type="text"]:focus,
        .admin-form input[type="number"]:focus,
        .admin-form textarea:focus,
        .admin-form select:focus {
            border-color: #6c8cff;
            outline: none;
        }

        .admin-form input[type="file"] {
            display: block;
            width: 100%;
            padding: 10px;
            border: 1px dashed rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.02);
            color: #8b94b0;
            margin-bottom: 1rem;
        }

        .submit-button {
            background: linear-gradient(90deg, #6c8cff, #5977ea);
            color: white;
            width: 100%;
            border: none;
            padding: 14px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .submit-button:hover {
            filter: brightness(1.1);
            box-shadow: 0 6px 20px rgba(108, 140, 255, 0.3);
        }

        .message {
            text-align: center;
            padding: 10px;
            border-radius: 6px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .message.error {
            background-color: rgba(255, 107, 107, 0.1);
            border: 1px solid #ff6b6b;
            color: #ff6b6b;
        }

        .message.success {
            background-color: rgba(29, 209, 161, 0.1);
            border: 1px solid #1dd1a1;
            color: #1dd1a1;
        }

        @media (max-width: 768px) {
            .admin-form {
                padding: 1.5rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-content">
        <div class="admin-form">
            <h2>Add New Product</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <label>Product Name:</label>
            <asp:TextBox ID="txtName" runat="server" />

            <label>Product Type:</label>
            <asp:DropDownList ID="ddlProductType" runat="server">
                <asp:ListItem Text="----Select Item-----" Value="" />
                <asp:ListItem Text="Laptop" Value="Laptop" />
                <asp:ListItem Text="Mobile" Value="Mobile" />
                <asp:ListItem Text="Tablet" Value="Tablet" />
                <asp:ListItem Text="Camera" Value="Camera" />
                <asp:ListItem Text="Accessories" Value="Accessories" />
            </asp:DropDownList>

            <label>Price ($):</label>
            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" />

            <label>Quantity Available:</label>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" />

            <label>Product Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" />

            <label>Product Image 1 (Primary):</label>
            <asp:FileUpload ID="fuImage1" runat="server" />

            <label>Product Image 2:</label>
            <asp:FileUpload ID="fuImage2" runat="server" />

            <label>Product Image 3:</label>
            <asp:FileUpload ID="fuImage3" runat="server" />

            <label>Product Image 4:</label>
            <asp:FileUpload ID="fuImage4" runat="server" />

            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="submit-button" OnClick="btnAddProduct_Click" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.querySelector('#form1');
            const lblMessage = document.getElementById('<%= lblMessage.ClientID %>');
            form.addEventListener('submit', function (e) {
                const required = ['<%= txtName.ClientID %>', '<%= ddlProductType.ClientID %>', '<%= txtPrice.ClientID %>', '<%= txtQuantity.ClientID %>', '<%= fuImage1.ClientID %>'];
                let valid = true;
                required.forEach(id => {
                    const el = document.getElementById(id);
                    if (!el.value.trim()) {
                        el.style.borderColor = 'red';
                        valid = false;
                    } else {
                        el.style.borderColor = '';
                    }
                });
                if (!valid) {
                    e.preventDefault();
                    lblMessage.className = 'message error';
                    lblMessage.textContent = 'Please fill in all required fields.';
                }
            });
        });
    </script>
</asp:Content>
