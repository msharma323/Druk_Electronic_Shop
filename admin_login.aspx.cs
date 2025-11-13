using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Electronics_shop
{
    public partial class admin_login : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        public void getcon()
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

            getcon();
            da = new SqlDataAdapter("select * from admin where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["AdminID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                Session["AdminName"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                Session["AdminEmail"] = ds.Tables[0].Rows[0]["Email"].ToString();
                Session["AdminRole"] = ds.Tables[0].Rows[0]["Role"].ToString();
                Response.Redirect("add_product.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Email or Password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
