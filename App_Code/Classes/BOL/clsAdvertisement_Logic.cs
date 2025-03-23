using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// This is BOL Advertisement_Logic Class
/// Created By: Team A PropertyNet
/// Created On: 19-Oct-2007
/// Last Modified By: Team A PropertyNet
/// Last Modified On: 19-Oct-2007
/// </summary>
public class clsAdvertisement_Logic
{

    clsDbConnector objDbConnector;
    private int _AdvtId;
    private string _AdType;
    private int _AdTypeId;
    private string _AdTitle;
    private string _AdCompanyName;
    private string _AdPublishDate;
    private string _AdPublishDateFrom;
    private string _AdPublishDateTo;
    private string _AdExpiryDate;
    private string _AdExpiryDateFrom;
    private string _AdExpiryDateTo;
    private decimal _AdFee;
    private string _AdTargetUrl;
    private string _AdShortWriteup;
    private string _AdImage;
    private int _AdDisplayTime;
    private string _Status;
    private int _StatusId;
    private string _CreatedBy="rakesh";
    private string _UpdatedBy="rakesh";

    public string Sort_On;


	public clsAdvertisement_Logic()
	{
        objDbConnector = new clsDbConnector();
		
	}
    public int pro_AdvtId
    {
        get
        {
            return _AdvtId;
        }
        set
        {
            _AdvtId = value;
        }
    }
    public string pro_AdType
    {
        get 
        {
            return _AdType;
        }
        set 
        {
            _AdType = value;
        }
    }
    public int pro_AdTypeId
    {
        get
        {
            return _AdTypeId;
        }
        set
        {
            _AdTypeId = value;
        }
    }

    public string pro_AdTitle
    {
        get
        {
            return _AdTitle;
        }
        set
        {
            _AdTitle = value;
        }
    }

    public string pro_AdCompanyName
    {
        get
        {
            return _AdCompanyName;
        }
        set
        {
            _AdCompanyName = value;
        }
    }


    public string pro_AdPublishDate
    {
        get
        {
            return _AdPublishDate;
        }
        set
        {
            _AdPublishDate = value;
        }
    }
    public string pro_AdPublishDateFrom
    {
        get
        {
            return _AdPublishDateFrom;
        }
        set
        {
            _AdPublishDateFrom = value;
        }
    }
    public string pro_AdPublishDateTo
    {
        get
        {
            return _AdPublishDateTo;
        }
        set
        {
            _AdPublishDateTo = value;
        }
    }
    public string pro_AdExpiryDate
    {
        get
        {
            return _AdExpiryDate;
        }
        set
        {
            _AdExpiryDate = value;
        }
    }
    public string pro_AdExpiryDateFrom
    {
        get
        {
            return _AdExpiryDateFrom;
        }
        set
        {
            _AdExpiryDateFrom = value;
        }
    }
    public string pro_AdExpiryDateTo
    {
        get
        {
            return _AdExpiryDateTo;
        }
        set
        {
            _AdExpiryDateTo = value;
        }
    }

    public Decimal pro_AdFee
    {
        get
        {
            return _AdFee;
        }
        set
        {
            _AdFee = value;
        }
    }

    public string pro_AdTargetUrl
    {
        get
        {
            return _AdTargetUrl;
        }
        set
        {
            _AdTargetUrl = value;
        }
    }

    public string pro_AdShortWriteup
    {
        get
        {
            return _AdShortWriteup;
        }
        set
        {
            _AdShortWriteup = value;
        }
    }

    public string pro_AdImage
    {
        get
        {
            return _AdImage;
        }
        set
        {
            _AdImage = value;
        }
    }

    public int pro_AdDisplayTime
    {
        get
        {
            return _AdDisplayTime;
        }
        set
        {
            _AdDisplayTime = value;
        }
    }

    public string pro_Status
    {
        get
        {
            return _Status;
        }
        set
        {
            _Status = value;
        }
    }

