<%@ Page Language="C#" MasterPageFile="~/PropertyNetMasterPage.master" AutoEventWireup="true" CodeFile="frmRegistration_Success.aspx.cs" Inherits="frmRegistration_Success" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table border="0" cellpadding="0" cellspacing="0" width="100%" height="300">
   <tr>
   <td valign="top" align="center" style="width: 569px">
      <table border="0" cellpadding="5" cellspacing="0" width="99%"  class="publicloginTable"> 
      <tr>
        <td align ="left" class="LoginTitle" ><strong >Registration Success</strong></td>      
      </tr> 
      
      <tr align="center" valign="middle" height="200">
      <td align ="center" class="menu" >Thanks for registring with us.<br />
          <br />
          <asp:LinkButton ID="lnkBtnClickHere" runat="server" OnClick="lnkBtnClickHere_Click">Click here</asp:LinkButton>
       to view account details</td>
      </tr>
           
      </table>
   
   </td>
   </tr>
   
   </table>

</asp:Content>

