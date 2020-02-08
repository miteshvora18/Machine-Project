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
    public partial class Register : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool hasRow = false;
            try
            {
                SqlConnection con = new SqlConnection(conn);
                con.Open();
                SqlCommand cmd2 = new SqlCommand("Select user_id from login where user_id=@user_id",con);
                cmd2.Parameters.AddWithValue("@user_id", txtUser.Text);
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.HasRows)
                {
                    hasRow = true;
                }
                else
                    hasRow = false;
                con.Close();
                con.Open();
                if (hasRow == false)
                {
                    SqlCommand cmd = new SqlCommand("Insert into login values(@userid,@pass,@rid,@email)", con);
                    cmd.Parameters.AddWithValue("@userid", txtUser.Text);
                    cmd.Parameters.AddWithValue("@rid", 2);
                    cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.ExecuteNonQuery();
                    txtConfPass.Text = txtEmail.Text = txtPass.Text = txtUser.Text = "";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Your account is registered.');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('User id exists.');", true);
                }
                con.Close();
            }
            catch (Exception e1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error..Try again');", true);
            }
        }
    }
}