    public int pro_StatusId
    {
        get
        {
            return _StatusId;
        }
        set
        {
            _StatusId = value;
        }
    }
    public string pro_CreatedBy
    {
        get
        {
            return _CreatedBy;
        }
        set
        {
            _CreatedBy = value;
        }
    }

    public string pro_UpdatedBy
    {
        get
        {
            return _UpdatedBy;
        }
        set
        {
            _UpdatedBy = value;
        }
    }
   
    
    public DataSet GetAdvertisement()
    {
        string strSql = string.Empty;
        strSql += "select d.AdvtId,d.Advt_Title,d.Advt_Company,d.Publish_Date,d.Expiry_Date,t.Advt_Type,s.StatusName from tbl_Status s,tbl_AdvertisementDetails d,tbl_Advertisement_Type t where d.Advt_TypeId=t.Advt_TypeId and d.Status_Id=s.StatusId";
        if (_Status != "")
        {
            strSql += " and StatusName='"+_Status+"'";
        }
        if (_AdType != "")
        {
            strSql += " and Advt_Type='"+_AdType+"'";
        }
        if (_AdPublishDateFrom != "" && _AdPublishDateTo != "")
        {
            strSql += " and Publish_Date between '" + _AdPublishDateFrom + "' and '" + _AdPublishDateTo + "'";
        }
        if (_AdExpiryDateFrom != "" && _AdExpiryDateTo != "")
        {
            strSql += " and Expiry_Date between '" + _AdExpiryDateFrom + "' and '" + _AdExpiryDateTo + "'";
        }
        if (Sort_On != "")
        {
            strSql = strSql + " ORDER BY " + Sort_On;
        }
        else
        {
            strSql = strSql + " Order By Advt_Title";
        }
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;    
    }

    public DataSet GetAdType()
    {
        string strSql = string.Empty;
        strSql += "select Advt_TypeId,Advt_Type from tbl_Advertisement_Type";
        DataSet ds=objDbConnector.GetDataSet(strSql);
        return ds;
    
    }

    public void AddAdvertisement()
    {
        string strSql = string.Empty;
        strSql += "insert into tbl_AdvertisementDetails(Advt_typeId,Advt_Title,Advt_Company,Publish_Date,Expiry_Date,Image,Display_Time,Fee,Target_Url,Short_Desc,Status_Id,Created_On,Created_By,Updated_On,Updated_By) values(";
        strSql += _AdTypeId + ",'" + _AdTitle + "','" + _AdCompanyName + "','" + _AdPublishDate + "','";
        strSql += _AdExpiryDate + "','" + _AdImage + "'," + _AdDisplayTime + ","+_AdFee+",'";
        strSql += _AdTargetUrl + "','" + _AdShortWriteup + "',"+_StatusId+",'";
        strSql += DateTime.Now.ToString()+"','"+_CreatedBy + "','";
        strSql += DateTime.Now.ToString()  + "','"+ _UpdatedBy + "')";
        objDbConnector.runSQL(strSql);
    }

