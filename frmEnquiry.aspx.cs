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
using System.Net.Mail;

public partial class frmEnquiry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

        }
    }
  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (Page.IsValid)
        {
            sendMAIL();
            Response.Redirect("frmEnquiry_Success.aspx");
        }
    }
    private void sendMAIL()
    {
        string From, Subject, Salutation, username, Hearder, MainContent, MainContent1, signature, footer, adminUser, adminRole, strbody = "";

        username = "";
        Hearder = "";
        footer = "";
        adminUser = "";
        adminRole = "";
        signature = "Land.Net-Enquiries";
        string[] To = { ConfigurationManager.AppSettings["AdminMail"].ToString() };
        string[] ccList = { string.Empty };
        From = txtEmailAddress.Text.Trim();

        Subject = "Feedback/Comment";
        Salutation = "<b>Dear &nbsp;" + "Admin,</b>";
        strbody = strbody + "<tr><td colspan=2> <font face=Verdana size=2 color=black> <B>" + txtFeedbackComments.Text.Replace("\n", "<br>").ToString() + "</B></font></tr></td>";
        MainContent = strbody;
        MainContent1 = "";
        Send_email(To, From, Subject, Salutation, username, Hearder, MainContent, MainContent1, signature, footer, adminUser, adminRole, ccList);
    }

    public void Send_email(string[] mailto, string mailFrom, string strSubject, string strSalutation, string username, string strHearder, string strMainContent, string strMainContent1, string strsignature, string strfooter, string adminUser, string adminRole, string[] ccList)
    {
        string strbody = "";
        strbody = strbody + "<html><HEAD><title>eMailTemplate</title><style>.formLabel";
        strbody = strbody + "{color:white;FONT-FAMILY:Verdana,Arial,haettenschweiler; ";
        strbody = strbody + "font-size:10pt;background-color:#737164;font-weight:normal;}";
        strbody = strbody + "</style></HEAD><body MS_POSITIONING='GridLayout'>";
        strbody = strbody + "<TABLE id='Table1' cellSpacing='0' align=center cellPadding='2' width='100%' border='1'>";
        strbody = strbody + "<TR><TD colspan=2 bgColor='#E7E7EF'><table width='100%'><tr bgcolor=#FFFFFF height=28><td width='16%' valign=middle><img alt='Logo' ";
        strbody = strbody + "src='" + ConfigurationManager.AppSettings["InternalURL"] + "images/logo.jpg'></TD>";
        strbody = strbody + "</tr></table>";
        strbody = strbody + "<table border=0 width=100% valign=top bgColor='#F3F3F3'>";
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=black>" + strSalutation + "</font></td></tr>";
        strbody = strbody + "<tr><td colspan=2 height=7></td></tr>";
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=black>" + strHearder + "</font></td></tr>";
        strbody = strbody + strMainContent;
        strbody = strbody + strMainContent1;
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=Black><br>&nbsp;<b>" + strsignature + "</b><br>&nbsp;" + txtName.Text + "<br>&nbsp;" + mailFrom + "</font></td></tr>";
        strbody = strbody + "<tr><td colspan=2>" + "<font face=Verdana size=2 color=red>" + strfooter + "</font></td></tr>";
        strbody = strbody + "</table>";
        strbody = strbody + "</body>";
        strbody = strbody + "</html>";

        CommonFunctions.SendMail(mailto, mailFrom, strbody, strSubject, ccList);
        strbody = "";
    }
}
