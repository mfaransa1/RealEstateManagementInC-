<%@ Page Language="C#" AutoEventWireup="true" Theme="PropertyNetThemes" CodeFile="frmMyProfile.aspx.cs" MasterPageFile="~/MyProfieMasterPage.master"  Inherits="frmMyProfile" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border ="0" cellpadding ="0" cellspacing ="0"  width="100%" height="372" class="publicloginTable">
<tr >

<td style="width:100%" valign="top" align="left">
 <table width="100%" class="admintablestyle">
        
        <tr>
            <td colspan="3" class="LoginTitle">
                Member Update
            </td>
        </tr>
     <tr>
         <td align="left" colspan="3"><span class="lblerror">*-Mandatory Fields</span>
         </td>
     </tr>
        <tr>
            <td  align="left" width="17%" >Member Id<span class="lblerror">*</span>
            </td>
            <td width="2%" >:
            </td>
            <td align="left" >
                <asp:TextBox ID="txtMemberId" runat="server" Width="160px" ReadOnly="True" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMemberId" runat="server" ControlToValidate="txtMemberId"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td width="19%">Member Name<span class="lblerror">*</span>
            </td>
            <td style="height: 26px">:
            </td>
            <td align="left" >
                <asp:TextBox ID="txtMemberName" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMemberName" runat="server" ControlToValidate="txtMemberName"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Date Of Birth<span class="lblerror">*</span>
            </td>
            <td>:
            </td>
            <td align="left">
                <cc1:GMDatePicker ID="GMDOB" runat="server" CalendarOffsetX="-127px" CalendarTheme="Blue" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" YearDropDownRange="100">
                </cc1:GMDatePicker>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="GMDOB"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
     <tr>
         <td valign="top">
             Address Line</td>
         <td valign="top">
             :</td>
         <td align="left" >
             <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="221px" Height="108px"></asp:TextBox>
         </td>
     </tr>
     <tr>
         <td>
             Country<span class="lblerror">*</span></td>
         <td>
             :</td>
         <td align="left">
             <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                 <asp:ListItem>Select</asp:ListItem>
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry"
                 ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator></td>
     </tr>
     <tr>
         <td >
             State<span class="lblerror">*</span></td>
         <td >
             :</td>
         <td align="left" >
         <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
             <asp:ListItem>Select</asp:ListItem>
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState"
                 ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator></td>
     </tr>
     <tr>
         <td>
             District<span class="lblerror">*</span></td>
         <td>
             :</td>
         <td align="left">
         <asp:DropDownList ID="ddlDistrict" runat="server">
             <asp:ListItem>Select</asp:ListItem>
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict"
                 ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator></td>
     </tr>
        <tr>
            <td >Contact Number<span class="lblerror">*</span>
            </td>
            <td >:
            </td>
            <td align="left" >
                <asp:TextBox ID="txtContactNo" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="txtContactNo"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Phone Number" ControlToValidate="txtContactNo" ValidationExpression="(9\d{9})"></asp:RegularExpressionValidator>
                    </td>
        </tr>
        <tr>
        <td>
        Email Id<span class="lblerror">*</span>
        </td>
        <td>
        :
        </td>
        <td align="left">
            <asp:TextBox ID="txtEmailId" runat="server" Width="160px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmailId" runat="server" ControlToValidate="txtEmailId"
                ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Email Id" ControlToValidate="txtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
        <td >
        Advertiser<span class="lblerror">*</span>
        </td>
        <td >
        :
        </td>
        <td align="left" >
            <asp:DropDownList ID="ddlAdvertiser" runat="server">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Owner</asp:ListItem>
                <asp:ListItem>Agent</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvAdvertiser" runat="server" ControlToValidate="ddlAdvertiser"
                ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td>
        Realter
        </td>
        <td>
        :
        </td>
        <td align="left">
            <asp:TextBox ID="txtRealter" runat="server" Width="160px"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td >
        Upload Image<span class="lblerror">*</span>
        </td>
        <td >
        :
        </td>
        <td align="left" >
            <asp:FileUpload ID="fileUpLoadMemberImage" runat="server" Width="250px" />
            <asp:HyperLink id="member_b_img" runat="server">View Image</asp:HyperLink>
            <asp:LinkButton id="lnktbn_DeleteImage" onclick="lnktbn_DeleteImage_Click" runat="server" CausesValidation="False">Delete Image</asp:LinkButton>
            <asp:Label id="Label_Noimg" runat="server" Visible="False" ForeColor="Red">Image Not Available</asp:Label>
            </td>
        </tr>
        <tr>
        <td align="right">
            
        </td>
        <td>
        
        </td>
        <td>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="65px" />&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <input id="Reset" type="reset" value="Reset" class="btnstyle" />
        </td>
        </tr>
    </table>
