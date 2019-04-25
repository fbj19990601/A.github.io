<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=8859_1" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<bean:cookie id="cookieID" name="SESSION_USER_NAME" value="STAFF_ID_UNDEFINE"/>
<bean:page id="currSession" property="session"/>
<html>
<head>
<title><bean:message key="system.tittle"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22"  class="bj-fix">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr> 
             <td height="27" valign="top"   class="bj-fix" bgcolor="#FFFFEE">
          	 <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              
              <tr> 
                <td>&nbsp;</td> 
                <td class="top"><font color="#702400">
                  <SCRIPT language=JavaScript>
					var today=new Date();var strDate=(" "+today.getYear()+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日");document.write("<font color=#702400><b>"+strDate+"</b><font>");</SCRIPT>
                  </font>
 				<bean:message key="hello.user"/>：<bean:write name="cookieID" property="value"/> 		
 				 						
                </td>
                <td bgcolor="#FFFFFF" align="right">
                <bean:message key="system.version.right"/>
            </td>
              </tr>
            </table>
           </td>
        </tr>
        </table>       
     </td>
  </tr>
</table>
</body>
</html>
