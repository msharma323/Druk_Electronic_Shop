<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Electronics_shop.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* === Responsive Profile Page === */
        .profile-container {
            max-width: 800px;
            width: 95%;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 20px 25px;
        }
        .profile-container h2 {
            text-align: center;
            color: #222;
            margin-bottom: 25px;
            font-family: 'Segoe UI', sans-serif;
        }
        .profile-form table {
            width: 100%;
            border-collapse: collapse;
        }
        .profile-form td {
            padding: 8px 10px;
            vertical-align: middle;
        }
        .profile-form label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .profile-form input[type=text],
        .profile-form input[type=email],
        .profile-form textarea {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .profile-form textarea {
            resize: vertical;
        }
        .profile-form .btn {
            display: inline-block;
            margin-top: 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 25px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s ease;
        }
        .profile-form .btn:hover {
            background-color: #0056b3;
        }

        /* === Responsive Adjustments === */
        @media (max-width: 768px) {
            .profile-container {
                padding: 15px;
            }
            .profile-form table,
            .profile-form tr,
            .profile-form td {
                display: block;
                width: 100%;
            }
            .profile-form td {
                margin-bottom: 10px;
            }
            .profile-form label {
                margin-bottom: 3px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-container">
        <h2>My Profile</h2>
        <form id="form1" runat="server" class="profile-form">
            <table>
                <tr>
                    <td>
                        <label>Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>City</label>
                        <asp:TextBox ID="txtCity" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>State</label>
                        <asp:TextBox ID="txtState" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Postal Code</label>
                        <asp:TextBox ID="txtPostalCode" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Country</label>
                        <asp:TextBox ID="txtCountry" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Gender</label>
                        <asp:TextBox ID="txtGender" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>