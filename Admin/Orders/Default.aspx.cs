using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Orders_Default : System.Web.UI.Page
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
        com.CommandText = "SELECT Orders.OrderNo,Orders.DateOrdered,Deliveries.Deadline, " +
        "(SELECT SUM(OrderDetails.Amount) FROM OrderDetails " +
        "WHERE OrderDetails.OrderNo = Orders.OrderNo) AS TotalAmount, " +
        "Orders.PaymentMethod,Orders.Status  FROM Orders " +
        "JOIN Deliveries ON Deliveries.OrderNo = Orders.OrderNo " +
        "JOIN OrderDetails ON OrderDetails.OrderNo = Orders.OrderNo";

        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Orders");  // pwedeng "sdfds"
        //dataset kayang magstore ng kahit ilang table
        ltOrders.DataSource = ds;
        ltOrders.DataBind();
        con.Close();
    // inner join kung ano pagkakapareha nila
    }

}