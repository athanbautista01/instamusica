using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Deliveries : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOrders();
        }
    }

    void GetOrders()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT o.OrderNo, o.DateOrdered, d.DateDelivered, d.Deadline,(SELECT SUM(od.Quantity) FROM OrderDetails od WHERE od.OrderNo = o.OrderNo) AS TotalQuantity, o.PaymentMethod, d.Status FROM Orders o JOIN Deliveries d ON d.OrderNo = o.OrderNo INNER JOIN OrderDetails od on od.OrderNo = o.OrderNo INNER JOIN users u on od.UserID = u.UserID WHERE od.UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Orders");

        lvDeliveries.DataSource = ds;
        lvDeliveries.DataBind();
        con.Close();
    }
}