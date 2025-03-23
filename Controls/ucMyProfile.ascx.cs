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

public partial class Controls_ucMyProfile : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsMember_Logic objMember = new clsMember_Logic();
        //if (Session["LoginId"] != null)
        //{
        //    objMember.pro_MemberId = Session["LoginId"].ToString();
        //}
        //else
        //{
        //    Response.Redirect("frmLogin.aspx");
        //}
    }
    protected void lnkbtnchangepassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmChangePassword.aspx");
    }
    protected void lnkbtnmyprofile_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmMyProfile.aspx");
    }
    protected void lnkbtnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("frmLogout.aspx");
    }
    protected void lnkbtnmyproperty_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmPropertyAdList.aspx");
    }
    protected void lnkbtnpostproperty_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmPropertyAdProfile_Add.aspx");
    }
}
