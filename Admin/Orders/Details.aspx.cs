using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Orders_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int orderNo = 0;
            bool validOrder = int.TryParse(Request.QueryString["ID"].ToString(), out orderNo);

            if (validOrder)
            {
                GetDetails(orderNo);
                Compute(orderNo);
                GetInfo(orderNo);
            }

        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    void GetDetails(int OrderNo)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT p.ProductID, p.Code, p.Image, p.Name, " +
            "p.Price, od.Quantity, od.Amount, od.RefNo, c.Category " +
            "FROM OrderDetails od " +
            "INNER JOIN Products p ON od.ProductID = p.ProductID " +
            "INNER JOIN Categories c on p.CatID = c.CatID " +
            "WHERE od.OrderNo=@OrderNo ";
        com.Parameters.AddWithValue("@OrderNo", OrderNo);
        SqlDataReader dr = com.ExecuteReader();
        lvOrders.DataSource = dr;
        lvOrders.DataBind();
        con.Close();
    }

    //decimal GetPrice(int ID)
    //{
    //    decimal price = 0;
    //    con.Open();
    //    SqlCommand com = new SqlCommand();
    //    com.Connection = con;
    //    com.CommandText = "SELECT Price FROM Products WHERE ProductID=@ProductID";
    //    com.Parameters.AddWithValue("@ProductID", ID);
    //    price = (decimal)com.ExecuteScalar();
    //    con.Close();
    //    return price;
    //}

    void Compute(int OrderNo1)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) FROM OrderDetails " +
            "WHERE OrderNo=@OrderNo HAVING COUNT(RefNo) > 0";
        com.Parameters.AddWithValue("@OrderNo", OrderNo1); 
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

    void GetInfo(int OrderNo2)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 1 Users.UserID,Users.FirstName,Users.LastName,Users.Street,Users.Municipality,Users.City,Users.Phone,Orders.Status,Users.Mobile " +
        "FROM OrderDetails INNER JOIN Orders ON OrderDetails.OrderNo = Orders.OrderNo " +
        "INNER JOIN Users ON Users.UserID = OrderDetails.UserID WHERE " +
        "OrderDetails.OrderNo = @OrderNo";
        com.Parameters.AddWithValue("@OrderNo", OrderNo2); 
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            txtFN.Text = dr["FirstName"].ToString();
            txtLN.Text = dr["LastName"].ToString();
            
            txtStreet.Text = dr["Street"].ToString();
            txtMunicipality.Text = dr["Municipality"].ToString();
            txtCity.Text = dr["City"].ToString();
            txtPhone.Text = dr["Phone"].ToString();
            txtMobile.Text = dr["Mobile"].ToString();

            ltOrderNo.Text = OrderNo2.ToString();

            if (dr["Status"].ToString() == "Pending")
            {
                btnApprove.Visible = true;
                btnReject.Visible = true;
            }
            else
            {
                btnApprove.Visible = false;
                btnReject.Visible = false;
            }
        }
        con.Close();
    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Orders SET Status = 'Approve' WHERE OrderNo =@OrderNo  ";
        com.Parameters.AddWithValue("@OrderNo",ltOrderNo.Text);
        com.ExecuteNonQuery();
          Response.Redirect("Default.aspx");

    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Orders SET Status = 'Reject' WHERE OrderNo =@OrderNo  ";
        com.Parameters.AddWithValue("@OrderNo", ltOrderNo.Text);
        com.ExecuteNonQuery();
          Response.Redirect("Default.aspx");
    }
}