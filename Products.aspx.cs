using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (ddlSort.SelectedValue == "0")
            {
                GetProducts();
            }

            ltTotalProducts.Text = Helper.CountData("products", "catid", "");
            ltDrums.Text = Helper.CountData("products", "catid", "1");
            ltGuitar.Text = Helper.CountData("products", "catid", "2");
            ltLaunchpad.Text = Helper.CountData("products", "catid", "3");
            ltPiano.Text = Helper.CountData("products", "catid", "4");
            ltViolin.Text = Helper.CountData("products", "catid", "5");

            if (Session["userid"] == null)
            {
                errorMessage.Visible = true;
            }

            //Session["catid"] = null;
            //GetCategories();
            //SortProducts();
            //CountDrums();
        }

    }

    void GetProducts(string keyword)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Products.ProductID, Products.Name, " +
            "Categories.Category, Products.Image, Products.Price " +
            "FROM Products INNER JOIN Categories ON " +
            "Products.CatID = Categories.CatID " +
            "WHERE Products.Name LIKE @keyword OR " +
            "Products.Code LIKE @keyword OR " +
            "Categories.Category LIKE @keyword OR " +
            "Products.Description LIKE @keyword";
        com.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, " Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtKeyword.Text == "")
            GetProducts();
        else
            GetProducts(txtKeyword.Text);
    }

    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (lvProducts.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        if (ddlSort.SelectedValue == "1")
        {
            if (Session["catid"] == null)
            {
                this.GetProductsByPriceNoCatID();
                //ddlSort.ClearSelection();
            }
            else
            {
                this.GetProductsByPrice();
                //ddlSort.ClearSelection();
            }
        }
        else if (ddlSort.SelectedValue == "2")
        {
            if (Session["catid"] == null)
            {
                this.GetProductsByFeaturedNoCatID();
                //ddlSort.ClearSelection();
            }
            else
            {
                this.GetProductsByFeatured();
                //ddlSort.ClearSelection();
            }
        }
        else if (ddlSort.SelectedValue == "3")
        {
            if (Session["catid"] == null)
            {
                this.GetProductsByAlphabeticalNoCatID();
                //ddlSort.ClearSelection();
            }
            else
            {
                this.GetProductsByAlphabetical();
                //ddlSort.ClearSelection();
            }
        }
        else if (ddlSort.SelectedValue == "0")
        {
            this.GetProducts();
        }
        else
            this.GetProducts();
    }

    //void GetCategories()
    //{
    //    con.Open();
    //    SqlCommand com = new SqlCommand();
    //    com.Connection = con;
    //    com.CommandText = "select category from categories";
    //    SqlDataAdapter da = new SqlDataAdapter(com);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds, "Category");
    //    lvCategories.DataSource = ds;
    //    lvCategories.DataBind();
    //}
    
    void GetProducts()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, categories.catid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

    }

    void GetProductsByPrice()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid where categories.catid=@ID order by products.price";
        com.Parameters.AddWithValue("@ID", Session["catid"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
    }

    void GetProductsByFeatured()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid where isfeatured='yes' and categories.catid=@ID";
        com.Parameters.AddWithValue("@ID", Session["catid"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

    }

    void GetProductsByAlphabetical()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid where categories.catid=@ID order by name";
        com.Parameters.AddWithValue("@ID", Session["catid"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

    }

    void GetProductsByFeaturedNoCatID()
    {

        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid where isfeatured='yes'";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

    }

    void GetProductsByPriceNoCatID()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid order by products.price";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
    }

    void GetProductsByAlphabeticalNoCatID()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid order by name";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSort.SelectedValue == "1")
        {
            if (Session["catid"] == null)
            {
                GetProductsByPriceNoCatID();
                //ddlSort.ClearSelection();
            }
            else
            {
                GetProductsByPrice();
                //ddlSort.ClearSelection();
            }
        }
        else if (ddlSort.SelectedValue == "2")
        {
            if (Session["catid"] == null)
            {
                GetProductsByFeaturedNoCatID();
                //ddlSort.ClearSelection();
            }
            else
            {
                GetProductsByFeatured();
                //ddlSort.ClearSelection();
            }
        }
        else if (ddlSort.SelectedValue == "3")
        {
            if (Session["catid"] == null)
            {
                GetProductsByAlphabeticalNoCatID();
                //ddlSort.ClearSelection();
            }
            else
            {
                GetProductsByAlphabetical();
                //ddlSort.ClearSelection();
            }
        }
        else if (ddlSort.SelectedValue == "0")
        {
            GetProducts();
        }
        ////GetProductsByPrice();
        ////GetProductsByFeatured();
        //GetProductsByAlphabetical();
    }
    protected void btnDrums_Click(object sender, EventArgs e)
    {
        
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, categories.catid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid WHERE categories.catid=1";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["catid"] = dr["catid"].ToString();
            }
        }
    }
    protected void btnGuitar_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, categories.catid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid WHERE categories.catid=2";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();

        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["catid"] = dr["catid"].ToString();
            }
        }
    }
    protected void btnLaunchpad_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, categories.catid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid WHERE categories.catid=3";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["catid"] = dr["catid"].ToString();
            }
        }
    }
    protected void btnPiano_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, categories.catid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid WHERE categories.catid=4";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["catid"] = dr["catid"].ToString();
            }
        }
    }
    protected void btnViolin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.productid, categories.catid, products.name, categories.category, products.code, products.description, products.image, products.price, products.isfeatured, products.dateadded, products.datemodified, products.status from products inner join categories on products.catid = categories.catid WHERE categories.catid=5";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["catid"] = dr["catid"].ToString();
            }
        }
    }
    protected void btnDefault_Click(object sender, EventArgs e)
    {
        GetProducts();
        Session.Remove("catid");
        ddlSort.SelectedValue = "0";
    }
    void CountDrums()
    {
        //con.Open();
        //SqlCommand com = new SqlCommand();
        //com.Connection = con;
        //com.CommandText = "select count(products.productid) as total from Products where catid='1'";
        //SqlDataAdapter da = new SqlDataAdapter(com);
        //DataSet ds = new DataSet();
        //da.Fill(ds, "Products");
        //ltDrums.DataSource = ds;
        //ltDrums.DataBind();

    }
}