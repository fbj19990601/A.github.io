<%@ page contentType="text/html;charset=8859_1" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html:html locale="true">
<head>
<title><title><bean:message key="system.tittle"/></title></title>
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
<br><br><br><br><br><br><center>   
<h3><font color=blue><bean:message key="system.getmenulist.waitinfo"/></font></h3></center>   
    
<%
    String strTradeTypeCode= request.getParameter("trade_type_code");
%>
<html:form action="/getQueryInterface">  
	<input type=hidden name="trade_type_code" value=<%=strTradeTypeCode%>>
	<input type=hidden name="query_param" >
</html:form> 
</body>
</html:html>