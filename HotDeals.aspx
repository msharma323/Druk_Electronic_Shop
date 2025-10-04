<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HotDeals.aspx.cs" Inherits="Electronics_shop.HotDeals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific CSS -->
    <style>
        .hot-deal-section {
            background-color: #f8f9fa;
            padding: 30px 0;
            margin-bottom: 30px;
        }
        .hot-deal-card {
            border: 2px solid #ff6a00;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        .hot-deal-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .hot-deal-header {
            background-color: #ff6a00;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }
        .countdown-timer {
            display: flex;
            justify-content: center;
            margin: 15px 0;
        }
        .countdown-unit {
            margin: 0 5px;
            text-align: center;
            background: #ff6a00;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            min-width: 50px;
        }
        .countdown-value {
            font-size: 24px;
            font-weight: bold;
        }
        .countdown-label {
            font-size: 12px;
        }
        .discount-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #dc3545;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hot Deals Banner -->
    <div class="hot-deal-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1>🔥 HOT DEALS 🔥</h1>
                    <p class="lead">Limited time offers - Don't miss out!</p>
                    
                    <!-- Countdown Timer -->
                    <div class="countdown-timer">
                        <div class="countdown-unit">
                            <div class="countdown-value" id="days">02</div>
                            <div class="countdown-label">Days</div>
                        </div>
                        <div class="countdown-unit">
                            <div class="countdown-value" id="hours">10</div>
                            <div class="countdown-label">Hours</div>
                        </div>
                        <div class="countdown-unit">
                            <div class="countdown-value" id="minutes">34</div>
                            <div class="countdown-label">Mins</div>
                        </div>
                        <div class="countdown-unit">
                            <div class="countdown-value" id="seconds">60</div>
                            <div class="countdown-label">Secs</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hot Deals Products -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">Today's Best Deals</h3>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <!-- Product 1 -->
                <div class="col-md-4 col-xs-6">
                    <div class="product hot-deal-card">
                        <div class="hot-deal-header">FLASH SALE</div>
                        <div class="product-img">
                            <img src="./img/product01.png" alt="">
                            <div class="discount-badge">-30%</div>
                        </div>
                        <div class="product-body">
                            <p class="product-category">Laptop</p>
                            <h3 class="product-name"><a href="#">Dell XPS 13 Laptop</a></h3>
                            <h4 class="product-price">$980.00 <del class="product-old-price">$1,400.00</del></h4>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-btns">
                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                        </div>
                    </div>
                </div>
                
                <!-- Product 2 -->
                <div class="col-md-4 col-xs-6">
                    <div class="product hot-deal-card">
                        <div class="hot-deal-header">LIMITED STOCK</div>
                        <div class="product-img">
                            <img src="./img/product02.png" alt="">
                            <div class="discount-badge">-25%</div>
                        </div>
                        <div class="product-body">
                            <p class="product-category">Smartphone</p>
                            <h3 class="product-name"><a href="#">Samsung Galaxy S21</a></h3>
                            <h4 class="product-price">$750.00 <del class="product-old-price">$1,000.00</del></h4>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <div class="product-btns">
                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                        </div>
                    </div>
                </div>
                
                <!-- Product 3 -->
                <div class="col-md-4 col-xs-6">
                    <div class="product hot-deal-card">
                        <div class="hot-deal-header">DEAL OF THE DAY</div>
                        <div class="product-img">
                            <img src="./img/product03.png" alt="">
                            <div class="discount-badge">-40%</div>
                        </div>
                        <div class="product-body">
                            <p class="product-category">Camera</p>
                            <h3 class="product-name"><a href="#">Canon EOS R5</a></h3>
                            <h4 class="product-price">$2,399.00 <del class="product-old-price">$3,999.00</del></h4>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-btns">
                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- More Hot Deals Section -->
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">More Hot Deals</h3>
                    </div>
                    
                    <div class="row">
                        <!-- Deal 1 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./img/product04.png" alt="">
                                    <div class="product-label">
                                        <span class="sale">-20%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Accessories</p>
                                    <h3 class="product-name"><a href="#">Wireless Headphones</a></h3>
                                    <h4 class="product-price">$79.99 <del class="product-old-price">$99.99</del></h4>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Deal 2 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./img/product05.png" alt="">
                                    <div class="product-label">
                                        <span class="sale">-15%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Tablet</p>
                                    <h3 class="product-name"><a href="#">iPad Air</a></h3>
                                    <h4 class="product-price">$599.00 <del class="product-old-price">$699.00</del></h4>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Deal 3 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./img/product06.png" alt="">
                                    <div class="product-label">
                                        <span class="sale">-35%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Smart Watch</p>
                                    <h3 class="product-name"><a href="#">Apple Watch Series 7</a></h3>
                                    <h4 class="product-price">$329.00 <del class="product-old-price">$499.00</del></h4>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Deal 4 -->
                        <div class="col-md-3 col-sm-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./img/product07.png" alt="">
                                    <div class="product-label">
                                        <span class="sale">-10%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Gaming</p>
                                    <h3 class="product-name"><a href="#">PlayStation 5</a></h3>
                                    <h4 class="product-price">$539.99 <del class="product-old-price">$599.99</del></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <!-- Page-specific JavaScript -->
    <script>
        // Countdown timer functionality
        function updateCountdown() {
            const days = document.getElementById('days');
            const hours = document.getElementById('hours');
            const minutes = document.getElementById('minutes');
            const seconds = document.getElementById('seconds');

            let sec = parseInt(seconds.innerText);
            let min = parseInt(minutes.innerText);
            let hr = parseInt(hours.innerText);
            let d = parseInt(days.innerText);

            sec--;

            if (sec < 0) {
                sec = 59;
                min--;

                if (min < 0) {
                    min = 59;
                    hr--;

                    if (hr < 0) {
                        hr = 23;
                        d--;

                        if (d < 0) {
                            // Timer completed
                            clearInterval(countdownInterval);
                            document.querySelector('.countdown-timer').innerHTML = '<div class="alert alert-warning">Deal has ended!</div>';
                            return;
                        }
                    }
                }
            }

            seconds.innerText = sec.toString().padStart(2, '0');
            minutes.innerText = min.toString().padStart(2, '0');
            hours.innerText = hr.toString().padStart(2, '0');
            days.innerText = d.toString().padStart(2, '0');
        }

        // Start the countdown timer
        const countdownInterval = setInterval(updateCountdown, 1000);

        // Add to cart functionality
        document.querySelectorAll('.add-to-cart-btn').forEach(button => {
            button.addEventListener('click', function () {
                const product = this.closest('.product');
                const productName = product.querySelector('.product-name').textContent;

                // Show added to cart message
                const originalText = this.innerHTML;
                this.innerHTML = '<i class="fa fa-check"></i> Added!';

                setTimeout(() => {
                    this.innerHTML = originalText;
                }, 2000);

                // You would typically send an AJAX request to your server here
                console.log(`Added ${productName} to cart`);
            });
        });
    </script>
</asp:Content>