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

public partial class frmLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberName"] == null || Session["LoginId"] == null)
        {
            Response.Redirect("frmLogin.aspx");
        }
        else
        {
        }
        if (!Page.IsPostBack)
        {
            Session.Abandon();
            Session.Remove("MemberName");
            Session.Remove("LoginId");
            Session.Clear();
        }
    }
}
