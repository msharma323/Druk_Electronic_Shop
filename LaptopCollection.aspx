<%@ Page Title="Laptop Collection" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LaptopCollection.aspx.cs" Inherits="Electronics_shop.LaptopCollection" EnableEventValidation="false" %>

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
}
.thumbnails img.active-thumb {
border-color: #007bff;
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
}
.cart-btn:hover {
background: #0056b3;
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1" runat="server">
<div class="collection-header">
<h2 style="color:navy;">Laptop Collection</h2>
<asp:HyperLink ID="hlViewCart" runat="server" CssClass="btn view-cart-btn" NavigateUrl="Cart.aspx">
Go to Cart (<asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>)
</asp:HyperLink>
</div>

    <div class="product-grid">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10" OnItemCommand="DataList1_ItemCommand">
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

    <div class="pagination-controls">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pagination-btn" OnClick="LinkButton1_Click" Text="Previous" Enabled="false" />
        <asp:Label ID="Label1" runat="server" CssClass="page-info" Text="Page 1 of 1" />
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="pagination-btn" OnClick="LinkButton2_Click" Text="Next" Enabled="false" />
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
    });
</script>

</asp:Content>