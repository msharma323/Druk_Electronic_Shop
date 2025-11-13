<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AccessoriesCollection.aspx.cs" Inherits="Electronics_shop.AccessoriesCollection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="styles/LaptopCollection.css" rel="stylesheet" />
<style>

.product-grid {
display: flex;
flex-wrap: wrap;
gap: 20px;
justify-content: center;
}
.product-card {
width: 300px;
border: 1px solid #ddd;
padding: 15px;
border-radius: 8px;
text-align: center;
transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.product-card:hover {
transform: translateY(-5px);
box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}
.image-gallery {
position: relative;
height: 200px;
overflow: hidden;
}
.image-gallery img {
width: 100%;
height: 200px;
object-fit: contain;
display: none;
}
.image-gallery img.active {
display: block;
}
.thumbnails {
display: flex;
justify-content: center;
gap: 5px;
margin: 10px 0;
}
.thumbnails img {
width: 50px;
height: 50px;
object-fit: cover;
cursor: pointer;
border: 2px solid transparent;
transition: border-color 0.2s ease;
}
.thumbnails img.active-thumb {
border-color: #007bff;
}
.thumbnails img:hover {
border-color: #0056b3;
}
.product-card h3 {
color: #333;
margin: 10px 0;
}
.product-card p {
margin: 5px 0;
text-align: left;
}
.desc-wrapper {
position: relative;
}
.desc-text {
max-height: 60px;
overflow: hidden;
transition: max-height 0.3s ease;
}
.desc-text.expanded {
max-height: 500px;
}
.see-more-btn {
background: none;
border: none;
color: #007bff;
cursor: pointer;
padding: 5px 0;
font-size: 14px;
}
.cart-buttons {
display: flex;
gap: 10px;
margin-top: 10px;
}
.view-details-btn {
background: #28a745;
color: white;
border: none;
padding: 10px 15px;
border-radius: 4px;
cursor: pointer;
flex: 1;
transition: background 0.3s ease;
}
.view-details-btn:hover {
background: #218838;
}
.cart-btn {
background: #007bff;
color: white;
border: none;
padding: 10px 15px;
border-radius: 4px;
cursor: pointer;
flex: 1;
transition: background 0.3s ease;
}
.cart-btn:hover {
background: #0056b3;
}

.pagination-container {
display: flex;
justify-content: center;
align-items: center;
margin: 30px 0;
gap: 15px;
flex-wrap: wrap;
}

.pagination-nav {
display: flex;
gap: 10px;
align-items: center;
background: #f8f9fa;
padding: 15px 25px;
border-radius: 10px;
box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.pagination-btn {
background: white;
border: 2px solid #007bff;
color: #007bff;
padding: 10px 20px;
border-radius: 6px;
cursor: pointer;
transition: all 0.3s ease;
font-weight: 600;
text-decoration: none;
display: inline-flex;
align-items: center;
justify-content: center;
gap: 8px;
min-width: 120px;
font-size: 14px;
}

.pagination-btn:hover {
background: #007bff;
color: white;
transform: translateY(-2px);
box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
}

.pagination-btn:active {
transform: translateY(0);
}

.pagination-btn.disabled {
background: #f8f9fa;
border-color: #dee2e6;
color: #6c757d;
cursor: not-allowed;
transform: none;
box-shadow: none;
}

.pagination-btn.disabled:hover {
background: #f8f9fa;
color: #6c757d;
border-color: #dee2e6;
transform: none;
box-shadow: none;
}

.page-indicator {
background: #007bff;
color: white;
padding: 8px 16px;
border-radius: 20px;
font-weight: 600;
font-size: 14px;
min-width: 80px;
text-align: center;
box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.pagination-info {
color: #6c757d;
font-size: 14px;
font-weight: 500;
text-align: center;
margin-top: 10px;
width: 100%;
}

@keyframes fadeIn {
from { opacity: 0; transform: translateY(10px); }
to { opacity: 1; transform: translateY(0); }
}

.animate-on-load {
animation: fadeIn 0.5s ease forwards;
}

@media (max-width: 768px) {
.pagination-container {
    gap: 30px;
}
.pagination-nav {
    flex-direction: column;
    padding: 15px;
    gap: 15px;
}
.pagination-btn {
    min-width: 140px;
    padding: 12px 20px;
}
}

.pagination-btn.loading {
position: relative;
color: transparent;
}

.pagination-btn.loading::after {
content: "";
position: absolute;
width: 20px;
height: 20px;
border: 2px solid transparent;
border-top: 2px solid #007bff;
border-radius: 50%;
animation: spin 1s linear infinite;
}

@keyframes spin {
0% { transform: rotate(0deg); }
100% { transform: rotate(360deg); }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1" runat="server">
<div class="collection-header">
<h2 style="color:navy;">Mobile Collection</h2>
<asp:HyperLink ID="hlViewCart" runat="server" CssClass="btn view-cart-btn" NavigateUrl="Cart.aspx">
Go to Cart (<asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>)
</asp:HyperLink>
</div>

    <div class="product-grid">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="10" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="product-card">
                    <div class="image-gallery">
                        <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/" + Eval("Image1") %>' CssClass="active" onerror="this.style.display='none'" />
                        <asp:Image ID="img2" runat="server" ImageUrl='<%# "~/" + Eval("Image2") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image2").ToString()) %>' />
                        <asp:Image ID="img3" runat="server" ImageUrl='<%# "~/" + Eval("Image3") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image3").ToString()) %>' />
                        <asp:Image ID="img4" runat="server" ImageUrl='<%# "~/" + Eval("Image4") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image4").ToString()) %>' />
                    </div>
                    
                    <div class="thumbnails">
                        <asp:Image ID="thumb1" runat="server" ImageUrl='<%# "~/" + Eval("Image1") %>' CssClass="active-thumb" onclick="changeImage(this, '<%# Container.ItemIndex %>')" onerror="this.style.display='none'" />
                        <asp:Image ID="thumb2" runat="server" ImageUrl='<%# "~/" + Eval("Image2") %>' onclick="changeImage(this, '<%# Container.ItemIndex %>')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image2").ToString()) %>' />
                        <asp:Image ID="thumb3" runat="server" ImageUrl='<%# "~/" + Eval("Image3") %>' onclick="changeImage(this, '<%# Container.ItemIndex %>')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image3").ToString()) %>' />
                        <asp:Image ID="thumb4" runat="server" ImageUrl='<%# "~/" + Eval("Image4") %>' onclick="changeImage(this, '<%# Container.ItemIndex %>')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image4").ToString()) %>' />
                    </div>
                    
                    <h3><%# Eval("Product_Name") %></h3>
                    <p><b>Price:</b> ₹<%# Eval("Price", "{0:N2}") %></p>
                    <p><b>Available:</b> <%# Eval("Quantity") %></p>

                    <div class="desc-wrapper">
                        <p class="desc-text"><%# Eval("Description") %></p>
                    </div>

                    <!-- Buttons Section -->
                    <div class="cart-buttons">
                        <asp:Button ID="btnViewDetails" runat="server" Text="View Details" 
                            CssClass="view-details-btn" 
                            CommandArgument='<%# Eval("ID") %>' 
                            CommandName="ViewDetails" />

                        <asp:Button ID="btnAddCart" runat="server" Text="Add to Cart" 
                            CssClass="cart-btn" 
                            CommandArgument='<%# Eval("ID") %>' 
                            CommandName="AddToCart" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <!-- Enhanced Pagination - Works with your existing backend -->
    <div class="pagination-container animate-on-load" style="animation-delay: 0.8s;">
        <div class="pagination-nav">
            <!-- Previous Button -->
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="pagination-btn prev-btn">
                <i class="fas fa-chevron-left"></i>
                Previous
            </asp:LinkButton>
            
            <!-- Current Page Indicator -->

            
            <!-- Next Button -->
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CssClass="pagination-btn next-btn">
                Next
                <i class="fas fa-chevron-right"></i>
            </asp:LinkButton>
        </div>
        
        <!-- Additional Info -->
        <div class="pagination-info">
            Browse through our laptop collection
        </div>
    </div>
