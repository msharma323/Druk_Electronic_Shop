<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="Electronics_shop.admin_login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link rel="stylesheet" href="styles/admin_login.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-form">
            <h2>Admin Login</h2>  

            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
            
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            
            <label for="txtPassword">Password:</label>
            <div class="password-wrapper">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <span class="toggle-password" onclick="togglePassword()">👁</span>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('<%= txtPassword.ClientID %>');
            const toggleIcon = document.querySelector('.toggle-password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.textContent = '🙈';
            } else {
                passwordInput.type = 'password';
                toggleIcon.textContent = '👁';
            }
        }
    </script>
</body>
</html>
