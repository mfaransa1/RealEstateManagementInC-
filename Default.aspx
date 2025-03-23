<%@ Page Language="C#" AutoEventWireup="true" Theme="PropertyNetThemes" MasterPageFile="~/PropertyNetMasterPage.master"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="Controls/ucAdvertisementSmallAd.ascx" TagName="ucAdvertisementSmallAd"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function IMG2_onclick() {

}

// ]]>
</script>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" height="330">
        <tr>
            <td valign="top">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td class="LoginTitle" align ="center" style="color: #ff9933">
                        <strong style="font-size: 12pt" >Welcome To Home Page</strong></td>                      
                    </tr>
                    <tr>
                        <td>
                            <table id="tblCommercial" runat="server" border="0" cellpadding="0" cellspacing="0"
                                width="100%">
                                <tr>
                                    <td >
                                        </td>
                                    <td width="26">
                                        <img height="22" src="images/green_left.jpg" width="26" /></td>
                                    <td bgcolor="#129c4f" class="headertext" width="95">
                                        &nbsp;<span class="menu" style="color: #ffffff"> Commercial</span></td>
                                    <td style="color: #ffffff" width="21">
                                        <img height="22" src="images/green_bg1.jpg" width="21" /></td>
                                    <td background="images/green_bg2.jpg" style="color: #ffffff" width="450">
                                        &nbsp;</td>
                                    <td width="24">
                                        <a href="frmCommercialProperty.aspx">
                                            <img  height="22" border="0" src="images/green_right.jpg" alt="" width="21" id="IMG2" /></a></td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                    </td>
                                </tr>
                            </table>
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td valign="top" width="50%">
                                        <asp:DataList ID="DLCommercialSale" runat="server" OnItemDataBound="DLCommercialSale_ItemDataBound"
                                            RepeatColumns="1" RepeatDirection="Horizontal" Width="98%">
                                            <HeaderTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            <b>For Sale</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <td background="images/grayline.gif" class="grayline" width="1%">
                                                    &nbsp;</td>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                    <div align="center">
                                                    </div>
                                                        <tr>
                                                            <td>
                                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                                    <tr>
                                                                        <td class="redtext" colspan="3">
                                                                            <div align="center">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <div align="center">
                                                                                <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>
                                                                                    <div id='Layer1' style='position: absolute; width: 100px; height: 75px; z-index: 1;'>
                                                                                        <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'></a>
                                                                                            <asp:Image ID="imgSoldCommercialSale" runat="server" ImageUrl='Image_Repository/PropertyImages/ThumbImages/sold.gif'
                                                                                                Visible="false" /></div>
                                                                                    <asp:Image ID="Img1" runat="server" Height="75" ImageUrl='<%#ConfigurationManager.AppSettings["PropertyImageTHUMB"] + Eval("Image1")%>'
                                                                                        Width="100" /></a></a></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top" width="23%">
                                                                            Address</td>
                                                                        <td valign="top" width="3%">
                                                                            :</td>
                                                                        <td rowspan="2" valign="top">
                                                                            <%#Eval("Street_Name")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            Type</td>
                                                                        <td bgcolor="#c5caca" valign="top">
                                                                            :</td>
                                                                        <td bgcolor="#c5caca" rowspan="2" valign="top">
                                                                            <%#Eval("BuildingType")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td bgcolor="#c5caca" height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            Price</td>
                                                                        <td valign="top">
                                                                            :</td>
                                                                        <td valign="top">
                                                                            <%#Eval("Price", "{0:$ #,#}")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td align="right">
                                                                            <asp:Label ID="lblImg1" runat="server" Text='<%#Eval("Image1")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg2" runat="server" Text='<%#Eval("Image2")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg3" runat="server" Text='<%#Eval("Image3")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblSetAsMainPhoto" runat="server" Text='<%#Eval("SetAsMainPhoto")%>'
                                                                                Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("StatusId")%>' Visible="false"></asp:Label>
                                                                            <a class="smalltext" style="color:Maroon; font-size:14px" href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>Details>></a></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                </table>
                                                <td background="images/grayline.gif" class="grayline" width="1%">
                                                    &nbsp;</td>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                    <td valign="top" width="50%">
                                        <asp:DataList ID="DLCommercialRent" runat="server" OnItemDataBound="DLCommercialRent_ItemDataBound"
                                            RepeatColumns="1" RepeatDirection="Horizontal" Width="98%">
                                            <HeaderTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            <b>For Rent</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                    <div align="center">
                                                    </div>
                                                        <tr>
                                                            <td>
                                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                                    <tr>
                                                                        <td class="redtext" colspan="3">
                                                                            <div align="center">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <div align="center">
                                                                                <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>
                                                                                    <div id='Layer1' style='position: absolute; width: 100px; height: 75px; z-index: 1;'>
                                                                                        <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'></a>
                                                                                            <asp:Image ID="imgLeasedCommercialRent" runat="server" ImageUrl='Image_Repository/PropertyImages/ThumbImages/leased.gif'
                                                                                                Visible="false" /></div>
                                                                                    <asp:Image ID="Img1" runat="server" Height="75" ImageUrl='<%#ConfigurationManager.AppSettings["PropertyImageTHUMB"] + Eval("Image1")%>'
                                                                                        Width="100" /></a></a></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top" width="23%">
                                                                            Address</td>
                                                                        <td valign="top" width="3%">
                                                                            :</td>
                                                                        <td rowspan="2" valign="top">
                                                                            <%#Eval("Street_Name")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            Type</td>
                                                                        <td bgcolor="#c5caca" valign="top">
                                                                            :</td>
                                                                        <td bgcolor="#c5caca" rowspan="2" valign="top">
                                                                            <%#Eval("BuildingType")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td bgcolor="#c5caca" height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            Price</td>
                                                                        <td valign="top">
                                                                            :</td>
                                                                        <td valign="top">
                                                                            <%#Eval("Price", "{0:$ #,#}")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td align="right">
                                                                            <asp:Label ID="lblImg1" runat="server" Text='<%#Eval("Image1")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg2" runat="server" Text='<%#Eval("Image2")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg3" runat="server" Text='<%#Eval("Image3")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblSetAsMainPhoto" runat="server" Text='<%#Eval("SetAsMainPhoto")%>'
                                                                                Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("StatusId")%>' Visible="false"></asp:Label>
                                                                            <a class="smalltext" style="color:Maroon; font-size:14px" href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>Details>></a></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="tblResidential" runat="server" border="0" cellpadding="0" cellspacing="0"
                                width="100%">
                                <tr>
                                    <td >
                                    </td>
                                    <td width="26">
                                        <img height="22" src="images/green_left.jpg" width="26" /></td>
                                    <td bgcolor="#129c4f" class="headertext" width="95">
                                        &nbsp;<span class="menu" style="color: #ffffff"> Residential</span></td>
                                    <td style="color: #ffffff" width="21">
                                        <img height="22" src="images/green_bg1.jpg" width="21" /></td>
                                    <td background="images/green_bg2.jpg" style="color: #ffffff" width="450">
                                        &nbsp;</td>
                                    <td width="24">
                                        <a href="frmResidentialProperty.aspx">
                                            <img border="0" height="22" src="images/green_right.jpg" width="21" /></a></td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                    </td>
                                </tr>
                            </table>
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td valign="top" width="50%">
                                        <asp:DataList ID="DLResidentialSale" runat="server" OnItemDataBound="DLResidentialSale_ItemDataBound"
                                            RepeatColumns="1" Width="98%">
                                            <ItemTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                    <div align="center">
                                                    </div>
                                                        <tr>
                                                            <td valign="top">
                                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                                    <tr>
                                                                        <td class="redtext" colspan="3">
                                                                            <div align="center">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <div align="center" valign="top">
                                                                                <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>
                                                                                    <div id='Layer1' style='position: absolute; width: 100px; height: 75px; z-index: 1;'>
                                                                                        <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'></a>
                                                                                            <asp:Image ID="imgSoldResidentialSale" runat="server" ImageUrl='Image_Repository/PropertyImages/ThumbImages/sold.gif'
                                                                                                Visible="false" /></div>
                                                                                    <asp:Image ID="Img1" runat="server" Height="75" ImageUrl='<%#ConfigurationManager.AppSettings["PropertyImageTHUMB"] + Eval("Image1")%>'
                                                                                        Width="100" /></a></a></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top" width="23%">
                                                                            Address</td>
                                                                        <td valign="top" width="3%">
                                                                            :</td>
                                                                        <td rowspan="2" valign="top">
                                                                            <%#Eval("Street_Name")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            Type</td>
                                                                        <td bgcolor="#c5caca" valign="top">
                                                                            :</td>
                                                                        <td bgcolor="#c5caca" rowspan="2" valign="top">
                                                                            <%#Eval("BuildingType")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td bgcolor="#c5caca" height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            Price</td>
                                                                        <td valign="top">
                                                                            :</td>
                                                                        <td valign="top">
                                                                            <%#Eval("Price", "{0:$ #,#}")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td align="right">
                                                                            <asp:Label ID="lblImg1" runat="server" Text='<%#Eval("Image1")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg2" runat="server" Text='<%#Eval("Image2")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg3" runat="server" Text='<%#Eval("Image3")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblSetAsMainPhoto" runat="server" Text='<%#Eval("SetAsMainPhoto")%>'
                                                                                Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("StatusId")%>' Visible="false"></asp:Label>
                                                                            <a class="smalltext" style="color:Maroon; font-size:14px" href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>Details>></a></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                </table>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width="49.5%" />
                                            <HeaderTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            <b>For Sale</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                        </asp:DataList></td>
                                    <td valign="top" width="50%">
                                        <asp:DataList ID="DLResidentialRent" runat="server" OnItemDataBound="DLResidentialRent_ItemDataBound"
                                            RepeatColumns="1" Width="98%">
                                            <ItemTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                    <div align="center">
                                                    </div>
                                                        <tr>
                                                            <td>
                                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                                    <tr>
                                                                        <td class="redtext" colspan="3">
                                                                            <div align="center">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <div align="center">
                                                                                <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>
                                                                                    <div id='Layer1' style='position: absolute; width: 100px; height: 75px; z-index: 1;'>
                                                                                        <a href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'></a>
                                                                                            <asp:Image ID="imgLeasedResidentialRent" runat="server" ImageUrl='Image_Repository/PropertyImages/ThumbImages/leased.gif'
                                                                                                Visible="false" /></div>
                                                                                    <asp:Image ID="Img1" runat="server" Height="75" ImageUrl='<%#ConfigurationManager.AppSettings["PropertyImageTHUMB"] + Eval("Image1")%>'
                                                                                        Width="100" /></a></a></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top" width="23%">
                                                                            Address</td>
                                                                        <td valign="top" width="3%">
                                                                            :</td>
                                                                        <td rowspan="2" valign="top">
                                                                            <%#Eval("Street_Name")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            Type</td>
                                                                        <td bgcolor="#c5caca" valign="top">
                                                                            :</td>
                                                                        <td bgcolor="#c5caca" rowspan="2" valign="top">
                                                                            <%#Eval("BuildingType")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td bgcolor="#c5caca" class="greytext" valign="top">
                                                                            &nbsp;</td>
                                                                        <td bgcolor="#c5caca" height="18" valign="top">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="greytext" valign="top">
                                                                            Price</td>
                                                                        <td valign="top">
                                                                            :</td>
                                                                        <td valign="top">
                                                                            <%#Eval("Price", "{0:$ #,#}")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="22">
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td align="right">
                                                                            <asp:Label ID="lblImg1" runat="server" Text='<%#Eval("Image1")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg2" runat="server" Text='<%#Eval("Image2")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblImg3" runat="server" Text='<%#Eval("Image3")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblSetAsMainPhoto" runat="server" Text='<%#Eval("SetAsMainPhoto")%>'
                                                                                Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("StatusId")%>' Visible="false"></asp:Label>
                                                                            <a class="smalltext" style="color:Maroon; font-size:14px" href='frmSearch_Details.aspx?PropertyId=<%#Eval("PropertyId")%>'>Details>></a></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                </table>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width="49.5%" />
                                            <HeaderTemplate>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            <b>For Rent</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                        </asp:DataList></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
           
        </tr>
    </table>
</asp:Content>
