<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<html>
    <head>
<script language="javascript">
	function closeit() 
	{ 
		setTimeout("window.opener=null;window.close();",   4000);   
	}
	
</script>
    </head>
<body >  
        <h3><bean:message key="str2880"/></h3> 
</body>
</html>