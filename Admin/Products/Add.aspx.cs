using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Products_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCategories();
        }
    }

    void GetCategories()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT CatID, Category FROM Categories";
        SqlDataReader dr = com.ExecuteReader(); //shortcut
        ddlCategories.DataSource = dr;
        ddlCategories.DataTextField = "Category";
        ddlCategories.DataValueField = "CatID";
        ddlCategories.DataBind();
        con.Close();

        ddlCategories.Items.Insert(0, new ListItem("Select a category...", ""));
        ////longcut
        //SqlDataAdapter da = new SqlDataAdapter(com);
        //DataSet ds = new DataSet();
        //da.Fill(ds,"Types");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Products VALUES (@Name, @CatID, @Code, @Description, @Image, @Price, @IsFeatured, " +
            "@Available, @CriticalLevel, @Maximum, @Status, @DateAdded, @DateModified)"; //parametarized SQL statement
        com.Parameters.AddWithValue("@Name", txtName.Text);
        com.Parameters.AddWithValue("@CatID", ddlCategories.SelectedValue);
        com.Parameters.AddWithValue("@Code", txtCode.Text);
        com.Parameters.AddWithValue("Description", txtDesc.Text);

        string fileExt = Path.GetExtension(fuImage.FileName);
        string id = Guid.NewGuid().ToString();
        com.Parameters.AddWithValue("@Image", id + fileExt);
        fuImage.SaveAs(Server.MapPath("~/img/products/" + id + fileExt));

        com.Parameters.AddWithValue("@Price", txtPrice.Text);
        com.Parameters.AddWithValue("@IsFeatured", ddlFeatured.SelectedValue);
        com.Parameters.AddWithValue("@Available", 0);
        com.Parameters.AddWithValue("@CriticalLevel", txtCriticalLevel.Text);
        com.Parameters.AddWithValue("@Maximum", txtMax.Text);
        com.Parameters.AddWithValue("@Status", "Active");
        com.Parameters.AddWithValue("@DateAdded", DateTime.Now);
        com.Parameters.AddWithValue("@DateModified", DBNull.Value);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
}