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
    public partial class All_Orders : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["rid"]) != 8)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select oid,mname,mquantity,price,ostartdate from orders o join machine m on o.mid=m.mid where ostatus=8", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                gvAdmin.DataSource = dr;
                gvAdmin.DataBind();
                con.Close();

                if (Request.QueryString["oid"] != null && Request.QueryString["status"] != null)
                {
                    string msg = "Status of Order Id : " + Request.QueryString["oid"] + " has been set to " + Request.QueryString["status"]+"d";
                    ScriptManager.RegisterStartupScript(this,GetType(), "alert", "alert('"+msg+"');", true);
                }
            }
        }

        protected void gvAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string oid = e.CommandArgument.ToString();
            Session["orderid"] = oid;
            Response.Redirect("EditAllOrders.aspx");
        }
    }
}
