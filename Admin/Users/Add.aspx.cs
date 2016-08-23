using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Users_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetTypes();
        }
    }

    void GetTypes()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TypeID, UserType FROM Types";
        SqlDataReader dr = com.ExecuteReader();
        ddlTypes.DataSource = dr;
        ddlTypes.DataTextField = "UserType";
        ddlTypes.DataValueField = "TypeID";
        ddlTypes.DataBind();
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO users VALUES (@TypeID, @Email, @Password, @FirstName, @LastName, @Street, @Municipality, @City, @Phone, @Mobile, @Status, @DateAdded, @DateModified)";
        com.Parameters.AddWithValue("@TypeID", ddlTypes.SelectedValue);
        com.Parameters.AddWithValue("@Email", txtEmail.Text);
        com.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
        com.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
        com.Parameters.AddWithValue("@LastName", txtLastName.Text);
        com.Parameters.AddWithValue("@Street", txtStreet.Text);
        com.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
        com.Parameters.AddWithValue("@City", txtCity.Text);
        com.Parameters.AddWithValue("@Phone", txtPhone.Text);
        com.Parameters.AddWithValue("@Mobile", txtMobile.Text);
        com.Parameters.AddWithValue("@Status", "Active");
        com.Parameters.AddWithValue("@DateAdded", DateTime.Now);
        com.Parameters.AddWithValue("@DateModified", DBNull.Value);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
}