</td>
    </tr></table>

</asp:Content>





<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table style="width:100%;height:300px">
<tr>
<td colspan="3" align ="left" valign ="top" >
<asp:Label ID="lblerror" runat="server" ForeColor="Red" ></asp:Label>
</td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 110px">
    <span style="font-size: 10pt; font-family: Verdana"><strong>Advertiser</strong></span><span style="color: #ff3333"> * </span>
</td>
<td align ="left" valign ="top">
    <span style="font-size: 10pt; font-family: Verdana"><strong>:</strong></span></td>
<td align ="left" valign ="top">
<asp:DropDownList ID="ddlist1" runat ="server" >
 </asp:DropDownList>
<asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat ="server" ControlToValidate="ddlist1" ErrorMessage="Select any advertiser" ></asp:RequiredFieldValidator>
 </td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 110px">
    <span style="font-size: 10pt; font-family: Verdana"><strong>Name</strong></span>&nbsp;<span style="color: #ff3333">* </span>
</td>
<td align ="left" valign ="top">
    <span style="font-size: 10pt; font-family: Verdana"><strong>:</strong></span></td>
<td align ="left" valign ="top">
<asp:TextBox ID="txtname" runat ="server" ></asp:TextBox>
<asp:RequiredFieldValidator ID="requirefieldvalidatot2" runat ="server" ControlToValidate="txtname" ErrorMessage="Name is compulsory" Display="Dynamic" ></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 110px">
    <span style="font-size: 10pt; font-family: Verdana"><strong>DateOfBirth</strong></span></td>
<td align ="left" valign ="top">
    <span style="font-size: 10pt; font-family: Verdana"><strong>:</strong></span></td>
<td align ="left" valign ="top">
<asp:TextBox ID="txtdob" runat ="server" ></asp:TextBox>
</td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 110px">
    <span style="font-size: 10pt; font-family: Verdana"><strong>Email-id</strong></span></td>
<td align ="left" valign ="top">
    <span style="font-size: 10pt; font-family: Verdana"><strong>:</strong></span></td>
<td align ="left" valign ="top">
<asp:TextBox ID ="txtemailid" runat ="server" ></asp:TextBox>
</td>
</tr>
<tr>
<td align ="left" valign ="top" style="width: 110px">
    <span style="font-size: 10pt; font-family: Verdana"><strong>PersonalPhoto</strong></span></td>
<td align ="left" valign ="top">
    <span style="font-size: 10pt; font-family: Verdana"><strong>:</strong></span></td>
<td align ="left" valign ="top">
<asp:Image ID="image1" Width ="55" Height ="55" runat ="server" />  <br />
<asp:FileUpload ID="fileupload" runat="server" /><br />
    <asp:LinkButton ID="lbtn" runat="server">Delete</asp:LinkButton></td>
</tr>
    <tr>
        <td align="left" colspan="3" valign="top"><span id="Span3"  style="color: red">*</span>Denotes compulsary fields
        </td>
    </tr>
<tr>
<td align ="left" valign ="top" style="width: 110px"></td>
<td align ="left" valign ="top"></td>
<td align ="left" valign ="top">
<asp:Button ID="btnupdate" Text ="Update" runat ="server" OnClick="btnupdate_Click" />&nbsp;&nbsp;&nbsp;
    <input id="Reset1" type="reset" value="Reset" class="btnstyle" />
</td>
</tr>
</table>--%>
