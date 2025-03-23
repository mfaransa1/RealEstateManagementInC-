<%@ Page Language="C#" AutoEventWireup="true" Theme="PropertyNetThemes" CodeFile="frmChangePassword.aspx.cs" MasterPageFile="~/MyProfieMasterPage.master" Inherits="frmChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <table border="0" cellpadding="0" cellspacing="0" width="100%" height="300">
        <tr>
            <td valign="top" align="center" style="width:569px">
                <table border="0" cellpadding="5" cellspacing="0" width="95%" class="publicloginTable">
                    <tr>
                        <td colspan="3" height="20" align="left" class="LoginTitle">
                            Change Password
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Label ID="lblsuccess" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    <td align="left"  colspan="3">
                        <asp:Label ID="lblError" runat="server" CssClass="lblerror"></asp:Label>
                    </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <span><strong>
                            Old Password<span class="lblerror">*</span> </strong></span>
                        </td>
                        <td align="center" style ="width :5%">
                            <span ><strong>: </strong></span>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <span><strong>
                           New Password<span class="lblerror">*</span></strong></span></td>
                        <td align="center">
                            <span><strong>:</strong></span></td>
                        <td align="left">
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox></td></tr>
                            <tr>
                            <td align="Left">
                                <span><strong>Confirm Password<span class="lblerror">*</span></strong></span></td>
                            <td align="center">
                                <span><strong>:</strong></span></td>
                            <td align="left" runat="server">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtNewPassword"
                                    ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is not Same" Style="position: relative"></asp:CompareValidator></td>
                             </tr>
                    
                    <tr>
                    <td ></td>
                    <td></td>
                    <td align="left">
                        <asp:Button ID="btnSubmit" runat="server" class="btnstyle" Text="Submit" OnClick="btnSubmit_Click"/>&nbsp;&nbsp;<input id="Reset1" type="reset"
                            value="Reset" class="btnstyle" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>