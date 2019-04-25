<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html locale="true">
<head>
<title><bean:message key="system.tittle"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#F0F0F0" leftmargin=2 topmargin=0 text="#FFFFFF" rightmargin=0>
<table width=89% cellspacing="0" cellpadding="0" align=center >
    <TR>
    <td height="10">&nbsp;</td>
    </TR>     
</table> 
<table width=99% cellspacing="0" cellpadding="0" align=center >
    <TR>
    <td>
		<TABLE cellSpacing=1 cellPadding=0 width=100% border=0   valign=top>
	    	<TBODY>
	    	<tr>
	    	<logic:notEmpty name="result" scope="request">
	    	<logic:iterate id="result1" name="result" scope="request">
				<td class=grayE></td>
				<td class=grayD onMouseover=this.className='grayE'; onMouseout=this.className='grayD' align=center>
				<logic:notEmpty name="result1" property="var">
					<html:link action="/getmenulist" paramId="menuId" paramName="result1" paramProperty="var" target="right">	
						<bean:write name="result1" property="text" filter="false"/>
					</html:link>
				 </logic:notEmpty>
				 <logic:empty name="result1" property="var">
				 	<bean:write name="result1" property="text" filter="false"/>
				 </logic:empty>
				</td>
				<td class=grayE></td>
			
		    </logic:iterate>
		    </logic:notEmpty>
		    </tr>	
	        </TBODY>
		</TABLE>
  	</td>
    </TR> 
</table> 
</body>
</html:html>

