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

/// <summary>
/// Summary description for clsBuildingType
/// </summary>
public class clsBuildingType_Logic
{
    clsDbConnector objDbConnector = new clsDbConnector();
    private int _BuildingType_Id;
    private string _BuildingTypeName;
    private string _Description;
    private string _RoomTypeName;
    private int _RoomTypeId;
    private string _PropertyType;
    public string Sort_On;
    public clsBuildingType_Logic()
    {
        this.objDbConnector = new clsDbConnector();
        //
        // TODO: Add constructor logic here
        //
    }
    public int pro_BuildingType_Id
    {
        get
        {
            return _BuildingType_Id;
        }
        set
        {
            _BuildingType_Id = value;
        }
    }
    public string pro_BuildingTypeName
    {
        get
        {
            return _BuildingTypeName;
        }
        set
        {
            if (value.ToString() == "")
            {
                _BuildingTypeName = "";
            }
            else
            {
                _BuildingTypeName = value;
            }
        }
    }
    public string pro_Description
    {
        get
        {
            return _Description;
        }
        set
        {
            if (value.ToString() == "")
            {
                _Description = "";
            }
            else
            {
                _Description = value;
            }
        }
    }
    public string pro_RoomTypeName
    {
        get
        {
            return _RoomTypeName;
        }
        set
        {
            if (value.ToString() == "")
            {
                _RoomTypeName = "";
            }
            else
            {
                _RoomTypeName = value;
            }
       }
    }
    public int pro_RoomTypeId
    {
        get
        {
            return _RoomTypeId;
        }
        set
        {
            _RoomTypeId = value;
        }
    }

    public string pro_PropertyType
    {
        get
        {
            return _PropertyType;
        }
        set
        {
            if (value.ToString() == "")
            {
                _PropertyType = "";
            }
            else
            {
                _PropertyType = value;
            }
        }
    }

    public DataSet GetBuildingType()
    {
        string strSql = string.Empty;
        strSql += "Select b.Building_Id,b.BuildingType_Name,b.Description,b.PropertyType,b.RoomType_Id,r.RoomTypeName,r.Id from tbl_BuildingType b,tbl_RoomType r where b.RoomType_Id=r.Id";
        if (_BuildingTypeName != "")
            strSql += " and BuildingType_Name like '%" + _BuildingTypeName + "%'";
        if (_PropertyType != "Select" && _PropertyType !=null)
            strSql += " and PropertyType='" + _PropertyType + "'";
        if (_RoomTypeName != "Select" && _RoomTypeName !=null)
            strSql += " and RoomTypeName='" + _RoomTypeName + "'";
        if (Sort_On != "" && Sort_On!=null)
            strSql += " order by " + Sort_On;
        else
            strSql += " order by BuildingType_Name";
        DataSet ds= objDbConnector.GetDataSet(strSql);
        return ds;
    
    }
    public DataSet GetRoomType()
    {
        string strSql = string.Empty;
        strSql = "Select Id,RoomTypeName from tbl_RoomType where id in(1,2)";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }

    public void AddBuildingType()
    {
        string strSql = string.Empty;
        strSql += "insert into tbl_BuildingType(BuildingType_Name,Description,RoomType_Id,PropertyType) values('" + _BuildingTypeName + "','" + _Description + "'," + _RoomTypeId + ",'" + _PropertyType + "')";
        objDbConnector.runSQL(strSql);
    }

    public void DeleteBuildingType(string buildingId)
    {
        string strSql = string.Empty;
        strSql += "Delete from tbl_BuildingType ";
        strSql += "where Building_Id in('" + buildingId.Replace(",","','") + "')";
        objDbConnector.runSQL(strSql);
    
    }
    public void UpdateBuildingType()
    {
        string strSql = string.Empty;
        strSql += "Update tbl_BuildingType set ";
        strSql += "BuildingType_Name='" + _BuildingTypeName + "',";
        strSql += "PropertyType='" + _PropertyType + "',";
        strSql += "RoomType_Id=" + _RoomTypeId + ",";
        strSql += "Description='" + _Description+"' ";
        strSql += "where Building_Id=" + _BuildingType_Id;
        objDbConnector.runSQL(strSql);
    }
    
    public void GetBuildingTypeDetails(int buildingId)
    {
        string strSql = string.Empty;
        strSql += "Select b.Building_Id,b.BuildingType_Name,b.Description,b.PropertyType,b.RoomType_Id,r.RoomTypeName,r.Id from tbl_BuildingType b,tbl_RoomType r where b.RoomType_Id=r.Id and Building_Id="+buildingId;
        DataSet ds = objDbConnector.GetDataSet(strSql);
        DataRowCollection drow = ds.Tables[0].Rows;
        if (drow.Count>0)
        {
            _BuildingTypeName = drow[0]["BuildingType_Name"].ToString();
            _Description = drow[0]["Description"].ToString();
            _PropertyType = drow[0]["PropertyType"].ToString();
            _RoomTypeName = drow[0]["RoomTypeName"].ToString();
            _RoomTypeId = Convert.ToInt32(drow[0]["RoomType_Id"].ToString());
        }
       else 
       {
       
       }
    }

    public DataSet GetBuildingTypeName()
    {
        string strSql = string.Empty;
        strSql += "select BuildingType_Name,Building_Id from tbl_BuildingType";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetResidentialBuildingType()
    {
        string strSql = string.Empty;
        strSql += "Select b.Building_Id,b.BuildingType_Name,b.Description,b.PropertyType,b.RoomType_Id,r.RoomTypeName,r.Id from tbl_BuildingType b,tbl_RoomType r where b.RoomType_Id=r.Id and PropertyType='Residential'";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetCommercialBuildingType()
    {
        string strSql = string.Empty;
        strSql += "Select b.Building_Id,b.BuildingType_Name,b.Description,b.PropertyType,b.RoomType_Id,r.RoomTypeName,r.Id from tbl_BuildingType b,tbl_RoomType r where b.RoomType_Id=r.Id and PropertyType='Commercial'";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
}
