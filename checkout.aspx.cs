using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class checkout : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
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
                fillOrderSummary();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillOrderSummary()
        {
            getcon();
            ds = new DataSet();

            da = new SqlDataAdapter("select * from users where Email='" + Session["Email"] + "'", con);
            da.Fill(ds);

            int uid = Convert.ToInt16(ds.Tables[0].Rows[0]["Id"]);

            da = new SqlDataAdapter("select Prod_Name as ProductName, Prod_Quantity as Quantity, Prod_Price as Price, " +
                                    "(Prod_Quantity * Prod_Price) as TotalPrice from Cart_tbl where User_Cart_Id='" + uid + "'", con);
            DataSet dsCart = new DataSet();
            da.Fill(dsCart);

            if (dsCart.Tables[0].Rows.Count > 0)
            {
                gvOrderSummary.DataSource = dsCart;
                gvOrderSummary.DataBind();

                decimal total = 0;
                foreach (DataRow dr in dsCart.Tables[0].Rows)
                {
                    total += Convert.ToDecimal(dr["TotalPrice"]);
                }

                lblTotal.Text = "Total: ₹" + total.ToString("N2");
                pnlOrderSummary.Visible = true;
                btnPlaceOrder.Enabled = true;
            }
            else
            {
                pnlOrderSummary.Visible = false;
                btnPlaceOrder.Enabled = false;
                btnPlaceOrder.Text = "Cart is Empty";
            }

            con.Close();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    getcon();

                    da = new SqlDataAdapter("select * from users where Email='" + Session["Email"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    int uid = Convert.ToInt16(ds.Tables[0].Rows[0]["Id"]);

                    SqlCommand cmdTotal = new SqlCommand("select sum(Prod_Quantity * Prod_Price) from Cart_tbl where User_Cart_Id='" + uid + "'", con);
                    object totalObj = cmdTotal.ExecuteScalar();
                    decimal total = totalObj != DBNull.Value ? Convert.ToDecimal(totalObj) : 0;

                    string orderQry = "insert into Orders (CustomerName, Email, Phone, Address, OrderDate, TotalAmount, UserId, Status) " +
                                      "output inserted.OrderId values ('" + txtName.Text + "','" + txtEmail.Text + "','" +
                                      txtPhone.Text + "','" + txtAddress.Text + "','" + DateTime.Now + "'," + total + "," + uid + ",'Pending')";

                    cmd = new SqlCommand(orderQry, con);
                    int orderId = Convert.ToInt32(cmd.ExecuteScalar());

                    da = new SqlDataAdapter("select * from Cart_tbl where User_Cart_Id='" + uid + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        string insertItem = "insert into OrderItems (OrderId, ProductName, Quantity, Price, TotalPrice) values (" +
                                            orderId + ",'" + ds.Tables[0].Rows[i]["Prod_Name"].ToString() + "'," +
                                            ds.Tables[0].Rows[i]["Prod_Quantity"].ToString() + "," +
                                            ds.Tables[0].Rows[i]["Prod_Price"].ToString() + "," +
                                            (Convert.ToDecimal(ds.Tables[0].Rows[i]["Prod_Quantity"]) *
                                            Convert.ToDecimal(ds.Tables[0].Rows[i]["Prod_Price"])) + ")";

                        cmd = new SqlCommand(insertItem, con);
                        cmd.ExecuteNonQuery();
                    }

                    cmd = new SqlCommand("delete from Cart_tbl where User_Cart_Id='" + uid + "'", con);
                    cmd.ExecuteNonQuery();

                    pnlCheckoutForm.Visible = false;
                    pnlError.Visible = false;
                    pnlSuccess.Visible = true;

                    con.Close();
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error while placing order: " + ex.Message;
                    pnlError.Visible = true;
                    pnlSuccess.Visible = false;
                    pnlCheckoutForm.Visible = true;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnTryAgain_Click(object sender, EventArgs e)
        {
            pnlError.Visible = false;
        }
    }
}
