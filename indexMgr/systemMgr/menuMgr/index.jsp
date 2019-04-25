<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%
    commMethodMgr commen = new commMethodMgr();
    String id = commen.GenTradeId();
    String menu_id = "";
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
	out.print("-------------"+menu_id);
%>
<html>
<head>
    <title><bean:message key="str2529"/>(http://soft.xsaas.com)</title>  
    <link href="/css/layout.css" rel="stylesheet" type="text/css">
    <link href="/css/daohang.css" rel="stylesheet" type="text/css">
    <link href="/css/manager.css" rel="stylesheet" type="text/css">
    <script src="/www/calendar.js" type="text/javascript"></script>
    <script language="JavaScript" src="/fuction/public.js"></script>
</head>
<body>	
    <table>
	        <tr>
	            <td colspan=2>
	                <jsp:include page="/inc/top.jsp"/>
	            </td>
	        </tr>
	        <tr>
	            <td>
	                <jsp:include page="/inc/left.jsp"/>
	            </td>
	            <td valign=top>
	                <jsp:include page="/inc/menu.jsp">
                	  <jsp:param name="menu_id" value="<%=menu_id%>" />
                	</jsp:include>
                </td>
            </tr> 
    </table> 
</body>
</html>