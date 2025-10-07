<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_products.aspx.cs" Inherits="Electronics_shop.manage_products" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Products - Admin</title>
    <style>
/* ===== ROOT VARIABLES ===== */
:root {
    --bg: #0b1020;
    --card: #1a2035;
    --text: #e8ecf8;
    --brand: #6c8cff;
    --brand-600: #5977ea;
    --accent: #1dd1a1;
    --danger: #ff6b6b;
    --success: #1dd1a1;
    --warning: #ffd166;
    --muted: #8b94b0;
    --radius: 14px;
    --shadow: 0 8px 24px rgba(0, 0, 0, 0.35);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Inter, Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
}

/* ===== HEADER STYLES ===== */
.admin-header {
    background: var(--card);
    padding: 1rem 2rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header-content h1 {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--text);
}

.header-actions {
    display: flex;
    gap: 1rem;
    align-items: center;
}

.nav-button {
    padding: 0.7rem 1.5rem;
    background: var(--brand);
    color: white;
    text-decoration: none;
    border-radius: var(--radius);
    font-weight: 600;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
}

.nav-button:hover {
    background: var(--brand-600);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(108, 140, 255, 0.3);
}

/* ===== MAIN CONTENT ===== */
.main-container {
    padding: 2rem;
    max-width: 1400px;
    margin: 0 auto;
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

/* ===== PRODUCTS GRID ===== */
.products-section {
    background: var(--card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    border: 1px solid rgba(255, 255, 255, 0.05);
    overflow: hidden;
}

.section-header {
    padding: 1.5rem 2rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    display: flex;
    justify-content: between;
    align-items: center;
}

.section-header h2 {
    color: var(--text);
    font-size: 1.4rem;
    font-weight: 600;
}

.products-count {
    background: var(--brand);
    color: white;
    padding: 0.3rem 0.8rem;
    border-radius: 20px;
    font-size: 0.9rem;
    font-weight: 600;
}

/* ===== GRIDVIEW STYLES ===== */
.gridview-container {
    width: 100%;
    overflow-x: auto;
}

.gridview {
    width: 100%;
    border-collapse: collapse;
    background: transparent;
}

.gridview th {
    background: rgba(108, 140, 255, 0.1);
    color: var(--brand);
    padding: 1.2rem 1rem;
    text-align: left;
    font-weight: 600;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.gridview td {
    padding: 1rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    vertical-align: middle;
}

.gridview tr:hover {
    background: rgba(255, 255, 255, 0.02);
}

/* ===== PRODUCT IMAGES ===== */
.product-image {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.1);
}

/* ===== ACTION BUTTONS ===== */
.action-buttons {
    display: flex;
    gap: 0.5rem;
}

.btn {
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    font-size: 0.85rem;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
    text-align: center;
    min-width: 70px;
}

.btn-edit {
    background: var(--warning);
    color: #000;
}

.btn-edit:hover {
    background: #ffc107;
    transform: translateY(-1px);
}

.btn-delete {
    background: var(--danger);
    color: #fff;
}

.btn-delete:hover {
    background: #ff5252;
    transform: translateY(-1px);
}

/* ===== EDIT PANEL ===== */
.edit-panel {
    background: var(--card);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    border: 1px solid rgba(255, 255, 255, 0.05);
    padding: 2rem;
    margin-top: 2rem;
    animation: slideIn 0.3s ease;
}

.panel-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.panel-header h3 {
    color: var(--text);
    font-size: 1.3rem;
    font-weight: 600;
}

.close-panel {
    background: var(--muted);
    color: var(--text);
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
}

.close-panel:hover {
    background: #7a84a0;
}

/* ===== FORM STYLES ===== */
.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group.full-width {
    grid-column: 1 / -1;
}

.form-label {
    display: block;
    margin-bottom: 0.5rem;
    color: var(--brand);
    font-weight: 600;
    font-size: 0.95rem;
}

.form-control {
    width: 100%;
    padding: 12px 16px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.02);
    color: var(--text);
    font-size: 0.95rem;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: var(--brand);
    background: rgba(255, 255, 255, 0.05);
    outline: none;
    box-shadow: 0 0 0 3px rgba(108, 140, 255, 0.1);
}

textarea.form-control {
    resize: vertical;
    min-height: 100px;
    font-family: inherit;
}

select.form-control {
    cursor: pointer;
}

.submit-button {
    background: linear-gradient(90deg, var(--brand), var(--brand-600));
    color: #fff;
    border: none;
    padding: 14px 20px;
    border-radius: 10px;
    cursor: pointer;
    font-weight: 700;
    font-size: 1rem;
    transition: all 0.3s ease;
    margin-top: 1rem;
    width: 100%;
}

.submit-button:hover {
    filter: brightness(1.1);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(108, 140, 255, 0.3);
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
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 768px) {
    .admin-header {
        flex-direction: column;
        gap: 1rem;
        text-align: center;
    }
    
    .main-container {
        padding: 1rem;
    }
    
    .form-grid {
        grid-template-columns: 1fr;
    }
    
    .section-header {
        flex-direction: column;
        gap: 1rem;
        align-items: flex-start;
    }
    
    .action-buttons {
        flex-direction: column;
    }
    
    .btn {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .admin-header h1 {
        font-size: 1.5rem;
    }
    
    .gridview th,
    .gridview td {
        padding: 0.5rem;
        font-size: 0.85rem;
    }
    
    .product-image {
        width: 40px;
        height: 40px;
    }
}

/* ===== EMPTY STATE ===== */
.empty-state {
    text-align: center;
    padding: 3rem 2rem;
    color: var(--muted);
}

.empty-state i {
    font-size: 3rem;
    margin-bottom: 1rem;
    opacity: 0.5;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header class="admin-header">
            <div class="header-content">
                <h1>Product Management</h1>
            </div>
            <div class="header-actions">
                <a href="admin.aspx" class="nav-button">Back to Site</a>
            </div>
        </header>

        <!-- Main Content -->
        <div class="main-container">
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <!-- Products Section -->
            <div class="products-section">
                <div class="section-header">
                    <h2 >All Products</h2>
                    <asp:Label ID="lblProductCount" runat="server" CssClass="products-count" />
                </div>

                <div class="gridview-container">
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssClass="gridview"
                        OnRowCommand="GridView1_RowCommand"
                        EmptyDataText="No products found.">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                            <asp:BoundField DataField="Product_Type" HeaderText="Category" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgProduct" runat="server" 
                                        ImageUrl='<%# Eval("Image1") %>' 
                                        CssClass="product-image"
                                        onerror="this.src='./img/placeholder.png'" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnEdit" runat="server" 
                                            CommandName="cmd_edt" 
                                            CommandArgument='<%# Eval("ID") %>'
                                            CssClass="btn btn-edit"
                                            Text="Edit" />
                                        
                                        <asp:LinkButton ID="btnDelete" runat="server" 
                                            CommandName="cmd_del" 
                                            CommandArgument='<%# Eval("ID") %>'
                                            CssClass="btn btn-delete"
                                            Text="Delete" 
                                            OnClientClick="return confirm('Are you sure you want to delete this product?');" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Edit Panel -->
            <asp:Panel ID="Panel1" runat="server" CssClass="edit-panel" Visible="false">
                <div class="panel-header">
                    <h3>Edit Product</h3>
                    <asp:Button ID="btnClosePanel" runat="server" Text="Close" 
                        CssClass="close-panel" OnClick="btnClosePanel_Click" />
                </div>
                
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label" for="<%= txtName.ClientID %>">Product Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="<%= ddlProductType.ClientID %>">Product Type:</label>
                        <asp:DropDownList ID="ddlProductType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="----Select Item-----" Value="------Select-----" />
                            <asp:ListItem Text="Laptop" Value="Laptop" />
                            <asp:ListItem Text="Mobile" Value="Mobile" />
                            <asp:ListItem Text="Tablet" Value="Tablet" />
                            <asp:ListItem Text="Camera" Value="Camera" />
                            <asp:ListItem Text="Accessories" Value="Accessories" />
                        </asp:DropDownList>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="<%= txtPrice.ClientID %>">Price ($):</label>
                        <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="form-control" />
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="<%= txtQuantity.ClientID %>">Quantity Available:</label>
                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control" />
                    </div>
                    
                    <div class="form-group full-width">
                        <label class="form-label" for="<%= txtDescription.ClientID %>">Product Description:</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" />
                    </div>
                    
                    <div class="form-group full-width">
                        <label class="form-label" for="<%= fuImage.ClientID %>">Update Product Image:</label>
                        <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
                    </div>
                </div>
                
                <asp:Button ID="btnUpdate" runat="server" Text="Update Product" 
                    OnClick="btnUpdate_Click" CssClass="submit-button" />
            </asp:Panel>
        </div>
    </form>

    <script>
        function closeEditPanel() {
            document.querySelector('.edit-panel').style.display = 'none';
        }
    </script>
</body>
</html>