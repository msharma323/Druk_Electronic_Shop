<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Electronics_shop.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ====== Checkout Page Styling ====== */
        :root {
            --bg: #0b1020;
            --card: #1a2035;
            --accent: #3b82f6;
            --text: #f1f5f9;
            --error: #ef4444;
            --success: #10b981;
        }

        body {
            background-color: var(--bg);
            color: var(--text);
            font-family: 'Segoe UI', sans-serif;
        }

        .checkout-container {
            max-width: 900px;
            margin: 60px auto;
            background: var(--card);
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
            padding: 30px 40px;
        }

        h2 {
            text-align: center;
            color: var(--accent);
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--text);
        }

        .form-control {
            width: 100%;
            padding: 10px 14px;
            border-radius: 6px;
            border: none;
            background-color: #1f2937;
            color: var(--text);
        }

        .form-control:focus {
            outline: 2px solid var(--accent);
        }

        .btn {
            background-color: var(--accent);
            color: #fff;
            padding: 10px 20px;
            border-radius: 6px;
            border: none;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }

        .gridview-container {
            margin-top: 30px;
            border-radius: 8px;
            overflow: hidden;
        }

        .total {
            font-size: 18px;
            font-weight: bold;
            color: var(--success);
            text-align: right;
            margin-top: 15px;
        }

        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }

        .alert-error {
            background-color: var(--error);
            color: white;
        }

        .alert-success {
            background-color: var(--success);
            color: white;
        }

        /* GridView Styling */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .table th {
            background-color: #1f2937;
            color: white;
            padding: 12px;
            text-align: left;
        }

        .table td {
            padding: 12px;
            border-bottom: 1px solid #374151;
            background-color: var(--card);
        }

        .table-bordered {
            border: 1px solid #374151;
        }

        .mt-2 {
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- FORM TAG ADDED HERE -->
    <form id="form1" runat="server">
        
        <!-- =================== CHECKOUT SECTION =================== -->
        <div class="checkout-container">

            <h2>Checkout</h2>

            <!-- ❌ ERROR PANEL -->
            <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-error">
                <asp:Label ID="lblError" runat="server" />
                <br />
                <asp:Button ID="btnTryAgain" runat="server" Text="Try Again" CssClass="btn mt-2" OnClick="btnTryAgain_Click" />
            </asp:Panel>

            <!-- ✅ SUCCESS PANEL -->
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success">
                🎉 Your order has been placed successfully!  
                <br /><br />
                <asp:HyperLink ID="lnkContinue" runat="server" NavigateUrl="~/index.aspx" CssClass="btn">Continue Shopping</asp:HyperLink>
            </asp:Panel>

            <!-- 🧾 CHECKOUT FORM PANEL -->
            <asp:Panel ID="pnlCheckoutForm" runat="server" Visible="true">

                <div class="form-group">
                    <label for="txtName">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                        ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                        ErrorMessage="Phone is required" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                        ValidationExpression="^[0-9]{10}$" 
                        ErrorMessage="Please enter a valid 10-digit phone number" ForeColor="Red" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"
                        Rows="3" placeholder="Enter your delivery address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                        ErrorMessage="Address is required" ForeColor="Red" Display="Dynamic" />
                </div>

                <!-- ORDER SUMMARY -->
                <asp:Panel ID="pnlOrderSummary" runat="server" Visible="false" CssClass="gridview-container">
                    <h3>Order Summary</h3>
                    <asp:GridView ID="gvOrderSummary" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" 
                        GridLines="None" ShowHeader="true">
                        <Columns>
                            <asp:BoundField DataField="ProductName" HeaderText="Product" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                            <asp:BoundField DataField="Price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="TotalPrice" HeaderText="Total (₹)" DataFormatString="{0:N2}" />
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblTotal" runat="server" CssClass="total" />
                </asp:Panel>

                <!-- PAYMENT METHOD -->
                <div class="form-group">
                    <label>Payment Method</label>
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Credit Card" Value="CreditCard" Selected="True" />
                        <asp:ListItem Text="Cash on Delivery" Value="COD" />
                    </asp:RadioButtonList>
                </div>

                <!-- PLACE ORDER BUTTON -->
                <div style="text-align: center; margin-top: 25px;">
                    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn" OnClick="btnPlaceOrder_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click" 
                        style="background-color: #6c757d; margin-left: 10px;" CausesValidation="false" />
                </div>
            </asp:Panel>

        </div>
    
    </form> <!-- FORM TAG CLOSED HERE -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        // Client-side validation or additional scripts can go here
        function validateForm() {
            return Page_ClientValidate();
        }
    </script>
</asp:Content>