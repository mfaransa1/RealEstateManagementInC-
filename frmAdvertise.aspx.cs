using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class frmAdvertise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
    }
   
    protected void lnkPostAnAd_Click(object sender, EventArgs e)
    {
        Session["Advertise"] = "yes";
        Response.Redirect("frmPropertyAdList.aspx");
    }
    protected void imgPostAnAd_Click(object sender, ImageClickEventArgs e)
    {
        Session["Advertise"] = "yes";
        Response.Redirect("frmPropertyAdList.aspx");
    }
    protected void imgFirstTimeUser_Click(object sender, ImageClickEventArgs e)
    {
        Session["Advertise"] = "yes";
        Response.Redirect("frmRegistration.aspx");
    }
    protected void lnkBtnForFirstTimeUser_Click(object sender, EventArgs e)
    {
        Session["Advertise"] = "yes";
        Response.Redirect("frmRegistration.aspx");
    }
   
}
