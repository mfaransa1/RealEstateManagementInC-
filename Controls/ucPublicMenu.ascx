<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPublicMenu.ascx.cs"
    Inherits="Controls_ucPublicMenu" %>
<%@ Register Src="ucAdvertisementBanner.ascx" TagName="ucAdvertisementBanner" TagPrefix="uc1" %>
<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" id="tbl1"
    runat="server">
    <tr>
        <td>
            <table width="100%" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="15%">
                        <div style="text-align: center">
                            <a href="frmAboutUS.aspx" class="menu">About Us</a></div>
                    </td>
                    <td width="2%" class="menu">
                        <div style="text-align: center">
                            l</div>
                    </td>
                    <td width="15%">
                        <div style="text-align: center">
                            <a href="frmResidentialProperty.aspx" class="menu">Residential</a></div>
                    </td>
                    <td width="2%" class="menu">
                        <div style="text-align: center">
                            l</div>
                    </td>
                    <td width="15%">
                        <div style="text-align: center">
                            <a href="frmCommercialProperty.aspx" class="menu">Commercial</a></div>
                    </td>
                    <td width="2%" class="menu">
                        <div style="text-align: center">
                            l</div>
                    </td>
                    <td width="15%">
                        <div style="text-align: center">
                            <a href="frmAdvertise.aspx" class="menu">Advertise</a></div>
                    </td>
                    <td width="2%" class="menu">
                        <div style="text-align: center">
                            l</div>
                    </td>
                    <td width="15%">
                        <div style="text-align: center">
                            <a href="frmEnquiry.aspx" class="menu">Enquiry</a></div>
                    </td>
                    <td width="2%" class="menu">
                        <div style="text-align: center">
                            l</div>
                    </td>
                    <td width="15%">
                        <div style="text-align: center">
                            <a href="frmUsefulLink.aspx" class="menu">Useful Links</a></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="13">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 19px">
                        <uc1:ucAdvertisementBanner ID="UcAdvertisementBanner1" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
