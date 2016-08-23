using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Reports_Purchases : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetPurchaseOrder();
        }
    }

    void GetPurchaseOrder()
    {
        Con.Open();
        SqlCommand Com = new SqlCommand();
        Com.Connection = Con;
        Com.CommandText = "SELECT pu.PurchaseNo, s.ContactPerson, pr.Name, pd.Quantity, pu.DatePurchased, pu.DateReceived, pu.Status FROM Suppliers s INNER JOIN Purchases pu ON s.SupplierID = pu.SupplierID INNER JOIN PurchaseDetails pd ON pd.PurchaseNo = pu.PurchaseNo INNER JOIN Products pr ON pr.ProductID = pd.ProductID";
        SqlDataAdapter DA = new SqlDataAdapter(Com);
        DataSet DS = new DataSet();
        DA.Fill(DS, "PurchaseDetails");
        lvProducts.DataSource = DS;
        lvProducts.DataBind();
        Con.Close();
    }
}