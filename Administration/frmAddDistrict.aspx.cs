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

public partial class Administration_frmAddDistrict : System.Web.UI.Page
{
    clsDistrict_Logic objDistrict = new clsDistrict_Logic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("frmLogin.aspx");
        }
        else
        {
        }
        if (!IsPostBack)
        {
            BindStatus();
            BindCountry();
        }
    }

    void BindStatus()
    {
        DataSet dsStatus = objDistrict.GetStatus();
        ddlStatus.DataSource = dsStatus.Tables[0];
        ddlStatus.DataTextField = "StatusName";
        ddlStatus.DataValueField = "StatusId";
        ddlStatus.DataBind();
        ListItem li = new ListItem("Select", "0");
        ddlStatus.Items.Insert(0, li);
    }

    void BindCountry()
    {
        DataSet dsCountry = objDistrict.GetCountry();
        ddlCountryName.DataSource = dsCountry.Tables[0];
        ddlCountryName.DataTextField = "CountryName";
        ddlCountryName.DataValueField = "CountryId";
        ddlCountryName.DataBind();
        ListItem li = new ListItem("Select", "0");
        ddlCountryName.Items.Insert(0, li);
    }
    void BindState()
    {
        DataSet dsState = objDistrict.GetState();
        ddlStateName.DataSource = dsState.Tables[0];
        ddlStateName.DataTextField = "StateName";
        ddlStateName.DataValueField = "StateId";
        ddlStateName.DataBind();
        ListItem li = new ListItem("Select", "0");
        ddlStateName.Items.Insert(0, li);

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (ddlCountryName.SelectedItem.Text != "Select")
        {
            lblErrorCountryName.Visible = false;
            if (ddlStateName.SelectedItem.Text != "Select")
            {
                lblErrorStateName.Visible = false;
                if (ddlStatus.SelectedItem.Text != "Select")
                {
                    lblErrorStatus.Visible = false;

                    objDistrict.pro_DistrictName = txtDistrictName.Text.Trim();
                    objDistrict.pro_DistrictDescription = txtDistrictDescription.Text.Trim();
                    objDistrict.pro_StateName = ddlStateName.SelectedItem.Text;
                    objDistrict.pro_StateId = Convert.ToInt32(ddlStateName.SelectedItem.Value);
                    objDistrict.pro_StatusName = ddlStatus.SelectedItem.Text;
                    objDistrict.pro_StatusId = Convert.ToInt32(ddlStatus.SelectedItem.Value);
                    objDistrict.pro_CountryName = ddlCountryName.SelectedItem.Text;
                    objDistrict.pro_CountryId = Convert.ToInt32(ddlCountryName.SelectedItem.Value);
                    objDistrict.AddDistrict();
                    Response.Redirect("frmManageDistrict.aspx");
                }
                else
                {
                    lblErrorStatus.Visible = true;
                }
            }
            else
            {
                lblErrorStateName.Visible = true;
            }
        }
        else
        {
            lblErrorCountryName.Visible = true;
        }       
        
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmManageDistrict.aspx");

    }
    protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlCountryName.SelectedItem.Text!="select")
        {
            objDistrict.pro_CountryName = ddlCountryName.SelectedItem.Text;
            objDistrict.pro_CountryId = Convert.ToInt32(ddlCountryName.SelectedItem.Value);
            BindState();       
        }
    }
}
