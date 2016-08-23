using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Reports_Suppliers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSuppliers();
        }
    }

    void GetSuppliers()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SupplierID, CompanyName, ContactPerson, Address, Phone, Mobile, Status, DateAdded, DateModified FROM Suppliers";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Suppliers");

        lvSupplier.DataSource = ds;
        lvSupplier.DataBind();
        con.Close();
    }
}