using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
/// <summary>
/// Summary description for CommonFunctions
/// </summary>
public class CommonFunctions
{
    private clsDbConnector dbConnection;

	public CommonFunctions()
	{
        this.dbConnection = new clsDbConnector();
	}
    public static string SendMail(string[] strTo, string strFrom, string strBody, string strSubject, string[] strCc)
    {
        MailMessage MyMail = new MailMessage();
        SmtpClient SmtpMail = new SmtpClient();

        string strToAdd = "";
        for (int intI = 0; intI < strTo.Length; intI++)
        {
            strToAdd += strTo[intI] + ",";
        }
        strToAdd = strToAdd.Substring(0, strToAdd.Length - 1);
        MyMail.To.Add(strToAdd);

        string strCCAdd = "";
        for (int intI = 0; intI < strCc.Length; intI++)
        {
            strCCAdd += strCc[intI] + ",";
        }
        strCCAdd = strCCAdd.Substring(0, strCCAdd.Length - 1);
        if (strCCAdd != "")
            MyMail.CC.Add(strCCAdd);

        SmtpMail.Host = ConfigurationManager.AppSettings["SMTPServerIPAddress"].ToString();
        SmtpMail.Port = 25;
        MailAddress FromAdd = new MailAddress(strFrom);
        MyMail.From = FromAdd;
        MyMail.Subject = strSubject;
        MyMail.IsBodyHtml = true;
        MyMail.Body = strBody;
        try
        {
            SmtpMail.Send(MyMail);
            return "success";
        }
        catch (Exception Ex)
        {
            string strError = Ex.Message;
            return "";
        }
    }
}
