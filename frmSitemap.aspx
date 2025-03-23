<%@ Page Language="C#" MasterPageFile="~/PropertyNetMasterPage.master" AutoEventWireup="true" CodeFile="frmSitemap.aspx.cs" Inherits="frmSitemap" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center >
<table >
<tr>
<td style="width: 72px"><asp:LinkButton ID="linkAboutUs" runat ="server" PostBackUrl="~/frmAboutUs.aspx" >About Us</asp:LinkButton></td>
</tr>
<tr></tr>
<tr>
<td style="width: 72px"><asp:LinkButton ID="linkContactUs" runat ="server" PostBackUrl="~/frmContactUs.aspx" >Contact Us</asp:LinkButton></td>
</tr>
<tr></tr>
<tr>
<td style="width: 72px">
<asp:LinkButton ID="linkHome" runat ="server" PostBackUrl="~/Default.aspx" >Home</asp:LinkButton>
</td>
</tr>

</table>
</center>
</asp:Content>

