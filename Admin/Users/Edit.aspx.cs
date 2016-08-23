using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Users_Edit : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)  //record is not selected
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            int userID = 0;
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

            if (validID)
            {
                if (!IsPostBack)
                {
                    GetTypes();
                    GetInfo(userID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

    }

    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TypeID, FirstName, LastName, Email, Password, Street, Municipality, City, Phone, Mobile, Status FROM Users WHERE UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", ID);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows) //record is existing
        {
            while (dr.Read())
            {
                ddlTypes.SelectedValue = dr["TypeID"].ToString();
                txtFirstName.Text = dr["FirstName"].ToString();
                txtLastName.Text = dr["LastName"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPassword.Text = dr["Password"].ToString();
                txtStreet.Text = dr["Street"].ToString();
                txtMunicipality.Text = dr["Municipality"].ToString();
                txtCity.Text = dr["City"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtMobile.Text = dr["Mobile"].ToString();
                ddlStatus.SelectedValue = dr["Status"].ToString();
            }
            con.Close();
        }
        else //record is not existing
        {
            con.Close();
            Response.Redirect("Default.aspx");
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
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE users SET TypeID=@TypeID, Email=@Email, Password=@Password, " +
            "FirstName=@FirstName, LastName=@LastName, Street=@Street, Municipality=@Municipality, City=@City, Phone=@Phone, Mobile=@Mobile, " +
            "Status=@Status, DateModified=@DateModified WHERE UserID=@UserID"; // parameterized SQL statement
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
        com.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
        com.Parameters.AddWithValue("@DateModified", DateTime.Now);
        com.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
}