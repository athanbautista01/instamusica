using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SiteGallery : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            GetFeaturedProducts();
            GetCategories();
            GetTrends();
            //GetTypes();

            if (Session["userid"] == null)
            {
                cart.Visible = false;
                ME.Visible = false;
                LOGIN.Visible = true;
            }
            else
            {
                GetCart();
                Calculate();
                GetInfo();
                LOGIN.Visible = false;
                cart.Visible = true;
                ME.Visible = true;
            }

        }
    }

    void GetInfo() //get user name
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT FirstName + ' ' + LastName FROM Users WHERE UserID=@UserID and status='InCart'";
        com.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        ltUser.Text = (string)com.ExecuteScalar(); // typecasting
        con.Close();
    }

    void GetFeaturedProducts()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select top 5 products.productid, products.name, products.isfeatured from products ORDER BY NEWID()";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();
    }

    void GetCategories()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select category, catid from categories";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Category");
        lvCategories.DataSource = ds;
        lvCategories.DataBind();
        con.Close();
    }

    void GetTrends()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select top 3 products.productid, products.name, categories.category, products.image, products.price, products.isfeatured from products inner join categories on products.catid = categories.catid where IsFeatured='yes' order by Price asc";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvTrends.DataSource = ds;
        lvTrends.DataBind();
        con.Close();

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {


        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select userid, typeid from users where email=@Email and password=@Password";
        com.Parameters.AddWithValue("@Email", txtLogEmail.Text);
        com.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtLogPassword.Text));
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["userid"] = dr["UserID"].ToString();
                Session["typeid"] = dr["TypeID"].ToString();

                if (Session["typeid"].ToString() == "1")
                {
                    con.Close();
                    Response.Redirect("~/Admin/Default.aspx");
                }

                else if (Session["typeid"].ToString() == "5")
                {
                    con.Close();
                    Response.Redirect("~/Products.aspx");
                }
                else
                    Response.Redirect("~/Home.aspx");
            }


        }
        else
            error.Visible = true;
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        #region Register
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO users(typeid, email, password, status, firstname, lastname, dateadded, datemodified) VALUES (@TypeID, @Email, @Password, @Status, @FirstName, @LastName, @DateAdded, @DateModified)";
        com.Parameters.AddWithValue("@TypeID", 5);
        com.Parameters.AddWithValue("@Email", txtRegEmail.Text);
        com.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtRegPwd.Text));
        com.Parameters.AddWithValue("@Status", "Pending");
        com.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
        com.Parameters.AddWithValue("@LastName", txtLastName.Text);
        com.Parameters.AddWithValue("@DateAdded", DateTime.Now);
        com.Parameters.AddWithValue("@DateModified", DBNull.Value);
        com.ExecuteNonQuery();
        con.Close();
        #endregion

    }

    //void GetTypes()
    //{
    //    con.Open();
    //    SqlCommand com = new SqlCommand();
    //    com.Connection = con;
    //    com.CommandText = "SELECT TypeID, UserType FROM Types";
    //    SqlDataReader dr = com.ExecuteReader();
    //    ddlTypes.DataSource = dr;
    //    ddlTypes.DataTextField = "UserType";
    //    ddlTypes.DataValueField = "TypeID";
    //    ddlTypes.DataBind();
    //    con.Close();
    //}

    void GetCart()
    {

        con.Open();

        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT od.RefNo, p.ProductID, p.Image, p.Name, p.Price, od.Quantity, od.Amount FROM OrderDetails od INNER JOIN " +
                            "Products p ON od.ProductID=p.ProductID WHERE od.OrderNo=0 AND od.UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());

        //int NoUID = 0;
        //bool validUID = int.TryParse(Session["userid"].ToString(), out NoUID);
        ////

        SqlDataReader dr = com.ExecuteReader();
        lvListofCart.DataSource = dr;
        lvListofCart.DataBind();

        con.Close();
    }

    void CountCart()
    {

        con.Open();

        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT count(ProductID) FROM OrderDetails WHERE UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        int total = (int)com.ExecuteScalar();
        con.Close();
        ltCartCount.Text = total.ToString();

    }

    void Calculate()
    {

        con.Open();

        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT SUM(Amount) FROM OrderDetails WHERE OrderNo=0 AND UserID=@UserID HAVING COUNT(RefNo) > 0";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());

        //int NoUID = 0;
        //bool validUID = int.TryParse(Session["userid"].ToString(), out NoUID);

        object data = com.ExecuteScalar();
        double total = 0;
        if (data == null)
        {
            total = 0;
        }
        else
        {
            total = Convert.ToDouble((decimal)com.ExecuteScalar());
        }

        con.Close();

        ltTotal.Text = total.ToString("#,##0.00");
    }
}
