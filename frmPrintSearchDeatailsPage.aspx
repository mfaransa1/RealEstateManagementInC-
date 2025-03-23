<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmPrintSearchDeatailsPage.aspx.cs" Inherits="frmPrintSearchDeatailsPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="CSS/PropertyNet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
     <tr>
         <td align="left" class="LoginTitle" rowspan="1" valign="top" style="width: 160px">
             </td>
         <td class="LoginTitle" colspan="3">
             Search Details</td>
         <td class="LoginTitle" colspan="1">
         </td>
         <td class="LoginTitle" colspan="1">
         </td>
         <td class="LoginTitle" colspan="1">
         </td>
     </tr>
        <tr>
            <td rowspan="13" align="left" valign="top" style="width: 160px">
              <table >
                    <tr>
                        <td>
                            
                        <asp:Image ID="SmallImage1" Width="150px" Height="160px" runat="server" />
                </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Image id="SmallImage2" runat="server" Height="160px" Width="150px"></asp:Image>
                </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Image id="SmallImage3" runat="server" Height="160px" Width="150px"></asp:Image>
                </td>
                    </tr>
                    <tr>
                        <td style="height: 18px">
                            </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
           
            </td>
            <td style="height: 26px" >
                Price</td>
            <td style="width:42px; height: 26px;">
                :</td>
            <td width="60%" align="left" valign="top" style="height: 26px">
                <asp:TextBox ID="txtPrice" runat="server" ></asp:TextBox></td>
            <td align="left" valign="top" width="60%" style="height: 26px">
            </td>
            <td align="left" valign="top" width="60%" style="height: 26px">
            </td>
            <td align="left" valign="top" width="60%" style="height: 26px">
            </td>
        </tr>
       
        <tr>
            <td style="height: 24px" >
                Building
                Type</td>
            <td style="width: 42px; height: 24px;">
                :</td>
            <td align="left" valign="top" style="height: 24px">
                <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" style="height: 24px" valign="top">
            </td>
            <td align="left" style="height: 24px" valign="top">
            </td>
            <td align="left" style="height: 24px" valign="top">
            </td>
        </tr>
     <tr>
         <td>
             Country</td>
         <td style="width: 42px">
             :</td>
         <td align="left" valign="top">
             <asp:DropDownList ID="ddlCountry" runat="server">
                 <asp:ListItem> --Select--</asp:ListItem>
             </asp:DropDownList></td>
         <td align="left" valign="top">
         </td>
         <td align="left" valign="top">
         </td>
         <td align="left" valign="top">
         </td>
     </tr>
     <tr>
         <td>
             State</td>
         <td style="width: 42px">
             :</td>
         <td align="left" valign="top">
             <asp:DropDownList ID="ddlState" runat="server">
                 <asp:ListItem> --Select--</asp:ListItem>
             </asp:DropDownList></td>
         <td align="left" valign="top">
         </td>
         <td align="left" valign="top">
         </td>
         <td align="left" valign="top">
         </td>
     </tr>
       
        <tr>
            <td >
                District</td>
            <td style="width: 42px">
                :</td>
            <td  align="left" valign="top">
                <asp:DropDownList ID="ddlDistrict" runat="server">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td >
                Age</td>
            <td style="width: 42px">
                :</td>
            <td  align="left" valign="top">
                <asp:TextBox ID="txtAge" runat="server" Height="18px" Width="30px"></asp:TextBox></td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td >
                Built in Area</td>
            <td style="width: 42px">
                :</td>
            <td  align="left" valign="top">
                <asp:TextBox ID="txtBuiltInArea1" runat="server" Width="88px"></asp:TextBox></td>
            <td align="left" valign="top">
                </td>
            <td align="left" valign="top">
                </td>
            <td align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td >
                Valuation</td>
            <td style="width: 42px">
                :</td>
            <td align="left" valign="top">
                $<asp:TextBox ID="txtValuation" runat="server" Width="80px"></asp:TextBox></td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
                &nbsp;</td>
            <td align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td >
                Availability</td>
            <td >
                :</td>
            <td  align="left" valign="top">
                <asp:RadioButton ID="rbForRent" runat="server" Text="For Sale" GroupName ="avb1" />
                <asp:RadioButton ID="rbForSale" runat="server" Text="For Rent" GroupName ="avb1" /><br />
            </td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td  align="left" valign="top">
                Summary</td>
            <td align="left" valign="top" style="width: 42px">
                :</td>
            <td >
                <asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Height="73px" Width="184px"></asp:TextBox></td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
     <tr>
         <td align="left" valign="top" style="height: 83px">
             Description</td>
         <td align="left" style="width: 42px; height: 83px;" valign="top">
             :</td>
         <td style="height: 83px">
             <asp:TextBox ID="txtDescription" runat="server" Height="73px" TextMode="MultiLine" Width="184px"></asp:TextBox></td>
         <td style="height: 83px">
         </td>
         <td style="height: 83px">
         </td>
         <td style="height: 83px">
         </td>
     </tr>
     <tr>
         <td align="left" colspan="3" valign="top">
             <table>
                 <tr>
                     <td align="center" colspan="3" class="LoginTitle">
                         Advertisement Details</td>
                 </tr>
                 <tr>
                     <td>
                         Contact Person</td>
                     <td>
                         :<asp:Label ID="lblContactPerson" runat="server"></asp:Label></td>
                     <td rowspan="3">
                         <asp:Image ID="imgMember" runat="server" Height="120px" Width="100px" /></td>
                 </tr>
                 <tr>
                     <td>
                         Contact No</td>
                     <td>
                         :<asp:Label ID="lblContactNo" runat="server"></asp:Label></td>
                 </tr>
                 <tr>
                     <td>
                         Company Name</td>
                     <td>
                         <asp:Label ID="lblCompanyName" runat="server"></asp:Label></td>
                 </tr>
             </table>
         </td>
         <td align="left" colspan="1" valign="top">
         </td>
         <td align="left" colspan="1" valign="top">
         </td>
         <td align="left" colspan="1" valign="top">
         </td>
     </tr>
        <tr>
            <td colspan="3">
            &nbsp;&nbsp;&nbsp; &nbsp;
              <input id="btnPrint" type="button" value="Print" onclick="window.print()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input id="btnColse" type="button" value="Close" onclick="window.close()" />
              
                </td>
            <td colspan="2">
            </td>
            <td colspan="1">
            </td>
        </tr>
       
    </table>
    </div>
    </form>
</body>
</html>
