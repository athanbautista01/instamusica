using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddToCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null && Request.QueryString["qty"] != null)
        {
            int productID = 0;
            int quantity = 0;

            bool validProduct = int.TryParse(Request.QueryString["ID"].ToString(), out productID);
            bool validQty = int.TryParse(Request.QueryString["qty"].ToString(), out quantity);
            if (validProduct && validQty)
                AddItemToCart(productID, quantity);
            else
                Response.Redirect("~/Products.aspx");

        }
        else
        {
            Response.Redirect("~/Products.aspx");
        }
    }

    bool IsExisting(int ID)
    {
        bool existing = true;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select productid from orderdetails where productid=@ProductID and userid=@UserID and orderno=0";
        com.Parameters.AddWithValue("@ProductID", ID);
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;

    }

    decimal GetPrice(int ID)
    {
        decimal price = 0;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select price from products where productid=@ProductID";
        com.Parameters.AddWithValue("@ProductID", ID);
        price = (decimal)com.ExecuteScalar(); //typecasting shortcut

        //LongCut
        //SqlDataReader dr = com.ExecuteReader();
        //while (dr.Read())
        //{
        //    price = decimal.Parse(dr["Price"].ToString());
        //}

        con.Close();
        return price;
    }

    void AddItemToCart(int ID, int quantity)
    {
        bool existingProduct = IsExisting(ID);
        double price = Convert.ToDouble(GetPrice(ID));

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        if (existingProduct)
        {
            com.CommandText = "update orderdetails set quantity=quantity + @Quantity, amount = amount + @Amount where productid=@ProductID and userid=@UserID and orderno=@OrderNo";
        }
        else
        {
            com.CommandText = "insert into orderdetails values(@OrderNo, @UserID, @ProductID, @Quantity, @Amount, @Status)";
        }

        com.Parameters.AddWithValue("@Quantity", quantity);
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        com.Parameters.AddWithValue("@ProductID", ID);
        com.Parameters.AddWithValue("@Amount", quantity * price);
        com.Parameters.AddWithValue("@OrderNo", 0);
        com.Parameters.AddWithValue("@Status", "InCart");
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/Products.aspx");
    }
}