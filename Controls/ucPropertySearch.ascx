<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPropertySearch.ascx.cs"
    Inherits="Controls_ucPropertySearch" %>
<link href="../CSS/PropertyNet.css" rel="stylesheet" type="text/css" />
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td colspan="3" class="LoginTitle">
           Property Search
        </td>
    </tr>    
    <tr>
        <td>
            &nbsp;</td>
        <td align="center">
        </td>
        <td>
        </td>
    </tr>
    
    <tr>
        <td>
            <span ><b>Location</b></span></td>
        <td align="center">
            <span ><strong>:</strong></span></td>
        <td><asp:DropDownList ID="ddlDistrict"  runat="server" Width="105px">
        <asp:ListItem>Select</asp:ListItem>
        </asp:DropDownList></td>       
    </tr>
    
    <tr>
        <td style="height: 22px">
            <span ><strong>Categery</strong></span></td>
        <td align="center" style="height: 22px">
            <span ><strong>:</strong></span></td>
        <td style="height: 22px"><asp:DropDownList ID="ddlCategery" runat="server" Width="105px">
            <asp:ListItem>Residential</asp:ListItem>
            <asp:ListItem>Commercial</asp:ListItem>
        </asp:DropDownList></td>       
    </tr>
    
    <tr>
        <td>
            <span ><strong>Price</strong></span></td>
        <td align="center">
            <span ><strong>:</strong></span></td>
        <td><asp:TextBox ID="txtPriceFrom" runat="server" Width="100px" ></asp:TextBox></td>        
    </tr>
    
    <tr>
        <td></td>
        <td></td>
        <td align="left">
            <strong><span >To</span></strong></td>       
    </tr>
    
    <tr >
        <td></td>
        <td></td>
        <td><asp:TextBox ID="txtPriceTo" runat="server" Width="100px"></asp:TextBox></td>        
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    
    <tr>
        <td></td>
        <td></td>
        <td>
            <asp:ImageButton ID="ImgBtnSubmit" runat="server" Height="19px" ImageUrl="~/Images/submit.gif"
                OnClick="ImgBtnSubmit_Click" Width="87px" CausesValidation="False" /></td>       
    </tr>
</table>
