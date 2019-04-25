<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
    String  menu_id = "";
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
%>
<html>
<head>
<title><bean:message key="str116"/></title> 
    <link href="/style/layout.css" rel="stylesheet" type="text/css">
</head>
<body>	
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <jsp:include page="/inc/top.jsp"/>
	    <tr><!-- ÖÐ¼ä -->
            <td align="center" >        
	         <div id="manager_body"> <!--×ó±ß²Ëµ¥-->
                <div id="manager_body_left">
                    <jsp:include page="/inc/left.jsp"/>
                </div>
                <div id="manager_body_right">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td>
                                <jsp:include page="menuinfoList.jsp">
								  <jsp:param name="menuId" value="<%=menu_id%>" />
								  <jsp:param name="menu_id" value="<%=menu_id%>" />
								  <jsp:param name="class" value="1" />
								</jsp:include>
                          </td>
                        </tr>
                     </table>
                </div> 
            </div>
            </td> 
        </tr>
    </table>
</body>
</html>