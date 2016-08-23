using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Deliveries_Default : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int DeliveriesID = 0;

            bool validProduct = int.TryParse(Request.QueryString["ID"].ToString(), out DeliveriesID);

            if (validProduct)
            {
                GetOrders();                    
            }
            else
            {
                Response.Redirect("~/Deliveries/MyProfile.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Deliveries/MyProfile.aspx");
        }        
    }

    void GetOrders()
    {
        Con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = Con;
        com.CommandText = "SELECT o.RefNo, d.OrderNo, o.ProductID, o.Quantity, o.Amount, o.Status, d.DeliveryNo, d.Deadline, "
            + "d.DateDelivered, d.Status FROM OrderDetails o INNER JOIN Deliveries d ON d.OrderNo = o.OrderNo WHERE "
            + "UserID = @UserID";
        //com.CommandText = "SELECT o.OrderNo, o.DateOrdered, d.DateDelivered, d.Deadline, " +
        //    "(SELECT SUM(od.Quantity) FROM OrderDetails od " +
        //    "WHERE od.OrderNo = o.OrderNo) AS TotalQuantity, " +
        //    "o.PaymentMethod, d.Status FROM Orders o " +
        //    "JOIN Deliveries d ON d.OrderNo = o.OrderNo";

        com.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Deliveries");

        lvDeliveries.DataSource = ds;
        lvDeliveries.DataBind();
        Con.Close();
    }
}