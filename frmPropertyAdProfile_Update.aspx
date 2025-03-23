<%@ Page Language="C#" MasterPageFile="~/MyProfieMasterPage.master" Theme="PropertyNetThemes" AutoEventWireup="true" CodeFile="frmPropertyAdProfile_Update.aspx.cs" Inherits="frmPropertyAdProfile_Update" Title="Welcome to PropertyNet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td valign="top" align="center">
<table border="0" cellpadding="0" cellspacing="0" id="TABLE1" onclick="return TABLE1_onclick()" >
<tr><td colspan="9" align="left" class="LoginTitle">Property Update</td></tr>
    <tr>
        <td align="center" colspan="6" class="lblerror">
            <asp:Label ID="lblError" runat="server" Text="" Visible="false" style="position: relative"></asp:Label></td>
        <td align="left">
        </td>
    </tr>
<tr><td align="left">Property Type</td><td>:</td><td align="left" colspan="4" >
    <asp:DropDownList ID="ddlPropertyType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPropertyType_SelectedIndexChanged">
    <asp:ListItem>Select</asp:ListItem>
    <asp:ListItem>Residential</asp:ListItem>
    <asp:ListItem>Commercial</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPropertyType"
        ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator></td>
    <td align="left">
    </td>
</tr>

<tr><td align="left" style="height: 22px">Room Type</td><td style="height: 22px" >:</td><td align="left" style="height: 22px" colspan="4" >
    <asp:DropDownList ID="ddlRoomType" runat="server">
        <asp:ListItem>Select</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlRoomType"
        ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
    <asp:Label ID="lblNotApplicable" runat="server" Text="NotApplicable" Visible="false"></asp:Label></td>
    <td align="left" style="height: 22px">
    </td>
</tr>
<tr><td align="left" style="height: 22px">Building Type</td><td style="height: 22px" >:</td><td align="left" colspan="4" style="height: 22px" >
    <asp:DropDownList ID="ddlBuildingType" runat="server">
        <asp:ListItem>Select</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlBuildingType"
        ErrorMessage="*" InitialValue="Select" Style="position: relative"></asp:RequiredFieldValidator></td>
    <td align="left" style="height: 22px">
    </td>
</tr>
<tr><td align="left">Rent/Sale</td><td>:</td><td align="left" colspan="4" >
    <asp:DropDownList ID="ddlRentSale" runat="server">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Rent</asp:ListItem>
        <asp:ListItem>Sale</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlRentSale"
        ErrorMessage="*" InitialValue="Select" Style="position: relative"></asp:RequiredFieldValidator></td>
    <td align="left">
    </td>
</tr>
<tr><td align="left">Building HsNo</td><td >:</td><td align="left" colspan="4" >
    <asp:TextBox ID="txtBuildingHsNo" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBuildingHsNo"
        ErrorMessage="*" Style="position: relative"></asp:RequiredFieldValidator></td>
    <td align="left">
    </td>
</tr>
<tr><td align="left">Street Name</td><td >:</td><td align="left" colspan="4" >
    <asp:TextBox ID="txtStreetName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtStreetName"
        ErrorMessage="*" Style="position: relative"></asp:RequiredFieldValidator></td>
    <td align="left">
    </td>
</tr>
<tr><td align="left">Unit No</td><td >:</td><td align="left" colspan="4" >#<asp:TextBox ID="txtUnitno" width="20%" runat="server"></asp:TextBox>--<asp:TextBox ID="txtUnitno1"
       Width="20%" runat="server"></asp:TextBox></td>
    <td align="left">
    </td>
