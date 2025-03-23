<%@ Page Language="C#" AutoEventWireup="true" Theme="PropertyNetThemes" CodeFile="frmAdvertisementAdd.aspx.cs" MasterPageFile="~/Administration/AdminPropertyNetMasterPageMenu.master" Inherits="Administration_frmAdvertisementAdd" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" height="373" class="publicloginTable"><tr>
    <td  valign="top" align="left" style="width: 992px">
    <table style="width: 100%" class="admintablestyle">
        <tr>
            <td colspan="3" class="LoginTitle">
                
                    <strong>Advertisement Ad</strong></td>
        </tr>
        <tr>
            <td align="center" class="lblerror" colspan="4">
                <asp:Label ID="lblError" runat="server" CssClass="lblerror" 
                    Visible="False"></asp:Label></td>
        </tr>
        
        <tr>
            <td align="left" colspan="4" class="lblerror">*-Mandatory Fields
            
            </td>
        </tr>
        
        <tr>
            <td align="left" width="25%" style="height: 24px">
                <strong>Type<span class="lblerror">*</span></strong></td>
            <td width="2%" style="height: 24px">
                <strong>:</strong></td>
            <td align="left" style="height: 24px">
                <asp:DropDownList ID="ddlType" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="*" ControlToValidate="ddlType" CssClass="lblerror" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Title<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtTitle" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="*" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 26px">
                <strong>Company Name<span class="lblerror">*</span></strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
                <asp:TextBox ID="txtCompanyName" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ErrorMessage="*" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 26px">
                <strong>Publish Date<span class="lblerror">*</span></strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
                <cc1:GMDatePicker ID="GMPublishDate" runat="server" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
                <asp:RequiredFieldValidator ID="rfvPublishDate" runat="server" ErrorMessage="*" ControlToValidate="GMPublishDate"></asp:RequiredFieldValidator>
               
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 26px">
                <strong>Expiry Date<span class="lblerror">*</span></strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
            
                <cc1:GMDatePicker ID="GMExpiryDate" runat="server" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
                <asp:RequiredFieldValidator ID="rfvExpiryDate" runat="server" ErrorMessage="*" ControlToValidate="GMExpiryDate"></asp:RequiredFieldValidator>&nbsp;
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Fee</strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtFee" runat="server" Width="160px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Target Url</strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtTaregtUrl" runat="server" Width="160px"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr>
            <td align="left"  valign="top">
                <strong>Short Writeup</strong></td>
            <td valign="top">
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtShortWriteUp" runat="server" TextMode="MultiLine" Width="385px" Height="85px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Image(<asp:Label
                                    ID="lblwid" runat="server">780</asp:Label>x
                                <asp:Label ID="lblheight" runat="server">105</asp:Label>
                                for banner)<br />
                    and (63 X 100 for Advertisements)<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:FileUpload ID="fileuploadImage" runat="server" Width="250px" />&nbsp;
                <asp:RequiredFieldValidator id="rfvFileupload" runat="server" ControlToValidate="fileuploadImage" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
           <td align="left">
                <strong>Display Time<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtDispalyTime" runat="server" Width="44px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDisplayTime" runat="server" ErrorMessage="*" ControlToValidate="txtDispalyTime"></asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr>
            <td align="left">
                <strong>Status<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:DropDownList ID="ddlStatus" runat="server" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ErrorMessage="*" ControlToValidate="ddlStatus" CssClass="lblerror" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            
        </tr>
        <tr>
            <td align="left">
            </td>
            <td>
            </td>
            <td align="left">
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" Width="65px" OnClick="btnSubmit_Click" />&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button" Width="65px" OnClick="btnBack_Click" CausesValidation="False" />
            </td>
        </tr>
    </table>
</td></tr></table>

</asp:Content>