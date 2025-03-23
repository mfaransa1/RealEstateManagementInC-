<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmEmailThisPage.aspx.cs" MasterPageFile="~/PropertyNetMasterPage.master" Inherits="frmEmailThisPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border ="0" cellpadding ="0" cellspacing ="0" width="100%" height="300">
<tr>
<td valign="top" align="left" style="width: 569px">
  <table width="100%">
  <tr>
  <td colspan="2" valign="middle"><input name="url" type="hidden" value='<%=Request.ServerVariables["HTTP_REFERER"]%>'/>
  
  <table style="border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid; background-color: white" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr><td  style="font-weight: bold; font-size: 13px; background-color: #e0edf6;" class="greytext" colspan="4">Please fill the details</td></tr>
  
  <tr>
  <td width="2%">
      &nbsp;</td>
      
      <td />
      <td>
      </td>
      <td>
          &nbsp;</td>
  </tr>
      <tr>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
          <td align="left">
              <asp:Label ID="lblError" runat="server" Font-Size="10pt" ForeColor="Red" Visible="False"></asp:Label></td>
      </tr>
      <tr style="font-weight: bold; font-size: 7pt; color: #663333">
          <td>
          </td>
          <td class="greytext" width="33%">
              <font size="1">Recipient’s Name*</font>
          </td>
          <td width="2%">
              <strong>:</strong></td>
          <td>
              <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                  ErrorMessage="*" Font-Size="8pt"></asp:RequiredFieldValidator></td>
      </tr>
      <tr style="font-weight: bold; color: #663333">
          <td>
          </td>
          <td width="33%">
              <span style="font-size: 7pt">&nbsp;</span></td>
          <td style="font-size: 7pt" width="2%">
          </td>
          <td style="font-size: 7pt">
          </td>
      </tr>
      <tr style="font-weight: bold; font-size: 7pt; color: #663333">
          <td>
          </td>
          <td class="greytext">
              <font size="1">Recipient’s Email*</font></td>
          <td>
              :</td>
          <td>
              <asp:TextBox ID="txtEmailId" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailId"
                  ErrorMessage="*" Font-Size="8pt"></asp:RequiredFieldValidator><span style="color: #ff0000">
                  </span>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailId"
                  ErrorMessage="Invalid Email Id" Font-Size="8pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
      </tr>
      <tr style="font-weight: bold; color: #663333">
          <td>
          </td>
          <td>
              &nbsp;</td>
          <td>
          </td>
          <td>
          </td>
      </tr>
      <tr>
          <td>
          </td>
          <td class="greytext">
              <strong><font size="1">Sender’s Name</font></strong>*</td>
          <td>
              <strong>:</strong></td>
          <td>
              <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactNo"
                  ErrorMessage="*" Font-Size="8pt"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
          <td>
          </td>
          <td>
          </td>
          <td>
          </td>
          <td>
              &nbsp;</td>
      </tr>
      <tr>
          <td colspan="1">
          </td>
          <td align="left" colspan="3">
              <font color="red">* denotes compulsory field</font>
          </td>
      </tr>
      <tr>
          <td colspan="1">
          </td>
          <td align="center" colspan="3">
              <asp:Button ID="btnSubmit" runat="server" CssClass="login" Height="25px" OnClick="btnSubmit_Click"
                  Text="Submit" /></td>
      </tr>
      <tr>
          <td colspan="1">
          </td>
          <td colspan="3">
              &nbsp;</td>
      </tr>
  </table>
  
  </td>
  </tr></table>

</td>
</tr>


</table>

</asp:Content>