</tr>
       <tr><td align="left">Building/Estate Name</td><td >:</td><td align="left" colspan="4" >
           <asp:TextBox ID="txtBuildingEstateName" runat="server"></asp:TextBox></td>
           <td align="left">
           </td>
       </tr>
           <tr><td align="left">Postal Code</td><td >:</td><td align="left" colspan="4" >
               <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox></td>
               <td align="left" >
               </td>
           </tr>
               <tr><td align="left" style="height: 22px">Country</td><td style="height: 22px" >:</td><td align="left" colspan="4" style="height: 22px" >
                   <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                       <asp:ListItem>Select</asp:ListItem>
                   </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCountry"
                       ErrorMessage="*" InitialValue="Select" Style="position: relative"></asp:RequiredFieldValidator></td>
                   <td align="left" style="height: 22px">
                   </td>
               </tr>
                   <tr><td align="left">State</td><td >:</td><td align="left" colspan="4" >
                       <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                           <asp:ListItem>Select</asp:ListItem>
                       </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlState"
                           ErrorMessage="*" InitialValue="Select" Style="position: relative"></asp:RequiredFieldValidator></td>
                       <td align="left" >
                       </td>
                   </tr>
                       <tr><td align="left">Location</td><td >:</td><td align="left" colspan="4" >
                           <asp:DropDownList ID="ddlDistrict" runat="server">
                               <asp:ListItem>Select</asp:ListItem>
                           </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlDistrict"
                               ErrorMessage="*" InitialValue="Select" Style="position: relative"></asp:RequiredFieldValidator></td>
                           <td align="left" >
                           </td>
                       </tr>
                           <tr><td align="left" >Price</td><td  >:</td><td align="left" colspan="4"  >$<asp:TextBox ID="txtPrice" OnKeypress="return onlyNumbers(event)" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPrice"
                                   ErrorMessage="*" Style="position: relative"></asp:RequiredFieldValidator></td>
                               <td align="left" >
                               </td>
                           </tr>
                           
                <tr><td align="left">Valuation</td><td >:</td><td align="left" colspan="4" >
                    <asp:TextBox ID="txtValuation" OnKeypress="return onlyNumbers(event)" runat="server"></asp:TextBox></td>
                    <td align="left" >
                    </td>
                </tr>  
                    <tr><td align="left">Built in Area</td><td >:</td><td align="left" colspan="5" >
                        <asp:TextBox ID="txtBuiltinArea" OnKeypress="return onlyNumbers(event)" runat="server"></asp:TextBox></td>
                    </tr>
                        <tr><td align="left">Age</td><td >:</td><td align="left" colspan="5" >
                            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr><td align="left">Tenure</td><td >:</td><td align="left" colspan="4" >
                            <asp:DropDownList ID="ddlTenure" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                            </asp:DropDownList></td>
                            <td align="left" >
                            </td>
                        </tr>
                            <tr><td align="left">No.of BedRooms</td><td >:</td><td align="left" colspan="4">
                                <asp:TextBox ID="txtBedrooms" OnKeypress="return onlyNumbers(event)" runat="server"></asp:TextBox></td>
                                <td align="left">
                                </td>
                            </tr>
                                <tr><td align="left">Summary</td><td >:</td><td align="left">
                                    <asp:TextBox ID="txtSummary" TextMode="MultiLine"  runat="server" Width="200px"></asp:TextBox></td>
                                    <td align="left" colspan="3">
                                    </td>
                                    <td align="left">
                                    </td>
                                </tr>
                                    <tr><td align="left">Description</td><td>:</td><td align="left" >
                                        <asp:TextBox ID="txtDescription" TextMode="MultiLine"  runat="server" Width="200px"></asp:TextBox></td>
                                        <td align="left" colspan="3" >
                                        </td>
                                        <td align="left" >
                                        </td>
                                    </tr>
                                        <tr><td align="left" ><strong>Upload Pictures</strong></td></tr>
                                        <tr><td align="left" colspan="3" >
                                            Picture1:</td>
                                            <td align="left" colspan="3">
                                                Description: &nbsp;</td>
                                            <td align="left">
                                            </td>
                                           </tr>
    <tr>
        <td align="left" colspan="3">
        <asp:FileUpload id="fileuploadImage1" runat="server"></asp:FileUpload>
        <br /><asp:HyperLink id="member_b_img1" runat="server">View Image</asp:HyperLink>&nbsp;<asp:LinkButton id="lnkbtn_DeleteImage1" onclick="lnkbtn_DeleteImage1_Click" runat="server" CausesValidation="False">Delete Image</asp:LinkButton>&nbsp;<asp:Label id="Label_Noimg1" runat="server" ForeColor="Red" Visible="False">Image Not Available</asp:Label></td>
        <td align="left" colspan="3">
        <asp:TextBox id="txtDescription1" TextMode="MultiLine" runat="server" Height="51px" Width="200px"></asp:TextBox>
        </td>
        <td align="left">
        </td>
    </tr>
   <tr><td align="left" colspan="3" >
       Picture2:</td>
                                            <td align="left"  colspan="3">
                                                Description: &nbsp;</td>
                                            <td align="left" >
                                            </td>
                                           </tr>
    <tr>
        <td align="left" colspan="3">
        <asp:FileUpload id="fileuploadImage2" runat="server"></asp:FileUpload>
        <br /><asp:HyperLink id="member_b_img2" runat="server">View Image</asp:HyperLink>&nbsp;<asp:LinkButton id="lnkbtn_DeleteImage2" onclick="lnkbtn_DeleteImage2_Click" runat="server" CausesValidation="False">Delete Image</asp:LinkButton>&nbsp;<asp:Label id="Label_Noimg2" runat="server" Visible="False" ForeColor="Red">Image Not Available</asp:Label>
        </td>
        <td align="left" colspan="3">
        <asp:TextBox id="txtDescription2" TextMode="MultiLine" runat="server" Height="51px" Width="200px"></asp:TextBox>
        </td>
        <td align="left">
        </td>
    </tr>
    
    <tr><td align="left" colspan="3" style="height: 16px" >
        Picture3:</td>
                                            <td align="left" colspan="3" style="height: 16px">
                                                Description: &nbsp;</td>
                                            <td align="left" style="height: 16px">
                                            </td>
                                           </tr>
    <tr>
        <td align="left" colspan="3">
        <asp:FileUpload id="fileuploadImage3" runat="server"></asp:FileUpload><br /><asp:HyperLink id="member_b_img3" runat="server">View Image</asp:HyperLink>&nbsp;<asp:LinkButton id="lnkbtn_DeleteImage3" onclick="lnkbtn_DeleteImage3_Click" runat="server" CausesValidation="False">Delete Image</asp:LinkButton>&nbsp;<asp:Label id="Label_Noimg3" runat="server" Visible="False" ForeColor="Red">Image Not Available</asp:Label>
        </td>
        <td align="left" colspan="3">
        <asp:TextBox id="txtDescription3" TextMode="MultiLine" runat="server" Height="51px" Width="200px"></asp:TextBox>
        </td>
        <td align="left">
        </td>
    </tr>
    <tr><td colspan="6">
    </td></tr>
    
                                              <tr><td></td><td ></td><td align="left">
                                                  <asp:Button id="btnUpdate" onclick="btnUpdate_Click" runat="server" Width="65px" Text="Update"></asp:Button>&nbsp;<asp:Button id="btnBack" onclick="btnBack_Click" runat="server" Width="65px" Text="Back" CausesValidation="False"></asp:Button>&nbsp;<input id="Reset" class="btnstyle" type="Reset" value="reset" /></td></tr>       
</table>
</td></tr>

</table>


</asp:Content>

