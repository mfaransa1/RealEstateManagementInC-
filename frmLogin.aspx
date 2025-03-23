<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmLogin.aspx.cs" Theme="PropertyNetThemes" MasterPageFile="~/PropertyNetMasterPage.master" Inherits="frmLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border ="0" cellpadding="0" cellspacing ="0" width="100%" height="300"  class="publicloginTable">
<tr>
<td valign ="top" align ="left" style="width:50%; height: 300px;" >


<table align="center" border="0">
                                            <tr>
                                                <td valign="top">
                                                    <table width="100%" border="0" cellpadding="4" cellspacing="4" id="TABLE1">
                                                        <tr>
                                                            <td style="color: #999999; font-weight: bold; font-size: 12px;">
                                                                Not registered yet?
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="middle" class="textbold">
                                                                List your property now&nbsp;&nbsp;<strong><font color="#006699"
                                                                    size="3px">FOR FREE</font></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="100%" cellpadding="5" cellspacing="5">
                                                        
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                                •</td>
                                                            <td class="text">
                                                                Post online property classifieds</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                                •</td>
                                                            <td class="text">
                                                                Sell your own property</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                                •</td>
                                                            <td class="text">
                                                                Easy access and update</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                            </td>
                                                            <td >
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2" valign="middle" >
                                                                It’s free and it only takes less than a minute!
                                                            </td>
                                                        </tr>                                                       
                                                        <tr>
                                                            <td align="left" colspan="2" valign="middle" >
                                                            <asp:LinkButton ID="lnkbtnNewUser" runat="server" CausesValidation="False" OnClick="lnkbtnNewUser_Click">Register Now</asp:LinkButton>
                                                                </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

</td>
<td valign ="top" align ="left" style="width:50%; height: 300px;">

<table  border ="0" cellpadding ="5" cellspacing ="0" width ="100%">

<tr>
<td align ="left" colspan ="3" class="login"><strong >Already Registered?</strong></td>
</tr>
<tr>
<td align ="left" colspan ="3" class="LoginTitle"><strong >Login Now</strong></td>
</tr>
    <tr>
        <td colspan="3" align="center">
            <asp:Label ID="lblError" runat="server" CssClass="lblerror" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="3"><span class="lblerror">*-Mandatory Fields</span>
        </td>
    </tr>

<tr><td>Login Id<span class="lblerror">*</span></td>
<td align ="center" width="2%">:</td>
<td><asp:TextBox ID="txtLoginId" runat="server" Width="150px"></asp:TextBox></td>
</tr>

<tr><td>Password<span class="lblerror">*</span></td>
<td align ="center" >:</td>
<td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
</tr>

<tr>
<td  colspan ="2" ></td>
<td align ="left" ><asp:LinkButton ID="lnkbtnForgotPassword" runat="server" CausesValidation="False" OnClick="lnkbtnForgotPassword_Click">ForgotPassword</asp:LinkButton></td>

</tr>
<tr>
<td colspan="3"></td>
</tr>

<tr><td colspan ="2"></td>
<td align ="center" ><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Width="65px" />
    <input id="Reset1" type="reset" value="Reset" /></td>
</tr>
<tr><td colspan="3">

</td></tr>
<tr>
<td colspan="3"></td>
</tr>


<tr>
<td colspan="3"></td>
</tr>


</table>

</td>


</tr>

</table>

</asp:Content>