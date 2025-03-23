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
using System.IO;

public partial class frmMyProfile : System.Web.UI.Page
{
    clsMember_Logic objMember = new clsMember_Logic();
    clsCommon_Logic objCommon = new clsCommon_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginId"] != null)
            objMember.pro_MemberId = Session["LoginId"].ToString();
        else
            Response.Redirect("frmLogin.aspx");

        if (!IsPostBack)
        {
            BindCountry();
            BindState();
            BindDistrict();
            BindData();
        }
        GMDOB.Attributes.Add("readonly", "readonly()");
     }
    public void BindData()
    {
        string strAimg;
        objMember.pro_MemberId = Session["LoginId"].ToString();
        objMember.GetMemberDetails(objMember.pro_MemberId);
        txtMemberId.Text = objMember.pro_MemberId;
        txtMemberName.Text = objMember.pro_MemberName;
        GMDOB.DateString = objMember.pro_DOB;
        txtAddress.Text = objMember.pro_AddressLine;
        txtContactNo.Text = objMember.pro_ContactNumber;
        txtEmailId.Text = objMember.pro_EmailId;
        txtRealter.Text = objMember.pro_Realtor;

        if (!String.IsNullOrEmpty(objMember.pro_MemberImage))
        {
            member_b_img.Visible = true;
            lnktbn_DeleteImage.Visible = true;
            Label_Noimg.Visible = false;
            ViewState["MemberIMAGE"] = objMember.pro_MemberImage;
            strAimg = ViewState["MemberIMAGE"].ToString();
            member_b_img.NavigateUrl = "#";
            member_b_img.Attributes.Add("onclick", "javascript:showImg();");
            member_b_img.Attributes.Add("target", "");

            string strScript;
            strScript = "<script>function showImg() {";
            strScript += "var mywin=window.open('','Image','top=20,left=10,width=350,height=240,scrollbars=yes,resizable=yes,toolbar=no');";
            strScript += "mywin.document.write('<title>Property Net</title>');";
            strScript += "mywin.document.write('<img src=\"" +ConfigurationManager.AppSettings["MemberImage"].Replace("\\", "/") + ViewState["MemberIMAGE"].ToString() + "\">');";
            strScript += "mywin.focus();}</script>";
            Page.RegisterStartupScript("StartUp", strScript);
        }
        else
        {
            member_b_img.Visible = false;
            lnktbn_DeleteImage.Visible = false;
            Label_Noimg.Visible = true;
        }
        int AdvertiserIndex = ddlAdvertiser.Items.IndexOf(ddlAdvertiser.Items.FindByText(objMember.pro_Advertiser));
        if (AdvertiserIndex > 0)
        {
            ddlAdvertiser.Items[AdvertiserIndex].Selected = true;
        }
        int CountryIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(objMember.pro_CountryId.ToString()));
        if (CountryIndex > 0)
        {
            ddlCountry.Items[CountryIndex].Selected = true;
        }
        int StateIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(objMember.pro_StateId.ToString()));
        if (StateIndex > 0)
        {
            ddlState.Items[StateIndex].Selected = true;
        }
        int DistrictIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(objMember.pro_DistrictId.ToString()));
        if (DistrictIndex > 0)
        {
            ddlDistrict.Items[DistrictIndex].Selected = true;
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


    protected void lnktbn_DeleteImage_Click(object sender, EventArgs e)
    {
        string ImageRepository_FolderName = Server.MapPath(ConfigurationManager.AppSettings["MemberImage"]);
        string ImgName = ViewState["MemberIMAGE"].ToString();
        string MemberImg = ImageRepository_FolderName + ImgName;
        if (System.IO.File.Exists(MemberImg))
        {
            File.Delete(MemberImg);
        }
        objMember.DeleteMemberImage(Session["LoginId"].ToString());
        ViewState["MemberIMAGE"] = null;
        member_b_img.Visible = false;
        Label_Noimg.Visible = true;
        lnktbn_DeleteImage.Visible = false;   
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objMember.pro_MemberId = Session["LoginId"].ToString();
        objMember.pro_MemberName = txtMemberName.Text;
        objMember.pro_DOB = GMDOB.DateString;
        objMember.pro_AddressLine = txtAddress.Text;
        objMember.pro_CountryName = ddlCountry.SelectedItem.Text;
        objMember.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
        objMember.pro_StateName = ddlState.SelectedItem.Text;
        objMember.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
        objMember.pro_DistrictName = ddlDistrict.SelectedItem.Text;
        objMember.pro_DistrictId = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
        objMember.pro_ContactNumber = txtContactNo.Text;
        objMember.pro_EmailId = txtEmailId.Text;
        objMember.pro_Advertiser = ddlAdvertiser.SelectedItem.Text;
        objMember.pro_Realtor = txtRealter.Text;

        if (ViewState["MemberIMAGE"] == null)
        {

            if (fileUpLoadMemberImage.PostedFile.FileName != "")
            {
                string ImgType = fileUpLoadMemberImage.PostedFile.ContentType;
                int ImgSize = fileUpLoadMemberImage.PostedFile.ContentLength;
                string ImgName;
                string ImageRepository_Foldername;
                if (ImgType == "image/jpg" || ImgType == "image/pjpeg" || ImgType == "image/bmp" || ImgType == "image/gif" || ImgType == "image/x-png")
                {
                    if (ImgSize > 1000000)
                    {
                        Label_Noimg.Visible = true;
                        Label_Noimg.Text = "Please select an image of length below 1MB";
                        return;
                    }
                    else
                    {
                        ImgName = Path.GetFileName(fileUpLoadMemberImage.PostedFile.FileName);
                        objMember.pro_MemberImage = ImgName;
                        Label_Noimg.Visible = false;
                    }
                    ImageRepository_Foldername = Server.MapPath(ConfigurationManager.AppSettings["MemberImage"]);
                    if (!Directory.Exists(ImageRepository_Foldername))
                    {
                        Directory.CreateDirectory(ImageRepository_Foldername);
                    }
                    string MemberImg;
                    MemberImg = ImageRepository_Foldername + ImgName;
                    fileUpLoadMemberImage.PostedFile.SaveAs(MemberImg);
                }
                else
                {
                    Label_Noimg.Visible = true;
                    Label_Noimg.Text = "Please select an image type of JPG or pjpeg or bmp or gif or x-png";
                }
            }
            else
            {
                Label_Noimg.Visible = true;

            }
        }

        else 
        {
            objMember.pro_MemberImage = ViewState["MemberIMAGE"].ToString();
        }
        objMember.UpdateMember();
        member_b_img.Visible = true;
        Label_Noimg.Visible = false;
        lnktbn_DeleteImage.Visible = true;
        Response.Redirect("frmMyProfileUpdate_Success.aspx");
    }
    //protected void btnBack_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("frmLogin.aspx");
    //}
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
}
