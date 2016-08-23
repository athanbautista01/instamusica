using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Suppliers_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
         con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO Suppliers VALUES (@CompanyName,@ContactPerson,@Address,@Phone,@Mobile,@Status,@DateAdded,@DateModified)";
        com.Parameters.AddWithValue("@CompanyName", txtCN.Text   );
        com.Parameters.AddWithValue("@ContactPerson", txtCP.Text  );
        com.Parameters.AddWithValue("@Address", txtAdd.Text  );
        com.Parameters.AddWithValue("@Phone", txtPhone.Text  );
        com.Parameters.AddWithValue("@Mobile", txtMobile.Text  );
        com.Parameters.AddWithValue("@Status", "Active"  );
        com.Parameters.AddWithValue("@DateAdded", DateTime.Now   );
        com.Parameters.AddWithValue("@DateModified", DBNull.Value   );
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
}