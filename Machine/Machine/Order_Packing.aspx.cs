﻿using System;
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
    public partial class Order_Packing : System.Web.UI.Page
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["MachineConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["rid"]) != 4)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select oid,mname,mquantity,price,ostartdate from orders o join machine m on o.mid=m.mid where ostatus=4", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                gvPacking.DataSource = dr;
                gvPacking.DataBind();
                con.Close();

                if (Request.QueryString["oid"] != null)
                {
                    SqlConnection con2 = new SqlConnection(conn);
                    SqlCommand cmd2 = new SqlCommand("Update orders set ostatus=5 where oid=" + Request.QueryString["oid"], con2);
                    con2.Open();
                    cmd2.ExecuteNonQuery();
                    con2.Close();
                    string msg = "Status of Order Id : " + Request.QueryString["oid"] + " has been set to completed." ;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('" + msg + "');", true);
                    con.Open();
                    dr = cmd.ExecuteReader();
                    gvPacking.DataSource = dr;
                    gvPacking.DataBind();
                    con.Close();
                }
            }
        }

        protected void gvPacking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string oid = e.CommandArgument.ToString();
            Response.Redirect("Order_Packing.aspx?oid="+oid);
        }
    }
}
