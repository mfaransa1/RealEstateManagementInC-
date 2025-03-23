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

public partial class frmPropertyAdProfile_Update : System.Web.UI.Page
{
    clsBuildingType_Logic objBuilding = new clsBuildingType_Logic();
    clsCommon_Logic objCommon = new clsCommon_Logic();
    clsPropertyAd_Logic objProperty = new clsPropertyAd_Logic();
    clsMember_Logic objMember = new clsMember_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginId"] != null)
            objMember.pro_MemberId = Session["LoginId"].ToString();
        else
            Response.Redirect("frmLogin.aspx");

        if(!IsPostBack)
        {
            
            if (Request["Id"] != null)
            {
                ViewState["Id"] = Request["Id"].ToString();
            }
            else
            {
                Response.Redirect("frmPropertyAdList.aspx");
            }
        BindCountry();
        BindState();
        BindDistrict();
        BindRoomType();
        BindBuildingType();
        BindData();
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
       
    }
    void BindData()
    {
        objProperty.pro_PropertyId = Convert.ToInt32(ViewState["Id"].ToString());
        objProperty.GetPropertyDetails();        
        int PropertyTypeIndex = ddlPropertyType.Items.IndexOf(ddlPropertyType.Items.FindByText(objProperty.pro_PropertyType));
        if (PropertyTypeIndex > 0)
        {
            ddlPropertyType.Items[PropertyTypeIndex].Selected = true;
        }
        
        if (ddlPropertyType.SelectedItem.Text == "Commercial")
        {
            ddlRoomType.Enabled = false;
            RequiredFieldValidator2.InitialValue = "";
            lblNotApplicable.Visible = true;
        }
        else
        {
            RequiredFieldValidator2.InitialValue = "0";
            lblNotApplicable.Visible = false;
            ddlRoomType.Enabled = true;
            int RoomTypeIndex = ddlRoomType.Items.IndexOf(ddlRoomType.Items.FindByText(objProperty.pro_RoomType));
            if (RoomTypeIndex > 0)
            {
                ddlRoomType.Items[RoomTypeIndex].Selected = true;
            }
        }
        int BuildingTypeIndex = ddlBuildingType.Items.IndexOf(ddlBuildingType.Items.FindByText(objProperty.pro_BuildingType));
        if (BuildingTypeIndex > 0)
        {
            ddlBuildingType.Items[BuildingTypeIndex].Selected = true;
        }
        int RentOrSaleTypeIndex = ddlRentSale.Items.IndexOf(ddlRentSale.Items.FindByText(objProperty.pro_RentSale));
        if (RentOrSaleTypeIndex > 0)
        {
            ddlRentSale.Items[RentOrSaleTypeIndex].Selected = true;
        }
        txtBuildingHsNo.Text=objProperty.pro_HsNo;
        txtStreetName.Text=objProperty.pro_StreetName;
        txtUnitno.Text=objProperty.pro_UnitNo;
        txtBuildingEstateName.Text=objProperty.pro_BuildingEstateName;
        txtPostalCode.Text=objProperty.pro_PostalCode;
        int CountryIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(objProperty.pro_CountryId.ToString()));
        if (CountryIndex > 0)
        {
            ddlCountry.Items[CountryIndex].Selected = true;
        }
        int StateIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(objProperty.pro_StateId.ToString()));
        if (StateIndex > 0)
        {
            ddlState.Items[StateIndex].Selected = true;
        }
        int DistrictIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(objProperty.pro_DistrictId.ToString()));
        if (DistrictIndex > 0)
        {
            ddlDistrict.Items[DistrictIndex].Selected = true;
        }
        txtPrice.Text=objProperty.pro_Price.ToString();
        txtValuation.Text=objProperty.pro_Valuation.ToString();
        txtBuiltinArea.Text = objProperty.pro_BuiltinArea.ToString();       
        txtAge.Text=objProperty.pro_Age;
       // objProperty.pro_Tenure = ddlTenure.SelectedItem.Text;
        int TenureIndex = ddlTenure.Items.IndexOf(ddlTenure.Items.FindByText(objProperty.pro_Tenure.ToString()));
        if (TenureIndex > 0)
        {
            ddlTenure.Items[TenureIndex].Selected = true;
        }

        txtBedrooms.Text=objProperty.pro_NoOfBedrooms.ToString();
        txtSummary.Text=objProperty.pro_Summary;
        txtDescription.Text=objProperty.pro_Description;
        string strAimg1, strAimg2, strAimg3;
        if (!String.IsNullOrEmpty(objProperty.pro_Image1))
        {
            member_b_img1.Visible = true;
            lnkbtn_DeleteImage1.Visible = true;
            Label_Noimg1.Visible = false;
            ViewState["PropertyIMAGE1"] = objProperty.pro_Image1;
            txtDescription1.Text = objProperty.pro_ImageDescription1;
            strAimg1 = ViewState["PropertyIMAGE1"].ToString();
            member_b_img1.NavigateUrl = "#";
            member_b_img1.Attributes.Add("onclick", "javascript:showImg1();");
            member_b_img1.Attributes.Add("target1", "");
            
            string strScript;
            strScript = "<script>function showImg1() {";
            strScript += "var mywin=window.open('','Image','top=20,left=10,width=350,height=240,scrollbars=yes,resizable=yes,toolbar=no');";
            strScript += "mywin.document.write('<title>Property Net</title>');";
            strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageBIG"].Replace("\\", "/") + ViewState["PropertyIMAGE1"].ToString() + "\">');";
            strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageSMALL"].Replace("\\", "/") + ViewState["PropertyIMAGE1"].ToString() + "\">');";
            strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageTHUMB"].Replace("\\", "/") + ViewState["PropertyIMAGE1"].ToString() + "\">');";            
            strScript += "mywin.focus();}</script>";
            Page.RegisterStartupScript("StartUp1", strScript);
        }
        else
        {
            member_b_img1.Visible = false;
            lnkbtn_DeleteImage1.Visible = false;
            Label_Noimg1.Visible = true;
        }
        if (!String.IsNullOrEmpty(objProperty.pro_Image2))
        {
            member_b_img2.Visible = true;
            lnkbtn_DeleteImage2.Visible = true;
            Label_Noimg2.Visible = false;
            ViewState["PropertyIMAGE2"] = objProperty.pro_Image2;
            txtDescription2.Text = objProperty.pro_ImageDescription2;
            strAimg2 = ViewState["PropertyIMAGE2"].ToString();
            member_b_img2.NavigateUrl = "#";
            member_b_img2.Attributes.Add("onclick", "javascript:showImg2();");
            member_b_img2.Attributes.Add("target2", "");

            string strScript;
            strScript = "<script>function showImg2() {";
            strScript += "var mywin=window.open('','Image','top=20,left=10,width=350,height=240,scrollbars=yes,resizable=yes,toolbar=no');";
            strScript += "mywin.document.write('<title>Property Net</title>');";
            strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageBIG"].Replace("\\", "/") + ViewState["PropertyIMAGE2"] .ToString()+ "\">');";
           // strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageSMALL"].Replace("\\", "/") + ViewState["PropertyIMAGE2"].ToString() + "\">');";
            //strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageTHUMB"].Replace("\\", "/") + ViewState["PropertyIMAGE2"].ToString() + "\">');";
            strScript += "mywin.focus();}</script>";
            Page.RegisterStartupScript("StartUp2", strScript);
        }
        else
        {
            member_b_img2.Visible = false;
            lnkbtn_DeleteImage2.Visible = false;
            Label_Noimg2.Visible = true;
        }
        if (!String.IsNullOrEmpty(objProperty.pro_Image3))
        {
            member_b_img3.Visible = true;
            lnkbtn_DeleteImage3.Visible = true;
            Label_Noimg3.Visible = false;
            ViewState["PropertyIMAGE3"] = objProperty.pro_Image3;
            txtDescription3.Text = objProperty.pro_ImageDescription3;
            strAimg3 = ViewState["PropertyIMAGE3"].ToString();
            member_b_img3.NavigateUrl = "#";
            member_b_img3.Attributes.Add("onclick", "javascript:showImg3();");
            member_b_img3.Attributes.Add("target3", "");

            string strScript;
            strScript = "<script>function showImg3() {";
            strScript += "var mywin=window.open('','Image','top=20,left=10,width=350,height=240,scrollbars=yes,resizable=yes,toolbar=no');";
            strScript += "mywin.document.write('<title>Property Net</title>');";
            strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageBIG"].Replace("\\", "/") + ViewState["PropertyIMAGE3"].ToString() + "\">');";
           // strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageSMALL"].Replace("\\", "/") + ViewState["PropertyIMAGE3"].ToString() + "\">');";
           // strScript += "mywin.document.write('<img src=\"" + ConfigurationManager.AppSettings["PropertyImageTHUMB"].Replace("\\", "/") + ViewState["PropertyIMAGE3"].ToString() + "\">');";
            strScript += "mywin.focus();}</script>";
            Page.RegisterStartupScript("StartUp3", strScript);
        }
        else
        {
            member_b_img3.Visible = false;
            lnkbtn_DeleteImage3.Visible = false;
            Label_Noimg3.Visible = true;
        }
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        objCommon.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
        BindState();
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        objCommon.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
        BindDistrict();
    }    
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objProperty.pro_MemberId = Session["LoginId"].ToString();
        objProperty.pro_PropertyId = Convert.ToInt32(ViewState["Id"].ToString());
        objProperty.pro_PropertyType = ddlPropertyType.SelectedItem.Text;        
        if (ddlPropertyType.SelectedItem.Text == "Commercial")
        {
            //objProperty.pro_RoomTypeId = 3;
            objProperty.pro_RoomType = "Commercial";            

        }
        else
        {
            objProperty.pro_RoomType = ddlRoomType.SelectedItem.Text;
            //objProperty.pro_RoomTypeId = Convert.ToInt32(ddlRoomType.SelectedItem.Value);
        }

        objProperty.pro_RentSale = ddlRentSale.SelectedItem.Text;
        
        objProperty.pro_BuildingType = ddlBuildingType.SelectedItem.Text;
        objProperty.pro_HsNo = txtBuildingHsNo.Text.Trim();
        objProperty.pro_StreetName = txtStreetName.Text.Trim();
        objProperty.pro_UnitNo = txtUnitno.Text.Trim() + txtUnitno1.Text.Trim();
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
        if (ViewState["PropertyIMAGE1"] == null)
        {
            if (fileuploadImage1.PostedFile.FileName != "")
            {
                string imgType;
                int imgSize;
                string imgName;
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
                        imgName = Path.GetFileName(fileuploadImage1.PostedFile.FileName);
                        objProperty.pro_Image1 = imgName;
                        objProperty.pro_ImageDescription1 = txtDescription1.Text.Trim();
                        lblError.Visible = false;
                    }
                    Image_Repository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
                    if (!Directory.Exists(Image_Repository_FolderName1))
                    {
                        Directory.CreateDirectory(Image_Repository_FolderName1);
                    }
                    fileuploadImage1.PostedFile.SaveAs(Image_Repository_FolderName1 + imgName);
                    Image_Repository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
                    if (!Directory.Exists(Image_Repository_FolderName2))
                    {
                        Directory.CreateDirectory(Image_Repository_FolderName2);
                    }
                    fileuploadImage1.PostedFile.SaveAs(Image_Repository_FolderName2 + imgName);
                    Image_Repository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
                    if (!Directory.Exists(Image_Repository_FolderName3))
                    {
                        Directory.CreateDirectory(Image_Repository_FolderName3);
                    }
                    fileuploadImage1.PostedFile.SaveAs(Image_Repository_FolderName3 + imgName);

                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
                }
            }
        }
        else
        {
            objProperty.pro_Image1 = ViewState["PropertyIMAGE1"].ToString();
            objProperty.pro_ImageDescription1 = txtDescription1.Text.ToString();
        }
        if (ViewState["PropertyIMAGE2"] == null)
        {
        if (fileuploadImage2.PostedFile.FileName != "")
        {
            string imgType;
            int imgSize;
            string imgName;
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
                    imgName = Path.GetFileName(fileuploadImage2.PostedFile.FileName);
                    objProperty.pro_Image2 = imgName;
                    objProperty.pro_ImageDescription2 = txtDescription2.Text.Trim();
                    lblError.Visible = false;
                }
                Image_Repository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
                if (!Directory.Exists(Image_Repository_FolderName1))
                {
                    Directory.CreateDirectory(Image_Repository_FolderName1);
                }
                fileuploadImage2.PostedFile.SaveAs(Image_Repository_FolderName1 + imgName);
                Image_Repository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
                if (!Directory.Exists(Image_Repository_FolderName2))
                {
                    Directory.CreateDirectory(Image_Repository_FolderName2);
                }
                fileuploadImage2.PostedFile.SaveAs(Image_Repository_FolderName2 + imgName);
                Image_Repository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
                if (!Directory.Exists(Image_Repository_FolderName3))
                {
                    Directory.CreateDirectory(Image_Repository_FolderName3);
                }
                fileuploadImage2.PostedFile.SaveAs(Image_Repository_FolderName3 + imgName);

            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
            }
        }
    }
    else
    {
        objProperty.pro_Image2 = ViewState["PropertyIMAGE2"].ToString();
        objProperty.pro_ImageDescription2 = txtDescription2.Text.Trim();        
    }
    if (ViewState["PropertyIMAGE3"] == null)
    {
        if (fileuploadImage3.PostedFile.FileName != "")
        {
            string imgType;
            int imgSize;
            string imgName;
            string Image_Repository_FolderName1, Image_Repository_FolderName2, Image_Repository_FolderName3;
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
                    imgName = Path.GetFileName(fileuploadImage3.PostedFile.FileName);
                    objProperty.pro_Image3 = imgName;
                    objProperty.pro_ImageDescription3 = txtDescription3.Text.Trim();
                    lblError.Visible = false;
                }
                Image_Repository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
                if (!Directory.Exists(Image_Repository_FolderName1))
                {
                    Directory.CreateDirectory(Image_Repository_FolderName1);
                }
                fileuploadImage3.PostedFile.SaveAs(Image_Repository_FolderName1 + imgName);
                Image_Repository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
                if (!Directory.Exists(Image_Repository_FolderName2))
                {
                    Directory.CreateDirectory(Image_Repository_FolderName2);
                }
                fileuploadImage3.PostedFile.SaveAs(Image_Repository_FolderName2 + imgName);
                Image_Repository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
                if (!Directory.Exists(Image_Repository_FolderName3))
                {
                    Directory.CreateDirectory(Image_Repository_FolderName3);
                }
                fileuploadImage3.PostedFile.SaveAs(Image_Repository_FolderName3 + imgName);

            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
            }
        }
    }
    else
    {
        objProperty.pro_Image3 = ViewState["PropertyIMAGE3"].ToString();
        objProperty.pro_ImageDescription3 = txtDescription3.Text.Trim();
    }
       // if (fileuploadImage1.PostedFile.FileName == "" && fileuploadImage2.PostedFile.FileName == "" && fileuploadImage3.PostedFile.FileName == "")
        if(ViewState["PropertyIMAGE1"]==null &&  ViewState["PropertyIMAGE2"]==null  && ViewState["PropertyIMAGE3"]==null) 
        {
            lblError.Visible = true;
            lblError.Text = "Please upload image";
            return;
        }
        objProperty.UpdateProperty();
        Response.Redirect("frmPropertyAdList.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmPropertyAdList.aspx");
    }
    protected void lnkbtn_DeleteImage1_Click(object sender, EventArgs e)
    {

        string ImageRepository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
        string ImgName1 = ViewState["PropertyIMAGE1"].ToString();
        string PropertyImg1 = ImageRepository_FolderName1 + ImgName1;
        if (System.IO.File.Exists(PropertyImg1))
        {
            File.Delete(PropertyImg1);
        }
        string ImageRepository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);       
        string PropertyImg2 = ImageRepository_FolderName2 + ImgName1;
        if (System.IO.File.Exists(PropertyImg2))
        {
            File.Delete(PropertyImg2);
        }
        string ImageRepository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);     
        string PropertyImg3 = ImageRepository_FolderName3 + ImgName1;
        if (System.IO.File.Exists(PropertyImg3))
        {
            File.Delete(PropertyImg3);
        }        
        objProperty.DeletePropertyImage1(Convert.ToInt32(ViewState["Id"].ToString()));
        ViewState["PropertyIMAGE1"] = null;        
        member_b_img1.Visible = false;
        Label_Noimg1.Visible = true;
        lnkbtn_DeleteImage1.Visible = false;   
    }
    protected void lnkbtn_DeleteImage2_Click(object sender, EventArgs e)
    {
        string ImageRepository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
        string ImgName1 = ViewState["PropertyIMAGE2"].ToString();
        string PropertyImg1 = ImageRepository_FolderName1 + ImgName1;
        if (System.IO.File.Exists(PropertyImg1))
        {
            File.Delete(PropertyImg1);
        }
        string ImageRepository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
        string PropertyImg2 = ImageRepository_FolderName2 + ImgName1;
        if (System.IO.File.Exists(PropertyImg2))
        {
            File.Delete(PropertyImg2);
        }
        string ImageRepository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
        string PropertyImg3 = ImageRepository_FolderName3 + ImgName1;
        if (System.IO.File.Exists(PropertyImg3))
        {
            File.Delete(PropertyImg3);
        }
        objProperty.DeletePropertyImage2(Convert.ToInt32(ViewState["Id"].ToString()));
        ViewState["PropertyIMAGE2"] = null;
        member_b_img2.Visible = false;
        Label_Noimg2.Visible = true;
        lnkbtn_DeleteImage2.Visible = false; 
    }
    protected void lnkbtn_DeleteImage3_Click(object sender, EventArgs e)
    {
        string ImageRepository_FolderName1 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageBIG"]);
        string ImgName1 = ViewState["PropertyIMAGE3"].ToString();
        string PropertyImg1 = ImageRepository_FolderName1 + ImgName1;
        if (System.IO.File.Exists(PropertyImg1))
        {
            File.Delete(PropertyImg1);
        }
        string ImageRepository_FolderName2 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageSMALL"]);
        string PropertyImg2 = ImageRepository_FolderName2 + ImgName1;
        if (System.IO.File.Exists(PropertyImg2))
        {
            File.Delete(PropertyImg2);
        }
        string ImageRepository_FolderName3 = Server.MapPath(ConfigurationManager.AppSettings["PropertyImageTHUMB"]);
        string PropertyImg3 = ImageRepository_FolderName3 + ImgName1;
        if (System.IO.File.Exists(PropertyImg3))
        {
            File.Delete(PropertyImg3);
        }
        objProperty.DeletePropertyImage3(Convert.ToInt32(ViewState["Id"].ToString()));
        ViewState["PropertyIMAGE3"] = null;
        member_b_img3.Visible = false;
        Label_Noimg3.Visible = true;
        lnkbtn_DeleteImage3.Visible = false; 
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
}
