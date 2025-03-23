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

public partial class Administration_frmAdvertisementList : System.Web.UI.Page
{
    clsAdvertisement_Logic objAdvertisement = new clsAdvertisement_Logic();
    clsCommon_Logic objCommon = new clsCommon_Logic();
    private string strError = "No Data Available";
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
            this.txtPageSize.Text = "10";
            BindStatus();
            BindAdType();
            BindData();
        }
        GMPublishDateFrom.Attributes.Add("readonly", "readonly()");
        GMPublishDateTo.Attributes.Add("readonly", "readonly()");
        GMExpiryDateFrom.Attributes.Add("readonly", "readonly()");
        GMExpiryDateTo.Attributes.Add("readonly", "readonly()");

        string Msg = "Do you want to delete this data?";
        btnDelete.Attributes.Add("onClick", "return confirm('" + Msg + "');");
    }

    void BindStatus()
    {
        DataSet dsStatus = objCommon.GetStatusName();
        ddlStatus.DataSource = dsStatus.Tables[0];
        ddlStatus.DataTextField = "StatusName";
        ddlStatus.DataValueField = "StatusId";
        ddlStatus.DataBind();
        ddlStatus.Items.Insert(0, "Select");

    }
    void BindAdType()
    {
        DataSet dsAdType = objAdvertisement.GetAdType();
        ddlType.DataSource = dsAdType.Tables[0];
        ddlType.DataTextField = "Advt_Type";
        ddlType.DataValueField = "Advt_TypeId";
        ddlType.DataBind();
        ddlType.Items.Insert(0, "Select");
    }
    void BindData()
    {
        objAdvertisement.Sort_On = "";
        if (ddlStatus.SelectedItem.Text != "Select")
        {
            objAdvertisement.pro_Status = ddlStatus.SelectedItem.Text;
        }
        else 
        {
            objAdvertisement.pro_Status = "";
        }
        if (ddlType.SelectedItem.Text != "Select")
        {
            objAdvertisement.pro_AdType = ddlType.SelectedItem.Text;
        }
        else
        {
            objAdvertisement.pro_AdType = "";
        }
        if (GMPublishDateFrom.DateString != null && GMPublishDateTo.DateString != null)
        {
            objAdvertisement.pro_AdPublishDateFrom = GMPublishDateFrom.DateString;
            objAdvertisement.pro_AdPublishDateTo = GMPublishDateTo.DateString;
        }
        else
        {
            objAdvertisement.pro_AdPublishDateFrom="";
            objAdvertisement.pro_AdPublishDateTo = "";
        }

        if (GMExpiryDateFrom.DateString != null && GMExpiryDateTo.DateString != null)
        {
            objAdvertisement.pro_AdExpiryDateFrom = GMExpiryDateFrom.DateString;
            objAdvertisement.pro_AdExpiryDateTo = GMExpiryDateTo.DateString;
        }
        else
        {
            objAdvertisement.pro_AdExpiryDateFrom = "";
            objAdvertisement.pro_AdExpiryDateTo = "";
        }

        
        if (ViewState["Sort_On"] != null)
            objAdvertisement.Sort_On = ViewState["Sort_On"].ToString() + " " + ViewState["Sort_By"].ToString();
        lblError.Visible = false;
        DataSet dsTemp = objAdvertisement.GetAdvertisement();
        DataTable dtTemp = dsTemp.Tables[0];
        if (dtTemp.Rows.Count > 0)
        {
            lblError.Visible = false;
            btnDelete.Visible = true;
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = strError;
            btnDelete.Visible = false;
        }
        if (this.txtPageSize.Text != "")
        {
            if (System.Convert.ToInt32(this.txtPageSize.Text) > 0)
            {
                this.gvAdvList.PageSize = System.Convert.ToInt32(this.txtPageSize.Text);
            }
        }
        else
        {
            txtPageSize.Text = Convert.ToString(10);
            gvAdvList.PageSize = 10;
        }
        gvAdvList.DataSource = dtTemp;
        gvAdvList.DataBind();
        if (dtTemp.Rows.Count == 0)
        {
            this.Lbl_Pageinfo.Visible = false;
        }
        else
        {
            Int16 intTo;
            Int16 intFrom;
            if (gvAdvList.PageSize * (gvAdvList.PageIndex + 1) < dtTemp.Rows.Count)
            {
                intTo = System.Convert.ToInt16(gvAdvList.PageSize * (gvAdvList.PageIndex + 1));
            }
            else
            {
                intTo = System.Convert.ToInt16(dtTemp.Rows.Count);
            }
            intFrom = System.Convert.ToInt16((gvAdvList.PageSize * gvAdvList.PageIndex) + 1);
            this.Lbl_Pageinfo.Text = "Record(s) " + intFrom + " to " + intTo + " of " + dtTemp.Rows.Count;
            this.Lbl_Pageinfo.Visible = true;
        }
    
    
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmAdvertisementAdd.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request["Cbx_AdvtId"] == null)
        {
            lblError.Text = "Please select at least one to delete.";
            lblError.Visible = true;
        }
        else
        {
            objAdvertisement.DeleteAdvertisement(Request["Cbx_AdvtId"].ToString());
            lblError.Visible = false;
            BindData();
        }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        strError = "No data matching with your searching criteria";
        gvAdvList.PageIndex = 0;
        BindData();
    }
    protected void gvAdvList_Sorting(object sender, GridViewSortEventArgs e)
    {
        objAdvertisement.Sort_On = e.SortExpression;
        ViewState["Sort_On"] = objAdvertisement.Sort_On;
        if (ViewState["Sort_By"] == null)
            ViewState["Sort_By"] = "Asc";
        if (ViewState["Sort_By"].ToString() == "Asc")
        {
            ViewState["Sort_By"] = "Desc";
        }
        else
        {
            ViewState["Sort_By"] = "Asc";
        }

        BindData();

    }
    protected void gvAdvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "UPDATE")
        {
            Response.Redirect("frmAdvertisementUpdate.aspx?Id=" + e.CommandArgument.ToString());
        
        }

    }
    protected void gvAdvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (ViewState["Sort_On"] != null)
        {
            objAdvertisement.Sort_On = ViewState["Sort_On"].ToString();
        }
        else
        {
            objAdvertisement.Sort_On = "";
        }
        gvAdvList.PageIndex = e.NewPageIndex;
        BindData();

    }
}
