using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Users_Delete : System.Web.UI.Page
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
                    DeleteRecord(userID);

                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    void DeleteRecord(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "delete from users where UserID=@UserID";
        com.Parameters.AddWithValue("@UserID", ID);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
}