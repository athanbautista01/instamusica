using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Products_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int productID = 0;
            bool validProduct = int.TryParse(Request.QueryString["ID"].ToString(), out productID);

            if (validProduct)
            {
                if (!IsPostBack)
                {
                    GetCategories();
                    GetInfo(productID);
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "update products set name=@Name, catid=@CatID, code=@Code, description=@Description, image=@Image, price=@Price, isfeatured=@IsFeatured, criticallevel=@CriticalLevel, Maximum=@Maximum, datemodified=@DateModified where productid=@ProductID";
        com.Parameters.AddWithValue("@Name", txtName.Text);
        com.Parameters.AddWithValue("@CatID", ddlCategories.SelectedValue);
        com.Parameters.AddWithValue("@Code", txtCode.Text);
        com.Parameters.AddWithValue("@Description", txtDesc.Text);
        if (fuImage.HasFile)
        {
            string fileExt = Path.GetExtension(fuImage.FileName);
            string id = Guid.NewGuid().ToString();
            com.Parameters.AddWithValue("@Image", id + fileExt);
            fuImage.SaveAs(Server.MapPath("~/img/products/" + id + fileExt));
        }
        else
        {
            com.Parameters.AddWithValue("Image", Session["image"].ToString());
        }
        com.Parameters.AddWithValue("@Price", txtPrice.Text);
        com.Parameters.AddWithValue("@IsFeatured", ddlFeatured.SelectedValue);
        com.Parameters.AddWithValue("@Available", 0);
        com.Parameters.AddWithValue("@CriticalLevel", txtCritical.Text);
        com.Parameters.AddWithValue("@Maximum", txtMax.Text);
        com.Parameters.AddWithValue("@DateModified", DateTime.Now);
        com.Parameters.AddWithValue("@ProductID", Request.QueryString["ID"].ToString());
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }

    void GetCategories()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select CatId, category from categories";
        SqlDataReader dr = com.ExecuteReader();
        ddlCategories.DataSource = dr;
        ddlCategories.DataTextField = "Category";
        ddlCategories.DataValueField = "CatID";
        ddlCategories.DataBind();
        con.Close();
    }

    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "select productid, name, catid, code, description, image, price, isfeatured, criticallevel, maximum from products where productid=@productid";
        com.Parameters.AddWithValue("@ProductID", ID);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                ltID.Text = dr["ProductID"].ToString();
                txtName.Text = dr["Name"].ToString();
                ddlCategories.SelectedValue = dr["CatID"].ToString();
                txtCode.Text = dr["Code"].ToString();
                txtDesc.Text = dr["Description"].ToString();
                Session["image"] = dr["Image"].ToString();
                txtPrice.Text = dr["Price"].ToString();
                ddlFeatured.SelectedValue = dr["IsFeatured"].ToString();
                txtCritical.Text = dr["CriticalLevel"].ToString();
                txtMax.Text = dr["Maximum"].ToString();
            }
            imgProduct.ImageUrl = "~/img/products/" + Session["image"].ToString();
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Default.aspx");
        }
    }
}