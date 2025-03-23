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

public partial class frmRegistration : System.Web.UI.Page
{
    clsMember_Logic objMember = new clsMember_Logic();
    clsCommon_Logic objCommon = new clsCommon_Logic();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["Id"] == null)
        //{
        //    Response.Redirect("frmLogin.aspx");
        //}
        //else
        //{ }
        if (!IsPostBack)
        {
            BindCountry();
            //BindState();
            //BindDistrict();         
       }
       GMDOB.Attributes.Add("readonly", "readonly()");
       txtPassword.Attributes.Add("value", txtPassword.Text.Trim());
       txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text.Trim());
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objMember.pro_MemberId = txtMemberId.Text;
        objMember.pro_Password = txtPassword.Text;
        objMember.pro_MemberName = txtMemberName.Text;
        objMember.pro_DOB = GMDOB.DateString;
        objMember.pro_AddressLine = txtAddress.Text;
        objMember.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
        objMember.pro_CountryName = ddlCountry.SelectedItem.Text;
        objMember.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
        objMember.pro_StateName = ddlState.SelectedItem.Text;
        objMember.pro_DistrictId = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
        objMember.pro_DistrictName = ddlDistrict.SelectedItem.Text;
        objMember.pro_ContactNumber = txtContactNo.Text;
        objMember.pro_EmailId = txtEmailid.Text;
        objMember.pro_Realtor = txtRealtor.Text;
        objMember.pro_Advertiser = ddlAdvertiser.SelectedItem.Text;

        if (fileUploadMemberImage.PostedFile.FileName != null)
        {
            string imgType;
            string imgName;
            int imgSize;
            string ImageRepository_FolderName;
            imgType = fileUploadMemberImage.PostedFile.ContentType;
            if (imgType == "image/jpg" || imgType == "image/jpeg" || imgType == "image/gif" || imgType == "image/bmp" || imgType == "image/x-png")
            {
                imgSize = fileUploadMemberImage.PostedFile.ContentLength;
                if (imgSize > 1000000)
                {
                    lblerror.Visible = true;
                    lblerror.Text = "Please select an image of length below 1MB";
                    return;
                }
                else
                {
                    lblerror.Visible = false;
                    imgName = Path.GetFileName(fileUploadMemberImage.PostedFile.FileName);
                    objMember.pro_MemberImage = imgName;
                }
                ImageRepository_FolderName = Server.MapPath(ConfigurationManager.AppSettings["MemberImage"]);
                if (!Directory.Exists(ImageRepository_FolderName))
                    Directory.CreateDirectory(ImageRepository_FolderName);
                fileUploadMemberImage.PostedFile.SaveAs(ImageRepository_FolderName + imgName);
            }
            else
            {
                lblerror.Visible = true;
                lblerror.Text = "Please select an image type of jpg or jpeg or gif or bmp or x-png";
            }
        }
        else
        {
            lblerror.Visible = true;
            lblerror.Text = "Please upload an image";        
        }
        Boolean boole = objMember.AddMember();
        if (boole == false)
        {
            Page.RegisterClientScriptBlock("ss", "<script>alert('Sorry record was not added please try again')</script>");
        }
        else
        {
            Page.RegisterClientScriptBlock("ss", "<script>alert('Record added successfully')</script>");
            Response.Redirect("frmRegistration_Success.aspx");
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
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
    protected void lnkbtnCheckAvailability_Click(object sender, EventArgs e)
    {
        if (txtMemberId.Text.Trim() != "")
        {
            Boolean bl = objCommon.CheckMemberId(txtMemberId.Text.Trim());

            if (bl == true)
            {
                lblExistsMemberId.Visible = true;
                lblExistsMemberId.Text = "Member ID is alresdy existing";
                return;
            }
            else
            {
                lblExistsMemberId.Visible = true;
                lblExistsMemberId.Text = "OK You can use this Member ID";
            }
        }
        else
        {
            lblerror.Text = "Please enter Member ID";
            lblerror.Visible = true;
            return;
        }
    }
}
