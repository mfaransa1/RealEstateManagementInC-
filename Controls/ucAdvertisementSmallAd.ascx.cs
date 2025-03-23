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

public partial class Controls_ucAdvertisementSmallAd : System.Web.UI.UserControl
{
    public clsAdvertisement_Logic objADS = new clsAdvertisement_Logic();
    protected int count = 0;
    protected string imagesArray;
    protected string delayTIMES;
    protected string URLs;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDATA();
        }

    }
    void bindDATA()
    {

        DataSet dsTEMP = objADS.getSmallAD();
        DataRowCollection dRC = dsTEMP.Tables[0].Rows;
        DataRow dR;
        count = dRC.Count;
        if (dRC.Count > 0)
        {

            for (int i = 0; i <= dRC.Count - 2; i++)
            {
                dR = dRC[i];
                imagesArray += "'" + dR["Image"].ToString() + "',";
                delayTIMES += "'" + dR["Display_Time"].ToString() + "',";
                if (!string.IsNullOrEmpty(dR["Target_URL"].ToString()))
                    URLs += "'http://" + dR["Target_URL"].ToString() + "',";
                else
                    URLs += "'#',";

            }
            imagesArray += "'" + dRC[dRC.Count - 1]["Image"].ToString() + "'";
            delayTIMES += "'" + dRC[dRC.Count - 1]["Display_Time"].ToString() + "'";
            if (!string.IsNullOrEmpty(dRC[dRC.Count - 1]["Target_URL"].ToString()))
                URLs += "'http://" + dRC[dRC.Count - 1]["Target_URL"].ToString() + "'";
            else
                URLs += "'#'";
        }

    }
}
