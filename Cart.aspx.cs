using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetCart();
            Calculate();
        }
    }

    void GetCart()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select od.refno, p.productid, p.image, p.name, p.price, od.quantity, od.amount from orderdetails od inner join products p on od.productid = p.productid where od.orderno=0 and od.userid=@userid";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); 
        SqlDataReader dr = com.ExecuteReader();
        lvCart.DataSource = dr;
        lvCart.DataBind();
        con.Close();
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

    protected void lvCart_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Literal ltRefNo = (Literal)e.Item.FindControl("ltRefNo");
        Literal ltProductID = (Literal)e.Item.FindControl("ltProductID");
        TextBox txtQty = (TextBox)e.Item.FindControl("txtQty");
        double price = Convert.ToDouble(GetPrice(int.Parse(ltProductID.Text)));

        if (e.CommandName == "updateqty")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "update orderdetails set quantity=@Quantity, amount=@Amount where orderno=0 and productid=@ProductID and UserID=@UserID";
            com.Parameters.AddWithValue("@Quantity", txtQty.Text);
            com.Parameters.AddWithValue("@Amount", price * int.Parse(txtQty.Text));
            com.Parameters.AddWithValue("@ProductID", ltProductID.Text);
            com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            com.ExecuteNonQuery();
            con.Close();
        }
        else if (e.CommandName == "deleteitem")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "DELETE FROM OrderDetails WHERE ProductID = @ProductID";
            com.Parameters.AddWithValue("@ProductID", ltProductID.Text);
            com.ExecuteNonQuery();
            con.Close();
        }
        GetCart();
        Calculate();
    }

    void Calculate()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select sum(amount) from orderdetails where orderno=0 and userid=@UserID having count(refno) > 0";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); 
        object data = com.ExecuteScalar();
        double total = 0;
        if (data == null)
        {
            total = 0;
        }
        else
            total = Convert.ToDouble((decimal)com.ExecuteScalar());

        con.Close();
        ltGross.Text = (total * .88).ToString("#,##0.00");
        ltVAT.Text = (total * .12).ToString("#,##0.00");
        ltTotal.Text = total.ToString("#,##0.00");
    }
}