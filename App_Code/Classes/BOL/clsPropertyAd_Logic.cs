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
/// Summary description for clsPropertyAd_Logic
/// </summary>
public class clsPropertyAd_Logic
{
    clsDbConnector objDbConnector = new clsDbConnector();
    public string Sort_On;
    private int _PropertyId;
    private string _PropertyType;
    private string _RentSale;
    private string _RoomType;
    private string _BuildingType;
    private string _HsNo;
    private string _StreetName;
    private string _UnitNo;
    private string _BuildingEstateName;
    private string _PostalCode;
    private string _CountryName;
    private int _CountryId;
    private string _StateName;
    private int _StateId;
    private string _DistrictName;
    private int _DistrictId;
    private decimal _Price;
    private decimal _PriceFrom;
    private decimal _PriceTo;
    private decimal _Valuation;
    private decimal _ValuationFrom;
    private decimal _ValuationTo;
    private decimal _PriceperSqft;
    private decimal _BuiltinArea;
    private decimal _BuiltinAreaFrom;
    private decimal _BuiltinAreaTo;
    private string _Age;
    private int _Tenure;
    private int _NoOfBedrooms;
    private int _NoOfBedroomsFrom;
    private int _NoOfBedroomsTo;
    private decimal _PaymentPerAd;
    private string _Description;
    private DateTime _StartDate;
    private DateTime _ExpiryDate;
    private string _MemberId;
    private int _StatusId;
    private string _Summary;
    private string _Image1;
    private string _ImageDescription1;
    private string _Image2;
    private string _ImageDescription2;
    private string _Image3;
    private string _ImageDescription3;
    private DateTime _AdPostedOn;
    private DateTime _LastEditedOn;    
    private string _StatusName;
    private string _FromStartDate, _ToStartDate, _FromExpiryDate, _ToExpiryDate;
    private string _SmallImage1, _SmallImage2, _SmallImage3, _ThumbImage1,_ThumbImage2,_ThumbImage3;
    public clsPropertyAd_Logic()
	{
        this.objDbConnector = new clsDbConnector();
        _StatusId = 1;
        _StartDate = Convert.ToDateTime(DateTime.Now.ToString("dd-MMM-yyyy"));
        _ExpiryDate = DateTime.Now.AddMonths(6);
        _LastEditedOn=Convert.ToDateTime(DateTime.Now.ToString("dd-MMM-yyyy"));
        _AdPostedOn = Convert.ToDateTime(DateTime.Now.ToString("dd-MMM-yyyy"));
        _PropertyType="";
        _RentSale="";
        _RoomType="";
        _BuildingType="";
        _HsNo="";
        _StreetName="";
        _UnitNo="";
        _BuildingEstateName="";
        _PostalCode="";
        _CountryName="";
        _CountryId = 0;
        _FromStartDate="";
        _ToStartDate="";
        _FromExpiryDate="";
        _ToExpiryDate = "";
        _MemberId = "";

	}


    public string pro_SmallImage1
    {
        get
        {
            return _SmallImage1;
        }
        set
        {
            _SmallImage1 = value;
        }
    }
    public string pro_SmallImage2
    {
        get
        {
            return _SmallImage2;
        }
        set
        {
            _SmallImage2 = value;
        }
    }
    public string pro_SmallImage3
    {
        get
        {
            return _SmallImage3;
        }
        set
        {
            _SmallImage3 = value;
        }
    }

    public string pro_ThumbImage1
    {
        get
        {
            return _ThumbImage1;
        }
        set
        {
            _ThumbImage1 = value;
        }
    }
    public string pro_ThumbImage2
    {
        get
        {
            return _ThumbImage2;
        }
        set
        {
            _ThumbImage2 = value;
        }
    }
    public string pro_ThumbImage3
    {
        get
        {
            return _ThumbImage3;
        }
        set
        {
            _ThumbImage3 = value;
        }
    }



