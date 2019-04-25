<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %> 
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
<body bgcolor="#F0F0F0" leftmargin=2 topmargin=0 text="#FFFFFF" rightmargin=0>

    <%HashMap indexmenumap=new HashMap();%>
    
    <logic:iterate id="query1" name="backQ" scope="request" >	
        <logic:notEmpty name="query1" property="LMJB">
            <bean:define id="lmjb" name="query1" property="LMJB"  type="java.lang.String"/>
            <%indexmenumap.put("lmjb",lmjb);%>
            <logic:equal name="query1" property="LMJB"  value="0">
                <%indexmenumap.put("sjlmbs","");%>
            </logic:equal>
        </logic:notEmpty>       
        <logic:notEmpty name="query1" property="SJLMBS">
            <bean:define id="sjlmbs" name="query1" property="SJLMBS"  type="java.lang.String"/>
            <%indexmenumap.put("sjlmbs",sjlmbs);%>
        </logic:notEmpty>
        <%indexmenumap.put("trade_type_code","0119");%>
    </logic:iterate>
    <%request.setAttribute("indexmenumap",indexmenumap);%>
    
    <html:link action="/getadditemlist" name="indexmenumap">	
	    返回上级列表
	</html:link>
    
<html:form action="/getadditemlist">  
    
	<input type=hidden name="lmjb" value="0">
	<input type=hidden name="sjlmbs" value=""> 
 
</html:form> 
</body>
</html:html>