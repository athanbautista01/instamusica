using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Reports_Deliveries : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            GetDeliveries();
        }
    }

    void GetDeliveries()
    {
        Con.Open();
        SqlCommand Com = new SqlCommand();
        Com.Connection = Con;
        Com.CommandText = "SELECT * FROM Deliveries";
        SqlDataAdapter DA = new SqlDataAdapter(Com);
        DataSet DS = new DataSet();
        DA.Fill(DS, "Deliveries");
        lvDeliveries.DataSource = DS;
        lvDeliveries.DataBind();
        Con.Close();
    }

}