using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Deliveries_MyProfile : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(Helper.GetCon());
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
                    GetInfo();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    void GetInfo()
    {
        Con.Open();
        SqlCommand Com = new SqlCommand();
        Com.Connection = Con;
        Com.CommandText = "SELECT TypeID, Email, Password, FirstName, LastName, Street, Municipality, City, Phone, Mobile, Status FROM Users WHERE UserID = @UserID";
        Com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        SqlDataReader dr = Com.ExecuteReader();

        if (dr.HasRows) // Record is Existing
        {
            while (dr.Read())
            {
                TextFirstName.Text = dr["FirstName"].ToString();
                TextLastName.Text = dr["LastName"].ToString();
                TextEmail.Text = dr["Email"].ToString();
                TextStreet.Text = dr["Street"].ToString();
                TextMunicipality.Text = dr["Municipality"].ToString();
                TextCity.Text = dr["City"].ToString();
                TextPhone.Text = dr["Phone"].ToString();
                TextMobile.Text = dr["Mobile"].ToString();
            }
            Con.Close();
        }
        else
        {
            Con.Close();
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Con.Open();
        SqlCommand Com = new SqlCommand();
        Com.Connection = Con;
        if (TextPassword.Text == "") // means that the user doesn't want to change their password
        {
            Com.CommandText = "UPDATE Users SET Email = @Email, FirstName = @FirstName, LastName = @LastName, Street = @Street, Municipality = @Municipality, City = @City, Phone = @Phone, Mobile = @Mobile, DateModified = @DateModified WHERE UserID = @UserID"; // Parameratized SQL Statement
        }
        else
        {
            Com.CommandText = "UPDATE Users SET Email = @Email, Password = @Password, FirstName = @FirstName, LastName = @LastName, Street = @Street, Municipality = @Municipality, City = @City, Phone = @Phone, Mobile = @Mobile, DateModified = @DateModified WHERE UserID = @UserID"; // Parameratized SQL Statement
        }
        Com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        Com.Parameters.AddWithValue("@Email", TextEmail.Text);
        Com.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(TextPassword.Text));
        Com.Parameters.AddWithValue("@FirstName", TextFirstName.Text);
        Com.Parameters.AddWithValue("@LastName", TextLastName.Text);
        Com.Parameters.AddWithValue("@Street", TextStreet.Text);
        Com.Parameters.AddWithValue("@Municipality", TextMunicipality.Text);
        Com.Parameters.AddWithValue("@City", TextCity.Text);
        Com.Parameters.AddWithValue("@Phone", TextPhone.Text);
        Com.Parameters.AddWithValue("@Mobile", TextMobile.Text);
        Com.Parameters.AddWithValue("@DateModified", DateTime.Now);
        Com.ExecuteNonQuery();
        Con.Close();
        Session["update"] = "yes";
        Response.Redirect("MyProfile.aspx");


    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Product.aspx");
    }
}