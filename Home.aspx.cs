using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class H : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDrum1();
            GetLaunch1();
            GetTwinNeck();
            GetKlotz();
            GetDisklavier();
            GetSilentGuitar();
        }
    }

    void GetDrum1()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.image, products.price from products where productid=@D1";
        com.Parameters.AddWithValue("@D1", 63);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvDrum1.DataSource = ds;
        lvDrum1.DataBind();
        con.Close();
    }

    void GetLaunch1()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.image, products.price from products where productid=@D1";
        com.Parameters.AddWithValue("@D1", 18);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvLaunch1.DataSource = ds;
        lvLaunch1.DataBind();
        con.Close();
    }

    void GetTwinNeck()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.image, products.price from products where productid=@D1";
        com.Parameters.AddWithValue("@D1", 55);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvTwinNeck.DataSource = ds;
        lvTwinNeck.DataBind();
        con.Close();
    }

    void GetKlotz()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.image, products.price from products where productid=@D1";
        com.Parameters.AddWithValue("@D1", 1);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvKlotz.DataSource = ds;
        lvKlotz.DataBind();
        con.Close();
    }

    void GetDisklavier()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.image, products.price from products where productid=@D1";
        com.Parameters.AddWithValue("@D1", 42);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvDisklavier.DataSource = ds;
        lvDisklavier.DataBind();
        con.Close();
    }

    void GetSilentGuitar()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.image, products.price from products where productid=@D1";
        com.Parameters.AddWithValue("@D1", 54);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvSilentGuitar.DataSource = ds;
        lvSilentGuitar.DataBind();
        con.Close();
    }
}