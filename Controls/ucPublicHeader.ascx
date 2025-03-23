<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPublicHeader.ascx.cs" Inherits="Controls_ucPublicHeader" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="44%" rowspan="4" valign="middle"><img src="images/logo.jpg" width="250" height="60" /></td>
            <td width="26%"></td>
            <td width="30%" height="29" class="greytext"><div align="right"><a href="Administration/Default.aspx">Admin Login</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="CurrentDate" runat="server"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          </tr>
            <tr>
                <td colspan="2" rowspan="2" valign="top">
                 <table id="tblLogin" width="100%" border="0" cellspacing="0" cellpadding="0" runat="server">
              <tr>
                <td width="87%" align="right" style="height: 24px"><span id="sp_Newuser" runat="server"></span></td>
                <td style="width: 3%; height: 24px;" ><img src="images/login.jpg" id="loginImage" width="21" /></td>
                <td width="10%" class="redtext" style="height: 24px">
                    &nbsp;<a class="redtext" id="AncorLogin" href="frmLogin.aspx">Login</a></td>
              </tr>
              </table>
                
                    </td>
              
            </tr>
            <tr>
                <td colspan="2">
                    </td>
                                
            </tr>
          <tr>
            
            <td colspan="2" align="right">
             <table width="260" border="0" cellspacing="0" cellpadding="0">
             
              <tr>
                <td width="15" style="height: 19px"><img src="images/home.jpg" width="15" height="17" /></td>
                <td width="50" align="center" style="height: 19px"><a href="Default.aspx" class="smalltext">Home</a></td>
                <td width="12" style="height: 19px"><img src="images/contact.jpg" width="12" height="8" /></td>
                <td width="50" align="center" style="height: 19px"><a href="frmContactUs.aspx" class="smalltext">Contact</a></td>
               
                
               
                <td width="12" style="height: 19px"><img src="images/sitemap.jpg" width="11" height="11" /></td>
                <td width="58" align="center" style="height: 19px"><a href="frmSitemap.aspx" class="smalltext">Sitemap&nbsp;</a></td>
              </tr>
            </table>
            </td>
          </tr>
        </table>
        </td>
        </tr>
        </table>