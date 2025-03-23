<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmForgotPassword.aspx.cs" Theme="PropertyNetThemes" MasterPageFile="~/PropertyNetMasterPage.master" Inherits="frmForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border ="0" cellpadding ="o" cellspacing ="0" width ="100%" height="300">
<tr>
<td valign="top" align="center" style="width: 569px">
<table border="0" cellpadding="5" cellspacing="0" width="100%" class="publicloginTable">
       <tr>
        <td class="LoginTitle" align ="left" ><strong >Forgot Password</strong></td>
    
       </tr>       
       
       <tr>
       <td align="left" > <asp:Label ID="lblError" runat="server" Text=""></asp:Label></td>     
       </tr>
       
       <tr>
       <td align="justify"><div align="justify">If you already have Member Id ,Password to access your web account but<br/> have
        forgotten password,type your Member-Id below and click to Check</div>       
       </td>
       </tr>
       
       <tr>
       <td></td>
       </tr>
       
       <tr>
       <td>Member ID:<asp:TextBox ID="txtMemberId" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMemberId"
               ErrorMessage="*" ValidationGroup="login"></asp:RequiredFieldValidator></td>
       </tr>
    <tr>
        <td align ="center">
            <asp:Button ID="btnCheck" runat="server" Text="Check" OnClick="btnCheck_Click" />
        </td>
    </tr>
       
</table>

</td>
</tr>

</table>


</asp:Content>