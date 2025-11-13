using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class order : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
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
            if (Session["Email"] == null)
            {
                Response.Redirect("login_register.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    fillorder();
                    fillhistory();
                }
            }
        }

        void fillorder()
        {
            getcon();
            da = new SqlDataAdapter("select * from users where Email='" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0]["Id"]);

                da = new SqlDataAdapter("select top 1 * from Orders where UserId='" + uid + "' order by OrderId desc", con);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);

                if (ds1.Tables[0].Rows.Count > 0)
                {
                    lblOrderInfo.Text = "Order Date : " + Convert.ToDateTime(ds1.Tables[0].Rows[0]["OrderDate"]).ToString("dd MMM yyyy");
                    lblAddress.Text = "Delivery Address : " + ds1.Tables[0].Rows[0]["Address"].ToString();
                    lblStatus.Text = "Delivery Status : " + ds1.Tables[0].Rows[0]["Status"].ToString();

                    int orderId = Convert.ToInt16(ds1.Tables[0].Rows[0]["OrderId"]);

                    da = new SqlDataAdapter("select ProductName, Quantity, Price, TotalPrice from OrderItems where OrderId='" + orderId + "'", con);
                    DataSet ds2 = new DataSet();
                    da.Fill(ds2);

                    gvOrderItems.DataSource = ds2;
                    gvOrderItems.DataBind();

                    cmd = new SqlCommand("select sum(TotalPrice) from OrderItems where OrderId='" + orderId + "'", con);
                    object totalObj = cmd.ExecuteScalar();

                    decimal total = 0;
                    if (totalObj != DBNull.Value)
                    {
                        total = Convert.ToDecimal(totalObj);
                    }

                    lblTotalAmount.Text = "Total Amount : ₹" + total.ToString("N2");
                }
            }
            con.Close();
        }

        void fillhistory()
        {
            getcon();
            da = new SqlDataAdapter("select * from users where Email='" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt16(ds.Tables[0].Rows[0]["Id"]);

                da = new SqlDataAdapter("select OrderId, OrderDate, Address, Status, TotalAmount from Orders where UserId='" + uid + "' and Status='Delivered' order by OrderDate desc", con);
                DataSet ds3 = new DataSet();
                da.Fill(ds3);

                if (ds3.Tables[0].Rows.Count > 0)
                {
                    gvOrderHistory.DataSource = ds3;
                    gvOrderHistory.DataBind();
                }
                else
                {
                    lblHistoryMsg.Text = "No delivered orders found.";
                }
            }
            con.Close();
        }

        protected void gvOrderHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int orderId = Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "OrderId"));
                getcon();
                da = new SqlDataAdapter("select ProductName, Quantity from OrderItems where OrderId='" + orderId + "'", con);
                DataSet ds4 = new DataSet();
                da.Fill(ds4);

                GridView gvHistoryItems = (GridView)e.Row.FindControl("gvHistoryItems");
                if (gvHistoryItems != null)
                {
                    gvHistoryItems.DataSource = ds4;
                    gvHistoryItems.DataBind();
                }
                con.Close();
            }
        }
    }
}
