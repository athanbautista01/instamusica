using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Admin_SupplierItem_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            GetSuppliersItem();
            GetSuppliers();
            GetProduct();
        }
    }


    void GetSuppliersItem()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SupplierItems.RefNo, Products.Name, Products.Code, Categories.Category, Suppliers.CompanyName FROM SupplierItems " +
        "INNER JOIN Products ON SupplierItems.ProductID = Products.ProductID " +
        "INNER JOIN Suppliers ON SupplierItems.SupplierID = Suppliers.SupplierID " +
        "INNER JOIN Categories ON Categories.CatID = Products.CatID";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "SupplierItem");
        lvSuppliers.DataSource = ds;
        lvSuppliers.DataBind();
        con.Close();

    }

    void GetSuppliers()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SupplierID, CompanyName FROM Suppliers";
        SqlDataReader dr = com.ExecuteReader();
        ddlSupplier.DataSource = dr;
        ddlSupplier.DataTextField = "CompanyName";
        ddlSupplier.DataValueField = "SupplierID";
        ddlSupplier.DataBind();
        con.Close();


        ddlSupplier.Items.Insert(0, new ListItem("Select a supplier...", ""));
    }


    void GetProduct()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Name, ProductID FROM Products";
        SqlDataReader dr = com.ExecuteReader();
        ddlProducts.DataSource = dr;
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataValueField = "ProductID";
        ddlProducts.DataBind();
        con.Close();


        ddlProducts.Items.Insert(0, new ListItem("Select a product...", ""));
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO SupplierItems VALUES(@SupplierID,@ProductID)";
        com.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
        com.Parameters.AddWithValue("@ProductID", ddlProducts.SelectedValue);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Item.aspx");
    }
}