<%@ Page Language="C#" MasterPageFile="~/PropertyNetSimpleMaster.master" AutoEventWireup="true" CodeFile="frmSearch_Details.aspx.cs" Inherits="frmSearch_Details"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table width="100%">
     <tr>
         <td align="left" class="LoginTitle" rowspan="1" valign="top" height: 19px;">
             </td>
         <td class="LoginTitle" colspan="3" style="height: 19px">
             Search Details</td>
     </tr>
        <tr>
            <td rowspan="13" align="left" valign="top">
                <table >
                    <tr>
                        <td>
                            
                        <asp:Image ID="SmallImage1" Width="180px" Height="200px" runat="server" />
                </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Image id="SmallImage2" runat="server" Height="200px" Width="180px"></asp:Image>
                </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Image id="SmallImage3" runat="server" Height="200px" Width="180px"></asp:Image>
                </td>
                    </tr>
                </table>
           
            </td>
            <td width="30%" align="left">
                Price</td>
            <td>
                :</td>
            <td width="70%" align="left" valign="middle">
                <%--<asp:TextBox ID="txtPrice" runat="server" ></asp:TextBox>--%>
                <asp:Label ID="txtPrice" runat="server"></asp:Label>
                </td>
        </tr>
       
        <tr>
            <td>
                Building Type</td>
            <td>
                :</td>
            <td align="left" valign="middle">
               
                <asp:Label ID="lblBuildingType" runat="server" ></asp:Label>
                 <asp:DropDownList ID="ddlType" Visible="false" runat="server">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
     <tr>
         <td>
             Country</td>
         <td>
             :</td>
         <td align="left" valign="middle">
             
             <asp:Label ID="lblCountry" runat="server" ></asp:Label>
             <asp:DropDownList ID="ddlCountry" Visible="false" runat="server">
                 <asp:ListItem> --Select--</asp:ListItem>
             </asp:DropDownList>
             </td>
     </tr>
     <tr>
         <td>
             State</td>
         <td>
             :</td>
         <td align="left" valign="middle">
            
              <asp:Label ID="lblState" runat="server" ></asp:Label>
               <asp:DropDownList ID="ddlState" Visible="false" runat="server">
                 <asp:ListItem> --Select--</asp:ListItem>
             </asp:DropDownList>
             </td>
     </tr>
       
        <tr>
            <td >
                District</td>
            <td>
                :</td>
            <td  align="left" valign="middle">
               
                <asp:Label ID="lblDistrict" runat="server" ></asp:Label>
                 <asp:DropDownList ID="ddlDistrict" Visible="false" runat="server">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td >
                Age</td>
            <td>
                :</td>
            <td  align="left" valign="middle">
                <%--<asp:TextBox ID="txtAge" runat="server" Height="18px" Width="30px"></asp:TextBox>--%>
                <asp:Label ID="txtAge" runat="server" Height="18px" Width="30px"></asp:Label>
                </td>
        </tr>
        <tr>
            <td >
                Built in Area</td>
            <td style="width: 42px">
                :</td>
            <td  align="left" valign="middle">
                <%--<asp:TextBox ID="txtBuiltInArea1" runat="server" Width="88px"></asp:TextBox>--%>
                <asp:Label ID="txtBuiltInArea1" runat="server" Width="88px"></asp:Label>
                </td>
        </tr>
        <tr>
            <td >
                Valuation</td>
            <td>
                :</td>
            <td align="left"valign="middle">
                $<%--<asp:TextBox ID="txtValuation" runat="server" Width="80px"></asp:TextBox>--%>
                <asp:Label ID="txtValuation" runat="server" Width="80px"></asp:Label>
                </td>
        </tr>
        <tr>
            <td >
                Availability</td>
            <td >
                :</td>
            <td  align="left">
                <asp:RadioButton ID="rbForRent" runat="server" Text="For Sale" Visible="false" GroupName ="avb1" />
                <asp:RadioButton ID="rbForSale" runat="server" Text="For Rent" Visible="false" GroupName ="avb1" /><br />
                <asp:Label ID="lblRentOrSale" runat="server"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td  align="left">
                Summary</td>
            <td align="left">
                :</td>
            <td >
                <%--<asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Height="73px" Width="184px"></asp:TextBox>--%>
                
                <asp:Label ID="txtSummary" Height="73px" Width="184px" runat="server"></asp:Label>
                
                
                
                </td>
        </tr>
     <tr>
         <td align="left">
             Description</td>
         <td align="left">
             :</td>
         <td >
             <%--<asp:TextBox ID="txtDescription" runat="server" Height="73px" TextMode="MultiLine" Width="184px"></asp:TextBox>--%>
             <asp:Label ID="txtDescription" Height="73px" Width="184px" runat="server"></asp:Label>
             </td>
     </tr>
     <tr>
         <td align="left" colspan="3" valign="middle">
             <table>
                 <tr>
                     <td align="center" colspan="3" class="LoginTitle">
                         Advertiser Details</td>
                 </tr>
                 <tr>
                     <td>
                         Contact Person</td>
                     <td>
                         :<asp:Label ID="lblContactPerson" runat="server"></asp:Label></td>
                     <td rowspan="3">
                         <asp:Image ID="imgMember" runat="server" Height="75px" Width="100px" /></td>
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
     </tr>
        <tr>
            <td colspan="3" valign="top">
                
              
                <table width="100%"><tr><td align="center" colspan="2" ><asp:LinkButton ID="lbtnEmailThisPage" runat="server" OnClick="lbtnEmailThisPage_Click" >Email this page</asp:LinkButton>&nbsp;
                    <asp:HyperLink ID="hLinkPrintThisPage" runat="server">Print this Page</asp:HyperLink>&nbsp;
                    <asp:LinkButton ID="lnkBtnReportErrors" runat="server" OnClick="lnkBtnReportErrors_Click">Report Errors on this Ad</asp:LinkButton></td></tr>
                </table>
            </td>
        </tr>
       
    </table>  
</asp:Content>

