using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Reports_Users : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUsers();
        }
    }
    void GetUsers()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select u.UserID, t.UserType, u.Email, u.FirstName, u.LastName, u.Street, u.Municipality, u.City, u.Phone, u.Mobile, u.Status, u.DateAdded, u.DateModified from Users u INNER JOIN Types t ON u.TypeID = t.TypeID";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Users");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();

    }

    protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProducts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetUsers();
    }

    protected void lvProducts_DataBound(object sender, EventArgs e)
    {
        dpProducts.Visible = dpProducts.PageSize < dpProducts.TotalRowCount;
    }
    protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

    }
}