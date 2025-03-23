
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
/// This is BOL Member_Logic Class
/// Created By: Team A PropertyNet
/// Created On: 09-Oct-2007
/// Last Modified By: Team A PropertyNet
/// Last Modified On: 09-Oct-2007
/// </summary>
public class clsMember_Logic
{
    clsDbConnector objdDbConnector;
    private string _MemberId;
    private string _MemberName;
    private string _Password;
    private string _DOB;
    private string _ContactNumber;
    private string _EmailId;
    private string _Realtor;
    private string _MemberImage;
    private string _Advertiser;
    private string _AddressLine;
    private string _CountryName;
    private int _CountryId;
    private int _StateId;
    private string _StateName;
    private int _DistrictId;
    private string _DistrictName;
    public string Sort_On;

	public clsMember_Logic()
	{
        objdDbConnector = new clsDbConnector();
	}

    public string pro_MemberId
    {
        get
        {
            return _MemberId;
        }
        set
        {
            _MemberId = value;
            
        }
    }

    public string pro_MemberName
    {
        get
        {
            return _MemberName;
        }
        set
        {
            _MemberName = value;

        }
    }

    public string pro_Password
    {
        get
        {
            return _Password;
        }
        set
        {
            _Password = value;

        }
    }

    public string pro_DOB
    {
        get
        {
            return _DOB;
        }
        set
        {
            if (value.ToString() == "")
            {
                _DOB = "";
            }
            else
            {
                _DOB = string.Format(value, "{0:dd MM yyyy}");
            }

        }
    }

    public string pro_EmailId
    {
        get
        {
            return _EmailId;
        }
        set
        {
            _EmailId = value;

        }
    }

    public string pro_ContactNumber
    {
        get
        {
            return _ContactNumber;
        }
        set
        {
            _ContactNumber = value;

        }
    }

    public string pro_Realtor
    {
        get
        {
            return _Realtor;
        }
        set
        {
            _Realtor = value;

        }
    }

    public string pro_MemberImage
    {
        get
        {
            return _MemberImage;
        }
        set
        {
            _MemberImage = value;

        }
    }

