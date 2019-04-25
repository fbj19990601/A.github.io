<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page contentType="text/html;charset=gb2312" %>
<html>
<head>
<title><bean:message key="str2512"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=8859_1">
<link href="style/css.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
    function autoSubmit(){   
        document.formAuto.submit();   
    } 
</script>
</head>
<body onload="document.formAuto.submit();">
<h5><font color=blue>loginout...</font></h5>
  <form name="formAuto" action="/index.jsp" method="post">
  	<%
  	HttpSession tempsession = request.getSession();
  	tempsession.invalidate();
  	%>
  	<input name="us" type="hidden">
 </form> 
</body>
</html>