using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public class Marquee_Logic
{
    public clsDbConnector ObjdbConnector = new clsDbConnector();

    private string _MarqueeText;
    private string _Behaviour;
    private string _Direction;
    private int _ScrollDelay;
    private string _BgColor;
    private string _TextColor;
    public string _Flag;
    public int _RecNo;
    public string _FontSize;

	public Marquee_Logic()
	{
        this.ObjdbConnector = new clsDbConnector();
	}

    public string pro_MarqueeText
    {
        get
        {
            return _MarqueeText;
        }
        set
        {
            if (value.ToString() == "")
            {
                _MarqueeText = "";
            }
            else
            {
                _MarqueeText = value;
            }
        }
    }

    public string pro_Behaviour
    {
        get
        {
            return _Behaviour;
        }
        set
        {
            if (value.ToString() == "")
            {
                _Behaviour = "";
            }
            else
            {
                _Behaviour = value;
            }
        }
    }

    public string pro_Direction
    {
        get
        {
            return _Direction;
        }
        set
        {
            if (value.ToString() == "")
            {
                _Direction = "";
            }
            else
            {
                _Direction = value;
            }
        }
    }

    public int pro_ScrollDelay
    {
        get
        {
            return _ScrollDelay;
        }
        set
        {
            if (value == 0)
            {
                _ScrollDelay = 0;
            }
            else
            {
                _ScrollDelay = value;
            }
        }
    }

    public string pro_BgColor
    {
        get
        {
            return _BgColor;
        }
        set
        {
            if (value.ToString() == "")
            {
                _BgColor = "";
            }
            else
            {
                _BgColor = value;
            }
        }
    }

    public string pro_TextColor
    {
        get
        {
            return _TextColor;
        }
        set
        {
            if (value.ToString() == "")
            {
                _TextColor = "";
            }
            else
            {
                _TextColor = value;
            }
        }
    }

    public bool Add_Marquee()
    {
        string strSQL1;
        strSQL1 = "Insert into tbl_Marquee(Text,Behavior,Direction,BgColor,TextColor,ScrollDelay,FontSize,RecNo,Flag) values(";
        strSQL1 += "'" + _MarqueeText + "',";
        strSQL1 += "'" + _Behaviour + "',";
        strSQL1 += "'" + _Direction + "',";
        strSQL1 += "'" + _BgColor + "',";
        strSQL1 += "'" + _TextColor + "',";
        strSQL1 +=_ScrollDelay + ",";
        strSQL1 += "'" + _FontSize + "',";
        strSQL1 += _RecNo + ",";
        strSQL1 += "'" + _Flag + "')";
        string[] Strs ={ strSQL1};
        return ObjdbConnector.BatchTransaction(Strs);
    }

    public DataSet GetAllMarqueeData()
    {
        string strSQL;
        strSQL = "SELECT * from tbl_Marquee";
        DataSet dsTemp;
        dsTemp = ObjdbConnector.GetDataSet(strSQL);
        return dsTemp;
    }
    public DataSet GetMarqueeData()
    {
        string strSQL;
        strSQL = "SELECT * from tbl_Marquee where Flag=1";
        DataSet dsTemp;
        dsTemp = ObjdbConnector.GetDataSet(strSQL);
        return dsTemp;
    }
    public bool Update_NoMarquee()
    {
        string strSQL1;
        strSQL1 = "Update tbl_Marquee set Flag=0";
        string[] Strs ={ strSQL1 };
        return ObjdbConnector.BatchTransaction(Strs);
    }
    public bool Update_MarqueeFalg(int Id)
    {
        string strSQL1;
        strSQL1 = "Update tbl_Marquee set Flag=0 where Id=" + Id;
        string[] Strs ={ strSQL1 };
        return ObjdbConnector.BatchTransaction(Strs);
    }

    public bool Update_SelectedMarquee(int Id)
    {
        string strSQL1;
        strSQL1 = "Update tbl_Marquee set ";
        strSQL1 += "Text='" + _MarqueeText + "',";
        strSQL1 += "Behavior='" + _Behaviour + "',";
        strSQL1 += "Direction='" + _Direction + "',";
        strSQL1 += "BgColor='" + _BgColor + "',";
        strSQL1 += "TextColor='" + _TextColor + "',";
        strSQL1 += "ScrollDelay=" + _ScrollDelay + ",";
        strSQL1 += "FontSize='" + _FontSize + "',";
        strSQL1 += "RecNo=" + _RecNo + ",";
        strSQL1 += "Flag='" + _Flag + "' ";
        strSQL1 += "Where Id=" + Id;
        string[] Strs ={ strSQL1 };
        return ObjdbConnector.BatchTransaction(Strs);
    }
}