    public string pro_FromStartDate
    {
        get
        {
            return _FromStartDate;
        }
        set
        {
            _FromStartDate = value;
        }
    }
    public string pro_ToStartDate
    {
        get
        {
            return _ToStartDate;
        }
        set
        {
            _ToStartDate = value;
        }
    }
    public string pro_FromExpiryDate
    {
        get
        {
            return _FromExpiryDate;
        }
        set
        {
            _FromExpiryDate = value;
        }
    }
    public string pro_ToExpiryDate
    {
        get
        {
            return _ToExpiryDate;
        }
        set
        {
            _ToExpiryDate = value;
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
            _PropertyType = value;
        }   
    }
    public string pro_RentSale
    {
        get
        {
            return _RentSale ;
        }
        set
        {
            _RentSale = value;
        }
    }
    public string pro_RoomType
    {
        get
        {
            return _RoomType;
        }
        set
        {
            _RoomType = value;
        }
    }
    public string pro_BuildingType
    {
        get
        {
            return _BuildingType;
        }
        set
        {
            _BuildingType = value;
        }
    }
    public string pro_HsNo
    {
        get
        {
            return _HsNo;
        }
        set
        {
            _HsNo = value;
        }
    }
    public string pro_StreetName
    {
        get
        {
            return _StreetName;
        }
        set
        {
            _StreetName = value;
        }
    }
    public string pro_UnitNo
    {
        get
        {
            return _UnitNo;
        }
        set
        {
            _UnitNo = value;
        }
    }
    public string pro_BuildingEstateName
    {
        get
        {
            return _BuildingEstateName;
        }
        set
        {
            _BuildingEstateName = value;
        }
    }
    public string pro_PostalCode
    {
        get
        {
            return _PostalCode;
        }
        set
        {
            _PostalCode = value;
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
            _DistrictName = value;
        }
    } 
    
    public decimal pro_Price
  
    {
        get
        {
            return _Price;
        }
        set
        {
            _Price = value;
        }
    }
    public decimal pro_PriceFrom
    {
        get
        {
            return _PriceFrom;
        }
        set
        {
            _PriceFrom = value;
        }
    }
    public decimal pro_PriceTo
    {
        get
        {
            return _PriceTo;
        }
        set
        {
            _PriceTo = value;
        }
    }
    
    public decimal pro_Valuation
    {
        get
        {
            return _Valuation;
        }
        set
        {
            _Valuation = value;
        }
    }
    public decimal pro_ValuationFrom
    {
        get
        {
            return _ValuationFrom;
        }
        set
        {
            _ValuationFrom = value;
        }
    }
    public decimal pro_ValuationTo
    {
        get
        {
            return _ValuationTo;
        }
        set
        {
            _ValuationTo = value;
        }
    }
    public decimal pro_PriceperSqft
    {
        get
        {
            return _PriceperSqft;
        } 
        set
        {
            _PriceperSqft = value;
        }
    }
    public decimal pro_BuiltinArea
    {
        get
        {
            return _BuiltinArea;
        }
        set
        {
            _BuiltinArea = value;
        }
    }

    public decimal pro_BuiltinAreaFrom
    {
        get
        {
            return _BuiltinAreaFrom;
        }
        set
        {
            _BuiltinAreaFrom = value;
        }
    }
    public decimal pro_BuiltinAreaTo
    {
        get
        {
            return _BuiltinAreaTo;
        }
        set
        {
            _BuiltinAreaTo = value;
        }
    }
    
    public string  pro_Age
    {
        get
        {
            return _Age;
        }
        set
        {
            _Age = value;
        }
    }
    public int pro_Tenure
    {
        get 
        {
            return _Tenure;
        }
        set
        {
            _Tenure = value;
        }   
    }
    public int pro_NoOfBedrooms
    {
        get
        {
            return _NoOfBedrooms;
        }
        set
        {
            _NoOfBedrooms = value;
        }
    }
    public int pro_NoOfBedroomsFrom
    {
        get
        {
            return _NoOfBedroomsFrom;
        }
        set
        {
            _NoOfBedroomsFrom = value;
        }
    }
    public int pro_NoOfBedroomsTo
    {
        get
        {
            return _NoOfBedroomsTo;
        }
        set
        {
            _NoOfBedroomsTo = value;
        }
    }

    public decimal  pro_PaymentPerAd
    {
        get
        {
            return _PaymentPerAd;
        }
        set
        {
            _PaymentPerAd = value;
        }
    }
    
