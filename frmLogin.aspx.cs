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

public partial class frmLogin : System.Web.UI.Page
{
    clsMember_Logic objMember = new clsMember_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtLoginId.Focus();
        if (!IsPostBack)
        { 
        
        }

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        objMember.pro_MemberId = txtLoginId.Text.Trim();
        objMember.pro_Password = txtPassword.Text.Trim();
        DataSet dsCheckLogin=objMember.CheckLogin();
        DataRowCollection drows = dsCheckLogin.Tables[0].Rows;
        if (drows.Count > 0)
        {
            Session["MemberName"] = drows[0]["MemberName"].ToString();
            Session["LoginId"] = drows[0]["MemberId"].ToString();
            Response.Redirect("frmMyProfile.aspx");
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = "Invalid LoginId and Password";
            txtPassword.Focus();
        }
    }
    protected void lnkbtnNewUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmRegistration.aspx");
    }
    protected void lnkbtnForgotPassword_Click(object sender, EventArgs e)
    {

    }
}
