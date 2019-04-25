<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<html:html locale="true">
<title><bean:message key="system.tittle"/></title>
<head>
<title><bean:message key="system.tittle"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="style/css.css" rel="stylesheet" type="text/css">
<script language="JavaScript">

    function autoSubmit(){   
        var form = document.forms[0];   
        form.method = 'post';    
        form.submit();   
    } 
</script>

</head>
<body bgcolor="#F0F0F0" leftmargin=2 topmargin=0 text="#FFFFFF" rightmargin=0  onload="autoSubmit()">
<h5><font color=blue><bean:message key="system.getmenulist.waitinfo"/></font></h5>
<html:form action="/getmodifyitemlist">  
	<input type=hidden name="lmjb" value="0">
	<input type=hidden name="sjlmbs" value=""> 
	<input type=hidden name="trade_type_code" value="0119">
</html:form> 
</body>
</html:html>