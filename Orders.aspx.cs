using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;

public partial class Orders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOrders();
        }
    }

    void GetOrders()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select o.orderno, o.dateordered from orders o join OrderDetails d on d.orderno = o.orderno where d.UserID=@UserID order by o.DateOrdered desc";
        com.Parameters.AddWithValue("@UserID", Session["userid"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Orders");
        lvOrders.DataSource = ds;
        lvOrders.DataBind();
        con.Close();
    }
}