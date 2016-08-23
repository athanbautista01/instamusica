using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;  

public partial class ProductDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
         if (Session["userid"] == null)
        {
            txtReview.Visible = false;
            ddlRating.Visible = false;
            btnAddReview.Visible = false;
            errorReview.Visible = true;
        }
        else
        {
            
             errorReview.Visible = false;
            txtReview.Visible = true;
            ddlRating.Visible = true;
            btnAddReview.Visible = true;
        }

        if (Request.QueryString["ID"] != null)
        {
            
            int productID = 0;
            bool validProduct = int.TryParse(Request.QueryString["ID"].ToString(), out productID);

            if (validProduct)
            {
                GetInfo(productID);
                GetRelated(productID);
                GetReview(productID);
            }
            else
                Response.Redirect("Products.aspx");
        }
        else
        {
            Response.Redirect("Products.apsx");
        }
    }

    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select products.name, products.code, products.image, categories.category, products.description, products.price from products inner join categories on products.catid = categories.catid where products.productid=@ProductID";
        com.Parameters.AddWithValue("@ProductID", ID);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                ltName.Text = dr["Name"].ToString();
                ltCode.Text = dr["Code"].ToString();
                imgProduct.ImageUrl = "~/img/products/" + dr["Image"].ToString();
                imgProductZoom.ImageUrl = "~/img/products/" + dr["Image"].ToString();
                ltCategory.Text = dr["Category"].ToString();
                ltDesc.Text = dr["Description"].ToString().Replace(Environment.NewLine, "<br/>");
                //ltQuickDesc.Text = dr["Description"].ToString().Replace(Environment.NewLine, "<br/>");
                double price = double.Parse(dr["Price"].ToString());
                ltPrice.Text = price.ToString("#,###,###.00");

            }
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Products.aspx");
        }

    }

    void GetRelated(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select top 30 percent products.productid, products.name, products.image, products.price from products where catid=(select categories.catid from products inner join categories on products.catid = categories.catid where products.productid=@ProductID) ORDER BY NEWID()";
        com.Parameters.AddWithValue("@ProductID", ID);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvRelated.DataSource = ds;
        lvRelated.DataBind();
        con.Close();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            errorMessage.Visible = true;
        }
        else
        {
        Response.Redirect("~/AddToCart.aspx?ID=" + Request.QueryString["ID"].ToString() + "&qty=" + txtQty.Text);
        }
    }

    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            errorMessage.Visible = true;
        }
    }

    protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        TextBox txtqty = (TextBox)e.Item.FindControl("txtqty");
        TextBox txtReview = (TextBox)e.Item.FindControl("txtReview");
        RadioButtonList rating = (RadioButtonList)e.Item.FindControl("rating");
        if (e.CommandName == "addqty")
        {
            Response.Redirect("AddToCart.aspx?ID=" + e.CommandArgument + "&qty=" + txtqty.Text);
        }
        else if (e.CommandName == "addRating")
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "INSERT INTO Rating VALUES (@ProductID, @DateAdded, @UserID, @Rating, @Review, @Status)";
            com.Parameters.AddWithValue("@ProductID", e.CommandArgument);
            com.Parameters.AddWithValue("@DateAdded", DateTime.Now);
            com.Parameters.AddWithValue("@UserID", 1); //Sesison
            com.Parameters.AddWithValue("@Rating", rating.SelectedValue);
            com.Parameters.AddWithValue("@Review", txtReview.Text);
            com.Parameters.AddWithValue("@Status", "Pending");
            com.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            Response.Redirect("Products.aspx");
        }
    }

    void GetReview(int ID)
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select TOP 20 Review,Rating,DateReviewed,ProductID,UserID FROM Reviews WHERE ProductID = @ProductID AND Status = 'Approved' ORDER BY DateReviewed desc";
        com.Parameters.AddWithValue("@ProductID", ID);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Reviews");
        lvReview.DataSource = ds;
        lvReview.DataBind();
        con.Close();
    }
    protected void btnAddReview_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Products.apsx");
        }
        else
        {
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "INSERT INTO Reviews VALUES (@DateReviewed, @UserID, @ProductID, @Rating, @Review, @Status)";
            com.Parameters.AddWithValue("@ProductID", Request.QueryString["ID"].ToString());
            com.Parameters.AddWithValue("@DateReviewed", DateTime.Now);
            com.Parameters.AddWithValue("@UserID", Session["userid"].ToString()); //Session
            com.Parameters.AddWithValue("@Rating", ddlRating.SelectedValue);
            com.Parameters.AddWithValue("@Review", txtReview.Text);
            com.Parameters.AddWithValue("@Status", "Pending");
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ProductDetails.aspx?ID=" + Request.QueryString["ID"].ToString() +"");
        }
    }
}