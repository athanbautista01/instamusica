using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Products_AddCat : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Categories VALUES (@Category)"; //parametarized SQL statement
        com.Parameters.AddWithValue("@Category", txtCat.Text);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Categories.aspx");
    }
}