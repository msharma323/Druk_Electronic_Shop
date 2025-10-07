<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Electronics_shop.admin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel - Add Product</title>
    <style>
/* ===== ROOT VARIABLES ===== */
:root {
    /* Color Palette */
    --bg: #0b1020;
    --sidebar: #12182b;
    --card: #1a2035;
    --muted: #8b94b0;
    --text: #e8ecf8;
    --brand: #6c8cff;
    --brand-600: #5977ea;
    --accent: #1dd1a1;
    --ring: #9bb3ff;
    --danger: #ff6b6b;
    --success: #1dd1a1;
    
    /* Spacing */
    --radius: 14px;
    --shadow: 0 8px 24px rgba(0, 0, 0, 0.35);
    
    /* Gradients */
    --gradient-bg: linear-gradient(160deg, #0f1323, #1a2035);
    --gradient-card: linear-gradient(135deg, #12182b, #1c2440);
    --gradient-button: linear-gradient(90deg, var(--brand), var(--brand-600));
}

/* ===== RESET & BASE STYLES ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Inter, Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    display: flex;
    min-height: 100vh;
}

/* ===== SIDEBAR STYLES ===== */
.sidebar {
    width: 220px;
    background-color: var(--sidebar);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    flex-shrink: 0;
}

.sidebar h2 {
    color: var(--text);
    text-align: center;
    padding: 1rem 0;
    margin: 0;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    font-size: 1.3rem;
    font-weight: 600;
}

.sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
    flex-grow: 1;
}

.sidebar ul li {
    margin: 0;
}

.sidebar ul li a {
    display: block;
    color: var(--text);
    padding: 0.8rem 1rem;
    text-decoration: none;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    transition: all 0.3s ease;
    font-weight: 500;
}

.sidebar ul li a:hover,
.sidebar ul li a.active {
    background-color: var(--brand-600);
    color: #fff;
    padding-left: 1.5rem;
}

/* ===== MAIN CONTENT AREA ===== */
.main-content {
    flex-grow: 1;
    padding: 2rem;
    background: var(--gradient-bg);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: flex-start;
}

/* ===== ADMIN FORM STYLES ===== */
.admin-form {
    width: 100%;
    max-width: 650px;
    padding: 2.5rem;
    background: var(--gradient-card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    border: 1px solid rgba(255, 255, 255, 0.05);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.admin-form:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.5);
}

.admin-form h2 {
    font-weight: 700;
    letter-spacing: 0.2px;
    text-align: center;
    margin-bottom: 2rem;
    color: var(--text);
    font-size: 1.8rem;
}

/* ===== FORM ELEMENTS ===== */
.form-group {
    margin-bottom: 1.5rem;
}

.form-label {
    display: block;
    margin-bottom: 0.5rem;
    color: var(--brand) !important;
    font-weight: 600;
    font-size: 0.95rem;
}

.form-heading {
    color: #2d3748 !important;
    font-weight: 700;
    margin-bottom: 1.5rem;
}

.admin-form input[type="text"],
.admin-form input[type="number"],
.admin-form input[type="email"],
.admin-form input[type="password"],
.admin-form textarea,
.admin-form select {
    width: 100%;
    padding: 12px 16px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.02);
    color: var(--text);
    font-size: 0.95rem;
    transition: all 0.3s ease;
}

.admin-form input[type="text"]:focus,
.admin-form input[type="number"]:focus,
.admin-form textarea:focus,
.admin-form select:focus {
    border-color: var(--brand);
    background: rgba(255, 255, 255, 0.05);
    outline: none;
    box-shadow: 0 0 0 3px rgba(108, 140, 255, 0.1);
}

.admin-form textarea {
    resize: vertical;
    min-height: 100px;
    font-family: inherit;
}

.admin-form input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px dashed rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.02);
    color: var(--muted);
    cursor: pointer;
    transition: border-color 0.3s ease;
}

.admin-form input[type="file"]:hover {
    border-color: var(--brand);
}

/* ===== BUTTON STYLES ===== */
.submit-button {
    background: var(--gradient-button);
    color: #fff;
    width: 100%;
    border: none;
    padding: 14px 20px;
    border-radius: 10px;
    cursor: pointer;
    font-weight: 700;
    font-size: 1rem;
    transition: all 0.3s ease;
    margin-top: 1rem;
}

.submit-button:hover {
    filter: brightness(1.1);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(108, 140, 255, 0.3);
}

.submit-button:active {
    transform: translateY(0);
}

/* ===== MESSAGE STYLES ===== */
.message {
    text-align: center;
    padding: 12px 16px;
    margin: 1rem 0;
    border-radius: 8px;
    font-weight: 600;
    animation: fadeIn 0.5s ease;
}

.message.error {
    color: var(--danger);
    background-color: rgba(255, 107, 107, 0.1);
    border: 1px solid var(--danger);
}

.message.success {
    color: var(--success);
    background-color: rgba(29, 209, 161, 0.1);
    border: 1px solid var(--success);
}

