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

public partial class frmCommercialProperty : System.Web.UI.Page
{
    clsCommon_Logic objCommon = new clsCommon_Logic();
    clsPropertyAd_Logic objProperty = new clsPropertyAd_Logic();
    protected string ThumbImgFolder;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCountry();
            BindState();
            BindDistrict();
            BindData();
            BindDListCommercial();
            
        }

    }
    public void BindCountry()
    {
        DataSet dsCountry = objCommon.GetCountryName();
        ddlCountry.DataSource = dsCountry.Tables[0];
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Select");
    }
    public void BindState()
    {
        DataSet dsState = objCommon.GetStateName();
        ddlState.DataSource = dsState.Tables[0];
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateId";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "Select");
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
    string imagename;
    void BindData()
    {
        ThumbImgFolder = ConfigurationManager.AppSettings["PropertyImageTHUMB"];

        DataSet dsPropertyList = objProperty.GetCommercialPropertyList();
        dListCommercialProperty.DataSource = dsPropertyList.Tables[0];
        dListCommercialProperty.DataBind();

        for (int i = 0; i < dListCommercialProperty.Items.Count; i++)
        {
            imagename = dsPropertyList.Tables[0].Rows[i]["Image1"].ToString();
            Image img = (Image)dListCommercialProperty.Items[i].FindControl("imgProperty");
            img.ImageUrl = ThumbImgFolder + imagename;
        }
    }
    void BindDListCommercial()
    {
        DataSet dsCommercialDataList = objProperty.GetCommercialInDataList();
        dListCommercial.DataSource = dsCommercialDataList.Tables[0];
        dListCommercial.DataBind();
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCountry.SelectedItem.Text != "Select")
        {
            objCommon.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            BindState();
        }
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlState.SelectedItem.Text != "Select")
        {
            objCommon.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
            BindDistrict();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlType.SelectedItem.Text != "Select")
        {
            objProperty.pro_RentSale = ddlType.SelectedItem.Text;
        }
        if (ddlCountry.SelectedItem.Text != "Select")
        {
            objProperty.pro_CountryName = ddlCountry.SelectedItem.Text;
            objProperty.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
        }
        if (ddlState.SelectedItem.Text != "Select")
        {
            objProperty.pro_StateName = ddlState.SelectedItem.Text;
            objProperty.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
        }
        if (ddlDistrict.SelectedItem.Text != "Select")
        {
            objProperty.pro_DistrictName = ddlDistrict.SelectedItem.Text;
            objProperty.pro_DistrictId = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
        }
        if (ddlTenure.SelectedItem.Text != "Select")
        {
            objProperty.pro_Tenure = Convert.ToInt32(ddlTenure.SelectedItem.Text);
        }
        if (txtPriceFrom.Text.Trim() != "")
        {
            objProperty.pro_PriceFrom = Convert.ToDecimal(txtPriceFrom.Text);
        }
        if (txtPriceTo.Text.Trim() != "")
        {
            objProperty.pro_PriceTo = Convert.ToDecimal(txtPriceTo.Text);
        }
        if (txtValuationFrom.Text.Trim() != "")
        {
            objProperty.pro_ValuationFrom = Convert.ToDecimal(txtValuationFrom.Text);
        }
        if (txtValuationTo.Text.Trim() != "")
        {
            objProperty.pro_ValuationTo = Convert.ToDecimal(txtValuationTo.Text);
        }
        
        if (txtBuiltInAreaFrom.Text.Trim() != "")
        {
            objProperty.pro_BuiltinAreaFrom = Convert.ToDecimal(txtBuiltInAreaFrom.Text);
        }
        if (txtBuiltInAreaTo.Text.Trim() != "")
        {
            objProperty.pro_BuiltinAreaTo = Convert.ToDecimal(txtBuiltInAreaTo.Text);
        }
        DataSet dsCommercialPropertyDetails = objProperty.GetCommercialPropertyDetails();
        dListCommercialProperty.DataSource = dsCommercialPropertyDetails.Tables[0];
        dListCommercialProperty.DataBind();
        ThumbImgFolder = ConfigurationManager.AppSettings["PropertyImageTHUMB"];
        for (int i = 0; i < dListCommercialProperty.Items.Count; i++)
        {
            imagename = dsCommercialPropertyDetails.Tables[0].Rows[i]["Image1"].ToString();
            Image img = (Image)dListCommercialProperty.Items[i].FindControl("imgProperty");
            img.ImageUrl = ThumbImgFolder + imagename;
        }
    }
    protected void dListCommercial_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "COMMERCIAL")
        {
            ThumbImgFolder = ConfigurationManager.AppSettings["PropertyImageTHUMB"];
            objProperty.pro_RoomType = "NotApplicable";
            objProperty.pro_BuildingType = e.CommandArgument.ToString();
            DataSet dsCommercialPropertyDetails = objProperty.GetCommercialPropertyDetails();
            dListCommercialProperty.DataSource = dsCommercialPropertyDetails.Tables[0];
            dListCommercialProperty.DataBind();
            for (int i = 0; i < dListCommercialProperty.Items.Count; i++)
            {
                imagename = dsCommercialPropertyDetails.Tables[0].Rows[i]["Image1"].ToString();
                Image img = (Image)dListCommercialProperty.Items[i].FindControl("imgProperty");
                img.ImageUrl = ThumbImgFolder + imagename;
            }
        }
    }
    protected void dListCommercialProperty_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "MOREDETAILS")
        {
            Response.Redirect("frmSearch_Details.aspx?PropertyId=" + e.CommandArgument.ToString());
        }  
    }
}
