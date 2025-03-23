<%@ Page Language="C#" MasterPageFile="~/Administration/AdminPropertyNetMasterPageMenu.master" AutoEventWireup="true" CodeFile="frmAddBuildingType.aspx.cs" Inherits="Administration_frmAddBuildingType"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table border ="0" cellpadding ="0" cellspacing ="0"  width="100%" height="375" class="publicloginTable">
<tr><td align="left" valign="top">
<table width="100%" class="admintablestyle">
<tr><td colspan="3" class="LoginTitle"><b>Building Type</b></td>
</tr>
    <tr>
        <td style="width: 20%" colspan="3">
            <span class="lblerror">* - mark field mandatory</span></td>
       
       
    </tr>

<tr><td style="width:20%">Building Type Name<span class="lblerror">*</span></td><td>:</td><td><asp:TextBox ID="txtBuildingTypeName" runat ="server" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBuildingTypeName"
        ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>

<tr><td>Property Type<span class="lblerror">*</span></td><td>:</td><td><asp:DropDownList ID="ddlPropertyType" runat ="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPropertyType_SelectedIndexChanged" >
    <asp:ListItem Value="0">Select</asp:ListItem>
    <asp:ListItem>Residential</asp:ListItem>
    <asp:ListItem>Commercial</asp:ListItem>
</asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlPropertyType" InitialValue="0"></asp:RequiredFieldValidator>
</td>
</tr>

<tr><td>Room Type<span class="lblerror">*</span></td><td>:</td><td><asp:DropDownList ID="ddlRoomType" runat ="server" >
    <asp:ListItem>Select</asp:ListItem>
</asp:DropDownList>
    <asp:Label ID="lblNotApplicable" runat="server" Text="N/A" Visible="False"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlRoomType" InitialValue="0"></asp:RequiredFieldValidator></td>
</tr>

<tr><td>Description</td><td>:</td><td><asp:TextBox ID="txtDescription" runat ="server" TextMode="MultiLine"></asp:TextBox> </td></tr>
<tr><td align="right" valign="top"></td><td></td><td><asp:Button id="btnADD" onclick="btnADD_Click" runat="server" class="btnstyle" Text="ADD" Width="65px"></asp:Button>&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back"  Width="65px" class="btnstyle" OnClick="btnBack_Click" CausesValidation="False" />

</td></tr>
    <tr>
        <td valign="top" colspan="3">
        
        
        
        
        </td>
        
    </tr>
</table></td></tr></table>

</asp:Content>

