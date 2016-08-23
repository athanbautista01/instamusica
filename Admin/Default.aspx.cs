using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetFeedback();
            ltTotalUsers.Text = Helper.CountData("users", "", "");
            ltTotalOrders.Text = Helper.CountData("orders", "", "");
            ltTotalFeedback.Text = Helper.CountData("feedback", "", "");
            ltTotalProducts.Text = Helper.CountData("products", "", "");
            SetTheProgress(pUsers, ltTotalUsers.Text + "%");
            SetTheProgress(pOrders, ltTotalOrders.Text + "%");
            SetTheProgress(pFeedback, ltTotalFeedback.Text + "%");
            SetTheProgress(pProducts, ltTotalProducts.Text + "%");
        }
    }

    void SetTheProgress(HtmlGenericControl bar, string value)
    {
        bar.Attributes.Add("style", string.Format("width:{0};", value));
    }

    void GetFeedback()
    {
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "Select feebackid, feedback, response, datecreated from feedback";
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds, "Feedback");
        lvFeedback.DataSource = ds;
        lvFeedback.DataBind();
        con.Close();
    }

    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (lvFeedback.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.GetFeedback();
    }
}