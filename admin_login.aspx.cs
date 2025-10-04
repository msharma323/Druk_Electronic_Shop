using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Electronics_shop
{
    public partial class admin_login : System.Web.UI.Page
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
            if (Session["LoginMessage"] != null)
            {
                lblMessage.Text = Session["LoginMessage"].ToString();
                lblMessage.ForeColor = System.Drawing.Color.Red;
                Session.Remove("LoginMessage");
            }
            if (Session["AdminResetMessage"] != null)
            {
                lblMessage.Text = Session["AdminResetMessage"].ToString();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                Session.Remove("AdminResetMessage");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "" || txtPassword.Text == "")
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            GetCon();
            string query = "select * from admin where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["AdminID"] = dr["ID"].ToString();
                Session["AdminName"] = dr["FullName"].ToString();
                Session["AdminEmail"] = dr["Email"].ToString();
                Session["AdminRole"] = dr["Role"].ToString();
                Response.Redirect("admin.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Email or Password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}