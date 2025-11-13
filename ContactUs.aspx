<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="Electronics_shop.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Add this line for Font Awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .contact-section {
            padding: 60px 0;
            background: #f8f9fa;
        }

        .contact-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .contact-header h1 {
            font-size: 36px;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }

        .contact-header p {
            font-size: 18px;
            color: #666;
            max-width: 600px;
            margin: 0 auto;
        }

        .contact-info {
            background: white;
            padding: 40px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: 100%;
        }

        .contact-info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 30px;
        }

        .contact-info-icon {
            width: 50px;
            height: 50px;
            background: #D10024;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            flex-shrink: 0;
        }

        .contact-info-icon i {
            color: white;
            font-size: 20px;
        }

        .contact-info-content h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #333;
        }

        .contact-info-content p {
            color: #666;
            margin: 0;
        }

        .contact-form {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #D10024;
            box-shadow: 0 0 0 2px rgba(209, 0, 36, 0.1);
            outline: none;
        }

        .textarea {
            min-height: 120px;
            resize: vertical;
        }

        .btn-primary {
            background: #D10024;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background: #b3001f;
            transform: translateY(-2px);
        }

        .map-section {
            padding: 60px 0;
            background: white;
        }

        .map-container {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        .required {
            color: #D10024;
        }
        
        .validation-error {
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }
        .btn-secondary {
    background: #6c757d;
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 4px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-secondary:hover {
    background: #545b62;
    transform: translateY(-2px);
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Add form tag here -->
    <form id="form1" runat="server">
        
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li><a href="WebForm1.aspx">Home</a></li>
                            <li class="active">Contact Us</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /BREADCRUMB -->

        <!-- CONTACT SECTION -->
        <div class="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contact-header">
                            <h1>Get In Touch</h1>
                            <p>We'd love to hear from you. Send us a message and we'll respond as soon as possible.</p>
                        </div>
                    </div>
                </div>

                <!-- Success/Error Messages -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </asp:Panel>

                <div class="row">
                    <!-- Contact Information -->
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3>Our Address</h3>
                                    <p>1734 Stonecoal Road<br>City, State 12345<br>United States</p>
                                </div>
                            </div>
                            
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3>Phone Number</h3>
                                    <p>+021-95-51-84<br>+021-95-51-85</p>
                                </div>
                            </div>
                            
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3>Email Address</h3>
                                    <p>sharma10052003@email.com<br>support@electro.com</p>
                                </div>
                            </div>
                            
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fa fa-clock-o"></i>
                                </div>
                                <div class="contact-info-content">
                                    <h3>Working Hours</h3>
                                    <p>Monday - Friday: 9:00 - 20:00<br>Saturday - Sunday: 10:00 - 18:00</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="col-md-8">
                        <div class="contact-form">
                            <h3>Send us a Message</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Full Name <span class="required">*</span></label>
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                                            ErrorMessage="Full name is required" Display="Dynamic" ForeColor="#D10024"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email Address <span class="required">*</span></label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="Email is required" Display="Dynamic" ForeColor="#D10024"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                            ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                                            ErrorMessage="Invalid email format" Display="Dynamic" ForeColor="#D10024"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Subject <span class="required">*</span></label>
                                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter subject"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject"
                                            ErrorMessage="Subject is required" Display="Dynamic" ForeColor="#D10024"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>Message <span class="required">*</span></label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control textarea" 
                                    placeholder="Enter your message" TextMode="MultiLine" Rows="6"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                                    ErrorMessage="Message is required" Display="Dynamic" ForeColor="#D10024"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="form-group">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-primary" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-primary" OnClick="btnReset_Click" style="margin-left: 10px; background-color: #6c757d;" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MAP SECTION -->
        <div class="map-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="map-container">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3024.177631294249!2d-74.00594908459418!3d40.71278367933185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a316e0b3b39%3A0x59356bc351d6f0f1!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2s!4v1620000000000!5m2!1sen!2s" 
                                width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </form> <!-- Close the form tag -->
</asp:Content>