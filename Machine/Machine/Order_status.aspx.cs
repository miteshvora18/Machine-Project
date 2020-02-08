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
    public partial class Order_status : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["rid"]) != 1)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection con = new SqlConnection(conn);
                    SqlCommand cmd = new SqlCommand("Select rname from roles", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            ListItem li = new ListItem();
                            li.Value = dr[0].ToString();
                            ddlStatus.Items.Add(li);
                            ddlStatus.Items.Remove("Admin");
                            ddlStatus.Items.Remove("Marketing");
                        }
                    }
                    con.Close();

                    SqlConnection con2 = new SqlConnection(conn);
                    SqlCommand cmd2 = new SqlCommand("Select oid,mname,mquantity,price,ostartdate from orders o join machine m on o.mid=m.mid join roles r on r.rid=o.ostatus where rname='" + ddlStatus.Text+"'", con2);
                    con2.Open();
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    gvStatus.DataSource = dr2;
                    gvStatus.DataBind();
                    con2.Close();
                }
                catch (Exception e1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error..Try Again')", true);
                }
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con2 = new SqlConnection(conn);
            SqlCommand cmd2 = new SqlCommand("Select oid,mname,mquantity,price,ostartdate from orders o join machine m on o.mid=m.mid join roles r on r.rid=o.ostatus where rname='" + ddlStatus.Text + "'", con2);
            con2.Open();
            SqlDataReader dr2 = cmd2.ExecuteReader();
            gvStatus.DataSource = dr2;
            gvStatus.DataBind();
            con2.Close();
        }
    }
}
