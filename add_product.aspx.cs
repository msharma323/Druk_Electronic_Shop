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
    public partial class add_product : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm1, fnm2, fnm3, fnm4;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtName.Text = "";
            ddlProductType.SelectedIndex = 0;
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtDescription.Text = "";
        }

        void imgupload()
        {
            if (fuImage1.HasFile)
            {
                fnm1 = "Product_Images/" + fuImage1.FileName;
                fuImage1.SaveAs(Server.MapPath(fnm1));
            }
            else
            {
                fnm1 = "";
            }

            if (fuImage2.HasFile)
            {
                fnm2 = "Product_Images/" + fuImage2.FileName;
                fuImage2.SaveAs(Server.MapPath(fnm2));
            }
            else
            {
                fnm2 = "";
            }

            if (fuImage3.HasFile)
            {
                fnm3 = "Product_Images/" + fuImage3.FileName;
                fuImage3.SaveAs(Server.MapPath(fnm3));
            }
            else
            {
                fnm3 = "";
            }

            if (fuImage4.HasFile)
            {
                fnm4 = "Product_Images/" + fuImage4.FileName;
                fuImage4.SaveAs(Server.MapPath(fnm4));
            }
            else
            {
                fnm4 = "";
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || ddlProductType.SelectedIndex == 0 || txtPrice.Text == "" || txtQuantity.Text == "" || txtDescription.Text == "")
            {
                lblMessage.Text = "All fields are required!";
                lblMessage.CssClass = "error";
                return;
            }

            getcon();
            imgupload();

            // Handle apostrophes (') in description safely by replacing them
            string desc = txtDescription.Text.Replace("'", "''");

            cmd = new SqlCommand("insert into products(Product_Name, Product_Type, Price, Quantity, Description, Image1, Image2, Image3, Image4) " +
            "values('" + txtName.Text + "', '" + ddlProductType.SelectedValue + "', '" + txtPrice.Text + "', '" + txtQuantity.Text + "', '" + desc + "', '" + fnm1 + "', '" + fnm2 + "', '" + fnm3 + "', '" + fnm4 + "')", con);
            cmd.ExecuteNonQuery();

            lblMessage.Text = "Product Added Successfully!";
            lblMessage.CssClass = "success";
            clear();
            con.Close();
        }
    }
}