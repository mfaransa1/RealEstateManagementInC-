using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public class AdminMember_Logic
{   
    public clsDbConnector ObjdbConnector = new clsDbConnector();
    public AdminMember_Logic()
    {
        this.ObjdbConnector = new clsDbConnector();
    }

    private string _UserId;
    private string _Password;
    
    public string pro_UserId
    {
        get
        {
            return _UserId;
        }
        set
        {
            if (value.ToString() == "")
            {
                _UserId = "";
            }
            else
            {
                _UserId = value;
            }
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
            if (value.ToString() == "")
            {
                _Password = "";
            }
            else
            {
                _Password = value;
            }
        }
    }

   
    public DataSet CheckLogin()
    {
        string strSQL;
        strSQL = "SELECT User_Id,Password From tbl_Users";
        strSQL += " where User_Id='" + _UserId + "'";
        strSQL += " and Password='" + _Password + "'";
        DataSet dsTemp;
        dsTemp = ObjdbConnector.GetDataSet(strSQL);
        return dsTemp;
    }

    public bool CheckOldPassword()
    {
        string strSQL;
        strSQL = "SELECT Password from tbl_Users";
        strSQL += " where User_Id='" + _UserId + "'";
        strSQL += " and Password='" + _Password + "'";
        DataSet dsTemp;
        dsTemp = ObjdbConnector.GetDataSet(strSQL);
        
        if (dsTemp.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public void ChangeUserPassword()
    {
        string strSQL1;
        strSQL1 = "update tbl_Users set";
        strSQL1 += " Password='" + _Password + "'";
        strSQL1 += " where User_Id='" + pro_UserId + "'";
        ObjdbConnector.runSQL(strSQL1);
    }
}
