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
    public partial class manage_products : System.Web.UI.Page
    {
            String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        String S;
        protected void Page_Load(object sender, EventArgs e)
        {
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

                da = new SqlDataAdapter("select ID, Product_Name, Price, Quantity, Description, Image1 from products ", con);
                ds = new DataSet();
                da.Fill(ds);
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        protected void btnClosePanel_Click(object sender, EventArgs e)
        {

        }
    }
}
