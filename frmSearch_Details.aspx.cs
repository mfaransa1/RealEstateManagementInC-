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

public partial class frmSearch_Details : System.Web.UI.Page
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
        DataSet dsBuilding = objBuilding.GetBuildingTypeName();
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
        string a = ViewState["PropertyId"].ToString();
        int Id=Convert.ToInt32(ViewState["PropertyId"].ToString());
        objProperty.GetSearchPropertyDetailsByPropertyId(Id);
        string MemberId = objProperty.pro_MemberId;
        objMember.GetMemberDetails(MemberId);
        txtPrice.Text = objProperty.pro_Price.ToString();
        int BuildingTypeIndex=ddlType.Items.IndexOf(ddlType.Items.FindByText(objProperty.pro_BuildingType));
        if (BuildingTypeIndex >= 0)
            ddlType.Items[BuildingTypeIndex].Selected = true;
        lblBuildingType.Text = ddlType.SelectedItem.Text;
        int CountryIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(objProperty.pro_CountryId.ToString()));
        if (CountryIndex >= 0)
            ddlCountry.Items[CountryIndex].Selected = true;
        lblCountry.Text = ddlCountry.SelectedItem.Text;
        int StateIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(objProperty.pro_StateId.ToString()));
        if (StateIndex >= 0)
            ddlState.Items[StateIndex].Selected = true;
        lblState.Text = ddlState.SelectedItem.Text;
        int DistrictIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(objProperty.pro_DistrictId.ToString()));
        if (DistrictIndex >= 0)
            ddlDistrict.Items[DistrictIndex].Selected = true;
        lblDistrict.Text = ddlDistrict.SelectedItem.Text;
        txtAge.Text = objProperty.pro_Age;
        txtBuiltInArea1.Text = objProperty.pro_BuiltinArea.ToString();
        txtValuation.Text = objProperty.pro_Valuation.ToString();
        if (objProperty.pro_RentSale == "Rent")
        {
            rbForRent.Checked = true;
            lblRentOrSale.Text = "Rent";
        }
        else if (objProperty.pro_RentSale == "Sale")
        {

            rbForSale.Checked = true;
            lblRentOrSale.Text = "Sale";
        }
        txtSummary.Text = objProperty.pro_Summary;
        txtDescription.Text = objProperty.pro_Description;
        SmallImage1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageSMALL"] + objProperty.pro_Image1;
        SmallImage2.ImageUrl = ConfigurationManager.AppSettings["PropertyImageSMALL"] + objProperty.pro_Image2;
        SmallImage3.ImageUrl = ConfigurationManager.AppSettings["PropertyImageSMALL"] + objProperty.pro_Image3;
        lblCompanyName.Text = objMember.pro_Realtor;
        lblContactNo.Text = objMember.pro_ContactNumber;
        lblContactPerson.Text = objMember.pro_MemberId;
        imgMember.ImageUrl = ConfigurationManager.AppSettings["MemberImage"] + objMember.pro_MemberImage;
        hLinkPrintThisPage.NavigateUrl = "#";
        hLinkPrintThisPage.Attributes.Add("onclick", "javascript:PrintThisPage();");
        hLinkPrintThisPage.Attributes.Add("target", "");
        string strScript;
        string s = "frmPrintSearchDeatailsPage.aspx?PropertyId=" + Id.ToString();
        strScript = "<script>function PrintThisPage() {";
        strScript += "var mywin=window.open('frmPrintSearchDeatailsPage.aspx?PropertyId="+Id.ToString()+"','Image','top=20,left=10,width=650,height=540,scrollbars=yes,resizable=yes,toolbar=no');";
       /* strScript += "mywin.document.write('<title>Property Net</title>');";
        strScript += "mywin.document.write('<table><tr><td align=center colspan=4 class=LoginTitle> Advertisement Details</td></tr>');";
        strScript += "mywin.document.write('<tr><td>Contact Person</td><td>:</td><td colspan=2>"+lblContactPerson.Text+"</td>');";
        strScript += "mywin.document.write('<td rowspan=3><img  height=120px width=100px src=\"" + ConfigurationManager.AppSettings["MemberImage"].Replace("\\", "/") + objMember.pro_MemberImage + "\"></td></tr>');";
        strScript += "mywin.document.write('<tr><td>Contact No</td><td>:</td><td colspan=2>" + lblContactNo.Text + "</td></tr>');";
        strScript += "mywin.document.write('<tr><td>Company Name</td><td>:</td><td colspan=2>" + lblCompanyName.Text + "</td></tr></table>');";
        strScript += "mywin.document.write('<input type=button value=print name=btnPrint onClick=window.print()/>');";
        strScript += "mywin.document.write('<input type=button value=close name=btnClose onClick=window.close()/>');";
        //strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["MemberImage"].Replace("\\", "/") + ViewState["MemberIMAGE"].ToString() + "\">');";*/
        strScript += "mywin.focus();}</script>";
        Page.RegisterStartupScript("StartUp", strScript);       

    }
    protected void lbtnEmailThisPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmEmailThisPage.aspx");

    }
    protected void lnkBtnReportErrors_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmReportErrors.aspx");
    }
}
