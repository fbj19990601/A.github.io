<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page contentType="text/html;charset=gb2312" %>
<html:html locale="true">
<head>
<title><bean:message key="str3088"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=8859_1">
<link href="style/css.css" rel="stylesheet" type="text/css">
<script language="JavaScript">

    function autoSubmit(){   
        var form = document.forms[0];   
        form.method = 'post';    
        form.submit();   
    } 
</script>

</head>
<%
 String user_name="",link_type="";
 if(request.getParameter("user_name")!=null)
 {
     user_name=request.getParameter("user_name");
 }
  if(request.getParameter("link_type")!=null)
 {
     link_type=request.getParameter("link_type");
 }
%>
<body bgcolor="#F0F0F0" leftmargin=2 topmargin=0 text="#FFFFFF" rightmargin=0  onload="autoSubmit()">
<h5><font color=blue>loading...</font></h5>
  <html:form action="/stafflogin">
	<input type=hidden name="trade_type_code" value="0159">
	<input type=hidden name="user_name" value="<%=user_name%>">
	<input type=hidden name="link_type" value="<%=link_type%>">
</html:form> 
</body>
</html:html>