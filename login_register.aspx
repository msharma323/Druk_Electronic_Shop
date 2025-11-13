<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_register.aspx.cs" Inherits="Electronics_shop.login_register" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login & Register - Electronics Shop</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7f9;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            padding: 20px 0;
            background: linear-gradient(to right, #D10024, #FF0000);
            color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .tagline {
            font-size: 18px;
            opacity: 0.9;
        }

        .form-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 30px;
            margin-bottom: 40px;
        }

        .form-section {
            flex: 1;
            min-width: 300px;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
        }

        .form-title {
            color: #D10024;
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #D10024;
            outline: none;
            box-shadow: 0 0 0 2px rgba(209, 0, 36, 0.2);
        }

        .btn {
            display: inline-block;
            background: #D10024;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #FF0000;
        }

        .message {
            margin-top: 15px;
            padding: 12px;
            border-radius: 4px;
            text-align: center;
            font-weight: 500;
        }

        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
            font-size: 14px;
        }

        .form-footer a {
            color: #D10024;
            text-decoration: none;
            font-weight: 500;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .checkbox-group input {
            margin-right: 10px;
        }

        .password-strength {
            height: 5px;
            margin-top: 8px;
            border-radius: 3px;
            background: #f0f0f0;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: width 0.3s, background 0.3s;
        }

        .password-requirements {
            font-size: 13px;
            color: #777;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
            }

            .header {
                padding: 15px;
            }

            .logo {
                font-size: 28px;
            }

            .tagline {
                font-size: 16px;
            }
        }

        .form-toggle {
            text-align: center;
            margin-top: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #eee;
        }

        .form-toggle a {
            color: #D10024;
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
        }

        .form-toggle a:hover {
            text-decoration: underline;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div class="logo">ELECTRONICS SHOP</div>
                <p class="tagline">Login or create an account to access all features</p>
            </div>

            <div class="form-container">
                <div class="form-section" id="loginForm" runat="server">
                    <h2 class="form-title">Login to Your Account</h2>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                    </div>
                    <div class="checkbox-group">
                        <asp:CheckBox ID="chkRemember" runat="server" />
                        <label for="chkRemember">Remember Me</label>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

                    <div class="form-footer">
                        <a href="#">Forgot your password?</a>
                    </div>

                    <asp:Label ID="lblLoginMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
                </div>

                <div class="form-section hidden" id="registerForm" runat="server">
                    <h2 class="form-title">Create New Account</h2>

                    <div class="form-group">
                        <label for="txtFullName">Full Name *</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtRegEmail">Email Address *</label>
                        <asp:TextBox ID="txtRegEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtPhone">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="Enter your phone number"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtRegPassword">Password *</label>
                        <asp:TextBox ID="txtRegPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create a password"></asp:TextBox>
                        <div class="password-strength">
                            <div id="passwordStrengthBar" class="password-strength-bar"></div>
                        </div>
                        <div class="password-requirements">
                            Must be at least 8 characters with letters, numbers, and special characters
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm Password *</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtAddress">Street Address / House No.</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your street address"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtCity">City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter your city"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtState">State / Province</label>
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter your state"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtPostalCode">Postal Code / ZIP</label>
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" placeholder="Enter your postal code"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="ddlCountry">Country</label>
                        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
                            <asp:ListItem Text="India" Value="IN"></asp:ListItem>
                            <asp:ListItem Text="Bhutan" Value="BHU"></asp:ListItem>
                            <asp:ListItem Text="Canada" Value="CA"></asp:ListItem>
                            <asp:ListItem Text="Australia" Value="AU"></asp:ListItem>
                            <asp:ListItem Text="Germany" Value="DE"></asp:ListItem>
                            <asp:ListItem Text="France" Value="FR"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="ddlGender">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                            <asp:ListItem Text="Prefer not to say" Value="N"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="btnSignup" runat="server" Text="Create Account" CssClass="btn" OnClick="btnSignup_Click" />

                    <asp:Label ID="lblRegisterMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

                    <div class="form-footer">
                        By registering, you agree to our <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a>
                    </div>
                </div>
            </div>

            <div class="form-toggle">
                <p>Don't have an account? <a id="showRegister" href="javascript:void(0);">Register now</a></p>
                <p>Already have an account? <a id="showLogin" href="javascript:void(0);">Login here</a></p>
            </div>
        </div>
    </form>

    <script>
        document.getElementById('showRegister').addEventListener('click', function () {
            document.getElementById('loginForm').classList.add('hidden');
            document.getElementById('registerForm').classList.remove('hidden');
        });

        document.getElementById('showLogin').addEventListener('click', function () {
            document.getElementById('registerForm').classList.add('hidden');
            document.getElementById('loginForm').classList.remove('hidden');
        });

        const passwordInput = document.getElementById('<%= txtRegPassword.ClientID %>');
        const strengthBar = document.getElementById('passwordStrengthBar');

        if (passwordInput && strengthBar) {
            passwordInput.addEventListener('input', function () {
                const password = passwordInput.value;
                let strength = 0;

                if (password.length >= 8) strength += 25;
                if (/[A-Z]/.test(password)) strength += 25;
                if (/[0-9]/.test(password)) strength += 25;
                if (/[^A-Za-z0-9]/.test(password)) strength += 25;

                strengthBar.style.width = strength + '%';

                if (strength < 50) {
                    strengthBar.style.background = '#ff4d4d';
                } else if (strength < 75) {
                    strengthBar.style.background = '#ffa64d';
                } else {
                    strengthBar.style.background = '#2eb82e';
                }
            });
        }
    </script>
</body>
</html>
