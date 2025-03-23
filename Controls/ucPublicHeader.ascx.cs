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

public partial class Controls_ucPublicHeader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CurrentDate.InnerHtml = string.Format("{0:dddd, dd MMM yyyy}", DateTime.Now);

        string anchor = "| <a class=logintext href=frmMyProfile.aspx style=TEXT-DECORATION:underline><strong>My Account</strong></a> | <a class=logintext href=frmLogout.aspx style=TEXT-DECORATION:underline><strong>Logout</strong></a>";

        if (Session["MemberName"] != null && Session["LoginId"] != null)
        {
            sp_Newuser.InnerHtml = "<font size='1' color='black'><strong>Welcome : " + Session["MemberName"].ToString() + "</strong></font>" + anchor + "&nbsp;&nbsp;";
            tblLogin.Rows[0].Cells[1].Visible = false;
            tblLogin.Rows[0].Cells[2].Visible = false;
        }
    }
}
