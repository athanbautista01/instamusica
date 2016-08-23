using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Suppliers_Edit : System.Web.UI.Page
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
                    GetInfo(userID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText =  "SELECT SupplierID,CompanyName,ContactPerson,Address,Phone,Mobile,Status,DateAdded,DateModified FROM Suppliers WHERE SupplierID=@SupplierID";
        com.Parameters.AddWithValue("@SupplierID", ID);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows) //record is existing
        {
            while (dr.Read())
            {
                txtAdd.Text = dr["Address"].ToString();
                txtCN.Text = dr["CompanyName"].ToString();
                txtCP.Text = dr["ContactPerson"].ToString();
                txtMobile.Text = dr["Mobile"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                ddlStatus.SelectedValue = dr["Status"].ToString();
            }
            con.Close();
        }
        else //record is not existing
        {
            con.Close();
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
         con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE Suppliers SET CompanyName=@CompanyName, ContactPerson=@ContactPerson, Address=@Address, Phone=@Phone, Mobile=@Mobile,Status=@Status, " +
            "DateModified=@DateModified WHERE SupplierID=@SupplierID";
        com.Parameters.AddWithValue("@CompanyName", txtCN.Text);
        com.Parameters.AddWithValue("@ContactPerson", txtCP.Text);
        com.Parameters.AddWithValue("@Address", txtAdd.Text);
        com.Parameters.AddWithValue("@Phone", txtPhone.Text);
        com.Parameters.AddWithValue("@Mobile", txtMobile.Text);
        com.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
        com.Parameters.AddWithValue("@DateModified", DateTime.Now);
        com.Parameters.AddWithValue("@SupplierID", Request.QueryString["ID"].ToString());

        com.ExecuteNonQuery();
        con.Close();

        Response.Redirect("Default.aspx");





    }
}