<%@ Page Language="C#" MasterPageFile="~/PropertyNetMasterPage.master" Theme="PropertyNetThemes" AutoEventWireup="true" CodeFile="frmReportErrors.aspx.cs" Inherits="frmReportErrors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width :100%;">
<tr>
<td align ="left" valign ="top" colspan="3" class="LoginTitle" >
    <span style="font-size: 12pt" ><strong>Report Errors </strong></span>
</td>
</tr>
    <tr>
        <td align="left" colspan="3" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="justify" colspan="6">
                        </td>
                </tr>
                <tr>
                    <td align="justify" class="greytext" colspan="6">
                        All advertisements and their respective information posted on our website are to
                        the best knowledge of the advertiser. Should you be aware of any false or incorrect
                        information that has been posted herein, kindly inform us, we will investigate and
                        rectify all error reports accordingly.
                    </td>
                </tr>
                <tr>
                    <td align="justify" colspan="6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="justify" class="greytext" colspan="6">
                        All information submitted to PropertyNet will be strictly confidential.
                    </td>
                </tr>
            </table>
        </td>
    </tr>
<tr>
<td align ="left" valign ="top" colspan="3" >
<asp:Label ID="lblerror" runat ="server" CssClass="lblerror" ></asp:Label>
</td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 163px" >
    <strong>Name</strong><span style="color: #ff3333">*</span></td>
<td align ="left" valign ="top" >
    <strong>:</strong></td>
<td align ="left" valign ="top">
<asp:TextBox ID="txtname" runat ="server" Width="160px" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
        ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 163px" >
    <strong>Contact No</strong><span style="color: #ff3333">*</span></td>
<td align ="left" valign ="top" >
    <strong>:</strong></td>
<td align ="left" valign ="top">
<asp:TextBox ID="txtcontactno" runat ="server" Width="160px" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcontactno"
        ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 163px" >
    <strong>Email Address</strong><span style="color: #ff3333">*</span></td>
<td align ="left" valign ="top" >
    <strong>:</strong></td>
<td align ="left" valign ="top">
<asp:TextBox ID="txtemailid" runat ="server" Width="160px" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemailid"
        ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1"
            runat="server" ControlToValidate="txtEmailId" ErrorMessage="Invalid Email Id"
            Font-Size="8pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 163px" >
    <strong>Feedback</strong><span style="color: #ff3333">*</span></td>
<td align ="left" valign ="top" >
    <strong>:</strong></td>
<td align ="left" valign ="top">
<asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Height="100px" Width="311px" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMsg"
        ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td  valign ="top" colspan="3" >
    <span style="color: #ff0000">* denotes compulsory field</span></td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 163px" ></td>
<td align ="left" valign ="top" ></td>
<td align ="left" valign ="top">&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnsubmit" Text ="submit" runat ="server" OnClick="btnsubmit_Click" />
</td>
</tr>
</table>
</asp:Content>

