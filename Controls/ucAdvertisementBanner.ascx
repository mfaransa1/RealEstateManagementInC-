<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucAdvertisementBanner.ascx.cs"
    Inherits="Controls_ucAdvertisementBanner" %>

<script type="text/javascript">		
									var str7;	
									var k7=0;
									var count7=<%=count7%>;
									var imgPATH7='<%="./"+ ConfigurationSettings.AppSettings["AdvertisementImage"].Replace("\\", "/") %>';
									var ImageFileNames7 = new Array(<%=imagesArray7%>);
									var delayTIMES7=new Array(<%=delayTIMES7%>)
									var URLs7=new Array(<%=URLs7%>)
									function funloop7()
									{
									if (count7 == 0)
									{ 
									document.getElementById("divBANNER").innerHTML='<a href=# ><IMG id=img1 src=advt.jpg name=img1  border=0 width=100% height=105></a>';
									}
									else
									{
									call7();
									}
									}
									
									
									
									function call7()
										{
										
										if ( k7 < count7 )
										 {k7=k7+1;}
										else
											{k7=1;}
										
												
											document.getElementById("divBANNER").innerHTML='<a href='+URLs7[k7-1]+' target='+((URLs7[k7-1]=="#")?'_self':'_blank')+'><IMG id=img1 src='+imgPATH7 + ImageFileNames7[k7-1]+' name=img1  border=0 width=100% height=105></a>';
											setTimeout("call7();",parseInt(delayTIMES7[k7-1])*1000);	 
										
								}
									
									
				
		
		
</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="100%">
            <div align="center" id="divBANNER">
            
            </div>
        </td>
    </tr>
</table>

<script type="text/javascript">
	funloop7();
</script>

