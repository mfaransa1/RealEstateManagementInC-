<%@ Page Language="C#" MasterPageFile="~/PropertyNetMasterPage.master" AutoEventWireup="true" CodeFile="frmCommercialProperty.aspx.cs" Inherits="frmCommercialProperty" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table width="100%">
          <tr>
              <td align="left" class="LoginTitle" colspan="1" valign="top">
                  Commercial</td>
              <td align="left" class="LoginTitle" colspan="5" valign="top">
                  Search Commercial Property</td>
          </tr>
      <tr>
          <td align="left" valign="top" rowspan="10">
          <table width="100%">
          
          <tr>
          <td>
              <asp:DataList ID="dListCommercial" RepeatDirection="Horizontal" RepeatColumns="1" runat="server" OnItemCommand="dListCommercial_ItemCommand">
              <ItemTemplate>
                                      <asp:LinkButton ID="lnkBtnCommercial" Text='<%#Eval("BuildingType_Name") %>' CommandArgument='<%#Eval("BuildingType_Name") %>'
                                          CommandName="COMMERCIAL" runat="server"></asp:LinkButton>
                                  </ItemTemplate>
              </asp:DataList>
          </td>
          </tr>
          </table>
          </td>
          <td align="left" valign="top">
              Type</td>
          <td align="left" valign="top" style="width: 12px">
              :</td>
          <td align="left" valign="top">
              <asp:DropDownList ID="ddlType" runat="server">
                  <asp:ListItem>Select</asp:ListItem>
                  <asp:ListItem>Rent</asp:ListItem>
                  <asp:ListItem>Sale</asp:ListItem>
              </asp:DropDownList></td>
          <td align="left" valign="top">
          </td>
          <td align="left" valign="top">
          </td>
      </tr>
        <tr>
            <td align="left" valign="top">
                Country</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList></td>
            <td  align="left" valign="top">
            </td>
            <td align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td  align="left" valign="top">
                State</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList></td>
            <td  align="left" valign="top">
            </td>
            <td  align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td  align="left" valign="top">
                District</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
                <asp:DropDownList ID="ddlDistrict" runat="server">
                    <asp:ListItem> --Select--</asp:ListItem>
                </asp:DropDownList></td>
            <td  align="left" valign="top">
            </td>
            <td  align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td  align="left" valign="top">
                Tenure</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
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
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" valign="top">
            </td>
            <td  align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                Price</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
                $<asp:TextBox ID="txtPriceFrom" runat="server" Width="80px"></asp:TextBox></td>
            <td>
                To </td>
            <td  align="left" valign="top">
                $<asp:TextBox ID="txtPriceTo" runat="server" Width="80px"></asp:TextBox>
                </td></tr>
        <tr>
            <td  align="left" valign="top">
                Valuation</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
                $<asp:TextBox ID="txtValuationFrom" runat="server" Width="80px"></asp:TextBox></td>
            <td align="left" valign="top">
                To
            </td>
            <td  align="left" valign="top">
                $<asp:TextBox ID="txtValuationTo" runat="server" Width="80px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="left" valign="top">
                Built In Area</td>
            <td  align="left" valign="top" style="width: 12px">
                :</td>
            <td  align="left" valign="top">
                <asp:TextBox ID="txtBuiltInAreaFrom" runat="server" Width="88px"></asp:TextBox></td>
            <td  align="left" valign="top">
                To</td>
            <td  align="left" valign="top">
                <asp:TextBox ID="txtBuiltInAreaTo" runat="server" Width="88px"></asp:TextBox></td>
        </tr>
        <tr>
            <td  align="left" valign="top">
                </td>
            <td align="left" valign="top" style="width: 12px">
                </td>
            <td align="left" valign="top">
                </td>
            <td  align="left" valign="top">
                </td>
            <td  align="left" valign="top">
                </td>
        </tr>
        <tr>
            <td align="left" valign="top" >
            </td>
            <td align="left" valign="top" style="width: 12px" >
            </td>
            <td align="left" valign="top" >
                </td>
            <td align="left" valign="top"  >
            </td>
            <td align="right" valign="top"  >
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
        </tr>
      <tr>
          <td align="left" colspan="6" valign="top">
            <asp:DataList ID="dListCommercialProperty" RepeatDirection="Horizontal" RepeatColumns="1" runat="server" OnItemCommand="dListCommercialProperty_ItemCommand" Width="100%">
              <ItemTemplate>
                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                          <td>
                              For <%#Eval("Sale_Rent") %></td>
                          <td colspan="3">
                              <%#Eval("Building_Estate_Name") %>
                              ,
                              <%#Eval("Bldg_Blk_HseNo") %>
                              ,
                              <%#Eval("Street_Name") %>
                          </td>
                      </tr>
                      <tr>
                          <td colspan="2" rowspan="6"  style="width:40%;" >
                            <%-- <a href="#"> <asp:Image ID="imgProperty" runat="server" Width="150px" /></a>--%>
                            <asp:ImageButton ID="imgProperty" CommandName="MOREDETAILS" CommandArgument='<%#Eval("PropertyId") %>' Width="150px"  runat="server" />
                          </td>
                          <td>
                              Type:<%#Eval("RoomType") %></td>
                          <td>
                              Price:<%#Eval("Price") %></td>
                      </tr>
                      <tr>
                          
                          <td>
                              Tenure:<%#Eval("Tenure") %></td>
                          <td>
                              Location:<%#Eval("DistrictName") %></td>
                      </tr>
                      <tr>
                          
                          <td>
                              Summary:<%#Eval("Summary") %></td>
                          <td>
                          </td>
                      </tr>
                      <tr>
                          
                          <td>
                              Description:<%#Eval("Description") %></td>
                          <td>
                          </td>
                      </tr>
                      <tr> 
                          <td colspan="2" align="right">
                              <asp:LinkButton ID="lnkBtnMoreDetails" Text="For More Details" CommandArgument='<%#Eval("PropertyId") %>' CommandName="MoreDetails" runat="server"></asp:LinkButton>
                          </td>
                      </tr>
                      <tr>
                          <td>
                          </td>
                          <td>
                          </td>
                      </tr>
                  </table>
              </ItemTemplate>
              </asp:DataList>
          
          </td>
      </tr>
    </table>
  
</asp:Content>

