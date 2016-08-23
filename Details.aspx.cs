using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null) // if order is selected
        {
            int OrderNo = 0;
            bool ValidOrder = int.TryParse(Request.QueryString["ID"].ToString(), out OrderNo);

            if (ValidOrder)
            {
                GetDetails();
                Compute(OrderNo);

            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    void GetDetails()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT p.ProductID, p.Image, p.Name, p.Price, u.Street, u.Municipality, u.City FROM OrderDetails od INNER JOIN Products p ON od.ProductID = p.ProductID INNER JOIN users u on od.UserID = u.UserID WHERE od.UserID=@UserID and od.OrderNo=@OrderNo";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        com.Parameters.AddWithValue("@OrderNo", Request.QueryString["ID"].ToString());
        SqlDataReader dr = com.ExecuteReader();
        lvOrders.DataSource = dr;
        lvOrders.DataBind();
        con.Close();
    }

    decimal GetPrice(int ID)
    {
        decimal price = 0;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT Price FROM Products WHERE ProductID=@ProductID";
        com.Parameters.AddWithValue("@ProductID", ID);
        price = (decimal)com.ExecuteScalar();
        con.Close();
        return price;
    }

    void Compute(int OrderNo)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) FROM OrderDetails " +
            "WHERE OrderNo=@OrderNo HAVING COUNT(RefNo) > 0";
        com.Parameters.AddWithValue("@OrderNo", OrderNo);

        double total = 0; // initial value
        object data = com.ExecuteScalar();
        if (data == null) // record is not present
            total = 0;
        else
            total = Convert.ToDouble((decimal)com.ExecuteScalar());
        con.Close();

        ltGross.Text = (total * .88).ToString("#,##0.00");
        ltVAT.Text = (total * .12).ToString("#,##0.00");
        ltTotal.Text = total.ToString("#,##0.00");
    }
}