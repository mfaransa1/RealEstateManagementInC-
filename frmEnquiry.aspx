<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmEnquiry.aspx.cs" Theme="PropertyNetThemes" MasterPageFile="~/PropertyNetMasterPage.master" Inherits="frmEnquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border="1" cellpadding="0" cellspacing="0" width="100%" height="300">
<tr>
<td valign="top" align="left" >
<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
<td colspan="3" class="LoginTitle">Enquiry Form</td>
</tr>
    <tr>
        <td colspan="3">
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </td>
    </tr>

<tr>
<td style="width:20%;">Name<span id="Span2"  style="color: red">*</span></td>
<td align="center" style="width:3%;">:</td>
<td><asp:TextBox ID="txtName" runat="server" Width="160px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
        ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>

<tr>
<td>Email Address<span style="color: #ff0000">*</span></td>
<td align="center">:</td>
<td><asp:TextBox ID="txtEmailAddress" runat="server" Width="160px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailAddress"
        ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailAddress"
        ErrorMessage="Inavlid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
</tr>

<tr>
<td valign="top">Feedback/Comments<span id="Span1"  style="color: red">*</span></td>
<td align="center" valign="top">:</td>
<td><asp:TextBox ID="txtFeedbackComments" runat="server" TextMode="MultiLine" Height="83px" Width="362px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFeedbackComments"
        ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>

<tr>
<td colspan="3"><span id="Span3"  style="color: red">* mark fields are compulsary</span></td>
</tr>

<tr><td></td><td></td>
<td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
</tr>
</table>


</td>
</tr>

</table>



</asp:Content>