    public string pro_Advertiser
    {
        get
        {
            return _Advertiser;
        }
        set
        {
            _Advertiser = value;

        }
    }
    public string pro_AddressLine
    {
        get
        {
            return _AddressLine;
        }
        set
        {
            _AddressLine = value;
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
   
    public DataSet GetMember()
    {
        string strSql = string.Empty;
        strSql += "select * from tbl_Member_Details";
        if (_MemberName != "")
        {
            strSql += " where MemberName like '%" + _MemberName + "%'";
        }
        if (_DOB != "")
        {
            if (_MemberName == "")
            {
                strSql += " where DateOfBirth='" + _DOB + "'";
            }
            else
            {
                strSql += " and DateOfBirth='" + _DOB + "'";
            }
        }
        if (_EmailId != "")
        {
            if (_MemberName == "" && _DOB == "")
            {
                strSql += " where EmailId='" + _EmailId + "'";
            }
            else
            {
                strSql += " and EmailId='" + _EmailId + "'";
            }
        }
        if (Sort_On != "")
        {
            strSql += " order By " + Sort_On;
        }
        else
        {
            strSql += " order By MemberName";
        }
        DataSet ds= objdDbConnector.GetDataSet(strSql);
        return ds;
    
    }

    
    public Boolean AddMember()
    {
        //string strAddMember;
        string strSql1,strSql2;
        strSql1 = "insert into tbl_Member_Details(MemberId,MemberName,DateOfBirth,ContactNo,EmailId,AddressLine,CountryId,StateId,DistrictId,Advertiser,Realtor,MemberImage) ";
        strSql1 += "values('" + _MemberId + "','" + _MemberName + "',convert(date,(convert(varchar,'" + _DOB + "',105)),105),'" + _ContactNumber + "','" + _EmailId + "','"+_AddressLine+"',"+_CountryId+","+_StateId+","+_DistrictId+",'" + _Advertiser + "','" + _Realtor + "','" + _MemberImage + "');";
        strSql2 = "insert into tbl_Member_Login(MemberId,Password) values('" + _MemberId + "','" + _Password + "')";
        string[]  strSql={strSql2,strSql1};
       Boolean b= objdDbConnector.BatchTransaction(strSql);
       return b;
      
    }

    public Boolean DeleteMember(string MemberId)
    {
        string strSql1, strSql2;
        strSql1 = string.Empty;
        strSql1 += "delete from tbl_Member_Login where MemberId in('" + MemberId.Replace(",", "','") + "');";
        strSql2 = "delete from tbl_Member_Details where MemberId in('" + MemberId.Replace(",", "','") + "')";
        string[] strSql ={ strSql1, strSql2 };
        Boolean b = objdDbConnector.BatchTransaction(strSql);
        return b;
    }
    public void GetMemberDetails( string MemberId)
    {
        string strSql = string.Empty;
        //strSql += "select m.MemberId,m.MemberName,m.DataOfBirth,m.ContactNo,m.EmailId,m.AddressLine,m.CountryId,m.StateId,m.DistrictId, ";
        strSql += "select * from tbl_Member_Details";
        strSql += " where MemberId='" + MemberId + "'";
        DataSet ds = objdDbConnector.GetDataSet(strSql);
        DataRowCollection drows = ds.Tables[0].Rows;
        if (drows.Count > 0)
        {
            _MemberId = drows[0]["MemberId"].ToString();
            _MemberName = drows[0]["MemberName"].ToString();
            _DOB = drows[0]["DateOfBirth"].ToString();
            _ContactNumber = drows[0]["ContactNo"].ToString();
            _EmailId = drows[0]["EmailId"].ToString();
            _AddressLine = drows[0]["AddressLine"].ToString();
            _CountryId = Convert.ToInt32(drows[0]["CountryId"]);
            _StateId = Convert.ToInt32(drows[0]["StateId"].ToString());
            _DistrictId = Convert.ToInt32(drows[0]["DistrictId"].ToString());
            _Advertiser = drows[0]["Advertiser"].ToString();
            _Realtor = drows[0]["Realtor"].ToString();
            _MemberImage = drows[0]["MemberImage"].ToString();

        }    
    }

    public void UpdateMember()
    {
        string strsql = string.Empty;
        strsql += "update tbl_Member_Details set ";
        strsql += "MemberName='" + _MemberName + "',";
        strsql += "DateOfBirth='" + _DOB + "',";
        strsql += "ContactNo='" + _ContactNumber + "',";
        strsql += "EmailId='" + _EmailId + "',";
        strsql += "AddressLine='" + _AddressLine + "',";
        strsql += "CountryId=" + _CountryId + ",";
        strsql += "StateId=" + _StateId + ",";
        strsql += "DistrictId=" + _DistrictId + ",";
        strsql += "Advertiser='" + _Advertiser + "',";
        strsql += "Realtor='" + _Realtor + "',";
        strsql += "MemberImage='" + _MemberImage + "'";
        strsql +=" where MemberId='"+_MemberId+"'";
        objdDbConnector.runSQL(strsql);

    }
    public void DeleteMemberImage(string MemberId)
    {
        string strsql = string.Empty;
        strsql += "update tbl_Member_Details set MemberImage='' where MemberId='"+MemberId+"'";
        objdDbConnector.runSQL(strsql);
    }

    public DataSet CheckLogin()
    {
        string strSql = string.Empty;
        strSql += "select * from tbl_Member_Login m,tbl_Member_Details md ";
        strSql += "where m.MemberId='" + _MemberId + "' ";
        strSql += "and m.Password='" + _Password + "' ";
        strSql += "and m.MemberId=md.MemberId";
        DataSet ds=objdDbConnector.GetDataSet(strSql);
        return ds;    
    }

    public Boolean CheckOldPassword()
    { 
       string strSql = string.Empty;
       strSql += "select Password from tbl_Member_Login where MemberId='" + _MemberId + "' and Password='" + _Password + "'";
       DataSet dsCheckOldPassword = objdDbConnector.GetDataSet(strSql);
       DataRowCollection drows = dsCheckOldPassword.Tables[0].Rows;
       if (drows.Count > 0)
        {
         return true;
        }

       else
        {
         return false;
        }
    }

    public void ChangeMemberPassword()
    { 
       string strSql = string.Empty;
       strSql += "update tbl_Member_Login set ";
       strSql += "Password='" + _Password + "' ";
       strSql += "where MemberId='" + _MemberId + "'";
       objdDbConnector.runSQL(strSql);
    }

    public bool checkMemberIdForGetPwd()
    {
        string STRSQL = " SELECT d.MemberId,d.MemberName,d.EmailId,l.Password FROM tbl_Member_Details d,tbl_Member_Login l";
        STRSQL = STRSQL + " WHERE d.MemberId=l.MemberId";
        STRSQL = STRSQL + " AND d.MemberId='" + _MemberId + "'";
        DataSet dsTemp;
        dsTemp = objdDbConnector.GetDataSet(STRSQL);
        DataRowCollection dRC = dsTemp.Tables[0].Rows;
        if (dRC.Count > 0)
        {
            DataRow dR = dRC[0];
            _MemberId = dR["MemberId"].ToString();
            _MemberName = dR["MemberName"].ToString();
            _Password = dR["Password"].ToString();
            if (!String.IsNullOrEmpty(dR["EmailId"].ToString()))
                _EmailId = dR["EmailId"].ToString();
            return true;
        }
        return false;
    }

}
