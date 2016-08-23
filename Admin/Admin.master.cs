using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                GetInfo();
            }

        }
    }
    void GetInfo() //get user name
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT FirstName + ' ' + LastName FROM Users WHERE UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        ltUser.Text = (string)com.ExecuteScalar(); // typecasting
        con.Close();
    }

    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    if (txtKeyword.Text == "")
    //        GetProducts();
    //    else
    //        GetProducts(txtKeyword.Text);
    //}

    //void GetProducts(string keyword)
    //{
    //    con.Open();
    //    SqlCommand com = new SqlCommand();
    //    com.Connection = con;
    //    com.CommandText = "SELECT Products.ProductID, Products.Name, " +
    //        "Categories.Category, Products.Image, Products.Price " +
    //        "FROM Products INNER JOIN Categories ON " +
    //        "Products.CatID = Categories.CatID " +
    //        "WHERE Products.Name LIKE @keyword OR " +
    //        "Products.Code LIKE @keyword OR " +
    //        "Categories.Category LIKE @keyword OR " +
    //        "Products.Description LIKE @keyword";
    //    com.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
    //    SqlDataAdapter da = new SqlDataAdapter(com);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds, " Products");
    //    lvProducts.DataSource = ds;
    //    lvProducts.DataBind();
    //    con.Close();
    //}

}