    public string  pro_Description
    {
        get
        {
            return _Description;
        }
        set
        {
            _Description = value;
        }
    }
    public DateTime  pro_StartDate
    {
        get
        {
            return _StartDate;
        }
        set
        {
            _StartDate = value;
        }
    }
    public DateTime pro_ExpiryDate
    {
        get
        {
            return _ExpiryDate;
        }
        set
        {
            _ExpiryDate = value;
        }
    }
    public string  pro_MemberId
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
    public string pro_Summary
    {
        get 
        {
            return _Summary;
        }
        set
        {
            _Summary = value;
        }   
    }
    public string pro_Image1
    {
        get 
        {
            return _Image1;
        }
        set
        {
            _Image1 = value;
        }   
    }
    public string pro_ImageDescription1
    {
        get 
        {
            return _ImageDescription1;
        }
        set
        {
            _ImageDescription1 = value;
        }   
    }
    public string pro_Image2
    {
        get 
        {
            return _Image2;
        }
        set
        {
            _Image2 = value;
        }   
    }
    public string pro_ImageDescription2
    {
        get 
        {
            return _ImageDescription2;
        }
        set
        {
            _ImageDescription2 = value;
        }   
    }
    public string pro_Image3
    {
        get 
        {
            return _Image3;
        }
        set
        {
            _Image3 = value;
        }   
    }
    public string pro_ImageDescription3  
    {
        get 
        {
            return _ImageDescription3;
        }
        set
        {
            _ImageDescription3 = value;
        }   
    }

    public DateTime pro_AdPostedOn
    {
        get
        {
            return _AdPostedOn;
        }
        set
        {
            _AdPostedOn = value;
        }
    }

