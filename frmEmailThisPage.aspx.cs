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

public partial class frmEmailThisPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strUser, strSubject, strFrom, strSalutation, strHearder, strsignature, strfooter;
        string strMainContent, strMainContent1, adminRole, adminUser;
        string strPath;
        strUser = string.Empty;
        strHearder = string.Empty;
        strfooter = string.Empty;
        strMainContent = string.Empty;
        adminRole = string.Empty;
        adminUser = string.Empty;

        string[] strTO = { txtEmailId.Text.Trim() };
        string[] ccList = { string.Empty };

        strFrom = ConfigurationManager.AppSettings["FromMail"].ToString(); 

        strPath = ConfigurationManager.AppSettings["InternalUrl"];

        strSubject = "Property Advertisement – PropertyNet";

        strSalutation = "Dear " + txtName.Text.Trim();

        strsignature = "";

        strMainContent1 = "";

        string strurl = Request["url"].ToString();

        strMainContent1 = strMainContent1 + "<tr><td align=left colspan=2><font face=Verdana size=2>" + "Please click on the URL below to view forwarded property advertisement <br><a href=" + strurl + " target=_blank>" + strurl + "</td>";

        Send_email(strTO, strFrom, strSubject, strSalutation, strUser, strHearder, strMainContent, strMainContent1, strsignature, strfooter, adminUser, adminRole, ccList);

        Response.Redirect("frmMail_Success.aspx");

    }

    void Send_email(string[] mailto, string mailFrom, string strSubject, string strSalutation, string username, string strHearder, string strMainContent, string strMainContent1, string strsignature, string strfooter, string adminUser, string adminRole, string[] ccList)
    {
        string strbody = "";
        strbody = strbody + "<html><HEAD><title>eMailTemplate</title><style>.formLabel";
        strbody = strbody + "{color:white;FONT-FAMILY:Verdana,Arial,haettenschweiler; ";
        strbody = strbody + "font-size:10pt;background-color:#737164;font-weight:normal;}";
        strbody = strbody + "</style></HEAD><body MS_POSITIONING='GridLayout'>";
        strbody = strbody + "<TABLE id='Table1' cellSpacing='0' align=center cellPadding='2' width='95%' border='1'>";
        strbody = strbody + "<TR><TD colspan=2 bgColor='#E7E7EF'>";
        strbody = strbody + "<table border=0 width=95% valign=top bgColor='#E7E7EF'>";
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=black><b>" + strSalutation + "</b>,</font></td></tr>";
        strbody = strbody + "<tr><td colspan=2 height=7></td></tr>";
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=black>" + strHearder + "</font></td></tr>";
        strbody = strbody + "<tr><td colspan=2 height=7></td></tr>";
        strbody = strbody + strMainContent;
        strbody = strbody + strMainContent1;
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=Black>&nbsp;</td></tr>";
        strbody = strbody + "<tr><td colspan=2><font face=Verdana size=2 color=Black>" + "<br><br>" + txtContactNo.Text + "</font></td></tr>";
        strbody = strbody + "<tr><td colspan=2>" + "<font face=Verdana size=2 color=red>" + strfooter + "</font></td></tr>";
        strbody = strbody + "</table>";
        strbody = strbody + "</body>";
        strbody = strbody + "</html>";
        CommonFunctions.SendMail(mailto, mailFrom, strbody, strSubject, ccList);
        strbody = "";
    }
}
