using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Deliveries_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    SqlConnection con2 = new SqlConnection(Helper.GetCon());

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
        com.CommandText = "SELECT o.OrderNo, o.DateOrdered, d.DateDelivered, d.Deadline, " +
            "(SELECT SUM(od.Quantity) FROM OrderDetails od " +
            "WHERE od.OrderNo = o.OrderNo) AS TotalQuantity, " +
            "o.PaymentMethod, d.Status FROM Orders o " +
            "JOIN Deliveries d ON d.OrderNo = o.OrderNo";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Orders");

        lvDeliveries.DataSource = ds;
        lvDeliveries.DataBind();
        con.Close();
    }

    protected void lvDeliveries_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Literal ltOrderNo = (Literal)e.Item.FindControl("ltOrderNo");

        if (e.CommandName == "deliveritem")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "SELECT OrderNo,ProductID,Quantity FROM OrderDetails WHERE OrderNo = @OrderNo";
            com.Parameters.AddWithValue("@OrderNo", ltOrderNo.Text);
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                UpdateInventory(dr["OrderNo"].ToString(), dr["ProductID"].ToString());
                RecordReleasedItems(dr["OrderNo"].ToString(), dr["ProductID"].ToString(), dr["Quantity"].ToString());
            }
            con.Close();
            con.Open();
            com.CommandText = "UPDATE Orders SET Status=@Status WHERE OrderNo=@OrderNo; " +
                "UPDATE OrderDetails SET Status=@Status WHERE OrderNo=@OrderNo; " +
               "UPDATE Deliveries SET Status=@Status2, DateDelivered = @DateDelivered WHERE OrderNo= @OrderNo ";
            com.Parameters.Clear();
            com.Parameters.AddWithValue("@Status", "Completed");
            com.Parameters.AddWithValue("@OrderNo", ltOrderNo.Text);
            com.Parameters.AddWithValue("@Status2", "Delivered");
            com.Parameters.AddWithValue("@DateDelivered", DateTime.Now);
            com.ExecuteNonQuery();
            con.Close();
            GetOrders();


        }
    }


    void UpdateInventory(string productid, string quantity)
    {
        con2.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con2;
        com.CommandText = "UPDATE Products SET Available= Available - @Quantity WHERE ProductID = @ProductID";
        com.Parameters.AddWithValue("@Quantity", quantity);
        com.Parameters.AddWithValue("@ProductID", productid);
        com.ExecuteNonQuery();
        con2.Close();
    }

    void RecordReleasedItems(string OrderNo, string ProductID, string quantity)
    {
        con2.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con2;
        com.CommandText = "INSERT INTO Releasing VALUES (@DateReleased,@UserID,@OrderNo,@ProductID,@Quantity)";
        com.Parameters.AddWithValue("@DateReleased", DateTime.Now);
        com.Parameters.AddWithValue("@UserID",Session["userid"].ToString());
        com.Parameters.AddWithValue("@OrderNo", OrderNo);
        com.Parameters.AddWithValue("@ProductID", ProductID);
        com.Parameters.AddWithValue("@Quantity", quantity);
        com.ExecuteNonQuery();
        con2.Close();


    }  
}