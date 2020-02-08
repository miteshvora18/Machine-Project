using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Machine
{
    public partial class Order : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            if (Convert.ToInt32(Session["rid"]) != 2)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con=null;
            int mid=1;
            int price=0;
            if (hdnSelected.Value == "ctl00_ContentPlaceHolder1_imgLaser")
            {
                mid=1;
                price = 1300 * Convert.ToInt32(ddlQuantity.Text);
            }
            if (hdnSelected.Value == "ctl00_ContentPlaceHolder1_imgMetal")
            {
                mid = 2;
                price = 3500 * Convert.ToInt32(ddlQuantity.Text);
            }
            if (hdnSelected.Value == "ctl00_ContentPlaceHolder1_imgPaper")
            {
                mid = 3;
                price = 5800 * Convert.ToInt32(ddlQuantity.Text);
            }
            if (hdnSelected.Value == "ctl00_ContentPlaceHolder1_imgPumps")
            {
                mid = 4;
                price = 1000 * Convert.ToInt32(ddlQuantity.Text);
            }
            if (hdnSelected.Value == "ctl00_ContentPlaceHolder1_imgPrinting")
            {
                mid = 5;
                price = 7000 * Convert.ToInt32(ddlQuantity.Text);
            }
            if (hdnSelected.Value == "ctl00_ContentPlaceHolder1_imgRefrigeration")
            {
                mid = 6;
                price = 5000 * Convert.ToInt32(ddlQuantity.Text);
            }
            try
            {
                con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Insert into orders values(@mid,@mquantity,@price,@start,@end,@ostatus)",con);
                cmd.Parameters.AddWithValue("@mid", mid);
                cmd.Parameters.AddWithValue("@mquantity", ddlQuantity.Text);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@start", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@end", "");
                cmd.Parameters.AddWithValue("@ostatus", 8);
                con.Open();
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("select top 1 oid from orders order by oid desc", con);
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Order placed successfully Order id:" + dr[0] + "');", true);
                        txtPrice.Text = "";
                        ddlQuantity.SelectedIndex = 0;
                    }
                }
            }
            catch (Exception e1)
            {
                ScriptManager.RegisterStartupScript(this,GetType(), "alert", "alert('" + e1.Message + "');", true);
            }
            con.Close();
        }
    }
}
