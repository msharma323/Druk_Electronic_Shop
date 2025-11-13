<%@ Page Title="Laptop Collection" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LaptopCollection.aspx.cs" Inherits="Electronics_shop.LaptopCollection" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="styles/LaptopCollection.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
/* Enhanced CSS without breaking existing functionality */
:root {
    --primary: #4361ee;
    --secondary: #3a0ca3;
    --accent: #4cc9f0;
    --light: #f8f9fa;
    --dark: #212529;
    --success: #4bb543;
    --danger: #e63946;
    --warning: #ff9e00;
    --gray: #6c757d;
    --card-bg: #ffffff;
    --transition: all 0.3s ease;
}

body {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
    min-height: 100vh;
    transition: background 1s ease;
}

.collection-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    margin-bottom: 30px;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    position: relative;
    overflow: hidden;
}

.collection-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: linear-gradient(90deg, var(--primary), var(--accent));
}

.collection-header h2 {
    font-size: 2.5rem;
    font-weight: 700;
    background: linear-gradient(90deg, var(--primary), var(--secondary));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    margin: 0;
}

.view-cart-btn {
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    color: white;
    padding: 12px 25px;
    border-radius: 50px;
    text-decoration: none;
    font-weight: 600;
    box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
    transition: var(--transition);
    display: flex;
    align-items: center;
    gap: 8px;
}

.view-cart-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
    color: white;
    text-decoration: none;
}

.product-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 25px;
    justify-content: center;
    margin-bottom: 40px;
}

.product-card {
    width: 100%;
    max-width: 320px;
    background: var(--card-bg);
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
    transition: var(--transition);
    position: relative;
    overflow: hidden;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.product-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

.product-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: linear-gradient(90deg, var(--primary), var(--accent));
    transform: scaleX(0);
    transform-origin: left;
    transition: transform 0.5s ease;
}

.product-card:hover::before {
    transform: scaleX(1);
}

.image-gallery {
    position: relative;
    height: 220px;
    overflow: hidden;
    border-radius: 10px;
    margin-bottom: 15px;
}

.image-gallery img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    display: none;
    transition: opacity 0.5s ease;
}

.image-gallery img.active {
    display: block;
    animation: fadeIn 0.5s ease;
}

.thumbnails {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin: 15px 0;
    flex-wrap: wrap;
}

.thumbnails img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    cursor: pointer;
    border: 2px solid transparent;
    border-radius: 5px;
    transition: var(--transition);
}

.thumbnails img.active-thumb {
    border-color: var(--primary);
    transform: scale(1.1);
}

.thumbnails img:hover {
    border-color: var(--accent);
    transform: scale(1.05);
}

.product-card h3 {
    color: var(--dark);
    margin: 10px 0;
    font-size: 1.4rem;
    font-weight: 700;
}

.product-card p {
    margin: 8px 0;
    text-align: left;
    color: var(--gray);
}

.product-card .price {
    font-size: 1.3rem;
    font-weight: 700;
    color: var(--primary);
}

.desc-wrapper {
    position: relative;
    margin: 15px 0;
}

.desc-text {
    max-height: 60px;
    overflow: hidden;
    transition: max-height 0.5s ease;
    line-height: 1.5;
}

.desc-text.expanded {
    max-height: 500px;
}

.see-more-btn {
    background: none;
    border: none;
    color: var(--primary);
    cursor: pointer;
    padding: 5px 0;
    font-size: 14px;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 5px;
    transition: var(--transition);
}

.see-more-btn:hover {
    color: var(--secondary);
}

.cart-buttons {
    display: flex;
    gap: 10px;
    margin-top: 15px;
}