/* ===== ANIMATIONS ===== */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes slideIn {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 768px) {
    body {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        min-height: auto;
    }
    
    .sidebar ul {
        display: flex;
        overflow-x: auto;
    }
    
    .sidebar ul li {
        flex-shrink: 0;
    }
    
    .sidebar ul li a {
        border-bottom: none;
        border-right: 1px solid rgba(255, 255, 255, 0.05);
        white-space: nowrap;
    }
    
    .main-content {
        padding: 1rem;
    }
    
    .admin-form {
        padding: 1.5rem;
        margin: 1rem;
    }
}

@media (max-width: 480px) {
    .admin-form {
        padding: 1rem;
    }
    
    .admin-form h2 {
        font-size: 1.5rem;
    }
    
    .sidebar h2 {
        font-size: 1.1rem;
        padding: 0.8rem 0;
    }
}

/* ===== UTILITY CLASSES ===== */
.text-center {
    text-align: center;
}

.text-muted {
    color: var(--muted);
}

.mt-1 { margin-top: 0.5rem; }
.mt-2 { margin-top: 1rem; }
.mt-3 { margin-top: 1.5rem; }
.mb-1 { margin-bottom: 0.5rem; }
.mb-2 { margin-bottom: 1rem; }
.mb-3 { margin-bottom: 1.5rem; }

.hidden {
    display: none;
}

.fade-in {
    animation: fadeIn 0.5s ease;
}
        
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <ul>
            <li><a href="admin.aspx" class="active">Add Product</a></li>
            <li><a href="manage_products.aspx">Manage Products</a></li>
            <li><a href="orders.aspx">View Orders</a></li>
            <li><a href="default.aspx">Back to Site</a></li>
        </ul>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <form id="form1" runat="server">
            <div class="admin-form">
                <h2>Add New Product</h2>

                <asp:Label ID="lblMessage" runat="server" CssClass="message" />

                <label for="<%= txtName.ClientID %>">Product Name:</label>
                <asp:TextBox ID="txtName" runat="server" />

                <label for="<%= ddlProductType.ClientID %>">Product Type:</label>
                <asp:DropDownList ID="ddlProductType" runat="server" CssClass="dropdown">
                    <asp:ListItem Text="----Select Item-----" Value="------Select-----" />
                    <asp:ListItem Text="Laptop" Value="Laptop" />
                    <asp:ListItem Text="Mobile" Value="Mobile" />
                    <asp:ListItem Text="Tablet" Value="Tablet" />
                    <asp:ListItem Text="camera" Value="camera" />
                    <asp:ListItem Text="Accessories" Value="Accessories" />
                </asp:DropDownList>

                <label for="<%= txtPrice.ClientID %>">Price ($):</label>
                <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" />

                <label for="<%= txtQuantity.ClientID %>">Quantity Available:</label>
                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" />

                <label for="<%= txtDescription.ClientID %>">Product Description/Details:</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" />

                <label for="<%= fuImage1.ClientID %>">Product Image 1 (Primary):</label>
                <asp:FileUpload ID="fuImage1" runat="server" />

                <label for="<%= fuImage2.ClientID %>">Product Image 2:</label>
                <asp:FileUpload ID="fuImage2" runat="server" />

                <label for="<%= fuImage3.ClientID %>">Product Image 3:</label>
                <asp:FileUpload ID="fuImage3" runat="server" />

                <label for="<%= fuImage4.ClientID %>">Product Image 4:</label>
                <asp:FileUpload ID="fuImage4" runat="server" />

                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="submit-button" />
            </div>
        </form>
    </div>

    <script>
        (function () {
            function onReady(fn) { if (document.readyState !== 'loading') fn(); else document.addEventListener('DOMContentLoaded', fn); }
            onReady(function () {
                const form = document.querySelector('#form1');
                const lblMessage = document.querySelector('#<%= lblMessage.ClientID %>');
                const btnAdd = document.querySelector('#<%= btnAddProduct.ClientID %>');

                form.addEventListener('submit', function (e) {
                    let isValid = true;
                    const requiredFields = ['<%= txtName.ClientID %>', '<%= ddlProductType.ClientID %>', '<%= txtPrice.ClientID %>', '<%= txtQuantity.ClientID %>', '<%= fuImage1.ClientID %>'];
                    requiredFields.forEach(function (id) {
                        const input = document.querySelector('#' + id);
                        if (!input.value.trim()) {
                            isValid = false;
                            input.style.borderColor = 'red';
                        } else {
                            input.style.borderColor = '';
                        }
                    });
                    if (!isValid) {
                        e.preventDefault();
                        lblMessage.textContent = 'Please fill in all required fields.';
                        lblMessage.classList.add('error');
                        lblMessage.classList.remove('success');
                    }
                });

                if (lblMessage.textContent.includes('successfully')) {
                    lblMessage.classList.add('success');
                    lblMessage.classList.remove('error');
                }

                document.querySelectorAll('input, textarea').forEach(function (input) {
                    input.addEventListener('input', function () {
                        this.style.borderColor = '';
                    });
                });
            });
        })();
    </script>
</body>
</html>