</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
<script>
    function changeImage(thumbnail, itemIndex) {
        const productCard = thumbnail.closest('.product-card');
        const galleryImgs = productCard.querySelectorAll('.image-gallery img');
        const thumbnails = productCard.querySelectorAll('.thumbnails img');

        galleryImgs.forEach(img => img.classList.remove('active'));
        const thumbIndex = Array.from(thumbnails).indexOf(thumbnail);
        if (galleryImgs[thumbIndex]) galleryImgs[thumbIndex].classList.add('active');

        thumbnails.forEach(img => img.classList.remove('active-thumb'));
        thumbnail.classList.add('active-thumb');
    }

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.product-card').forEach(card => {
            const firstImg = card.querySelector('.image-gallery img');
            const firstThumb = card.querySelector('.thumbnails img');
            if (firstImg) firstImg.classList.add('active');
            if (firstThumb) firstThumb.classList.add('active-thumb');
        });

        // Add loading states to pagination buttons
        const paginationButtons = document.querySelectorAll('.pagination-btn');
        paginationButtons.forEach(btn => {
            btn.addEventListener('click', function () {
                // Add loading class
                this.classList.add('loading');

                // Remove loading class after a delay (in case of slow response)
                setTimeout(() => {
                    this.classList.remove('loading');
                }, 2000);
            });
        });
    });

    // Update page indicator from ViewState (if available)
    function updatePageIndicator() {
        // This function can be called from server-side if needed
        // to update the page indicator without full postback
    }
</script>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</asp:Content>