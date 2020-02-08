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
    public partial class _Default : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["status"] != null)
                {
                    Session["name"] = null;
                    Session["rid"] = null;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT User_id, password,rid FROM Login WHERE User_Id=@uid AND Password = @pass", con);
            cmd.Parameters.AddWithValue("@uid", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pass", TextBox2.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        int rid = (Convert.ToInt32(dr[2]));
                        //Label1.Text = rid.ToString();
                        Session["rid"] = rid;
                        Session["name"] = TextBox1.Text;
                        if (rid == 1)
                        {
                            Response.Redirect("Order_status.aspx");
                        }
                        if (rid == 2)
                        {
                            Response.Redirect("Order.aspx");
                        }
                        if (rid == 3)
                        {
                            Response.Redirect("Order_Manu.aspx");
                        }
                        if (rid == 4)
                        {
                            Response.Redirect("Order_Packing.aspx");
                        }
                        if (rid == 5)
                        {
                            Response.Redirect("Order_testing.aspx");
                        }
                        if (rid == 8)
                        {
                            Response.Redirect("All_Orders.aspx");
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Invalid User Id/Password');", true);
                }
            }
            finally
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error..Try again');", true);
                if (dr != null)
                {
                    dr.Close();
                }
                if(con!=null)
                {
                    con.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
