using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class AccessoriesCollection : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        String S;


        PagedDataSource pg;
        int row = 3, p;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pid"] = 0;
                filllist();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            int currentpage = Convert.ToInt32(ViewState["pid"]);
            currentpage++;
            ViewState["pid"] = currentpage;
            filllist();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int currentpage = Convert.ToInt32(ViewState["pid"]);
            currentpage--;
            ViewState["pid"] = currentpage;
            filllist();
        }

        void filllist()
        {
            getcon();
            da = new SqlDataAdapter("select ID, Product_Name, Price, Quantity, Description, Image1, Image2, Image3, Image4 from products where Product_Type='mobile'", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();

            pg.AllowPaging = true;
            pg.PageSize = 4;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);

            pg.DataSource = ds.Tables[0].DefaultView;
            DataList1.DataSource = pg;
            DataList1.DataBind();
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetail.aspx?id=" + id);
            }
            else if (e.CommandName == "AddToCart")
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("login_register.aspx");
                    return;
                }

                getcon();

                SqlDataAdapter da = new SqlDataAdapter("select * from users where Email='" + Session["Email"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());

                int prodid = Convert.ToInt32(e.CommandArgument);
                da = new SqlDataAdapter("select * from products where Id='" + prodid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                string prodname = ds.Tables[0].Rows[0]["Product_Name"].ToString();
                string prodprc = ds.Tables[0].Rows[0]["Price"].ToString();
                string img = ds.Tables[0].Rows[0]["Image1"].ToString();

                int quantity = 1;

                cmd = new SqlCommand("insert into Cart_tbl(User_Cart_Id, Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img) " +
                                     "values ('" + userid + "','" + prodid + "','" + prodname + "','" + prodprc + "','" + quantity + "','" + img + "')", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("Cart.aspx");
            }
        }

    }
}