<%@ page contentType="text/html;charset=GBK" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
 
<html>
<head>
	<title><bean:message key="system.tittle"/></title>
	<script language="javascript">
	function closeit() 
	{ 
		setTimeout("window.opener=null;window.close();",   2000);   
	}
	
</script>
</head>

<body onload="closeit()"> 
	 <h2 align=center><bean:message key="str2881"/>  </h2>
</body>
</html>
