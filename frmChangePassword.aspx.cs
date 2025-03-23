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

public partial class frmChangePassword : System.Web.UI.Page
{
    clsMember_Logic objMember = new clsMember_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtOldPassword.Focus();
        if (!IsPostBack)
        {
            if (Session["LoginId"] != null)
            {
                objMember.pro_MemberId = Session["LoginId"].ToString();
            }
            else
            {
                Response.Redirect("frmLogin.aspx");
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            objMember.pro_MemberId = Session["LoginId"].ToString();
            objMember.pro_Password = txtOldPassword.Text.Trim();
        if (objMember.CheckOldPassword() == true)
        {
            if (txtOldPassword.Text == txtNewPassword.Text)
            {
                lblError.Visible = true;
                lblsuccess.Visible = false;
                lblError.Text = "New password should not be same as OldPassword";
            }
            else
            {
                objMember.pro_Password = txtNewPassword.Text;
                objMember.ChangeMemberPassword();
                lblError.Visible = false;
                lblsuccess.Visible = true;
                lblsuccess.Text = "Your Password has been changed successfully!";
            }

        }
        else
        {
            lblError.Visible = true;
            lblsuccess.Visible = false;
            lblError.Text = "Invalid OldPassword";
        }
      }
    }
}
