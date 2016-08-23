using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Reviews_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetReview();
        }
    }

    void GetReview()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select r.ReviewID, r.DateReviewed, r.UserID, r.ProductID, r.Rating, r.Review, r.Status, u.FirstName, u.LastName, p.Name " +
                "From Reviews r INNER JOIN Users u ON u.UserID = r.UserID INNER JOIN Products p ON r.ProductID = p.ProductID";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Reviews");

        lvReview.DataSource = ds;
        lvReview.DataBind();
        con.Close();
    
    
    }


    
    protected void lvReview_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        Literal ltOrderNo = (Literal)e.Item.FindControl("ltReviewID");

        if (e.CommandName == "deliveritem")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "UPDATE Reviews SET Status=@Status WHERE ReviewID=@ReviewID ";
            com.Parameters.AddWithValue("@ReviewID", ltOrderNo.Text);
            com.Parameters.AddWithValue("@Status", "Approved");
            com.ExecuteNonQuery();
            con.Close();
            GetReview();
        }

         else if (e.CommandName == "rejectitem")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "UPDATE Reviews SET Status=@Status WHERE ReviewID=@ReviewID ";
            com.Parameters.AddWithValue("@ReviewID", ltOrderNo.Text);
            com.Parameters.AddWithValue("@Status", "Rejected");
            com.ExecuteNonQuery();
            con.Close();
            GetReview();
        }
    }
}