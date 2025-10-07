<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="Electronics_shop.ViewDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="styles/ViewDetails.css" rel="stylesheet" />
<style>
/* Mimic styles from LaptopCollection for a consistent look, adapted for a single product view */
.product-details-container {
    display: flex;
    justify-content: center;
    padding: 20px;
    margin: 20px auto;
    max-width: 1200px;
}
.details-card {
    display: flex;
    gap: 40px;
    width: 100%;
    border: 1px solid #ddd;
    padding: 30px;
    border-radius: 8px;
    background-color: #fff;
}
.image-section {
    width: 45%;
    min-width: 400px;
}
.info-section {
    width: 55%;
    padding-left: 20px;
}

.image-gallery {
    position: relative;
    height: 400px; /* Larger view */
    overflow: hidden;
    margin-bottom: 20px;
    border: 1px solid #eee;
    border-radius: 4px;
}
.image-gallery img {
    width: 100%;
    height: 400px;
    object-fit: contain;
    display: none;
}
.image-gallery img.active {
    display: block;
}
.thumbnails {
    display: flex;
    justify-content: flex-start;
    gap: 10px;
    margin: 10px 0;
}
.thumbnails img {
    width: 70px; /* Larger thumbnails */
    height: 70px;
    object-fit: cover;
    cursor: pointer;
    border: 2px solid transparent;
    border-radius: 4px;
}
.thumbnails img.active-thumb {
    border-color: #007bff;
}

.info-section h2 {
    color: #333;
    margin-top: 0;
    font-size: 2.2em;
    border-bottom: 2px solid #eee;
    padding-bottom: 10px;
    margin-bottom: 15px;
}
.info-section p {
    margin: 10px 0;
    font-size: 1.1em;
    line-height: 1.6;
}
.info-section b {
    font-weight: bold;
    color: #555;
}
.price {
    font-size: 1.8em;
    color: #e44d26; /* A contrasting color for price */
    font-weight: bold;
    margin: 20px 0;
}

.description-full {
    margin-top: 25px;
    padding: 15px;
    background-color: #f9f9f9;
    border-radius: 4px;
}
.description-full h3 {
    margin-top: 0;
    color: #333;
}

.cart-buttons {
    display: flex;
    gap: 15px;
    margin-top: 30px;
}
.cart-btn {
    background: #007bff;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.1em;
    flex: 0 1 auto;
    transition: background 0.3s;
}
.cart-btn:hover {
    background: #0056b3;
}
.back-btn {
    background: #6c757d;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.1em;
    flex: 0 1 auto;
    text-decoration: none;
    text-align: center;
    transition: background 0.3s;
}
.back-btn:hover {
    background: #5a6268;
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="collection-header">
        <h1 style="color:navy;">Product Details</h1>
        <asp:HyperLink ID="hlBackToCollection" runat="server" CssClass="btn back-btn" NavigateUrl="LaptopCollection.aspx">
            ← Back to Collection
        </asp:HyperLink>
    </div>

    <div class="product-details-container">
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" Width="100%">
            <ItemTemplate>
                <div class="details-card">
                    
                    <div class="image-section">
                        <div class="image-gallery">
                            <%-- Image controls similar to LaptopCollection.aspx--%>
                            <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/" + Eval("Image1") %>' CssClass="active" onerror="this.style.display='none'" />
                            <asp:Image ID="img2" runat="server" ImageUrl='<%# "~/" + Eval("Image2") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image2").ToString()) %>' />
                            <asp:Image ID="img3" runat="server" ImageUrl='<%# "~/" + Eval("Image3") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image3").ToString()) %>' />
                            <asp:Image ID="img4" runat="server" ImageUrl='<%# "~/" + Eval("Image4") %>' onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image4").ToString()) %>' />
                        </div>
                        
                        <div class="thumbnails">
                             <%-- Thumbnail controls similar to LaptopCollection.aspx --%>
                            <asp:Image ID="thumb1" runat="server" ImageUrl='<%# "~/" + Eval("Image1") %>' CssClass="active-thumb" onclick="changeImage(this, '0')" onerror="this.style.display='none'" />
                            <asp:Image ID="thumb2" runat="server" ImageUrl='<%# "~/" + Eval("Image2") %>' onclick="changeImage(this, '0')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image2").ToString()) %>' />
                            <asp:Image ID="thumb3" runat="server" ImageUrl='<%# "~/" + Eval("Image3") %>' onclick="changeImage(this, '0')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image3").ToString()) %>' />
                            <asp:Image ID="thumb4" runat="server" ImageUrl='<%# "~/" + Eval("Image4") %>' onclick="changeImage(this, '0')" onerror="this.style.display='none'" Visible='<%# !string.IsNullOrEmpty(Eval("Image4").ToString()) %>' />
                        </div>
                    </div>

                    <div class="info-section">
                        <h2><%# Eval("Product_Name") %></h2>
                        <p class="price"><b>Price:</b> ₹<%# Eval("Price", "{0:N2}") %></p>
                        <p><b>Available Stock:</b> <%# Eval("Quantity") %></p>
                        
                        <div class="description-full">
                            <h3>Full Description</h3>
                            <p><%# Eval("Description") %></p>
                        </div>
                        
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
<script>
    // Reusing the changeImage function from LaptopCollection.aspx for the gallery
    function changeImage(thumbnail, itemIndex) {
        // itemIndex is not strictly needed here as we only have one item in the DataList
        const productCard = thumbnail.closest('.details-card');
        const galleryImgs = productCard.querySelectorAll('.image-gallery img');
        const thumbnails = productCard.querySelectorAll('.thumbnails img');

        galleryImgs.forEach(img => img.classList.remove('active'));
        const thumbIndex = Array.from(thumbnails).indexOf(thumbnail);
        if (galleryImgs[thumbIndex]) galleryImgs[thumbIndex].classList.add('active');

        thumbnails.forEach(img => img.classList.remove('active-thumb'));
        thumbnail.classList.add('active-thumb');
    }

    document.addEventListener('DOMContentLoaded', function () {
        // Initialize the first image/thumbnail as active on load
        document.querySelectorAll('.details-card').forEach(card => {
            const firstImg = card.querySelector('.image-gallery img');
            const firstThumb = card.querySelector('.thumbnails img');
            if (firstImg) firstImg.classList.add('active');
            if (firstThumb) firstThumb.classList.add('active-thumb');
        });
    });
</script>
</asp:Content>
