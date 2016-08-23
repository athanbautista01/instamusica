using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Contact : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFeedback_Click1(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            errorMessage.Visible = true;
        }
        else
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "INSERT INTO Feedback VALUES (@DateCreated, @DateResponded, @UserID, @Feedback, @Response, @Status)";
            com.Parameters.AddWithValue("@DateCreated", DateTime.Now);
            com.Parameters.AddWithValue("@DateResponded", DBNull.Value);
            com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
            com.Parameters.AddWithValue("@Feedback", txtFeedback.Text);
            com.Parameters.AddWithValue("@Response", txtResponse.Text);
            com.Parameters.AddWithValue("@Status", "Unread");
            com.ExecuteNonQuery();
            con.Close();
            errorMessage.Visible = false;
            Response.Redirect("Contact.aspx");
        }
    }

    protected void btnShowModal_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
    }
}