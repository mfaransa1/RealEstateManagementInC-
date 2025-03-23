<%@ Page Language="C#" MasterPageFile="~/MyProfieMasterPage.master" AutoEventWireup="true" CodeFile="frmPropertyAdList.aspx.cs" Inherits="frmPropertyAdList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
function toggleAllCheckboxes(toggle)
{

var frm=document.forms[0];
for(i=0;i<frm.length;i++)
if(frm.elements[i].type=="checkbox")
if(frm.elements[i].name.indexOf('Cbx')==0)
frm.elements[i].checked=toggle;
}
</script>

<table width ="100%" class="publicloginTable"><tr><td><table width ="100%" class="admintablestyle">
    <tr>
        <td colspan="5" class="LoginTitle" >
            PROPERTY LIST PAGE</td>
    </tr>
<tr><td width="18%">Property Type</td>
    <td width="2%">
        :</td>
    <td colspan="3"><asp:DropDownList id="ddlPropertyType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPropertyType_SelectedIndexChanged">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Residential</asp:ListItem>
        <asp:ListItem>Commercial</asp:ListItem>
    </asp:DropDownList></td></tr>

<tr><td>
    Room Type</td>
    <td>
        :</td>
    <td colspan="3">
    <asp:DropDownList ID="ddlRoomType" runat="server">
    </asp:DropDownList>
        <asp:Label ID="lblNotApplicable" runat="server" Text="NotApplicable" Visible="False"></asp:Label>
    </td></tr>

<tr><td>
    Rent/Sale</td>
    <td>
        :</td>
    <td colspan="3">
    <asp:DropDownList ID="ddlRentSale" runat="server">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Rent</asp:ListItem>
        <asp:ListItem>Sale</asp:ListItem>
    </asp:DropDownList></td></tr>
    <tr>
        <td>Location
        </td>
        <td>
            :</td>
        <td colspan="3">
        <asp:DropDownList ID="ddlLocation" runat="server" style="position: relative">
        </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td colspan="3">
            <asp:Button ID="btnSearch" runat="server" Text="Search" Width="65px" OnClick="btnSearch_Click" /></td>
    </tr>
    <tr>
        <td colspan="5"><table ><tr><td style="height: 26px"><asp:Button ID="btnDelete" runat ="server" Text ="Delete" Width="65px" OnClick="btnDelete_Click"/></td><td align="right" style="height: 26px"><asp:Button ID="btnAdd" runat ="server"  Text ="ADD" Width="65px" OnClick="btnAdd_Click"/></td></tr>
        <tr><td colspan="2">
            <asp:GridView ID="gvPropertyAd" runat ="server" AutoGenerateColumns="False" OnPageIndexChanging="gvPropertyAd_PageIndexChanging" OnRowCommand="gvPropertyAd_RowCommand" OnSorting="gvPropertyAd_Sorting" AllowPaging="True" AllowSorting="True" >
<Columns >
<asp:TemplateField >
<HeaderTemplate >
    <input id="Cbx_Toggle" name="Cbx_Header" type="checkbox" onclick="toggleAllCheckboxes(this.checked)" />Select
</HeaderTemplate>
<ItemTemplate >
<input id="Cbx_PropertyId" name="Cbx_PropertyId" type="checkbox" value='<%#Eval("PropertyId") %> ' />
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="PropertyType" SortExpression="PropertyType">
<ItemTemplate ><asp:LinkButton  runat="server" Text='<%#Eval("PropertyType")%>' CommandArgument='<%#Eval("PropertyId")%>' CommandName="Update"></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="BuildingType" SortExpression="BuildingType">
<ItemTemplate>
<%#Eval("BuildingType")%>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="RoomType" SortExpression="RoomType">
<ItemTemplate>
<%#Eval("RoomType")%>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField  HeaderText="AdType" SortExpression="AdType">
<ItemTemplate >
<%#Eval("Sale_Rent")%>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField  HeaderText="StreetName" SortExpression="StreetName">
<ItemTemplate >
<%#Eval("Street_Name") %>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField  HeaderText="Price" SortExpression="Price">
<ItemTemplate >
<%#Eval("Price") %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Status" SortExpression="Status">
<ItemTemplate>
<%#Eval("StatusName")%>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
        </td></tr>
            <tr>
                <td>
                    <asp:Label ID="lblError" runat="server" CssClass="lblerror" Text="" Visible="false"></asp:Label></td>
                <td align="right">
                    <asp:Label ID="Lbl_Pageinfo" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        </td>
    </tr>
   <%-- <tr>
    <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>--%>
</table></td></tr></table>

</asp:Content>

