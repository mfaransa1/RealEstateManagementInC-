using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

///<summary >
///This is BOL District_Logic Class
/// Created By: Team A PropertyNet
/// Created On: 16-Oct-2007
/// Last Modified By: Team A PropertyNet
/// Last Modified On: 16-Oct-2007
/// </summary>
public class clsDistrict_Logic
{
	 private int _DistrictId;
    private string _DistrictName;
    private string _DistrictDescr;
    public string Sort_On;
    private int _StatusId;
    private string _StatusName;
    private string _CountryName;
    private int _CountryId;
    private int _StateId;
    private string _StateName;
    private clsDbConnector objDbConnector;
	public clsDistrict_Logic()
	{
        objDbConnector = new clsDbConnector();
	}
    public int pro_DistrictId
    {
        get
        {
            return _DistrictId;
        }
        set
        {
           _DistrictId = value;
        }
    }
    public string pro_DistrictName
    {
        get
        {
            return _DistrictName;
        }
        set
        {
            if (value.ToString() == "")
            {
                _DistrictName = "";
            }
            else
            {
                _DistrictName = value;
            }
        }
    }
    public string pro_DistrictDescription
    {
        get
        {
            return _DistrictDescr;
        }
        set
        {
            if (value.ToString() == "")
            {
                _DistrictDescr = "";
            }
            else
            {
                _DistrictDescr = value;
            }
        }
    }

    public string pro_StatusName
    {
        get
        {
            return _StatusName;
        }
        set
        {
            _StatusName = value;

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
    public string pro_CountryName
    {
        get
        {
            return _CountryName;
        }
        set
        {
            _CountryName = value;
        }

    }

    public int pro_CountryId
    {
        get
        {
            return _CountryId;
        }
        set
        {
            _CountryId = value;
        }

    }


    public int pro_StateId
    {
        get 
        {
            return _StateId;
        }
        set 
        {
            _StateId = value;
        }
    
    }

    public string pro_StateName
    {
        get
        {
            return _StateName;
        }
        set
        {
            _StateName = value;
        }

    }

    public DataSet GetDistrict()
    {
        string strSql = string.Empty;
        strSql = "select d.DistrictId,d.DistrictName,d.DistrictDescription,st.StateName,c.CountryName,s.StatusName from tbl_District d,tbl_Country c,tbl_State st,tbl_Status s where d.StatusId=s.StatusId and d.StateId=st.StateId  and d.CountryId=c.CountryId";
        if (_DistrictName != "")
            strSql += " and DistrictName like '%" + _DistrictName + "%'";
        if (_CountryName != "Select" && _CountryName!=null)
        {
            strSql += " and CountryName='" + _CountryName+"'";
        }
        if (_StateName != "Select" && _StateName!=null)
        {            
            strSql += " and StateName='" + _StateName+"'"; 
        }
        if (Sort_On != "")
        {
            strSql = strSql + " ORDER BY " + Sort_On;
        }
        else
        {
            strSql = strSql + " Order By DistrictName";
        }
        DataSet dsTemp;
        dsTemp = objDbConnector.GetDataSet(strSql);
        return dsTemp;
    }
    public void AddDistrict()
    {
        string strSql = string.Empty;
        strSql += "Insert into tbl_District(DistrictName,DistrictDescription,StateId,CountryId,StatusId)";
        strSql += " values('" + _DistrictName + "',";
        strSql += " '" + _DistrictDescr + "',";
        strSql += _StateId + ",";
        strSql += _CountryId + ",";
        strSql += _StatusId + ")";
        objDbConnector.runSQL(strSql);
    }

    public void DeleteDistrict(string DistrictId)
    {
        string strSql = string.Empty;
        strSql += "delete from tbl_District";
        strSql += " where DistrictId in('" + DistrictId.Replace(",","','") + "')";        
        objDbConnector.runSQL(strSql);
    }
    public void GetDistrictDetails()
    {
        string strSql = string.Empty;
        strSql += "select d.DistrictId,d.DistrictName,d.DistrictDescription,st.StateName,c.CountryName,s.StatusName from tbl_District d,tbl_Country c,tbl_State st,tbl_Status s where d.StatusId=s.StatusId and d.StateId=st.StateId  and d.CountryId=c.CountryId";
        strSql += " and DistrictId=" + _DistrictId;
        DataSet dsTemp;
        dsTemp = objDbConnector.GetDataSet(strSql);
        DataRowCollection drc = dsTemp.Tables[0].Rows;
        if (drc.Count > 0)
        {
            _DistrictName = drc[0]["DistrictName"].ToString();
            _DistrictDescr = drc[0]["DistrictDescription"].ToString();
            _StateName = drc[0]["StateName"].ToString();
            _CountryName = drc[0]["CountryName"].ToString();
            _StatusName = drc[0]["StatusName"].ToString();
        }
        else
        {
            _DistrictName = "";
            _DistrictDescr = "";
            _CountryName = "";
            _StateName = "";
            _StatusName = "";
        }
    }
    public void UpdateDistrict()
    {
        string strSql = string.Empty;
        strSql += "Update tbl_District set";
        strSql += " DistrictName='" + _DistrictName + "',";
        strSql += " DistrictDescription='" + _DistrictDescr + "',";
        strSql+=" StateId="+_StateId+",";
        strSql += " CountryId=" + _CountryId + ",";
        strSql += " StatusId=" + _StatusId;
        strSql += " where DistrictId=" + _DistrictId;
        objDbConnector.runSQL(strSql);
    }
    public DataSet GetStatus()
    {

        string strSql = string.Empty;
        strSql += "select StatusName,StatusId from tbl_Status";
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;

    }

    public DataSet GetState()
    {

        string strSql = string.Empty;
        strSql += "select StateName,StateId from tbl_State";
        if(_CountryId!=0)
        strSql += " where CountryId=" + _CountryId;
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;

    }
    public DataSet GetCountry()
    {
        string strSql = string.Empty;
        strSql += "select CountryName,CountryId from tbl_Country";
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;
    
    }

}
