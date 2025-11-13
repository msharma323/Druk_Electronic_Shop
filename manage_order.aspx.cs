using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class manage_order : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillOrders();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillOrders()
        {
            getcon();
            da = new SqlDataAdapter("select * from Orders", con);
            ds = new DataSet();
            da.Fill(ds);
            gvOrders.DataSource = ds;
            gvOrders.DataBind();
            con.Close();
        }

        protected void gvOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOrders.EditIndex = e.NewEditIndex;
            fillOrders();
        }

        protected void gvOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getcon();

            int orderId = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Value);
            DropDownList ddlStatus = (DropDownList)gvOrders.Rows[e.RowIndex].FindControl("ddlStatus");
            string newStatus = ddlStatus.SelectedValue;

            SqlCommand cmd = new SqlCommand("update Orders set Status='" + newStatus + "' where OrderId='" + orderId + "'", con);
            cmd.ExecuteNonQuery();

            gvOrders.EditIndex = -1;
            fillOrders();
            con.Close();
        }

        protected void gvOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOrders.EditIndex = -1;
            fillOrders();
        }
    }
}
