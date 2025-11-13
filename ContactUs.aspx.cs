using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Electronics_shop
{
    public partial class ContactUs : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlMessage.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getcon();

            // Escape single quotes in all textboxes to prevent SQL errors
            string fullname = txtFullName.Text.Replace("'", "''");
            string email = txtEmail.Text.Replace("'", "''");
            string phone = txtPhone.Text.Replace("'", "''");
            string subject = txtSubject.Text.Replace("'", "''");
            string message = txtMessage.Text.Replace("'", "''");

            string q = "insert into Contact_tbl(FullName, Email, Phone, Subject, Message, DateSent) " +
                       "values('" + fullname + "','" + email + "','" + phone + "','" +
                       subject + "','" + message + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')";

            cmd = new SqlCommand(q, con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                pnlMessage.Visible = true;
                pnlMessage.CssClass = "alert alert-success";
                lblMessage.Text = "Your message has been sent successfully!";

                txtFullName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            else
            {
                pnlMessage.Visible = true;
                pnlMessage.CssClass = "alert alert-danger";
                lblMessage.Text = "Something went wrong. Please try again.";
            }

            con.Close();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
            pnlMessage.Visible = false;
        }
    }
}
