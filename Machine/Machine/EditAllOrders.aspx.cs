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
    public partial class EditAllOrders : System.Web.UI.Page
    {
        string oid;
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["rid"]) != 8)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["orderid"] != null)
            {
                oid = (string)Session["orderid"];
                lblOid.Text = oid;
            }
            else
            {
                
                Response.Redirect("All_Orders.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            int ostatus = 8;
            if (ddlStatus.Text == "Approve")
            {
                ostatus = 3;
            }
            else
                ostatus = 7;
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Update orders set ostatus=" + ostatus + " where oid=" + oid, con);
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("All_Orders.aspx?oid=" + oid + "&status=" + ddlStatus.Text);
            con.Close();
            
        }
    }
}
