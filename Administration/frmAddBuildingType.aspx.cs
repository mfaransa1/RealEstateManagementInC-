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

public partial class Administration_frmAddBuildingType : System.Web.UI.Page
{
    clsBuildingType_Logic objBuildingType = new clsBuildingType_Logic();
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
            BindRoomType();
        }
    }

    void BindRoomType()
    {
        DataSet dsRoomType = objBuildingType.GetRoomType();
        ddlRoomType.DataSource = dsRoomType.Tables[0];
        ddlRoomType.DataTextField = "RoomTypeName";
        ddlRoomType.DataValueField = "Id";
        ddlRoomType.DataBind();
        ListItem li = new ListItem("Select", "0");
        ddlRoomType.Items.Insert(0, li);
    }
    protected void btnADD_Click(object sender, EventArgs e)
    {
        objBuildingType.pro_BuildingTypeName = txtBuildingTypeName.Text.Trim();
        objBuildingType.pro_PropertyType = ddlPropertyType.SelectedItem.Text.Trim();
        if (ddlPropertyType.SelectedItem.Text == "Commercial")
        {
            objBuildingType.pro_RoomTypeId = 3;
            objBuildingType.pro_RoomTypeName = "Commercial";
            
        }
        else
        {
            objBuildingType.pro_RoomTypeName = ddlRoomType.SelectedItem.Text;
            objBuildingType.pro_RoomTypeId = Convert.ToInt32(ddlRoomType.SelectedItem.Value);
        }
        objBuildingType.pro_Description = txtDescription.Text.Trim();
        objBuildingType.AddBuildingType();
        Response.Redirect("frmBuildingTypeList.aspx");
    }
    protected void ddlPropertyType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPropertyType.SelectedItem.Text == "Commercial")
        {
            ddlRoomType.Enabled = false;
            lblNotApplicable.Visible = true;
            RequiredFieldValidator2.InitialValue = "";
        }
        else
        {
            lblNotApplicable.Visible = false;
            ddlRoomType.Enabled = true;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmBuildingTypeList.aspx");
    }
}
