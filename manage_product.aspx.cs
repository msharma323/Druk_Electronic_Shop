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
    public partial class manage_product : System.Web.UI.Page
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
                da = new SqlDataAdapter("select ID, Product_Name, Product_Type, Price, Quantity, Description, Image1 from products ", con);
                ds = new DataSet();
                da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblProductCount.Text = ds.Tables[0].Rows.Count + " products";
            con.Close();
            }

            protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
            {

            }

            protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            {
            {
                int id = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "Edit")
                {
                    Response.Redirect("edit_product.aspx?id=" + id);
                }
                else if (e.CommandName == "DeleteProduct")
                {
                    getcon();
                    cmd = new SqlCommand("DELETE FROM products WHERE ID=@id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    fillgrid();
                }
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        protected void btnClosePanel_Click(object sender, EventArgs e)
        {

        }

      }
    }
