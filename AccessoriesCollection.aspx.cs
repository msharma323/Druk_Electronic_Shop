using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.Services;

namespace Electronics_shop
{
    public partial class AccessoriesCollection : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                    return 1;
                return (int)ViewState["CurrentPage"];
            }
            set { ViewState["CurrentPage"] = value; }
        }

        protected int TotalPages
        {
            get
            {
                if (ViewState["TotalPages"] == null)
                    return 1;
                return (int)ViewState["TotalPages"];
            }
            set { ViewState["TotalPages"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CurrentPage = 1;
                BindAccessories();
            }
        }

        private void BindAccessories()
        {
            con = new SqlConnection(s);

            cmd = new SqlCommand("SELECT COUNT(*) FROM Products p INNER JOIN ProductTypes pt ON p.TypeID = pt.TypeID WHERE pt.TypeName = 'AccessoriesCollection'", con);
            con.Open();
            int totalRecords = (int)cmd.ExecuteScalar();
            TotalPages = (int)Math.Ceiling((double)totalRecords / 15);
            con.Close();

            string query = @"
                SELECT * FROM (
                    SELECT p.ProductID, p.Name, p.Price, p.Quantity, p.Description, pt.TypeName, 
                           STRING_AGG(pi.ImageUrl, '|') AS ImageUrls,
                           ROW_NUMBER() OVER (ORDER BY p.ProductID) AS RowNum
                    FROM Products p
                    INNER JOIN ProductTypes pt ON p.TypeID = pt.TypeID
                    LEFT JOIN ProductImages pi ON p.ProductID = pi.ProductID
                    WHERE pt.TypeName = 'AccessoriesCollection'
                    GROUP BY p.ProductID, p.Name, p.Price, p.Quantity, p.Description, pt.TypeName
                ) AS Results
                WHERE RowNum BETWEEN " + (((CurrentPage - 1) * 15) + 1) + " AND " + (CurrentPage * 15);

            cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            rptAccessories.DataSource = dr;
            rptAccessories.DataBind();
            con.Close();

            lnkPrev.Enabled = CurrentPage > 1;
            lnkNext.Enabled = CurrentPage < TotalPages;
            lblPageInfo.Text = $"Page {CurrentPage} of {TotalPages}";
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                BindAccessories();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            if (CurrentPage < TotalPages)
            {
                CurrentPage++;
                BindAccessories();
            }
        }

        private string FixImagePath(string img)
        {
            if (string.IsNullOrWhiteSpace(img)) return "";
            img = img.Trim();

            if (img.StartsWith("http", StringComparison.OrdinalIgnoreCase) || img.StartsWith("/"))
                return img;

            return ResolveUrl("~/images/" + img);
        }

        protected string RenderImageGallery(object imageUrls, object productName)
        {
            if (imageUrls == null || imageUrls == DBNull.Value) return "";
            string[] images = imageUrls.ToString().Split('|');
            var sb = new StringBuilder();
            string safeAlt = (productName ?? "").ToString()
                .Replace("'", "&#39;")
                .Replace("\"", "&quot;");

            for (int i = 0; i < images.Length; i++)
            {
                string activeClass = i == 0 ? "active" : "";
                string src = FixImagePath(images[i]);
                sb.AppendFormat("<img src='{0}' class='{1}' alt='{2}' />", src, activeClass, safeAlt);
            }
            return sb.ToString();
        }

        protected string RenderThumbnails(object imageUrls)
        {
            if (imageUrls == null || imageUrls == DBNull.Value) return "";
            string[] images = imageUrls.ToString().Split('|');
            var sb = new StringBuilder();

            for (int i = 0; i < images.Length; i++)
            {
                string activeClass = i == 0 ? "active-thumb" : "";
                string src = FixImagePath(images[i]);
                sb.AppendFormat("<img src='{0}' class='{1}' onclick=\"changeImage(this)\" />", src, activeClass);
            }
            return sb.ToString();
        }

        [WebMethod]
        public static string AddToCart(int productId)
        {
            try
            {
                HttpContext.Current.Session["Cart"] = HttpContext.Current.Session["Cart"] ?? new List<CartItem>();
                List<CartItem> cart = (List<CartItem>)HttpContext.Current.Session["Cart"];

                CartItem existing = cart.FirstOrDefault(c => c.ProductID == productId);
                if (existing != null)
                {
                    existing.Quantity++;
                }
                else
                {
                    string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                    SqlConnection con = new SqlConnection(s);
                    SqlCommand cmd = new SqlCommand("SELECT ProductID, Name, Price FROM Products WHERE ProductID = " + productId, con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        cart.Add(new CartItem
                        {
                            ProductID = dr.GetInt32(0),
                            Name = dr.GetString(1),
                            Price = dr.GetDecimal(2),
                            Quantity = 1
                        });
                    }
                    con.Close();
                }

                HttpContext.Current.Session["Cart"] = cart;
                return "Product added to cart!";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        [Serializable]
        public class CartItem
        {
            public int ProductID { get; set; }
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
        }
    }
}
