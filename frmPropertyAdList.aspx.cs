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

public partial class frmPropertyAdList : System.Web.UI.Page
{
    clsCommon_Logic objCommon = new clsCommon_Logic();
    clsPropertyAd_Logic objProperty = new clsPropertyAd_Logic();
    clsMember_Logic objMember = new clsMember_Logic();
    clsBuildingType_Logic objBuilding = new clsBuildingType_Logic();
    string strError = "No data availble";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginId"] != null)
            objProperty.pro_MemberId = Session["LoginId"].ToString();
        else
            Response.Redirect("frmLogin.aspx");

        if (!IsPostBack)
        {
            BindRoomType();
            BindLocation();
            BindData();
        }
    }
    void BindRoomType()
    {
        DataSet dsRoomType = objBuilding.GetRoomType();
        ddlRoomType.DataSource = dsRoomType.Tables[0];
        ddlRoomType.DataTextField = "RoomTypeName";
        ddlRoomType.DataValueField = "Id";
        ddlRoomType.DataBind();
        ddlRoomType.Items.Insert(0, "Select");
        //ddlRoomType.Items[1].Enabled = false;
    }
    
    //void BindCountry()
    //{
    //    DataSet dsTemp = objCommon.GetCountryName();
    //    ddlCountry.DataSource = dsTemp.Tables[0];
    //    ddlCountry.DataTextField = "CountryName";
    //    ddlCountry.DataValueField = "CountryId";
    //    ddlCountry.DataBind();
    //    ddlCountry.Items.Insert(0, "Select");
    //}
    //void BindState()
    //{
    //    DataSet dsTemp = objCommon.GetStateName();
    //    ddlState.DataSource = dsTemp.Tables[0];
    //    ddlState.DataTextField = "StateName";
    //    ddlState.DataValueField = "StateId";
    //    ddlState.DataBind();
    //    ddlState.Items.Insert(0, "Select");
    //}
    void BindLocation()
    {
        DataSet dsTemp = objCommon.GetDistrictName();
        ddlLocation.DataSource = dsTemp.Tables[0];
        ddlLocation.DataTextField = "DistrictName";
        ddlLocation.DataValueField = "DistrictId";
        ddlLocation.DataBind();
        ddlLocation.Items.Insert(0, "Select");
    }
    //protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    objCommon.pro_CountryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
    //    // objCommon.GetStateName();
    //    BindState();
    //}
    //protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    objCommon.pro_StateId = Convert.ToInt32(ddlState.SelectedItem.Value);
    //    BindLocation();
    //}

   
    void BindData()
    {
        objProperty.Sort_On = "";
        //objProperty.pro_MemberId = Session["LoginId"].ToString();
        if (ViewState["Sort_On"] != null)
            objProperty.Sort_On = ViewState["Sort_On"].ToString() + " " + ViewState["Sort_By"].ToString();
        lblError.Visible = false;
        if (ddlPropertyType.SelectedItem.Text != "Select")
        {
            objProperty.pro_PropertyType = ddlPropertyType.SelectedItem.Text;
        }
        else
        {
            objProperty.pro_PropertyType = "";
        }
        if (ddlRoomType.SelectedItem.Text != "Select")
        {
            objProperty.pro_RoomType = ddlRoomType.SelectedItem.Text;
        }
        else
        {
            objProperty.pro_RoomType = "";
        }
        if (ddlRentSale.SelectedItem.Text != "Select")
        {
            objProperty.pro_RentSale = ddlRentSale.SelectedItem.Text;
        }
        else
        {
            objProperty.pro_RentSale = "";
        }
        if (ddlLocation.SelectedItem.Text != "Select")
        {
            objProperty.pro_DistrictName = ddlLocation.SelectedItem.Text;
            objProperty.pro_DistrictId =Convert.ToInt32( ddlLocation.SelectedItem.Value);
        }
        else
        {
            objProperty.pro_DistrictName = "";
            objProperty.pro_DistrictId = 0;
        }
        DataSet dsTemp = objProperty.GetPropertyList();
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

       
        gvPropertyAd.DataSource = dtTemp;
        gvPropertyAd.DataBind();
        if (dtTemp.Rows.Count == 0)
        {
            this.Lbl_Pageinfo.Visible = false;
        }
        else
        {
            Int16 intTo;
            Int16 intFrom;
            if (gvPropertyAd.PageSize * (gvPropertyAd.PageIndex + 1) < dtTemp.Rows.Count)
            {
                intTo = System.Convert.ToInt16(gvPropertyAd.PageSize * (gvPropertyAd.PageIndex + 1));
            }
            else
            {
                intTo = System.Convert.ToInt16(dtTemp.Rows.Count);
            }
            intFrom = System.Convert.ToInt16((gvPropertyAd.PageSize * gvPropertyAd.PageIndex) + 1);
            this.Lbl_Pageinfo.Text = "Record(s) " + intFrom + " to " + intTo + " of " + dtTemp.Rows.Count;
            this.Lbl_Pageinfo.Visible = true;
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmPropertyAdProfile_Add.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        strError = "No Data matching  with your searching criteria";
        gvPropertyAd.PageIndex = 0;
        BindData();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request["Cbx_PropertyId"] == null)
        {
            lblError.Visible = true;
            lblError.Text = "Please select at least one to delete.";
        }
        else
        {
            objProperty.pro_MemberId = Session["LoginId"].ToString();
            lblError.Visible = false;
            objProperty.DeleteProperty(Request["Cbx_PropertyId"].ToString());
            BindData();
        }

    }
    protected void gvPropertyAd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (ViewState["Sort_On"] != null)
            objProperty.Sort_On = ViewState["Sort_On"].ToString();
        else
            objProperty.Sort_On = null;
        gvPropertyAd.PageIndex = e.NewPageIndex;
        BindData();
        
    }
    protected void gvPropertyAd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "UPDATE")
            Response.Redirect("frmPropertyAdProfile_Update.aspx?Id=" + e.CommandArgument.ToString());
    }
    protected void gvPropertyAd_Sorting(object sender, GridViewSortEventArgs e)
    {
        objProperty.Sort_On = e.SortExpression;
        ViewState["Sort_On"] = objProperty.Sort_On;
        if (ViewState["Sort_By"] == null)
            ViewState["Sort_By"] = "Asc";
        if (ViewState["Sort_By"].ToString() == "Asc")
            ViewState["Sort_By"] = "Desc";
        else
            ViewState["Sort_By"] = "Asc";
        BindData();
       
    }
    protected void ddlPropertyType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPropertyType.SelectedItem.Text == "Commercial")
        {
            ddlRoomType.Enabled = false;
            lblNotApplicable.Visible = true;
            for (int i = 0; i < ddlRoomType.Items.Count - 1; i++)
            {
                ddlRoomType.Items[i].Selected = false;
            }
            ddlRoomType.Items[0].Selected = true;
        }
        else
        {
            ddlRoomType.Enabled = true;
            lblNotApplicable.Visible = false;
        }
    }
}
