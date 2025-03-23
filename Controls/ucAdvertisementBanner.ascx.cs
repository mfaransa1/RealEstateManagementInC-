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

public partial class Controls_ucAdvertisementBanner : System.Web.UI.UserControl
{
    public clsAdvertisement_Logic objADS = new clsAdvertisement_Logic();
    protected int count7 = 0;
    protected string imagesArray7;
    protected string delayTIMES7;
    protected string URLs7;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             bindDATA();
        }
    }
    void bindDATA()
    {

        DataSet dsTEMP = objADS.getBanner();
        DataRowCollection dRC = dsTEMP.Tables[0].Rows;
        DataRow dR;
        count7 = dRC.Count;
        if (dRC.Count > 0)
        {

            for (int i = 0; i <= dRC.Count - 2; i++)
            {
                dR = dRC[i];
                imagesArray7 += "'" + dR["Image"].ToString() + "',";
                delayTIMES7 += "'" + dR["Display_Time"].ToString() + "',";
                if (!string.IsNullOrEmpty(dR["Target_URL"].ToString()))
                    URLs7 += "'http://" + dR["Target_URL"].ToString() + "',";
                else
                    URLs7 += "'#',";

            }
           imagesArray7 += "'" + dRC[dRC.Count - 1]["Image"].ToString() + "'";
            delayTIMES7 += "'" + dRC[dRC.Count - 1]["Display_Time"].ToString() + "'";
            if (!string.IsNullOrEmpty(dRC[dRC.Count - 1]["Target_URL"].ToString()))
                URLs7 += "'http://" + dRC[dRC.Count - 1]["Target_URL"].ToString() + "'";
            else
                URLs7 += "'#'";
        }

    }
}