.view-details-btn, .cart-btn {
    flex: 1;
    padding: 12px;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition: var(--transition);
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

.view-details-btn {
    background: linear-gradient(135deg, var(--success), #2e8b57);
    color: white;
}

.view-details-btn:hover {
    background: linear-gradient(135deg, #3a9e4d, #267445);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(75, 181, 67, 0.3);
}

.cart-btn {
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    color: white;
}

.cart-btn:hover {
    background: linear-gradient(135deg, #3a56d4, #2f0c7a);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
}

.cart-btn.added {
    background: linear-gradient(135deg, var(--success), #2e8b57);
    animation: pulse 0.5s;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

.pagination-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 40px 0;
    gap: 20px;
    flex-wrap: wrap;
}

.pagination-nav {
    display: flex;
    gap: 15px;
    align-items: center;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
    padding: 20px 30px;
    border-radius: 15px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.pagination-btn {
    background: white;
    border: 2px solid var(--primary);
    color: var(--primary);
    padding: 12px 24px;
    border-radius: 8px;
    cursor: pointer;
    transition: var(--transition);
    font-weight: 600;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    min-width: 130px;
    font-size: 15px;
}

.pagination-btn:hover {
    background: var(--primary);
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
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
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    color: white;
    padding: 10px 20px;
    border-radius: 50px;
    font-weight: 700;
    font-size: 16px;
    min-width: 100px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
}

.pagination-info {
    color: var(--gray);
    font-size: 15px;
    font-weight: 500;
    text-align: center;
    margin-top: 10px;
    width: 100%;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.animate-on-load {
    animation: fadeIn 0.8s ease forwards;
}

.product-card {
    animation: fadeIn 0.6s ease forwards;
    opacity: 0;
}

.product-card:nth-child(1) { animation-delay: 0.1s; }
.product-card:nth-child(2) { animation-delay: 0.2s; }
.product-card:nth-child(3) { animation-delay: 0.3s; }
.product-card:nth-child(4) { animation-delay: 0.4s; }
.product-card:nth-child(5) { animation-delay: 0.5s; }
.product-card:nth-child(6) { animation-delay: 0.6s; }

@media (max-width: 1200px) {
    .product-card {
        max-width: 280px;
    }
}

@media (max-width: 992px) {
    .product-card {
        max-width: 45%;
    }
    
    .collection-header {
        flex-direction: column;
        gap: 15px;
        text-align: center;
    }
    
    .collection-header h2 {
        font-size: 2rem;
    }
}

@media (max-width: 768px) {
    .product-card {
        max-width: 100%;
    }
    
    .pagination-container {
        gap: 25px;
    }
    
    .pagination-nav {
        flex-direction: column;
        padding: 20px;
        gap: 15px;
    }
    
    .pagination-btn {
        min-width: 160px;
        padding: 14px 20px;
    }
    
    .cart-buttons {
        flex-direction: column;
    }
}

@media (max-width: 576px) {
    .collection-header h2 {
        font-size: 1.8rem;
    }
    
    .product-card {
        padding: 15px;
    }
    
    .image-gallery {
        height: 200px;
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
    border-top: 2px solid white;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* Background Animation */
.background-animation {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    opacity: 0.7;
}

.floating-shapes {
    position: absolute;
    width: 100%;
    height: 100%;
}

.shape {
    position: absolute;
    background: linear-gradient(45deg, var(--primary), var(--accent));
    border-radius: 50%;
    opacity: 0.1;
    animation: float 15s infinite linear;
}

.shape:nth-child(1) {
    width: 80px;
    height: 80px;
    top: 10%;
    left: 10%;
    animation-delay: 0s;
}

.shape:nth-child(2) {
    width: 120px;
    height: 120px;
    top: 60%;
    left: 80%;
    animation-delay: -5s;
}

.shape:nth-child(3) {
    width: 60px;
    height: 60px;
    top: 80%;
    left: 20%;
    animation-delay: -10s;
}

.shape:nth-child(4) {
    width: 100px;
    height: 100px;
    top: 30%;
    left: 70%;
    animation-delay: -7s;
}

@keyframes float {
    0%, 100% {
        transform: translateY(0) rotate(0deg);
    }
    25% {
        transform: translateY(-20px) rotate(90deg);
    }
    50% {
        transform: translateY(0) rotate(180deg);
    }
    75% {
        transform: translateY(20px) rotate(270deg);
    }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1" runat="server">
    <!-- Your original ASP.NET code remains UNCHANGED -->
    <div class="collection-header">
<h2 style="color:navy; margin: 0 auto; width: fit-content;">Laptop Collection</h2>
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

<!-- Background Animation -->
<div class="background-animation">
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
<script>
    // Enhanced JavaScript for dynamic interactions
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

    function toggleDescription(button) {
        const descWrapper = button.closest('.desc-wrapper');
        const descText = descWrapper.querySelector('.desc-text');
        const icon = button.querySelector('i');

        descText.classList.toggle('expanded');

        if (descText.classList.contains('expanded')) {
            button.querySelector('span').textContent = 'See Less';
            icon.classList.remove('fa-chevron-down');
            icon.classList.add('fa-chevron-up');
        } else {
            button.querySelector('span').textContent = 'See More';
            icon.classList.remove('fa-chevron-up');
            icon.classList.add('fa-chevron-down');
        }
    }

    function addToCartAnimation(button) {
        const originalText = button.innerHTML;
        button.classList.add('added');
        button.innerHTML = '<i class="fas fa-check"></i> Added to Cart';

        setTimeout(() => {
            button.classList.remove('added');
            button.innerHTML = originalText;
        }, 2000);
    }

    document.addEventListener('DOMContentLoaded', function () {
        // Initialize image galleries
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
                if (!this.classList.contains('disabled')) {
                    this.classList.add('loading');

                    setTimeout(() => {
                        this.classList.remove('loading');
                    }, 2000);
                }
            });
        });

        // Add click animations to cart buttons
        document.querySelectorAll('.cart-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                addToCartAnimation(this);
            });
        });

        // Add scroll animation for product cards
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.product-card').forEach(card => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(card);
        });

        // Dynamic background color change
        let bgIndex = 0;
        const backgrounds = [
            'linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%)',
            'linear-gradient(135deg, #accbee 0%, #e7f0fd 100%)',
            'linear-gradient(135deg, #d5dee7 0%, #e8e8e8 50%, #f5f5f5 100%)',
            'linear-gradient(135deg, #dfe9f3 0%, white 100%)'
        ];

        setInterval(() => {
            document.body.style.background = backgrounds[bgIndex];
            bgIndex = (bgIndex + 1) % backgrounds.length;
        }, 10000);
    });
</script>
</asp:Content>