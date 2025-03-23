using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    clsPropertyAd_Logic objPostAnAd = new clsPropertyAd_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindResidentialSaleRent();
            BindCommercialSaleRent();
        }
    }

    void BindResidentialSaleRent()
    {
        DataSet dsTemp = objPostAnAd.GetTop2Residential("Sale");
        if (dsTemp.Tables[0].Rows.Count > 0)
        {
            DLResidentialSale.Visible = true;
        }
        else
        {
            DLResidentialSale.Visible = false;
        }
        DLResidentialSale.DataSource = dsTemp.Tables[0];
        DLResidentialSale.DataBind();

        DataSet dsTemp1 = objPostAnAd.GetTop2Residential("Rent");
        if (dsTemp1.Tables[0].Rows.Count > 0)
        {
            DLResidentialRent.Visible = true;
        }
        else
        {
            DLResidentialRent.Visible = false;
        }
        DLResidentialRent.DataSource = dsTemp1.Tables[0];
        DLResidentialRent.DataBind();
        //This is For Making a Visibility
        if (dsTemp.Tables[0].Rows.Count > 0 || dsTemp1.Tables[0].Rows.Count > 0)
        {
            tblResidential.Visible = true;
        }
        else
        {
            tblResidential.Visible = false;
        }

    }

    void BindCommercialSaleRent()
    {
        DataSet dsTemp = objPostAnAd.GetTop1Commercial("Sale");
        if (dsTemp.Tables[0].Rows.Count > 0)
        {
            DLCommercialSale.Visible = true;
        }
        else
        {
            DLCommercialSale.Visible = false;
        }
        DLCommercialSale.DataSource = dsTemp.Tables[0];
        DLCommercialSale.DataBind();

        DataSet dsTemp1 = objPostAnAd.GetTop1Commercial("Rent");
        if (dsTemp1.Tables[0].Rows.Count > 0)
        {
            DLCommercialRent.Visible = true;
        }
        else
        {
            DLCommercialRent.Visible = false;
        }
        DLCommercialRent.DataSource = dsTemp1.Tables[0];
        DLCommercialRent.DataBind();

        if (dsTemp1.Tables[0].Rows.Count > 0 || dsTemp.Tables[0].Rows.Count > 0)
        {
            tblCommercial.Visible = true;
        }
        else
        {
            tblCommercial.Visible = false;
        }
    }

    ///////////////////////////////////////////////////////

    protected void DLCommercialSale_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblSetAsMainPhoto = (Label)e.Item.FindControl("lblSetAsMainPhoto");
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");
            Image Img1 = (Image)e.Item.FindControl("Img1");
            Label lblImg1 = (Label)e.Item.FindControl("lblImg1");
            Label lblImg2 = (Label)e.Item.FindControl("lblImg2");
            Label lblImg3 = (Label)e.Item.FindControl("lblImg3");
            if (lblSetAsMainPhoto.Text == "1")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg1.Text;
            }
            else if (lblSetAsMainPhoto.Text == "2")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg2.Text;
            }
            else if (lblSetAsMainPhoto.Text == "3")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg3.Text;
            }
            else
            {
                Img1.ImageUrl = "Images\\NoImage11.gif";
            }
            if (lblStatus.Text == "3")
            {
                Image imgSoldCommercialSale = (Image)e.Item.FindControl("imgSoldCommercialSale");
                imgSoldCommercialSale.Visible = true;
            }
            else if (lblStatus.Text == "4")
            {

            }
        }
    }
    protected void DLCommercialRent_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblSetAsMainPhoto = (Label)e.Item.FindControl("lblSetAsMainPhoto");
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");
            Image Img1 = (Image)e.Item.FindControl("Img1");
            Label lblImg1 = (Label)e.Item.FindControl("lblImg1");
            Label lblImg2 = (Label)e.Item.FindControl("lblImg2");
            Label lblImg3 = (Label)e.Item.FindControl("lblImg3");
            if (lblSetAsMainPhoto.Text == "1")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg1.Text;
            }
            else if (lblSetAsMainPhoto.Text == "2")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg2.Text;
            }
            else if (lblSetAsMainPhoto.Text == "3")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg3.Text;
            }
            else
            {
                Img1.ImageUrl = "Images\\NoImage11.gif";
            }
            if (lblStatus.Text == "3")
            {
            }
            else if (lblStatus.Text == "4")
            {
                Image imgLeasedCommercialRent = (Image)e.Item.FindControl("imgLeasedCommercialRent");
                imgLeasedCommercialRent.Visible = true;
            }
        }
    }
    protected void DLResidentialSale_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblSetAsMainPhoto = (Label)e.Item.FindControl("lblSetAsMainPhoto");
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");
            Image Img1 = (Image)e.Item.FindControl("Img1");
            Label lblImg1 = (Label)e.Item.FindControl("lblImg1");
            Label lblImg2 = (Label)e.Item.FindControl("lblImg2");
            Label lblImg3 = (Label)e.Item.FindControl("lblImg3");
            if (lblSetAsMainPhoto.Text == "1")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg1.Text;
            }
            else if (lblSetAsMainPhoto.Text == "2")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg2.Text;
            }
            else if (lblSetAsMainPhoto.Text == "3")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg3.Text;
            }
            else
            {
                Img1.ImageUrl = "Images\\NoImage11.gif";
            }
            if (lblStatus.Text == "3")
            {
                Image imgSoldResidentialSale = (Image)e.Item.FindControl("imgSoldResidentialSale");
                imgSoldResidentialSale.Visible = true;
            }
            else if (lblStatus.Text == "4")
            {

            }
        }
    }
    protected void DLResidentialRent_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblSetAsMainPhoto = (Label)e.Item.FindControl("lblSetAsMainPhoto");
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");
            Image Img1 = (Image)e.Item.FindControl("Img1");
            Label lblImg1 = (Label)e.Item.FindControl("lblImg1");
            Label lblImg2 = (Label)e.Item.FindControl("lblImg2");
            Label lblImg3 = (Label)e.Item.FindControl("lblImg3");
            if (lblSetAsMainPhoto.Text == "1")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg1.Text;
            }
            else if (lblSetAsMainPhoto.Text == "2")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg2.Text;
            }
            else if (lblSetAsMainPhoto.Text == "3")
            {
                Img1.ImageUrl = ConfigurationManager.AppSettings["PropertyImageTHUMB"] + lblImg3.Text;
            }
            else
            {
                Img1.ImageUrl = "Images\\NoImage11.gif";
            }
            if (lblStatus.Text == "3")
            {

            }
            else if (lblStatus.Text == "4")
            {
                Image imgLeasedResidentialRent = (Image)e.Item.FindControl("imgLeasedResidentialRent");
                imgLeasedResidentialRent.Visible = true;
            }
        }
    }

}