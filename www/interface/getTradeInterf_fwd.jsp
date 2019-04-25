<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html:html locale="true">
<head>
<title><title><bean:message key="system.tittle"/></title>
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
    String strClassName= request.getParameter("className");
    if(request.getParameter("className")!=null)
    {
    	strClassName=new String(strClassName.getBytes("GBK"), "utf-8");
    }
    String strClassId= request.getParameter("classId");
    String strClassIdGrp= request.getParameter("stridgrp");
    String strClassNameGrp= request.getParameter("strnamegrp");
    if(request.getParameter("strnamegrp")!=null)
    {
   	strClassNameGrp=new String(strClassNameGrp.getBytes("GBK"), "utf-8");
    }
    String strClassType= request.getParameter("class_type");
    String current_class = request.getParameter("current_class");
    String up_class_id = request.getParameter("upClassId");
    String grp_name = request.getParameter("grp_name");
    String grp_id = request.getParameter("grp_id");
%>
<html:form action="/getTradeInterface">  
	<input type=hidden name="trade_type_code" value=<%=strTradeTypeCode%>>
	<input type=hidden name="spec_class_name" value=<%=strClassName%>>
	<input type=hidden name="spec_class_id" value=<%=strClassId%>>
	<input type=hidden name="spec_class_id_grp" value="<%=strClassIdGrp%>">
	<input type=hidden name="spec_class_name_grp" value=<%=strClassNameGrp%>>
	<input type=hidden name="spec_class_type" value=<%=strClassType%>>
	<input type=hidden name="current_class" value=<%=current_class%>>
	<input type=hidden name="up_class_id" value=<%=up_class_id%>>
	<input type=hidden name="grp_name" value=<%=grp_name%>>
	<input type=hidden name="grp_id" value=<%=grp_id%>>
</html:form> 
</body>
</html:html>