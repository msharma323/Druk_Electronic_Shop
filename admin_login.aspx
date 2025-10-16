<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="Electronics_shop.admin_login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
            width: 300px;
            text-align: center;
        }
        .login-box h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .login-box label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-size: 14px;
        }
        .login-box input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #aaa;
            border-radius: 4px;
        }
        .login-box .toggle-password {
            position: absolute;
            right: 10px;
            top: 36px;
            cursor: pointer;
        }
        .login-box button, .login-box input[type=submit] {
            width: 100%;
            padding: 8px;
            background: navy;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-box button:hover {
            background: #003366;
        }
        .error {
            color: red;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h2>Admin Login</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>

            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
