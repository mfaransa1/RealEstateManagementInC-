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

public partial class frmPropertyAdProfile_Add : System.Web.UI.Page
{
    clsBuildingType_Logic objBuilding = new clsBuildingType_Logic();
    clsCommon_Logic objCommon = new clsCommon_Logic();
    clsPropertyAd_Logic objProperty = new clsPropertyAd_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginId"] != null)
            objProperty.pro_MemberId= Session["LoginId"].ToString();
        else
            Response.Redirect("frmLogin.aspx");
        if (!IsPostBack)
        {
            BindCountry();
            BindState();
            BindDistrict();
            BindBuildingType();
            BindRoomType();
        }       
    }
    void BindCountry()
    {
        DataSet dsCountry = objCommon.GetCountryName();
        ddlCountry.DataSource = dsCountry.Tables[0];
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Select");
    }

    void BindState()
    {
        DataSet dsState = objCommon.GetStateName();
        ddlState.DataSource = dsState.Tables[0];
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateId";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "Select");
    }

    void BindDistrict()
    {
        DataSet dsDistrict = objCommon.GetDistrictName();
        ddlDistrict.DataSource = dsDistrict.Tables[0];
        ddlDistrict.DataTextField = "DistrictName";
        ddlDistrict.DataValueField = "DistrictId";
        ddlDistrict.DataBind();
        ddlDistrict.Items.Insert(0, "Select");
    }
    void BindBuildingType()
    {
        DataSet dsBuildingType = objBuilding.GetBuildingTypeName();
        ddlBuildingType.DataSource = dsBuildingType.Tables[0];
        ddlBuildingType.DataTextField = "BuildingType_Name";
        ddlBuildingType.DataValueField = "Building_Id";
        ddlBuildingType.DataBind();
        ddlBuildingType.Items.Insert(0, "Select");
    }
    void BindRoomType()
    {
        DataSet dsRoomType = objBuilding.GetRoomType();
        ddlRoomType.DataSource = dsRoomType.Tables[0];
        ddlRoomType.DataTextField = "RoomTypeName";
        ddlRoomType.DataValueField = "Id";
        ddlRoomType.DataBind();
        ListItem li = new ListItem("Select", "0");
        ddlRoomType.Items.Insert(0, li);
        //ddlRoomType.Items.Insert(0, "Select");
       // ddlRoomType.Items[1].Enabled = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {       
         objProperty.pro_MemberId = Session["LoginId"].ToString();
         objProperty.pro_PropertyType = ddlPropertyType.SelectedItem.Text;
         if (ddlPropertyType.SelectedItem.Text == "Commercial")
         {
             objProperty.pro_RoomType = "Commercial";
         }
         else
         {
             objProperty.pro_RoomType = ddlRoomType.SelectedItem.Text;
         }         
         objProperty.pro_RentSale = ddlRentSale.SelectedItem.Text;         
         objProperty.pro_BuildingType = ddlBuildingType.SelectedItem.Text;
         objProperty.pro_HsNo = txtBuildingHsNo.Text.Trim();
         objProperty.pro_StreetName = txtStreetName.Text.Trim();
         objProperty.pro_UnitNo = txtUnitno.Text.Trim()+txtUnitno1.Text.Trim();
         objProperty.pro_BuildingEstateName = txtBuildingEstateName.Text.Trim();
         objProperty.pro_PostalCode = txtPostalCode.Text.Trim();
         objProperty.pro_CountryName = ddlCountry.SelectedItem.Text;
         objProperty.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
         objProperty.pro_StateName = ddlState.SelectedItem.Text;
         objProperty.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
         objProperty.pro_DistrictName = ddlDistrict.SelectedItem.Text;
         objProperty.pro_DistrictId = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
         if (txtPostalCode.Text.Trim() == "")
         {             
                 txtPrice.Text = Convert.ToString(0);             
         }
         else
         {
             try
             {
                 objProperty.pro_Price = Convert.ToDecimal(txtPrice.Text);
             }
             catch
             {
                 lblError.Visible = true;
                 lblError.Text = "Invalid Price";
                 return;
             }
         }
         if (txtValuation.Text.Trim() != "")
         {
             try
             {
                 objProperty.pro_Valuation = Convert.ToDecimal(txtValuation.Text);
             }
             catch
             {
                 lblError.Visible = true;
                 lblError.Text = "Please Enter valid Valuation";
                 return;
             }

         }
         else
         {
             objProperty.pro_Valuation = 0;
         }
         if (txtBuiltinArea.Text.Trim() != "")
         {
             try
             {
                 objProperty.pro_BuiltinArea = Convert.ToDecimal(txtBuiltinArea.Text);
             }
             catch
             {
                 lblError.Visible = true;
                 lblError.Text = "Please Enter valid Built in Area";
                 return;
             }

         }
         else
         {
             objProperty.pro_BuiltinArea = 0;
         }
         
        
         objProperty.pro_Age = txtAge.Text.Trim();
         objProperty.pro_Tenure =Convert.ToInt32(ddlTenure.SelectedItem.Text);
         if (txtBedrooms.Text.Trim() != "")
         {
             try
             {
                 objProperty.pro_NoOfBedrooms = Convert.ToInt32(txtBedrooms.Text);
             }
             catch
             {
                 lblError.Visible = true;
                 lblError.Text = "Please Enter valid Number Of Bed Rooms";
                 return;
             }

         }
         else
         {
             objProperty.pro_NoOfBedrooms = 0;
         }
         
         objProperty.pro_Summary = txtSummary.Text.Trim();
         objProperty.pro_Description = txtDescription.Text.Trim();
        //objProperty.pro_StatusId=
        //objProperty.pro_Image1=FileUpload1.
         if (fileuploadImage1.PostedFile.FileName != "")
         {
             string imgType;
             int imgSize;
             string imgName1;
             string Image_Repository_FolderName1, Image_Repository_FolderName2, Image_Repository_FolderName3;
             imgType = fileuploadImage1.PostedFile.ContentType;
             if (imgType == "image/pjpeg" || imgType == "image/JPG" || imgType == "image/bmp" || imgType == "image/gif" || imgType == "image/x-png")
             {
                 imgSize = fileuploadImage1.PostedFile.ContentLength;
                 if (imgSize > 1000000)
                 {
                     lblError.Visible = true;
                     lblError.Text = "please upload an image of size below 1MB only";
                     return;
                 }
                 else
                 {
                     imgName1 = Path.GetFileName(fileuploadImage1.PostedFile.FileName);
                     objProperty.pro_Image1 = imgName1;
                     objProperty.pro_ImageDescription1 = txtDescription1.Text.Trim();
                     objProperty.pro_SmallImage1 = imgName1;
                     objProperty.pro_ThumbImage1 = imgName1;                     
                     lblError.Visible = false;
                 }
                 Image_Repository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
                 if (!Directory.Exists(Image_Repository_FolderName1))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName1);
                 }
                 fileuploadImage1.PostedFile.SaveAs(Image_Repository_FolderName1 + imgName1);
                 Image_Repository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
                 if (!Directory.Exists(Image_Repository_FolderName2))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName2);
                 }
                 fileuploadImage1.PostedFile.SaveAs(Image_Repository_FolderName2 + imgName1);
                 Image_Repository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
                 if (!Directory.Exists(Image_Repository_FolderName3))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName3);
                 }
                 fileuploadImage1.PostedFile.SaveAs(Image_Repository_FolderName3 + imgName1);

             }
             else
             {
                 lblError.Visible = true;
                 lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
             }
         }
        

         if (fileuploadImage2.PostedFile.FileName != "")
         {
             string imgType;
             int imgSize;
             string imgName2;
             string Image_Repository_FolderName1, Image_Repository_FolderName2, Image_Repository_FolderName3;
             imgType = fileuploadImage2.PostedFile.ContentType;
             if (imgType == "image/pjpeg" || imgType == "image/JPG" || imgType == "image/bmp" || imgType == "image/gif" || imgType == "image/x-png")
             {
                 imgSize = fileuploadImage2.PostedFile.ContentLength;
                 if (imgSize > 1000000)
                 {
                     lblError.Visible = true;
                     lblError.Text = "please upload an image of size below 1MB only";
                     return;
                 }
                 else
                 {
                     imgName2 = Path.GetFileName(fileuploadImage2.PostedFile.FileName);
                     objProperty.pro_Image2 = imgName2;
                     objProperty.pro_ImageDescription2 = txtDescription2.Text.Trim();
                     objProperty.pro_SmallImage2 = imgName2;
                     objProperty.pro_ThumbImage2 = imgName2;                     
                     lblError.Visible = false;
                 }
                 Image_Repository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
                 if (!Directory.Exists(Image_Repository_FolderName1))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName1);
                 }
                 fileuploadImage2.PostedFile.SaveAs(Image_Repository_FolderName1 + imgName2);
                 Image_Repository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
                 if (!Directory.Exists(Image_Repository_FolderName2))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName2);
                 }
                 fileuploadImage2.PostedFile.SaveAs(Image_Repository_FolderName2 + imgName2);
                 Image_Repository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
                 if (!Directory.Exists(Image_Repository_FolderName3))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName3);
                 }
                 fileuploadImage2.PostedFile.SaveAs(Image_Repository_FolderName3 + imgName2);

             }
             else
             {
                 lblError.Visible = true;
                 lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
             }
         }
         if (fileuploadImage3.PostedFile.FileName != "")
         {
             string imgType;
             int imgSize;
             string imgName3;
             string Image_Repository_FolderName1,Image_Repository_FolderName2,Image_Repository_FolderName3;
             imgType = fileuploadImage3.PostedFile.ContentType;
             if (imgType == "image/pjpeg" || imgType == "image/JPG" || imgType == "image/bmp" || imgType == "image/gif" || imgType == "image/x-png")
             {
                 imgSize = fileuploadImage3.PostedFile.ContentLength;
                 if (imgSize > 1000000)
                 {
                     lblError.Visible = true;
                     lblError.Text = "please upload an image of size below 1MB only";
                     return;
                 }
                 else
                 {
                     imgName3 = Path.GetFileName(fileuploadImage3.PostedFile.FileName);
                     objProperty.pro_Image3 = imgName3;
                     objProperty.pro_ImageDescription3 = txtDescription3.Text.Trim();
                     objProperty.pro_SmallImage3 = imgName3;
                     objProperty.pro_ThumbImage3 = imgName3;
                     lblError.Visible = false;
                 }
                 Image_Repository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
                 if (!Directory.Exists(Image_Repository_FolderName1))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName1);
                 }
                 fileuploadImage3.PostedFile.SaveAs(Image_Repository_FolderName1 + imgName3);
                 Image_Repository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
                 if (!Directory.Exists(Image_Repository_FolderName2))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName2);
                 }
                 fileuploadImage3.PostedFile.SaveAs(Image_Repository_FolderName2 + imgName3);
                 Image_Repository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
                 if (!Directory.Exists(Image_Repository_FolderName3))
                 {
                     Directory.CreateDirectory(Image_Repository_FolderName3);
                 }
                 fileuploadImage3.PostedFile.SaveAs(Image_Repository_FolderName3 + imgName3);

             }
             else
             {
                 lblError.Visible = true;
                 lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
             }
         }
         if (fileuploadImage1.PostedFile.FileName == "" && fileuploadImage2.PostedFile.FileName == "" && fileuploadImage3.PostedFile.FileName == "")
         {  
             lblError.Visible = true;
             lblError.Text = "Please upload image";
             return;
         }
         objProperty.AddProperty();
         Response.Redirect("frmPropertyAdList.aspx");

   
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
    protected void ddlPropertyType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPropertyType.SelectedItem.Text != "Select")
        {
            if (ddlPropertyType.SelectedItem.Text == "Commercial")
            {               
                ddlRoomType.Enabled = false;
                lblNotApplicable.Visible = true;
                RequiredFieldValidator2.InitialValue = "";

            }
            else
            {
                RequiredFieldValidator2.InitialValue = "0";
                ddlRoomType.Enabled = true;
                lblNotApplicable.Visible = false;
            }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmPropertyAdList.aspx");
    }
}
