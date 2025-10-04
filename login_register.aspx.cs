using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Electronics_shop
{
    public partial class login_register : System.Web.UI.Page 
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "" || txtPassword.Text == "")
            {
                lblLoginMessage.Visible = true;
                lblLoginMessage.Text = "All fields are required.";
                lblLoginMessage.CssClass = "message error";
                return;
            }

            GetCon();
            string query = "select * from Users where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["UserID"] = dr["Id"].ToString();
                Session["FullName"] = dr["FullName"].ToString();
                Session["Email"] = dr["Email"].ToString();

                lblLoginMessage.Visible = true;
                lblLoginMessage.Text = "Login successful! Redirecting...";
                lblLoginMessage.CssClass = "message success";

                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                lblLoginMessage.Visible = true;
                lblLoginMessage.Text = "Invalid Email or Password.";
                lblLoginMessage.CssClass = "message error";
            }
            con.Close();
        }

        protected void btnSignup_Click(object sender, EventArgs e) 
        {
            if (txtFullName.Text == "" || txtRegEmail.Text == "" || txtRegPassword.Text == "" || txtConfirmPassword.Text == "")
            {
                lblRegisterMessage.Visible = true;
                lblRegisterMessage.Text = "Please fill all required fields.";
                lblRegisterMessage.CssClass = "message error";
                return;
            }

            if (txtRegPassword.Text != txtConfirmPassword.Text)
            {
                lblRegisterMessage.Visible = true;
                lblRegisterMessage.Text = "Wrong Password.";
                lblRegisterMessage.CssClass = "message error";
                return;
            }

            try
            {
                GetCon();
                string query = "insert into Users (FullName, Email, Phone, Password, Address, City, State, PostalCode, Country, Gender) " +
                               "values ('" + txtFullName.Text + "','" + txtRegEmail.Text + "','" + txtPhone.Text + "','" + txtRegPassword.Text + "','" + txtAddress.Text + "','" + txtCity.Text + "','" + txtState.Text + "','" + txtPostalCode.Text + "','" + ddlCountry.SelectedItem.Text + "','" + ddlGender.SelectedItem.Text + "')";
                cmd = new SqlCommand(query, con);
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblRegisterMessage.Visible = true;
                    lblRegisterMessage.Text = "Account created successfully.";
                    lblRegisterMessage.CssClass = "message success";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblRegisterMessage.Visible = true;
                lblRegisterMessage.Text = "Error: " + ex.Message;
                lblRegisterMessage.CssClass = "message error";
            }
        }
    }
}
