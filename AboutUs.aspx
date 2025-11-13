<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Electronics_shop.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .about-section {
            padding: 60px 0;
            background: #f8f9fa;
        }
        .about-header {
            text-align: center;
            margin-bottom: 50px;
        }
        .about-header h1 {
            font-size: 36px;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }
        .about-header p {
            font-size: 18px;
            color: #666;
            max-width: 600px;
            margin: 0 auto;
        }
        .about-content {
            margin-bottom: 50px;
        }
        .about-feature {
            text-align: center;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            height: 100%;
        }
        .about-feature i {
            font-size: 48px;
            color: #D10024;
            margin-bottom: 20px;
        }
        .about-feature h3 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #333;
        }
        .about-feature p {
            color: #666;
            line-height: 1.6;
        }
        .team-section {
            padding: 60px 0;
            background: white;
        }
        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
        }
        .team-member h4 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }
        .team-member p {
            color: #D10024;
            font-weight: 500;
        }
        .stats-section {
            background: #D10024;
            color: white;
            padding: 60px 0;
            text-align: center;
        }
        .stat-item h3 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .stat-item p {
            font-size: 18px;
            opacity: 0.9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb-tree">
                        <li><a href="WebForm1.aspx">Home</a></li>
                        <li class="active">About Us</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- /BREADCRUMB -->

    <!-- ABOUT SECTION -->
    <div class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="about-header">
                        <h1>About Electro</h1>
                        <p>Your trusted partner in electronics since 2010. We bring you the latest technology with unbeatable prices and exceptional service.</p>
                    </div>
                </div>
            </div>
            
            <div class="row about-content">
                <div class="col-md-6">
                    <h2>Our Story</h2>
                    <p>Founded in 2010, Electro started as a small electronics store with a big vision: to make cutting-edge technology accessible to everyone. Over the years, we've grown into one of the leading electronics retailers, serving thousands of satisfied customers worldwide.</p>
                    <p>We believe in innovation, quality, and customer satisfaction. Our team of experts carefully selects every product in our inventory to ensure we offer only the best to our customers.</p>
                </div>
                <div class="col-md-6">
                    <img src="./img/unnamed (1).jpg" alt="About Electro" class="img-responsive" style="width: 100%; border-radius: 8px;">
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="about-feature">
                        <i class="fa fa-rocket"></i>
                        <h3>Fast Delivery</h3>
                        <p>We deliver your favorite electronics quickly and safely to your doorstep with our reliable shipping partners.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="about-feature">
                        <i class="fa fa-shield"></i>
                        <h3>Quality Guarantee</h3>
                        <p>All our products come with manufacturer warranty and our own quality assurance for your peace of mind.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="about-feature">
                        <i class="fa fa-headphones"></i>
                        <h3>24/7 Support</h3>
                        <p>Our customer support team is always ready to help you with any questions or concerns you may have.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /ABOUT SECTION -->

    <!-- STATS SECTION -->
    <div class="stats-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="stat-item">
                        <h3>50K+</h3>
                        <p>Happy Customers</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stat-item">
                        <h3>10K+</h3>
                        <p>Products Available</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stat-item">
                        <h3>12+</h3>
                        <p>Years Experience</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="stat-item">
                        <h3>24/7</h3>
                        <p>Customer Support</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /STATS SECTION -->

    <!-- TEAM SECTION -->
    <div class="team-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">Meet Our Team</h3>
                        <p>The passionate people behind Electro's success</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="./img/20230603_102641.jpg" alt="Team Member">
                        <h4>Matrika Sharma</h4>
                        <p>CEO & Founder</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="./img/team2.jpg" alt="Team Member">
                        <h4>Arjun Sunwar</h4>
                        <p>Head of Operations</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="./img/team3.jpg" alt="Team Member">
                        <h4>Sumit Sunwar</h4>
                        <p>Technical Director</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /TEAM SECTION -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        $(document).ready(function () {
            // Add any custom JavaScript for the About Us page here
            console.log('About Us page loaded');
        });
    </script>
</asp:Content>
