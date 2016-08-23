using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_Purchases_Delivered : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
          if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            int purchaseno = 0;
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out purchaseno);
            if (validID)
            {

                if (!IsPostBack)
                {
                    Approve(purchaseno);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }


    void Approve(int ID)
    {
        Con.Open();
        SqlCommand Com = new SqlCommand();
        Com.Connection = Con;
        Com.CommandText = "UPDATE Purchases SET Status=@Status WHERE PurchaseNo = @PurchaseNo";
        Com.Parameters.AddWithValue("@PurchaseNo", ID);
        Com.Parameters.AddWithValue("@Status", "Receive");
        Com.ExecuteNonQuery();
        Con.Close();
        Response.Redirect("Default.aspx");
    }
}