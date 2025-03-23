<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmRegistration.aspx.cs" MasterPageFile="~/PropertyNetMasterPage.master" Inherits="frmRegistration" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="publicloginTable">
        <tr>
            <td style="width: 100%" valign="top" align="left">
                <table width="100%" class="admintablestyle">
                    <tr>
                        <td colspan="4" class="LoginTitle" style="height: 17px">
                            Registration</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <asp:Label ID="lblerror" runat="server" Text="" CssClass="redtext" Style="position: relative"></asp:Label>
                        </td>
            </tr>
            <tr>
                <td align="left" colspan="4" width="20%">
                    <span class="redtext">*-Mandatory Fields</span>
                </td>
                
            </tr>
            <tr>
                <td align="left" width="20%">
                    Advertiser<span class="redtext">*</span></td>
                <td width="2%">
                    :</td>
                <td align="left" width="20%">
                    <asp:DropDownList ID="ddlAdvertiser" runat="server" CssClass="dropdown">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Owner</asp:ListItem>
                        <asp:ListItem>Agent</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvAdvertiser" runat="server" ControlToValidate="ddlAdvertiser"
                        ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Member Id<span class="redtext">*</span></td>
                <td>
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtMemberId" runat="server" CssClass="txt" Width="160px" />
                    <asp:RequiredFieldValidator ID="rfvMembreId" runat="server" ControlToValidate="txtMemberId"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:LinkButton ID="lnkbtnCheckAvailability" runat="server" CssClass="linkbtn" CausesValidation="False"
                        OnClick="lnkbtnCheckAvailability_Click">Check Availability</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td align="left">
                    <asp:Label ID="lblExistsMemberId" runat="server" Text="" Visible="false"></asp:Label></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Password<span class="redtext">*</span></td>
                <td>
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="txt" Width="160px" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td >
                </td>
            </tr>
            <tr>
                <td valign="middle">
                    Confirm Password</td>
                <td valign="middle">
                    :</td>
                <td align="left" colspan="2" valign="middle">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="txt" Width="160px"
                        TextMode="Password" />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToCompare="txtPassword"
                        ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Name<span class="redtext">*</span></td>
                <td>
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtMemberName" runat="server" CssClass="txt" Width="160px" />
                    <asp:RequiredFieldValidator ID="rfvMemberName" runat="server" ControlToValidate="txtMemberName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Date Of Birth</td>
                <td>
                    :</td>
                <td align="left">
                    <cc1:GMDatePicker ID="GMDOB" runat="server" CalendarOffsetX="-127px" CalendarTheme="Blue"
                        DateFormat="dd-MM-yyyy" InitialValueMode="Null" YearDropDownRange="100" NoneButtonText="Clear">
                    </cc1:GMDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                        ControlToValidate="GMDOB"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Address Line</td>
                <td valign="top">
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="262px" Height="117px"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Country<span class="redtext">*</span></td>
                <td style="height: 23px">
                    :</td>
                <td align="left">
                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry"
                        ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    State<span class="redtext">*</span></td>
                <td>
                    :</td>
                <td align="left">
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState"
                        ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    District<span class="redtext">*</span>
                </td>
                <td>
                    :</td>
                <td align="left">
                    <asp:DropDownList ID="ddlDistrict" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict"
                        ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Contact Number<span class="redtext">*</span></td>
                <td>
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtContactNo" runat="server" CssClass="txt" Width="160px" />
                    <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="txtContactNo"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Email Id<span class="redtext">*</span></td>
                <td>
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtEmailid" runat="server" CssClass="txt" Width="160px" />
                    <asp:RequiredFieldValidator ID="rfvEmailI" runat="server" ControlToValidate="txtEmailid"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Realtor</td>
                <td>
                    :</td>
                <td align="left">
                    <asp:TextBox ID="txtRealtor" runat="server" CssClass="txt" Width="160px" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Member Image</td>
                <td>
                    :</td>
                <td colspan="2" align="left">
                    <asp:FileUpload ID="fileUploadMemberImage" runat="server" CssClass="fileupload" Width="250px" />&nbsp;
                    </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td align="left">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td>
                </td>
                <td align="left">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnSubmit_Click"
                        Width="65px" />&nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button" OnClick="btnBack_Click"
                        Width="65px" CausesValidation="False" /></td>
                <td>
                </td>
            </tr>
            </table> </td>
        </tr>
    </table>
</asp:Content>
