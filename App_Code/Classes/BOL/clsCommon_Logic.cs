using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


///<summary>
//This is BOL Common_Logic Class
/// Created By: Team A PropertyNet
/// Created On: 19-Oct-2007
/// Last Modified By: Team A PropertyNet
/// Last Modified On: 19-Oct-2007
/// </summary 
public class clsCommon_Logic
{
    clsDbConnector objDbConnector;
    private string _CountryName;
    private int _CountryId;
    private int _StateId;
    private string _StateName;
    private int _DistrictId;
    private string _DistrictName;

	public clsCommon_Logic()
	{
        objDbConnector = new clsDbConnector();		
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
    
    public DataSet GetStatusName()
    {
        string strSql = string.Empty;
        strSql += "select StatusName,StatusId from tbl_Status where StatusId in(1,2)";
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetCountryName()
    { 
    string strSql=string.Empty;
        strSql+="select CountryName,CountryId from tbl_Country ";
        DataSet ds;
        ds=objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetStateName()
    {

        string strSql = string.Empty;
        strSql += "select StateName,StateId from tbl_State";
        if(_CountryId!=0)
        strSql += " where CountryId=" + _CountryId;
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetDistrictName()
    {
        string strSql = string.Empty;
        strSql += "select DistrictName,DistrictId from tbl_District";
        if (_StateId != 0)
            strSql += " where StateId="+_StateId;
        DataSet ds;
        ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }

    public Boolean CheckMemberId(string memberid)
    {
        string strSql = string.Empty;
        strSql += "select count(*) from tbl_Member_Details where MemberId='" + memberid + "'";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        //string q = ds.Tables[0].Rows[0][0].ToString();
        //SqlDataReader sqlDr = objDbConnector.getSqlDataReader(strSql);
        //string s = sqlDr[0].ToString();
        if (int.Parse(ds.Tables[0].Rows[0][0].ToString()) == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
