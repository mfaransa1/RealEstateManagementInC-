<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmAdvertise.aspx.cs" MasterPageFile="~/PropertyNetMasterPage.master" Inherits="frmAdvertise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border="1" cellpadding="0" cellspacing="0"
        width="100%">
<tr>
<td>


    <table id="tblCommercial" runat="server" border="0" cellpadding="0" cellspacing="0"
        width="100%">
        <tr>
            <td>
            </td>
            <td width="26">
                <img height="22" src="images/green_left.jpg" width="26" /></td>
            <td bgcolor="#129c4f" class="headertext" width="195">
                &nbsp;<span class="menu" style="color: #ffffff"> Advertise</span></td>
            <td style="color: #ffffff" width="21">
                <img height="22" src="images/green_bg1.jpg" width="21" /></td>
            <td background="images/green_bg2.jpg" style="color: #ffffff" width="550">
                &nbsp;</td>
            <td width="24">
                <a href="Commercial_Search.aspx">
                    <img border="0" height="22" src="images/green_right.jpg" width="21" /></a></td>
        </tr>
        <tr>
            <td colspan="6">
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td rowspan="3" valign="top" width="507">
                            <table border="0" cellpadding="0" cellspacing="0" style="border-right: #aca899 1px solid;
                                border-top: #aca899 1px solid; border-bottom: #aca899 1px solid" width="100%">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td background="images/smallbg.jpg" height="26">
                                                    <div align="center">
                                                        <img height="9" src="images/arrow1.gif" width="6" /></div>
                                                </td>
                                                <td background="images/smallbg.jpg" class="greytext" height="26">
                                                    <span class="redtext">What You Get</span></td>
                                            </tr>
                                            <tr>
                                                <td height="26" width="6%">
                                                    <div align="center">
                                                        <img height="9" src="images/arrow.gif" width="7" /></div>
                                                </td>
                                                <td class="greytext" height="31" width="94%">
                                                    Entire webpage for your advertisement</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div align="center">
                                                        <img height="9" src="images/arrow.gif" width="7" /></div>
                                                </td>
                                                <td class="greytext" height="31">
                                                    Upload up to 3 photos for your ad</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div align="center">
                                                        <img height="9" src="images/arrow.gif" width="7" /></div>
                                                </td>
                                                <td class="greytext" height="31">
                                                    Free refresh of up to THREE times for your advertisement post</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div align="center">
                                                        <img height="9" src="images/arrow.gif" width="7" /></div>
                                                </td>
                                                <td class="greytext" height="34">
                                                    Advertiser login account to amend your ad anytime</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td background="images/smallbg.jpg" height="26" width="6%">
                                                    <div align="center">
                                                        <img height="9" src="images/arrow1.gif" width="6" /></div>
                                                </td>
                                                <td background="images/smallbg.jpg" class="greytext" height="26" width="94%">
                                                    <span class="redtext">How to Post An Ad </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" height="40" valign="top">
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="99%">
                                                        <tr>
                                                            <td class="greytext" width="15%">
                                                                Step 1 :</td>
                                                            <td class="greytext" height="31" width="89%">
                                                                Enter advertiser details</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="greytext" height="12">
                                                                Step 2 :</td>
                                                            <td class="greytext" height="31">
                                                                Enter the details of your advertisement</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="greytext" height="12">
                                                                Step 3 :</td>
                                                            <td class="greytext" height="31">
                                                                Submit with photos
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="greytext" height="45">
                                                    For any enquiries on placing an ad, email us at <a href="mailto:enquiry@landnet.com"
                                                        onmousemove="window.status='';">enquiry@propertysearch.com</a></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td rowspan="3" valign="top" width="2%">
                            &nbsp;</td>
                        <td align="left" valign="top" width="40%">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="50%">
                                <tr>
                                    <td>
                                        <strong>
                                            <asp:ImageButton ID="imgFirstTimeUser" runat="server" border="0" CssClass="redtext"
                                                ImageUrl="images/postimg_1.jpg" OnClick="imgFirstTimeUser_Click" />
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <strong>
                                                <asp:LinkButton ID="lnkBtnForFirstTimeUser" runat="server" CssClass="redtext" OnClick="lnkBtnForFirstTimeUser_Click"
                                                    onmousemove="window.status='';"><strong>For First Time User</strong></asp:LinkButton></strong></div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="50%">
                                <tr>
                                    <td>
                                        <strong>
                                            <asp:ImageButton ID="imgPostAnAd" runat="server" border="0" CssClass="redtext" Height="150"
                                                ImageUrl="images/postimg_2.jpg" OnClick="imgPostAnAd_Click" Width="208" />
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div align="center">
                                            <strong>
                                                <asp:LinkButton ID="lnkPostAnAd" runat="server" CssClass="redtext" OnClick="lnkPostAnAd_Click"
                                                    onmousemove="window.status='';"><strong>Advertiser Login</strong></asp:LinkButton></strong></div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</td>
</tr>
</table>
</asp:Content>