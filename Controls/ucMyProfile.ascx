<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMyProfile.ascx.cs" Inherits="Controls_ucMyProfile" %>
<table style="width:100%;height :300px"  cellpadding ="0" cellspacing ="0" border ="0">
<tr>
<td align ="left" valign ="middle"  >
<asp:LinkButton ID="lnkbtnmyprofile" Text ="My Profile" runat ="server" CausesValidation="False" OnClick="lnkbtnmyprofile_Click" ></asp:LinkButton>
</td>
</tr>
<tr>
<td align ="left" valign ="middle" >
<asp:LinkButton ID="lnkbtnchangepassword" Text ="Change Password" runat ="server" CausesValidation="False" OnClick="lnkbtnchangepassword_Click" ></asp:LinkButton>
</td>
</tr>
<tr>
<td align ="left" valign ="middle" >
<asp:LinkButton ID="lnkbtnmyproperty" Text ="My Property" runat ="server" CausesValidation="False" OnClick="lnkbtnmyproperty_Click" ></asp:LinkButton>
</td>
</tr>
<tr>
<td align ="left" valign ="middle" >
<asp:LinkButton ID="lnkbtnpostproperty" Text ="Post Property" runat ="server" CausesValidation="False" OnClick="lnkbtnpostproperty_Click" ></asp:LinkButton>
</td>
</tr>
<%--<tr>
<td align ="left" valign ="middle" >
<asp:LinkButton ID="lnkbtnrenewalproperty" Visible="false" Text ="Renewal Property" runat ="server" CausesValidation="False" ></asp:LinkButton>
</td>
</tr>--%>
<tr>
<td align ="left" valign ="middle" >
<asp:LinkButton ID="lnkbtnlogout" Text ="Logout" runat ="server" CausesValidation="False" OnClick="lnkbtnlogout_Click" ></asp:LinkButton>
</td>
</tr>
</table>
