<%@ page contentType="text/html;charset=8859_1" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<html>
    <head>
<script language="javascript">
	function closeit() 
	{ 
		setTimeout("window.opener=null;window.close();",   2000);   
	}
	function bb() 
	{ 
		window.opener.location.href=window.opener.location.href ;
		window.opener.location.reload();
		window.close(); 
	}
</script>
    </head>
<body onload="bb()">  
        <h5><bean:message key="str4415 /></h5> 
</body>
</html>