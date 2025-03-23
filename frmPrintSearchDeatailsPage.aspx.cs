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

public partial class frmPrintSearchDeatailsPage : System.Web.UI.Page
{
    clsCommon_Logic objCommon = new clsCommon_Logic();
    clsPropertyAd_Logic objProperty = new clsPropertyAd_Logic();
    clsBuildingType_Logic objBuilding = new clsBuildingType_Logic();
    clsMember_Logic objMember = new clsMember_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["PropertyId"] != null)
        {
            ViewState["PropertyId"] = Request["PropertyId"].ToString();
        }

        else
        {
            Response.Redirect("frmResidentialProperty.aspx");
        }
        if (!IsPostBack)
        {
            BindBuildingType();
            BindCountry();
            BindState();
            BindDistrict();
            BindData();
        }
    }

    public void BindBuildingType()
    {
        DataSet dsBuilding = objBuilding.GetBuildingType();
        ddlType.DataSource = dsBuilding.Tables[0];
        ddlType.DataTextField = "BuildingType_Name";
        ddlType.DataValueField = "Building_Id";
        ddlType.DataBind();
        ddlType.Items.Insert(0, "Select");

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

    void BindData()
    {
        int Id = Convert.ToInt32(ViewState["PropertyId"].ToString());
        objProperty.GetSearchPropertyDetailsByPropertyId(Id);
        string MemberId = objProperty.pro_MemberId;
        objMember.GetMemberDetails(MemberId);
        txtPrice.Text = objProperty.pro_Price.ToString();
        int BuildingTypeIndex = ddlType.Items.IndexOf(ddlType.Items.FindByText(objProperty.pro_BuildingType));
        if (BuildingTypeIndex >= 0)
            ddlType.Items[BuildingTypeIndex].Selected = true;
        int CountryIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(objProperty.pro_CountryId.ToString()));
        if (CountryIndex >= 0)
            ddlCountry.Items[CountryIndex].Selected = true;
        int StateIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(objProperty.pro_StateId.ToString()));
        if (StateIndex >= 0)
            ddlState.Items[StateIndex].Selected = true;
        int DistrictIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(objProperty.pro_DistrictId.ToString()));
        if (DistrictIndex >= 0)
            ddlDistrict.Items[DistrictIndex].Selected = true;
        txtAge.Text = objProperty.pro_Age;
        txtBuiltInArea1.Text = objProperty.pro_BuiltinArea.ToString();
        txtValuation.Text = objProperty.pro_Valuation.ToString();
        if (objProperty.pro_RentSale == "Rent")
        {
            rbForRent.Checked = true;
        }
        else if (objProperty.pro_RentSale == "Sale")
        {

            rbForSale.Checked = true;
        }
        txtSummary.Text = objProperty.pro_Summary;
        txtDescription.Text = objProperty.pro_Description;
        SmallImage1.ImageUrl = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]) + objProperty.pro_Image1;
        SmallImage2.ImageUrl = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]) + objProperty.pro_Image2;
        SmallImage3.ImageUrl = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]) + objProperty.pro_Image3;
        lblCompanyName.Text = objMember.pro_Realtor;
        lblContactNo.Text = objMember.pro_ContactNumber;
        lblContactPerson.Text = objMember.pro_MemberId;
        imgMember.ImageUrl = Server.MapPath(ConfigurationManager.AppSettings["MemberImage"]) + objMember.pro_MemberImage;
       

    }
}