    public void UpdateAdvertisement()
    {
        string strsql = string.Empty;
        strsql+="update tbl_AdvertisementDetails set ";
        strsql += "Advt_TypeId=" + _AdTypeId + ",";
        strsql+="Advt_Title='" + _AdTitle + "',";
        strsql+="Advt_Company='" + _AdCompanyName + "',";
        strsql+="Publish_Date='" + _AdPublishDate + "',";
        strsql+="Expiry_Date='" + _AdExpiryDate + "',";
        strsql+="Image='" + _AdImage + "',";
        strsql+="Display_Time=" + _AdDisplayTime + ",";
        strsql+="Fee=" + _AdFee + ",";
        strsql+="Target_Url='" + _AdTargetUrl + "',";
        strsql+="Short_Desc='" + _AdShortWriteup + "',";
        strsql+="Status_Id=" + _StatusId + ",";       
        strsql += "Updated_On='" + DateTime.Now.ToString() + "',Updated_By='" + _UpdatedBy + "'";
        strsql += " where AdvtId=" + _AdvtId;
        objDbConnector.runSQL(strsql);        
    }
    public void DeleteAdvertisement(string AdvertisementId)
    {
        string strSql = string.Empty;
        strSql += "delete from tbl_AdvertisementDetails";
        strSql += " where AdvtId in('" + AdvertisementId.Replace(",", "','") + "')";        
        objDbConnector.runSQL(strSql);    
    }
    public void GetAdvertisementDetails()
    {
        string strSql = string.Empty;
        strSql += "select d.AdvtId,d.Advt_Title,d.Advt_Company,d.Publish_Date,d.Expiry_Date,d.Fee,d.Target_URl,d.Short_Desc,d.Image,d.Display_Time,t.Advt_Type,s.StatusName from tbl_Status s,tbl_AdvertisementDetails d,tbl_Advertisement_Type t where d.Advt_TypeId=t.Advt_TypeId and d.Status_Id=s.StatusId";
        strSql += " and AdvtId=" + _AdvtId;
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        DataRowCollection drows = ds.Tables[0].Rows;
        if (drows.Count > 0)
        {            
            _AdvtId =Convert.ToInt32(drows[0]["AdvtId"].ToString());
            _AdTitle = drows[0]["Advt_Title"].ToString();
            _AdCompanyName = drows[0]["Advt_Company"].ToString();
            _AdPublishDate = drows[0]["Publish_Date"].ToString();
            _AdExpiryDate = drows[0]["Expiry_Date"].ToString();
            _AdFee =Convert.ToDecimal(drows[0]["Fee"].ToString());
            _AdTargetUrl = drows[0]["Target_Url"].ToString();
            _AdShortWriteup = drows[0]["Short_Desc"].ToString();
            _AdImage = drows[0]["image"].ToString();
            _AdDisplayTime =Convert.ToInt32(drows[0]["Display_Time"].ToString());
            _Status = drows[0]["StatusName"].ToString();
            _AdType = drows[0]["Advt_Type"].ToString(); 
        }    
    }

    public void DeleteAdvtImage(int AdvtId)
    {
        string strSql = string.Empty;
        strSql += "Update tbl_AdvertisementDetails set Image='' where AdvtId=" + AdvtId;
        objDbConnector.runSQL(strSql);    
    }

    public DataSet getBanner()
    {
        string strSQL = " Select * FROM tbl_AdvertisementDetails";
        strSQL = strSQL + " WHERE Advt_TypeId='1'";
        strSQL = strSQL + " AND Status_Id='1'";
        strSQL = strSQL + " AND Publish_Date<='" + string.Format("{0:yyyy-MM-dd}", System.DateTime.Now.AddDays(1)) + "'";
        strSQL = strSQL + " AND Expiry_Date>='" + string.Format("{0:yyyy-MM-dd}", System.DateTime.Now) + "'";
        strSQL = strSQL + " ORDER BY RAND()";
        DataSet dsTEMP;
        dsTEMP = objDbConnector.GetDataSet(strSQL);
        return dsTEMP;
    }
    public DataSet getSmallAD()
    {
        string strSQL = " Select * FROM tbl_AdvertisementDetails";
        strSQL = strSQL + " WHERE Advt_TypeId='2'";
        strSQL = strSQL + " AND Status_Id='1'";
        strSQL = strSQL + " AND Publish_Date<='" + string.Format("{0:yyyy-MM-dd}", System.DateTime.Now.AddDays(1)) + "'";
        strSQL = strSQL + " AND Expiry_Date>='" + string.Format("{0:yyyy-MM-dd}", System.DateTime.Now) + "'";
        strSQL = strSQL + " ORDER BY RAND()";
        DataSet dsTEMP;
        dsTEMP = objDbConnector.GetDataSet(strSQL);
        return dsTEMP;
    }
}
