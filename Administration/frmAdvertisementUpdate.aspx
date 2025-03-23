<%@ Page Language="C#" AutoEventWireup="true" Theme="PropertyNetThemes" CodeFile="frmAdvertisementUpdate.aspx.cs" MasterPageFile="~/Administration/AdminPropertyNetMasterPageMenu.master" Inherits="Administration_frmAdvertisementUpdate" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
     <table width="100%" height="365" class="publicloginTable"><tr>
    <td  valign="top" align="left" style="height: 516px">
    <table style="width: 100%" class="admintablestyle">
        <tr>
            <td colspan="3" class="LoginTitle">
                
                    <strong>Advertisement Update</strong>
            </td>
        </tr>
        <tr>
            <td align="center" class="lblerror" colspan="4" >
                <asp:Label ID="lblError" runat="server" Text="" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="lblerror" >*-Mandatory Fields
            </td>
           
        </tr>
        <tr>
            <td align="left" width="27%">
                <strong>Type<span class="lblerror">*</span></strong></td>
            <td width="2%">
                <strong>:</strong></td>
            <td align="left">
                <asp:DropDownList ID="ddlType" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" ControlToValidate="ddlType" ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Title<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtTitle" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 26px">
                <strong>Company Name<span class="lblerror">*</span></strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
                <asp:TextBox ID="txtCompanyName" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 26px">
                <strong>Publish Date<span class="lblerror">*</span></strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
                <cc1:GMDatePicker ID="GMPublishDate" runat="server" DateFormat="dd-MMM-yyyy" DateString="DD-Oct-YYYY"
                    Style="position: relative" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" ControlToValidate="GMPublishDate" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Expiry Date<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <cc1:GMDatePicker ID="GMExpiryDate" runat="server" DateFormat="dd-MMM-yyyy" Style="position: relative" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
                &nbsp;
                <asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server" ControlToValidate="GMExpiryDate" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 26px">
                <strong>Fee</strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
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
            <td align="left" valign="top">
                <strong>Short Writeup</strong></td>
            <td valign="top">
                <strong>:</strong></td>
            <td align="left">
                <asp:TextBox ID="txtSwriteUp" runat="server" TextMode="MultiLine" Width="331px" Height="118px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Image (<asp:Label
                                    ID="lblwid" runat="server">780</asp:Label>x
                                <asp:Label ID="lblheight" runat="server">105</asp:Label>
                                for banner)<br />
                    and (63 X 100 for Advertisements)<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:FileUpload ID="fileuploadImage" runat="server" Width="250px" />
                <asp:HyperLink ID="adv_b_img" runat="server" >View Image</asp:HyperLink>&nbsp;<asp:LinkButton
                    ID="lnktbn_DeleteImage" runat="server" OnClick="lnktbn_DeleteImage_Click" CausesValidation="False" >Delete Image</asp:LinkButton><asp:Label
                        ID="Label_Noimg" runat="server" ForeColor="Red"
                        Visible="False">Image Not Available</asp:Label>
                       <%-- <asp:RequiredFieldValidator id="rfvImage" runat="server" ControlToValidate="fileuploadImage" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                        </td>
        </tr>
         <tr>
            <td align="left" style="height: 26px">
                <strong>Display Time<span class="lblerror">*</span></strong></td>
            <td style="height: 26px">
                <strong>:</strong></td>
            <td align="left" style="height: 26px">
                <asp:TextBox ID="txtDispalyTime" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtDispalyTime"></asp:RequiredFieldValidator>&nbsp;
            </td>
        </tr>
        <tr>
            <td align="left">
                <strong>Status<span class="lblerror">*</span></strong></td>
            <td>
                <strong>:</strong></td>
            <td align="left">
                <asp:DropDownList ID="ddlStatus" runat="server">
                </asp:DropDownList><asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="ddlStatus" ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
       
        <tr>
            <td align="left">
            </td>
            <td>
            </td>
            <td align="left">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="65px" />&nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" Width="65px" CausesValidation="False" />&nbsp;&nbsp;
                <input id="Reset1" type="reset" value="Reset" class="btnstyle" />
            </td>
        </tr>
    </table>
</td></tr></table>

    
    </asp:Content>