    public DateTime pro_LastEditedOn
    {
        get
        {
            return _LastEditedOn;
        }
        set
        {
            _LastEditedOn = value;
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
    public int pro_PropertyId
    {
        get
        {
            return _PropertyId;
        }
        set
        {
            _PropertyId = value;
        }
    }
    public void UpdateStatusOfProperty()
    {
        string strSql = string.Empty;
        strSql += "Update tbl_Property_Details set ";
        strSql += "StatusId=" + _StatusId;
        strSql += "where PropertyId=" + _PropertyId;
        objDbConnector.runSQL(strSql);  
    }
    
    public void AddProperty()
    {
        string strSql = string.Empty;
        strSql += "insert into tbl_Property_Details(PropertyType,Sale_Rent,RoomType,BuildingType,Bldg_Blk_HseNo,Street_Name,Unit_No,Building_Estate_Name,Postal_Code,CountryId,StateId,DistrictId,Price,Valuation,Built_In_Area,Age,Tenure,No_Of_BedRooms,Summary,Description,Image1,Image1_Description,Image2,Image2_Description,Image3,Image3_Description,StartDate,ExpiryDate,AdPostedOn,LastEditedOn,MemberId,StatusId,ThumbImage1,ThumbImage2,ThumbImage3,SmallImage1,SmallImage2,SmallImage3) ";
        strSql +="values('"+_PropertyType +"','"+_RentSale +"','"+_RoomType+"','"+_BuildingType +"','"+_HsNo+"','"+_StreetName+"','"+_UnitNo+"','"+_BuildingEstateName+"','"+_PostalCode+"',"+_CountryId+","+_StateId +","+_DistrictId+","+_Price+","+_Valuation+","+_BuiltinArea+",'" +_Age+"','"+_Tenure+"',"+_NoOfBedrooms+",'"+_Summary+"','"+_Description+"','"+_Image1+"','"+_ImageDescription1+"','"+_Image2+"','"+_ImageDescription2+"','"+_Image3+"','"+_ImageDescription3+"','"+_StartDate+"','"+_ExpiryDate+"','"+_AdPostedOn+"','"+_LastEditedOn+"','"+_MemberId+"',"+_StatusId+",'"+_ThumbImage1+"','"+_ThumbImage2+"','"+_ThumbImage3+"','"+_SmallImage1+"','"+_SmallImage2+"','"+_SmallImage3 +"')";
    objDbConnector.runSQL(strSql);
    }
    public void DeleteProperty(string PropertyId)
    {
      string strSql=string.Empty;
      strSql += "Delete from tbl_Property_Details ";
      strSql += "where PropertyId in('" + PropertyId.Replace(",", "','") + "')";
      objDbConnector.runSQL(strSql);
    }

    public void UpdateProperty()
    {
        string strSql = string.Empty;
        strSql += "Update tbl_Property_Details set ";
        strSql += "PropertyType='" + _PropertyType + "',";
        strSql += "Sale_Rent='" + _RentSale + "',";
        strSql += "RoomType='" + _RoomType + "',";
        strSql += "BuildingType='" + _BuildingType + "',";
        strSql += "Bldg_Blk_HseNo='" + _HsNo + "',";
        strSql += "Street_Name='" + _StreetName + "',";
        strSql += "Unit_No='" + _UnitNo + "',";
        strSql += "Building_Estate_Name='" + _BuildingEstateName + "',";
        strSql += "Postal_Code='" + _PostalCode + "',";
        strSql += "CountryId=" + _CountryId + ",";
        strSql += "StateId=" + _StateId + ",";
        strSql += "DistrictId=" + _DistrictId + ",";
        strSql += "Price=" + _Price + ",";
        strSql += "Valuation=" + _Valuation + ",";
        strSql += "Built_in_Area=" + _BuiltinArea + ",";
        strSql += "Age='" + _Age + "',";
        strSql += "Tenure='" + _Tenure + "',";
        strSql += "No_Of_BedRooms=" + _NoOfBedrooms + ",";
        strSql += "Summary='" + _Summary + "',";
        strSql += "Description='" + _Description + "',";
        strSql += "Image1='" + _Image1 + "',";
        strSql += "Image1_Description='" + _ImageDescription1 + "',";
        strSql += "Image2='" + _Image2 + "',";
        strSql += "Image2_Description='" + _ImageDescription2 + "',";
        strSql += "Image3='" + _Image3 + "',";
        strSql += "Image3_Description='" + _ImageDescription3 + "',";
        //strSql += "StartDate='" + _StartDate + "',";
        //strSql += "ExpiryDate='" + _ExpiryDate + "',";
        strSql += "LastEditedOn='" + DateTime.Now.ToString("dd-MMM-yyyy")+ "',";
        strSql += "MemberId='" + _MemberId + "' ";
       // strSql += "StatusId=" + _StatusId + ",";
        strSql += "where PropertyId=" + _PropertyId;
        objDbConnector.runSQL(strSql);  

    }

    public DataSet GetPropertyList()
    {
        string strSql = string.Empty;
        strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName from tbl_Property_Details p,tbl_Status s where s.StatusId=p.StatusId";
        
        
        if (_PropertyType != "")
        {
            strSql += " and p.PropertyType='" + _PropertyType + "'";
        }
        if (_RoomType != "")
        {
            strSql += " and p.RoomType='" + _RoomType + "'";
        }
        if (_RentSale != "")
        {
            strSql += " and p.Sale_Rent='" + _RentSale + "'";
        }
        if (_DistrictId != 0)
        { 
          strSql+=" and p.DistrictId="+_DistrictId;
        }
        if (_FromStartDate != "")
        {
            strSql += " and p.StartDate > '" +Convert.ToDateTime(_FromStartDate)+"'";
        }
        if (_ToStartDate != "")
        {
            strSql += " and p.StartDate < '" +Convert.ToDateTime( _ToStartDate)+"'";
        }
        if (_FromExpiryDate != "")
        {
            strSql += " and p.ExpiryDate > '" +Convert.ToDateTime( _FromExpiryDate)+"'";
        }
        if (_ToExpiryDate != "")
        {
            strSql += " and p.ExpiryDate < '" +Convert.ToDateTime( _ToExpiryDate)+"'";
        }
        if (_MemberId != "")
        {
            strSql += " and p.MemberId ='" + _MemberId + "'";
        }
        if (Sort_On != "")
        {
            strSql += " order by " + Sort_On;
        }
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }

    public void GetPropertyDetails()
    {
        string strSql = string.Empty;
        strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,";
        strSql += " p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,";
        strSql += " p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,";
        strSql += "p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,";
        strSql += "p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName from tbl_Property_Details p,tbl_Status s where s.StatusId=p.StatusId and PropertyId=" + _PropertyId;
        DataSet ds = objDbConnector.GetDataSet(strSql);
        DataRowCollection drows = ds.Tables[0].Rows;
        if (drows.Count > 0)
        {
            _PropertyId = Convert.ToInt32(drows[0][0].ToString());
            _PropertyType = drows[0][1].ToString();
            _RentSale = drows[0][2].ToString();
            _RoomType = drows[0][3].ToString();
            _BuildingType = drows[0][4].ToString();
            _HsNo = drows[0][5].ToString();
            _StreetName = drows[0][6].ToString();
            _UnitNo = drows[0][7].ToString();
            _BuildingEstateName = drows[0][8].ToString();
            _PostalCode = drows[0][9].ToString();
            _CountryId =Convert.ToInt32(drows[0][10].ToString());
            _StateId =Convert.ToInt32(drows[0][11].ToString());
            _DistrictId = Convert.ToInt32(drows[0][12].ToString());           
            _Price =Convert.ToDecimal(drows[0][13].ToString());
            _Valuation =Convert.ToDecimal(drows[0][14].ToString());
            _BuiltinArea =Convert.ToDecimal(drows[0][15].ToString());
            _Age = drows[0][16].ToString();
            _Tenure =Convert.ToInt32(drows[0][17].ToString());
            _NoOfBedrooms =Convert.ToInt32(drows[0][18].ToString());
            _Summary = drows[0][19].ToString();
            _Description = drows[0][20].ToString();
            _Image1 = drows[0][21].ToString();
            _ImageDescription1 = drows[0][22].ToString();
            _Image2 = drows[0][23].ToString();
            _ImageDescription2 = drows[0][24].ToString();
            _Image3 = drows[0][25].ToString();
            _ImageDescription3 =drows[0][26].ToString();
            _StartDate =Convert.ToDateTime(drows[0][27].ToString());
            _ExpiryDate =Convert.ToDateTime(drows[0][28].ToString());
            _MemberId =drows[0][29].ToString();
            _StatusId =Convert.ToInt32(drows[0][30].ToString());
            _StatusName = drows[0][31].ToString();           
        }
    }

    public void DeletePropertyImage1(int PropertyId)
    {
        string strsql = string.Empty;
        strsql += "update tbl_Property_Details set Image1='',Image1_Description='' where PropertyId=" + PropertyId;
        objDbConnector.runSQL(strsql);
    }
    public void DeletePropertyImage2(int PropertyId)
    {
        string strsql = string.Empty;
        strsql += "update tbl_Property_Details set Image2='',Image2_Description='' where PropertyId=" + PropertyId;
        objDbConnector.runSQL(strsql);
    }
    public void DeletePropertyImage3(int PropertyId)
    {
        string strsql = string.Empty;
        strsql += "update tbl_Property_Details set Image3='',Image3_Description='' where PropertyId=" + PropertyId;
        objDbConnector.runSQL(strsql);
    }

    public DataSet GetResidentialPropertyList()
    {
        string strSql = string.Empty;
        strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName,d.DistrictName from tbl_Property_Details p,tbl_Status s,tbl_District d where s.StatusId=p.StatusId and p.DistrictId=d.DistrictId and PropertyType='Residential'";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetPrivate_ResidentialPropertyList()
    {
        string strSql = string.Empty;
       // strSql += "Select PropertyId,PropertyType,RoomType,BuildingType from tbl_Property_Details where PropertyType='Residential' and RoomType='Private'";
        strSql += "select Building_Id,BuildingType_Name from tbl_BuildingType where RoomType_Id=1";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetHDB_ResidentialPropertyList()
    {
        string strSql = string.Empty;
        // strSql += "Select PropertyId,PropertyType,RoomType,BuildingType from tbl_Property_Details where PropertyType='Residential' and RoomType='Private'";
        strSql += "select Building_Id,BuildingType_Name from tbl_BuildingType where RoomType_Id=2";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }    
    public DataSet GetResidentialPropertyDetails()
    { 
       string strSql = string.Empty;
       strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName,d.DistrictName from tbl_Property_Details p,tbl_Status s,tbl_District d where s.StatusId=p.StatusId and p.DistrictId=d.DistrictId and PropertyType='Residential'";
       if (_RentSale != "")
       {
         strSql += " and Sale_Rent='" + _RentSale + "'";
       }
       if (_CountryId != 0)
       {
           strSql += " and p.CountryId=" + _CountryId;
       }
       if (_StateId != 0)
       {
           strSql += " and p.StateId=" + _StateId;
       }
       if (_DistrictId != 0)
       {
           strSql += " and p.DistrictId=" + _DistrictId;
       }
       if (_Tenure != 0)
       {
           strSql += " and Tenure=" + _Tenure;
       }
       if (_PriceFrom != 0)
       {
           strSql += " and Price >" + _PriceFrom;
       }
       if (_PriceTo != 0)
       {
           strSql += " and Price <" + _PriceTo;
       }
       if (_ValuationFrom != 0)
       {
           strSql += " and Valuation >" + _ValuationFrom;
       }
       if (_ValuationTo != 0)
       {
           strSql += " and Valuation <" + _ValuationTo;
       }
       if (_NoOfBedroomsFrom != 0)
       {
           strSql += " and No_Of_BedRooms >" + _NoOfBedroomsFrom;
       }
       if (_NoOfBedroomsTo != 0)
       {
           strSql += " and No_Of_BedRooms <" + _NoOfBedroomsTo;
       }
       if (_BuiltinAreaFrom != 0)
       {
           strSql += " and Built_In_Area >" + _BuiltinAreaFrom;
       }
       if (_BuiltinAreaTo != 0)
       {
           strSql += " and Built_In_Area <" + _BuiltinAreaTo;
       }
       if (_BuildingType != "")
       {
           strSql += " and BuildingType='" + _BuildingType + "'";
       }
       if (_RoomType != "")
       {
           strSql += " and RoomType='" + _RoomType + "'";
       }
       DataSet ds = objDbConnector.GetDataSet(strSql);
       return ds;
    }
    //public DataSet GetPropertyList_For_ucSearch()
    //{
    //    string strSql = string.Empty;
    //    strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName,d.DistrictName from tbl_Property_Details p,tbl_Status s,tbl_District d where s.StatusId=p.StatusId and p.DistrictId=d.DistrictId";
    //    if (_DistrictId != 0)
    //    {
    //        strSql += " and DistrictId=" + _DistrictId;
    //    }
    //    if (_PropertyType != "")
    //    {
    //        strSql += " and PropertyType='" + _PropertyType + "'";
    //    }
    //    if (_PriceFrom != 0)
    //    {
    //        strSql += " and Price >" + _PriceFrom;
    //    }
    //    if (_PriceTo != 0)
    //    {
    //        strSql += " and Price <" + _PriceTo;
    //    }

    //}

    public DataSet GetCommercialPropertyList()
    {
        string strSql = string.Empty;
        strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName,d.DistrictName from tbl_Property_Details p,tbl_Status s,tbl_District d where s.StatusId=p.StatusId and p.DistrictId=d.DistrictId and PropertyType='Commercial'";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetCommercialInDataList()
    {
        string strSql = string.Empty;
        strSql += "select Building_Id,BuildingType_Name from tbl_BuildingType where RoomType_Id=0";
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public DataSet GetCommercialPropertyDetails()
    {
        string strSql = string.Empty;
        // strSql += "Select * from tbl_Property_Details where 1=1";
        strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName,d.DistrictName from tbl_Property_Details p,tbl_Status s,tbl_District d where s.StatusId=p.StatusId and p.DistrictId=d.DistrictId and PropertyType='Commercial'";
        if (_RentSale != "")
        {
            strSql += " and Sale_Rent='" + _RentSale + "'";
        }
        if (_CountryId != 0)
        {
            strSql += " and p.CountryId=" + _CountryId;
        }
        if (_StateId != 0)
        {
            strSql += " and p.StateId=" + _StateId;
        }
        if (_DistrictId != 0)
        {
            strSql += " and p.DistrictId=" + _DistrictId;
        }
        if (_Tenure != 0)
        {
            strSql += " and Tenure=" + _Tenure;
        }
        if (_PriceFrom != 0)
        {
            strSql += " and Price >" + _PriceFrom;
        }
        if (_PriceTo != 0)
        {
            strSql += " and Price <" + _PriceTo;
        }
        if (_ValuationFrom != 0)
        {
            strSql += " and Valuation >" + _ValuationFrom;
        }
        if (_ValuationTo != 0)
        {
            strSql += " and Valuation <" + _ValuationTo;
        }
        if (_NoOfBedroomsFrom != 0)
        {
            strSql += " and No_Of_BedRooms >" + _NoOfBedroomsFrom;
        }
        if (_NoOfBedroomsTo != 0)
        {
            strSql += " and No_Of_BedRooms <" + _NoOfBedroomsTo;
        }
        if (_BuiltinAreaFrom != 0)
        {
            strSql += " and Built_In_Area >" + _BuiltinAreaFrom;
        }
        if (_BuiltinAreaTo != 0)
        {
            strSql += " and Built_In_Area <" + _BuiltinAreaTo;
        }
        if (_BuildingType != "")
        {
            strSql += " and BuildingType='" + _BuildingType + "'";
        }
        if (_RoomType != "")
        {
            strSql += " and RoomType='" + _RoomType + "'";
        }
        DataSet ds = objDbConnector.GetDataSet(strSql);
        return ds;
    }
    public void GetSearchPropertyDetailsByPropertyId(int PropertyId)
    {

        string strSql = string.Empty;
        strSql += "Select p.PropertyId,p.PropertyType,p.Sale_Rent,p.RoomType,p.BuildingType,p.Bldg_Blk_HseNo,p.Street_Name,p.Unit_No,p.Building_Estate_Name,p.Postal_Code,p.CountryId,p.StateId,p.DistrictId,p.Price,p.Valuation,p.Built_In_Area,p.Age,p.Tenure,p.No_Of_BedRooms,p.Summary,p.Description,p.Image1,p.Image1_Description,p.Image2,p.Image2_Description,p.Image3,p.Image3_Description,p.StartDate,p.ExpiryDate,p.MemberId,p.StatusId,s.StatusName,d.DistrictName from tbl_Property_Details p,tbl_Status s,tbl_District d where s.StatusId=p.StatusId and p.DistrictId=d.DistrictId and PropertyId="+PropertyId;
        DataSet dsResidentialPropertyDetailsByPropertyId = objDbConnector.GetDataSet(strSql);
        DataRowCollection drows = dsResidentialPropertyDetailsByPropertyId.Tables[0].Rows;        
        if (drows.Count > 0)
        {

            _PropertyType = drows[0]["PropertyType"].ToString();
            _RentSale = drows[0]["Sale_Rent"].ToString();
            _RoomType = drows[0]["RoomType"].ToString();
            _BuildingType = drows[0]["BuildingType"].ToString();
            _HsNo = drows[0]["Bldg_Blk_HseNo"].ToString();
            _StreetName = drows[0]["Street_Name"].ToString();
            _UnitNo = drows[0]["Unit_No"].ToString();
            _BuildingEstateName = drows[0]["Building_Estate_Name"].ToString();
            _PostalCode = drows[0]["Postal_Code"].ToString();
            _CountryId =Convert.ToInt32(drows[0]["CountryId"].ToString());
            _StateId =Convert.ToInt32(drows[0]["StateId"].ToString());
            _DistrictId =Convert.ToInt32(drows[0]["DistrictId"].ToString());
            _Price =Convert.ToDecimal(drows[0]["Price"].ToString());
            _Valuation =Convert.ToDecimal(drows[0]["Valuation"].ToString());
            _BuiltinArea =Convert.ToDecimal(drows[0]["Built_In_Area"].ToString());
            _Age = drows[0]["Age"].ToString();
            _Tenure =Convert.ToInt32(drows[0]["Tenure"].ToString());
            _NoOfBedrooms =Convert.ToInt32(drows[0]["No_Of_BedRooms"].ToString());
            _Summary= drows[0]["Summary"].ToString();
            _Description = drows[0]["Description"].ToString();
            _Image1 = drows[0]["Image1"].ToString();
            _ImageDescription1 = drows[0]["Image1_Description"].ToString();
            _Image2 = drows[0]["Image2"].ToString();
            _ImageDescription2 = drows[0]["Image2_Description"].ToString();
            _Image3 = drows[0]["Image3"].ToString();
            _ImageDescription3 =drows[0]["Image3_Description"].ToString();
            _StartDate =Convert.ToDateTime(drows[0]["StartDate"].ToString());
            _ExpiryDate =Convert.ToDateTime(drows[0]["ExpiryDate"].ToString());
            _MemberId = drows[0]["MemberId"].ToString();
            _StatusId =Convert.ToInt32(drows[0]["StatusId"].ToString());
            _StatusName = drows[0]["StatusName"].ToString();

        }
    }
    //Added on 30-12-2007
    public DataSet GetTop2Residential(string AdType)
    {
        string strSQL;
        strSQL = "SELECT top 2 * from tbl_Property_Details where StatusId not in(2,3,4) and PropertyType='Residential' and Sale_Rent='" + AdType + "'";
        strSQL += " order by rand(),AdPostedOn desc";
        DataSet dsTemp;
        dsTemp = objDbConnector.GetDataSet(strSQL);
        return dsTemp;
    }

    public DataSet GetTop1Commercial(string AdType)
    {
        string strSQL;
        strSQL = "SELECT top 1 * from tbl_Property_Details where StatusId not in(2,3,4) and PropertyType='Commercial' and Sale_Rent='" + AdType + "'";
        strSQL += " order by rand(),AdPostedOn desc";
        DataSet dsTemp;
        dsTemp = objDbConnector.GetDataSet(strSQL);
        return dsTemp;
    }
    
}
