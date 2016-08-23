using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Purchases_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCategories();
        }
    }

    void GetCategories()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT CatID, Category FROM Categories";
        SqlDataReader dr = com.ExecuteReader();
        ddlCategories.DataSource = dr;
        ddlCategories.DataTextField = "Category";
        ddlCategories.DataValueField = "CatID";
        ddlCategories.DataBind();
        con.Close();
    }

    void GetViolin()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select p.Name, p.ProductID FROM Products p Inner join Categories c ON p.CatID = c.CatID "
                    + " Where c.Category = 'Violin'";
        SqlDataReader dr = com.ExecuteReader();
        ddlProducts.DataSource = dr;
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataValueField = "ProductID";
        ddlProducts.DataBind();
        con.Close();
    }

    void GetDrums()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select p.Name, p.ProductID FROM Products p Inner join Categories c ON p.CatID = c.CatID "
                    + " Where c.Category = 'Drums'";
        SqlDataReader dr = com.ExecuteReader();
        ddlProducts.DataSource = dr;
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataValueField = "ProductID";
        ddlProducts.DataBind();
        con.Close();
    }

    void GetGuitar()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select p.Name, p.ProductID FROM Products p Inner join Categories c ON p.CatID = c.CatID "
                    + " Where c.Category = 'Guitar'";
        SqlDataReader dr = com.ExecuteReader();
        ddlProducts.DataSource = dr;
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataValueField = "ProductID";
        ddlProducts.DataBind();
        con.Close();
    }

    void GetLaunchpad()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select p.Name, p.ProductID FROM Products p Inner join Categories c ON p.CatID = c.CatID "
                    + " Where c.Category = 'Drums'";
        SqlDataReader dr = com.ExecuteReader();
        ddlProducts.DataSource = dr;
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataValueField = "ProductID";
        ddlProducts.DataBind();
        con.Close();
    }
    void GetPiano()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select p.Name, p.ProductID FROM Products p Inner join Categories c ON p.CatID = c.CatID "
                    + " Where c.Category = 'Piano'";
        SqlDataReader dr = com.ExecuteReader();
        ddlProducts.DataSource = dr;
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataValueField = "ProductID";
        ddlProducts.DataBind();
        con.Close();
    }




    protected void btnAdd_Click(object sender, EventArgs e)
    {

        #region Step 2: Add a new order record

        con.Open();
        SqlCommand Com = new SqlCommand();
        Com.Connection = con;
        Com.CommandText = "INSERT INTO Products VALUES (@Name, @Price, @Quantity)";
        Com.Parameters.AddWithValue("@Name", ddlProducts.SelectedValue);
        Com.Parameters.AddWithValue("@Price", txtPrice.Text);
        Com.Parameters.AddWithValue("@Quantity", txtQty.Text);
        Com.ExecuteNonQuery();
        con.Close();
        #endregion

        #region Step 3: Update Cart Details
        con.Open();
        SqlCommand com = new SqlCommand();
        com.CommandText = "Update orderdetails set orderno=@OrderNo, Status='Processing' where orderno=0 and userid=@UserID";
        com.Parameters.Clear(); //remove any existing parameter definition
        com.Parameters.AddWithValue("@OrderNo", 0);
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); //
        com.ExecuteNonQuery();
        con.Close();
        #endregion

        #region Step 4: Add a new delivery record
        con.Open();
        com.CommandText = "Insert into deliveries values(@OrderNo, @Deadline, @DateDelivered, @Status)";
        com.Parameters.Clear();
        com.Parameters.AddWithValue("@OrderNo", 0);
        com.Parameters.AddWithValue("@Deadline", DateTime.Now.AddDays(7));
        com.Parameters.AddWithValue("@DateDelivered", DBNull.Value);
        com.Parameters.AddWithValue("@Status", "Pending");
        com.ExecuteNonQuery();
        con.Close();
        #endregion
    }
    protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlCategories.SelectedValue == "1")
        {
            GetDrums();
        }
        else if (ddlCategories.SelectedValue == "2")
        {
            GetGuitar();
        }
        else if (ddlCategories.SelectedValue == "3")
        {
            GetLaunchpad();
        }
        else if (ddlCategories.SelectedValue == "4")
        {
            GetPiano();
        }
        else if(ddlCategories.SelectedValue == "5")
        {
            GetViolin();
        }
    }
}



    

    

