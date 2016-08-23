using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;  

public partial class About : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetRelated();
        }
            
    }

    void GetRelated()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select top 5 products.productid, products.name, products.image, products.price from products ORDER BY NEWID()";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvRelated.DataSource = ds;
        lvRelated.DataBind();
        con.Close();
    }

    protected void btnRelAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AddToCart.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}