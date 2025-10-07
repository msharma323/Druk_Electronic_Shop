using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class Cart : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("login_register.aspx");
            }
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            ds = new DataSet();

            // Get current user ID based on Email
            da = new SqlDataAdapter("select * from users where Email='" + Session["Email"] + "'", con);
            da.Fill(ds);
            int uid = Convert.ToInt16(ds.Tables[0].Rows[0]["Id"]);

            // Fetch cart items
            DataSet cartds = new DataSet();
            da = new SqlDataAdapter("select Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img from Cart_tbl where User_Cart_Id='" + uid + "'", con);
            da.Fill(cartds);

            gvCart.DataSource = cartds;
            gvCart.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Cart.aspx?id=" + id);
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        
        protected void btnOrder_Click(object sender, EventArgs e)
        {
           
        }
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
           
        }
    }
}
