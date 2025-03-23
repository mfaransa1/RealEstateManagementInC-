<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAdminMenu.ascx.cs" Inherits="Administration_Controls_ucAdminMenu" %>

<link href="../../Administration/CSS/AdminPropertyNet.css" rel="stylesheet" type="text/css" />
<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%"  class="publicloginTable">
    <tr>
        <td align="left" valign="top">
            <asp:Menu ID="Menu1" runat="server" Width="100%" BackColor="#E0E4E4" DynamicHorizontalOffset="2"
                Font-Names="Verdana" Font-Size="10pt" ForeColor="#7C6F57" StaticSubMenuIndent="10px"
                Style="position: relative" CssClass="adminMenu" StaticEnableDefaultPopOutImage="False" 
                Orientation="Horizontal">
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#026AFE" ForeColor="White" />
                <DynamicMenuStyle BackColor="#F7F6F3" />
                <DynamicSelectedStyle BackColor="#5D7B9D" />
                
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <Items>
                    <asp:MenuItem Text="Administration" Value="Administration">
                    
                        <asp:MenuItem NavigateUrl="~/Administration/frmChangePassword.aspx" Text="Change Password"
                            Value="Change Password"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Administration/frmManageStatus.aspx" Text="Manage Status"
                            Value="Manage Status"></asp:MenuItem>
                            
                        <asp:MenuItem Text="Manage Country" Value="Manage Country" NavigateUrl="~/Administration/frmManageCountry.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Manage State" Value="Manage State" NavigateUrl="~/Administration/frmManageState.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Manage District" Value="Manage District" NavigateUrl="~/Administration/frmManageDistrict.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Manage Marquee" Value="Manage Marquee" NavigateUrl="~/Administration/frmManageMarquee.aspx"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Administration/frmBuildingTypeList.aspx" Text="Manage Building Type"
                            Value="Manage Building Type"></asp:MenuItem>
                        
                    </asp:MenuItem>
                    <asp:MenuItem Text="Member List" Value="Member List" NavigateUrl="~/Administration/frmMemberList.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Property List" Value="Ad List" NavigateUrl="~/Administration/frmPropertyAdList.aspx"></asp:MenuItem>
                   <%-- <asp:MenuItem Text="Renewal" Value="Renewal"></asp:MenuItem>--%>
                    <asp:MenuItem Text="Commercial Ad" Value="Commercial Ad" NavigateUrl="~/Administration/frmAdvertisementList.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Logout" Value="Logout" NavigateUrl="~/Administration/frmSignOut.aspx"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#026AFE" ForeColor="White" />
            </asp:Menu>
        </td>
    </tr>
</table>
