using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class registered_user : System.Web.UI.Page
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
            {
                con.Open();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select Id, FullName, Email, Phone, City, State, Country, Gender, CreatedDate from Users", con);
            ds = new DataSet();
            da.Fill(ds);
            gvUsers.DataSource = ds;
            gvUsers.DataBind();
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getcon();
            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            TextBox txtFullName = (TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtFullName");
            TextBox txtEmail = (TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox txtPhone = (TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtPhone");
            TextBox txtCity = (TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtCity");
            TextBox txtState = (TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtState");

            cmd = new SqlCommand("update user_tbl set " +
            "FullName='" + txtFullName.Text + "'," +
            "Email='" + txtEmail.Text + "'," +
            "Phone='" + txtPhone.Text + "'," +
            "City='" + txtCity.Text + "'," +
            "State='" + txtState.Text + "' " +
            "where Id=" + id + "", con);

            cmd.ExecuteNonQuery();
            gvUsers.EditIndex = -1;
            fillgrid();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            getcon();
            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            cmd = new SqlCommand("delete from user_tbl where Id=" + id + "", con);
            cmd.ExecuteNonQuery();
            fillgrid();
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }
    }
}
