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

public partial class Controls_ucPropertySearch : System.Web.UI.UserControl
{
    clsCommon_Logic objCommon = new clsCommon_Logic();
    clsPropertyAd_Logic objProperty = new clsPropertyAd_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindDistrict();
    }
    public void BindDistrict()
    {
        DataSet dsDistrict = objCommon.GetDistrictName();
        ddlDistrict.DataSource = dsDistrict.Tables[0];
        ddlDistrict.DataTextField = "DistrictName";
        ddlDistrict.DataValueField = "DistrictId";
        ddlDistrict.DataBind();
        ddlDistrict.Items.Insert(0, "Select");
    }
    protected void ImgBtnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        if (ddlDistrict.SelectedItem.Text != "Select")
        {
            objProperty.pro_DistrictName = ddlDistrict.SelectedItem.Text;
            objProperty.pro_DistrictId = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
        }

        objProperty.pro_PropertyType = ddlCategery.SelectedItem.Text;

        if (txtPriceFrom.Text.Trim() != "")
        {
            objProperty.pro_PriceFrom = Convert.ToDecimal(txtPriceFrom.Text);
        }
        if (txtPriceTo.Text.Trim() != "")
        {
            objProperty.pro_PriceTo = Convert.ToDecimal(txtPriceTo.Text);
        }
    }
}
