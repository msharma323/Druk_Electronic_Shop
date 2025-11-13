<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HotDeals.aspx.cs" Inherits="Electronics_shop.HotDeals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="styles/LaptopCollection.css" rel="stylesheet" />
<style>
/* 🌌 Dynamic Bumper Offer Background */
body {
  background: linear-gradient(135deg, #0b0c10, #1f2833, #0b0c10);
  background-size: 300% 300%;
  animation: gradientShift 10s ease infinite;
  color: #fff;
  font-family: 'Poppins', sans-serif;
}

@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* 💥 Header */
.collection-header {
  text-align: center;
  padding: 40px 20px;
  background: radial-gradient(circle at top, #ff416c, #ff4b2b);
  color: white;
  border-radius: 20px;
  margin-bottom: 30px;
  animation: pulseGlow 3s infinite;
  box-shadow: 0 0 40px rgba(255, 75, 43, 0.6);
}

@keyframes pulseGlow {
  0%, 100% { box-shadow: 0 0 20px rgba(255, 75, 43, 0.6); }
  50% { box-shadow: 0 0 60px rgba(255, 75, 43, 0.9); }
}

.collection-header h2 {
  font-size: 2.5rem;
  font-weight: 700;
  text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.3);
}

.view-cart-btn {
  background: white;
  color: #ff4b2b;
  border-radius: 30px;
  padding: 10px 25px;
  font-weight: 600;
  transition: all 0.3s ease;
}

.view-cart-btn:hover {
  background: #ff4b2b;
  color: white;
  box-shadow: 0 0 15px rgba(255, 75, 43, 0.6);
}

/* 🛍️ Product Grid */
.product-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 25px;
  padding: 30px;
  animation: fadeIn 1s ease-in-out;
}

/* 💎 Product Cards */
.product-card {
  width: 300px;
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.15);
  border-radius: 16px;
  padding: 20px;
  text-align: center;
  transition: all 0.3s ease-in-out;
  backdrop-filter: blur(10px);
  box-shadow: 0 4px 15px rgba(255, 255, 255, 0.1);
  position: relative;
  overflow: hidden;
}

.product-card::before {
  content: "🔥 HOT DEAL";
  position: absolute;
  top: 10px;
  left: -50px;
  background: linear-gradient(90deg, #ff4b2b, #ff416c);
  color: white;
  padding: 5px 50px;
  font-size: 12px;
  font-weight: bold;
  transform: rotate(-45deg);
  box-shadow: 0 2px 10px rgba(255, 75, 43, 0.5);
}

.product-card:hover {
  transform: translateY(-10px) scale(1.02);
  box-shadow: 0 10px 25px rgba(255, 75, 43, 0.4);
}

/* 🖼️ Image Gallery */
.image-gallery img {
  width: 100%;
  height: 220px;
  object-fit: contain;
  border-radius: 10px;
  transition: opacity 0.3s ease;
}

.thumbnails img {
  width: 55px;
  height: 55px;
  border-radius: 6px;
  cursor: pointer;
  border: 2px solid transparent;
  transition: all 0.2s ease;
}

.thumbnails img:hover {
  transform: scale(1.1);
  border-color: #ff4b2b;
}

/* 💬 Description */
.desc-text {
  max-height: 70px;
  overflow: hidden;
  color: #ddd;
  font-size: 14px;
  transition: max-height 0.5s ease;
}

/* 💸 Price & Quantity */
.product-card p {
  color: #fff;
  text-align: left;
  margin: 5px 0;
}

/* 🛒 Buttons */
.cart-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 15px;
  gap: 10px;
}

.view-details-btn {
  background: linear-gradient(45deg, #1db954, #159a43);
  border: none;
  color: white;
  padding: 10px 15px;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.view-details-btn:hover {
  background: #0f7b32;
  box-shadow: 0 0 10px rgba(29, 185, 84, 0.7);
}

.cart-btn {
  background: linear-gradient(45deg, #007bff, #00b4d8);
  border: none;
  color: white;
  padding: 10px 15px;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.cart-btn:hover {
  background: #0056b3;
  box-shadow: 0 0 10px rgba(0, 123, 255, 0.7);
}

/* ⚡ Pagination */
.pagination-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 40px 0;
  gap: 15px;
}

.pagination-btn {
  background: rgba(255,255,255,0.1);
  border: 2px solid #ff4b2b;
  color: #ff4b2b;
  padding: 10px 25px;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.pagination-btn:hover {
  background: #ff4b2b;
  color: white;
  box-shadow: 0 0 15px rgba(255,75,43,0.6);
}

.page-indicator {
  background: #ff4b2b;
  color: white;
  padding: 8px 16px;
  border-radius: 20px;
  font-weight: 600;
  box-shadow: 0 0 15px rgba(255,75,43,0.6);
}

/* 🎇 Keyframes */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1" runat="server">
<div class="collection-header">
<h2 style="color:navy; margin: 0 auto; width: fit-content;">Hot Deals</h2>
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

</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 🔄 Image Thumbnail Change
        document.querySelectorAll('.thumbnails img').forEach(thumb => {
            thumb.addEventListener('click', () => {
                const card = thumb.closest('.product-card');
                const galleryImgs = card.querySelectorAll('.image-gallery img');
                galleryImgs.forEach(img => img.classList.remove('active'));
                galleryImgs[Array.from(thumb.parentNode.children).indexOf(thumb)].classList.add('active');

                card.querySelectorAll('.thumbnails img').forEach(t => t.classList.remove('active-thumb'));
                thumb.classList.add('active-thumb');
            });
        });

        // ✨ Floating Sparkle Animation
        createSparkles();
    });

    function createSparkles() {
        const sparkleContainer = document.createElement('div');
        sparkleContainer.style.position = 'fixed';
        sparkleContainer.style.top = 0;
        sparkleContainer.style.left = 0;
        sparkleContainer.style.width = '100%';
        sparkleContainer.style.height = '100%';
        sparkleContainer.style.pointerEvents = 'none';
        document.body.appendChild(sparkleContainer);

        setInterval(() => {
            const sparkle = document.createElement('div');
            sparkle.classList.add('sparkle');
            sparkle.style.position = 'absolute';
            sparkle.style.width = '5px';
            sparkle.style.height = '5px';
            sparkle.style.borderRadius = '50%';
            sparkle.style.background = 'radial-gradient(circle, #ff4b2b 0%, transparent 80%)';
            sparkle.style.left = Math.random() * window.innerWidth + 'px';
            sparkle.style.top = Math.random() * window.innerHeight + 'px';
            sparkle.style.opacity = 0;
            sparkle.style.transition = 'opacity 2s, transform 2s';
            sparkleContainer.appendChild(sparkle);

            setTimeout(() => {
                sparkle.style.opacity = 1;
                sparkle.style.transform = 'translateY(-50px)';
            }, 10);

            setTimeout(() => sparkle.remove(), 2500);
        }, 300);
    }
</script>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</asp:Content>