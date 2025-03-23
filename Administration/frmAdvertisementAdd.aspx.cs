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

public partial class Administration_frmAdvertisementAdd : System.Web.UI.Page
{
    clsAdvertisement_Logic objAdvertisement = new clsAdvertisement_Logic();
    clsCommon_Logic objCommon = new clsCommon_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("frmLogin.aspx");
        }
        else
        {
        }
        if (!Page.IsPostBack)
        {
            BindAdType();
            BindStatus();
        }
        GMPublishDate.Attributes.Add("readonly", "readonly()");
        GMExpiryDate.Attributes.Add("readonly", "readonly()");
    }
    void BindStatus()
    {
        DataSet dsStatus= objCommon.GetStatusName();
         ddlStatus.DataSource = dsStatus.Tables[0];
         ddlStatus.DataTextField = "StatusName";
         ddlStatus.DataValueField = "StatusId";
         ddlStatus.DataBind();
         ddlStatus.Items.Insert(0, "Select");
    
    }
    void BindAdType()
    { 
        DataSet dsAdType=objAdvertisement.GetAdType();
        ddlType.DataSource = dsAdType.Tables[0];
        ddlType.DataTextField = "Advt_Type";
        ddlType.DataValueField = "Advt_TypeId";
        ddlType.DataBind();
        ddlType.Items.Insert(0, "Select");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (GMPublishDate.Date < GMExpiryDate.Date)
        {
            objAdvertisement.pro_AdType = ddlType.SelectedItem.Text;
            objAdvertisement.pro_AdTypeId = Convert.ToInt32(ddlType.SelectedItem.Value);
            objAdvertisement.pro_AdTitle = txtTitle.Text.Trim();
            objAdvertisement.pro_AdCompanyName = txtCompanyName.Text.Trim();
            objAdvertisement.pro_AdPublishDate = GMPublishDate.DateString;
            objAdvertisement.pro_AdExpiryDate = GMExpiryDate.DateString;
            if (txtFee.Text.Trim() != "")
            {
                try
                {
                    objAdvertisement.pro_AdFee = Convert.ToDecimal(txtFee.Text.Trim());
                   
                }
                catch
                {
                    lblError.Visible = true;
                    lblError.Text = "Please Enter Valid Fee";
                    return;
                }
            }
            else
            {
                objAdvertisement.pro_AdFee = 0;
            }
            objAdvertisement.pro_AdTargetUrl = txtTaregtUrl.Text.Trim();
            objAdvertisement.pro_AdShortWriteup = txtShortWriteUp.Text.Trim();
            if (fileuploadImage.PostedFile.FileName != "")
            {
                string imgType;
                int imgSize;
                string imgName;
                string Image_Repository_FolderName;
                imgType = fileuploadImage.PostedFile.ContentType;
                if (imgType == "image/pjpeg" || imgType == "image/JPG" || imgType == "image/bmp" || imgType == "image/gif" || imgType == "image/x-png")
                {
                    imgSize = fileuploadImage.PostedFile.ContentLength;
                    if (imgSize > 1000000)
                    {
                        lblError.Visible = true;
                        lblError.Text = "please upload an image of size below 1MB only";
                        return;
                    }
                    else
                    {
                        imgName = Path.GetFileName(fileuploadImage.PostedFile.FileName);
                        objAdvertisement.pro_AdImage = imgName;
                        lblError.Visible = false;
                    }
                    Image_Repository_FolderName = Server.MapPath("../"+ConfigurationManager.AppSettings["AdvertisementImage"]);
                    if (!Directory.Exists(Image_Repository_FolderName))
                    {
                        Directory.CreateDirectory(Image_Repository_FolderName);
                    }
                    fileuploadImage.PostedFile.SaveAs(Image_Repository_FolderName + imgName);

                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Please upload an image of correct format(only *.JPEG,*.GIF,*.BMP,*.PNG are allowed)";
                    return;
                }
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Please upload image";
                return;
            }
            if (txtFee.Text.Trim() != "")
            {
                try
                {
                    objAdvertisement.pro_AdFee = Convert.ToDecimal(txtFee.Text.Trim());

                }
                catch
                {
                    lblError.Visible = true;
                    lblError.Text = "Please Enter Valid Fee";
                    return;
                }
            }
            else
            {
                objAdvertisement.pro_AdFee = 0;
            }
            if (txtDispalyTime.Text.Trim() != "")
            {
                try
                {
                    objAdvertisement.pro_AdDisplayTime = Convert.ToInt32(txtDispalyTime.Text.Trim());

                }
                catch
                {
                    lblError.Visible = true;
                    lblError.Text = "Please Enter Valid Display Time";
                    return;
                }
            }
            else
            {
                objAdvertisement.pro_AdDisplayTime = 0;
            }
           
            
            objAdvertisement.pro_Status = ddlStatus.SelectedItem.Text;
            objAdvertisement.pro_StatusId = Convert.ToInt32(ddlStatus.SelectedItem.Value);
            objAdvertisement.AddAdvertisement();
            Response.Redirect("frmAdvertisementList.aspx");
        }
        else
        {
            lblError.Text = "Invalid Date";
            return;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmAdvertisementList.aspx");

    }
}
