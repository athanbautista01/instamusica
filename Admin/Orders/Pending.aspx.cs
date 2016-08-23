using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Orders_Pending : System.Web.UI.Page
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
        com.CommandText = "Select o.orderno, o.dateordered, d.deadline, (select sum(od.amount) from orderdetails od where od.orderno = o.orderno) as totalamount, o.paymentmethod, o.status from orders o join deliveries d on d.orderno = o.orderno where o.status='Pending' order by dateordered desc";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Orders");

        lvOrders.DataSource = ds;
        lvOrders.DataBind();
        con.Close();
    }
}