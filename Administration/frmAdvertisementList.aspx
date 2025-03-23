<%@ Page Language="C#" AutoEventWireup="true" Theme="PropertyNetThemes" CodeFile="frmAdvertisementList.aspx.cs" MasterPageFile="~/Administration/AdminPropertyNetMasterPageMenu.master" Inherits="Administration_frmAdvertisementList" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" language="javascript">
function toggleAllCheckboexs(toggle)
{
				n = document.forms[0].length;
				var frm = document.forms[0];
				for(i=0;i<frm.length;i++)
				
					if(frm.elements[i].type=="checkbox")
						if (frm.elements[i].name.indexOf('Cbx')==0)						
							frm.elements[i].checked=toggle;
 }			
			
</script>

<table border ="0" cellpadding ="0" cellspacing ="0"  width="100%" height="373px" class="publicloginTable">
<tr >

<td style="width:100%" valign="top" align="left">
 <table width="100%" class="admintablestyle">
        <tr>
            <td colspan="7" class="LoginTitle">Advertisement List</td>
        </tr>
    
        
        <tr>
            <td align="left" width="12%">Type</td>
            <td align ="center">:</td>
            <td><asp:DropDownList ID="ddlType" runat="server">
            </asp:DropDownList></td>            
        </tr>
        
        <tr>
            <td>Publish Date</td>
            <td align ="center" width="2%">:</td>
            <td colspan="2" align="center">
                From</td>
            <td align="left" width="14%">
                <cc1:GMDatePicker ID="GMPublishDateFrom" runat="server" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
            </td>
            <td align ="center"  width="6%">To</td>
            <td style="width: 387px">
                <cc1:GMDatePicker ID="GMPublishDateTo" runat="server" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
            </td>
        </tr>
        
        <tr>
            <td >Expiry Date</td>
            <td align ="center" >:</td>
            <td colspan="2" align="center" >
                From</td>
            <td >
                <cc1:GMDatePicker ID="GMExpiryDateFrom" runat="server" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
            </td>
            <td align ="center" width="6%" >To</td>
            <td >
                <cc1:GMDatePicker ID="GMExpiryDateTo" runat="server" DateFormat="dd-MMM-yyyy" InitialValueMode="Null" CalendarOffsetX="-127px" CalendarTheme="Blue">
                </cc1:GMDatePicker>
            </td>
        </tr>
        
        <tr>
            <td style="height: 26px">
                Page Size</td>
            <td align ="center" style="height: 26px">:</td>
            <td align="left" width="8%" style="height: 26px"><asp:TextBox ID="txtPageSize" runat="server" Width="50px"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="lblerror" ErrorMessage="Invalid Number"
                    MaximumValue="999" MinimumValue="1" Style="position: relative" Type="Integer" ControlToValidate="txtPageSize">*</asp:RangeValidator></td>
          
        <td style="height: 26px; width: 4px;"></td>
            <td style="height: 26px; width: 4px;"></td>
            <td style="height: 26px; width: 387px;"></td>
        </tr>
     <tr>
         <td style="height: 28px">Status
         </td>
         <td align="center" style="height: 28px">
             :</td>
         <td align="left" style="height: 28px" width="8%">
         <asp:DropDownList ID="ddlStatus" runat="server">
            </asp:DropDownList>
         </td>
         <td style="width: 4px; height: 28px"></td>
         <td style="height: 28px">
         </td>
         <td style="height: 28px">
             &nbsp;</td>
         <td style="height: 28px">
         </td>
         
     </tr>
        
        <tr>
            <td colspan ="7" style="height: 1px">
         <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" style="left: 133px; position: relative; top: 0px"  /></td>
        </tr>        
        
        <tr>
        <td colspan ="7">
            <table border="0" cellpadding="0" cellspacing="0" width="70%">
                <tr>
                    <td align="left" width="50%">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="65px" OnClick="btnDelete_Click" /></td>
                    <td align="right">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" Width="65px" OnClick="btnAdd_Click" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvAdvList" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="gvAdvList_PageIndexChanging" OnRowCommand="gvAdvList_RowCommand" OnSorting="gvAdvList_Sorting">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <input name="Cbx_Toggle" onclick="toggleAllCheckboexs(this.checked)" type="checkbox" />Select
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <input name="Cbx_AdvtId" type="checkbox" value='<%#Eval("AdvtId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" SortExpression="Advt_Title">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkBtnAdvtTitle" Text='<%#Eval("Advt_Title")%>' runat="server"
                                            CommandArgument='<%#Eval("AdvtId")%>' CommandName="Update"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company" SortExpression="Advt_Company">
                                    <ItemTemplate>
                                       <%#Eval("Advt_Company")%>                                    
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Publish Date" SortExpression="Publish_Date">
                                    <ItemTemplate>
                                       <%#Eval("Publish_Date","{0:dd MMM yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Expiry Date" SortExpression="Expiry_Date">                          
                                    <ItemTemplate>
                                        <%#Eval("Expiry_Date", "{0:dd MMM yyyy}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type" SortExpression="Advt_Type">
                                    <ItemTemplate>
                                        <%#Eval("Advt_Type") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" SortExpression="Status_Id">
                                    <ItemTemplate>
                                        <%#Eval("StatusName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Label ID="lblError" CssClass="lblerror" Visible="false" runat="server" Text=""></asp:Label></td>
                    <td align="right">
                        <asp:Label ID="Lbl_Pageinfo" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>             
    </td>
    </tr></table>
</td>
</tr> 
</table> 
</asp:Content>