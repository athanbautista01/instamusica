using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Inventory_Releasing : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetReleasing();
        }
    }

    void GetReleasing()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT r.ReleasingNo, d.OrderNo, (SELECT p.Name FROM Products p WHERE p.ProductID = r.ProductID) " +
        "AS ProductName, r.Quantity, r.DateReleased from Releasing r JOIN Deliveries d " + 
        "ON r.OrderNo = d.OrderNo WHERE d.Status='Delivered' ORDER BY DateReleased DESC";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Releasing");
        lvReleasing.DataSource = ds;
        lvReleasing.DataBind();
        con.Close();
    }
}