<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %> 
<html:html locale="true">
<head>
<title><bean:message key="system.tittle"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#F0F0F0" leftmargin=0 topmargin=0 text="#FFFFFF" rightmargin=0>
<table width=89% cellspacing="0" cellpadding="0" align=center >
    <TR>
    <td>
    	<%@ include file="Date.jsp"%>
    </td>
    </TR>  
</table>
<table width=89% cellspacing="0" cellpadding="0" align=center >
    <TR>
    <td height="10">&nbsp;</td>
    </TR>     
</table> 
<table width=100% cellspacing="0" cellpadding="0" valign=center border=0>
    <TR>
    <td>
		<TABLE cellSpacing=0 cellPadding=0 width=100% border=0   valign=top>
	    	<TBODY>
	    	<logic:notEmpty name="result" scope="request">
	    	<logic:iterate id="result1" name="result" scope="request">	
	    	<tr>
	    	    <td height="2" background="img/admin_7.gif"></td>
		    </tr>	
	    	<tr>
				<td height="40" align=center background="img/admin_6.gif" id="menu_4">
				    <span  style="color:#ffffff;font-weight:bold">※</span>
				<logic:notEmpty name="result1" property="var">
					<bean:define id="menuId" name="result1" property="var"/>
					<%
						HashMap menumap=new HashMap();
		                menumap.put("up_menu_id",menuId);
		                menumap.put("menu_class","2");
		                menumap.put("trade_type_code","0121");
		                request.setAttribute("menumap",menumap);  
					%>
					<html:link action="/getchildmenulist" name="menumap" target="top">	
						<bean:write name="result1" property="text" filter="false"/>
					</html:link>
				 </logic:notEmpty>
				 <logic:empty name="result1" property="var">
				 	<bean:write name="result1" property="text" filter="false"/>
				 </logic:empty>
				</td>
				 
			</tr>	
		    </logic:iterate>
		    </logic:notEmpty>
	        </TBODY>
		</TABLE>
  	</td>
    </TR> 
</table> 
</body>
</html:html>

