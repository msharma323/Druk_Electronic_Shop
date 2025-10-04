using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronics_shop
{
    public partial class admin : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm1, fnm2, fnm3, fnm4;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
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
            if (fuImage2.HasFile)
            {
                fnm2 = "Product_Images/" + fuImage2.FileName;
                fuImage2.SaveAs(Server.MapPath(fnm2));
            }
            if (fuImage3.HasFile)
            {
                fnm3 = "Product_Images/" + fuImage3.FileName;
                fuImage3.SaveAs(Server.MapPath(fnm3));
            }
            if (fuImage4.HasFile)
            {
                fnm4 = "Product_Images/" + fuImage4.FileName;
                fuImage4.SaveAs(Server.MapPath(fnm4));
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (btnAddProduct.Text == "Add Product")
            {
                getcon();
                imgupload();
                cmd = new SqlCommand("insert into products(Product_Name, Product_Type, Price, Quantity, Description, Image1, Image2, Image3, Image4) values('" + txtName.Text + "' , '" + ddlProductType.SelectedValue + "' , '" + txtPrice.Text + "' , '" + txtQuantity.Text + "' , '" + txtDescription.Text + "' , '" + fnm1 + "' , '" + fnm2 + "' , '" + fnm3 + "' , '" + fnm4 + "')", con);
                cmd.ExecuteNonQuery();
                clear();

                lblMessage.Text = "Product added successfully!";
                lblMessage.CssClass = "success";

            }
        }
    }
}