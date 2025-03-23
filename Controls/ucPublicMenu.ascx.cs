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

public partial class Controls_ucPublicMenu : System.Web.UI.UserControl
{
    Marquee_Logic objMarquee = new Marquee_Logic();
    public clsAdvertisement_Logic objADS = new clsAdvertisement_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindMarquee();
        }
    }
    protected void BindMarquee()
    {
        DataTable dtTemp = objMarquee.GetMarqueeData().Tables[0];
        if (dtTemp.Rows.Count > 0)
        {
            DataRow dr = dtTemp.Rows[0];
            HtmlTableRow tr1 = new HtmlTableRow();
            HtmlTableCell td1 = new HtmlTableCell();
            string strMarquee = "<MARQUEE behavior='" + dr["Behavior"].ToString() + "' direction='" + dr["Direction"].ToString() + "' bgcolor='" + dr["BgColor"].ToString() + "' scrolldelay='" + dr["ScrollDelay"].ToString() + "'>";
            strMarquee += "<div style='font-size:" + dr["FontSize"].ToString() + "; color:" + dr["TextColor"].ToString() + "'><b>" + dr["Text"].ToString() + "<b></div></MARQUEE>";
            td1.InnerHtml = strMarquee;
            tr1.Cells.Add(td1);
            tbl1.Rows.Insert(1, tr1);
        }
    }
}
