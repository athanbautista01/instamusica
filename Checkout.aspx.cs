using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCart();
            Compute();
            GetInfo();
        }
    }

    void GetCart()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT p.ProductID, p.Code, p.Image, p.Name, " +
            "p.Price, od.Quantity, od.Amount, od.RefNo, c.Category " +
            "FROM OrderDetails od " +
            "INNER JOIN Products p ON od.ProductID = p.ProductID " +
            "INNER JOIN Categories c on p.CatID = c.CatID " +
            "WHERE od.OrderNo=0 AND od.UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); // 
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
        com.CommandText = "SELECT Price FROM Products WHERE ProductID=@ProductID";
        com.Parameters.AddWithValue("@ProductID", ID);
        price = (decimal)com.ExecuteScalar();
        con.Close();
        return price;
    }

    void Compute()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) FROM OrderDetails " +
            "WHERE OrderNo=0 AND UserID=@UserID HAVING COUNT(RefNo) > 0";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); // 
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

    void GetInfo()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select firstname, lastname, street, municipality, city, phone, mobile from users where userid=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
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
        }
        con.Close();


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region Step 1:Update user contact information

        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE users SET FirstName=@FirstName, LastName=@LastName, Street=@Street, Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, DateModified=@DateModified WHERE UserID=@UserID"; // parameterized SQL statement
        com.Parameters.AddWithValue("@FirstName", txtFN.Text);
        com.Parameters.AddWithValue("@LastName", txtLN.Text);
        com.Parameters.AddWithValue("@Street", txtStreet.Text);
        com.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
        com.Parameters.AddWithValue("@City", txtCity.Text);
        com.Parameters.AddWithValue("@Phone", txtPhone.Text);
        com.Parameters.AddWithValue("@Mobile", txtMobile.Text);
        com.Parameters.AddWithValue("@DateModified", DateTime.Now);
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); //
        com.ExecuteNonQuery();
        con.Close();

        #endregion

        #region Step 2: Add a new order record

        con.Open();
        com.CommandText = "Insert into orders values(@DateOrdered, @PaymentMethod, @Status); Select top 1 orderno from orders order by orderno desc;";
        com.Parameters.AddWithValue("@DateOrdered", DateTime.Now);
        com.Parameters.AddWithValue("@PaymentMethod", ddlMethod.SelectedValue);
        com.Parameters.AddWithValue("@Status", "Pending");
        int orderNo = (int)com.ExecuteScalar();
        con.Close();
        #endregion

        #region Step 3: Update Cart Details
        con.Open();
        com.CommandText = "Update orderdetails set orderno=@OrderNo, Status='Processing' where orderno=0 and userid=@UserID";
        com.Parameters.Clear(); //remove any existing parameter definition
        com.Parameters.AddWithValue("@OrderNo", orderNo);
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); //
        com.ExecuteNonQuery();
        con.Close();
        #endregion

        #region Step 4: Add a new delivery record
        con.Open();
        com.CommandText = "Insert into deliveries values(@OrderNo, @Deadline, @DateDelivered, @Status)";
        com.Parameters.Clear();
        com.Parameters.AddWithValue("@OrderNo", orderNo);
        com.Parameters.AddWithValue("@Deadline", DateTime.Now.AddDays(7));
        com.Parameters.AddWithValue("@DateDelivered", DBNull.Value);
        com.Parameters.AddWithValue("@Status", "Pending");
        com.ExecuteNonQuery();
        con.Close();
        #endregion

        Response.Redirect("~/Cart.aspx");
    }
}