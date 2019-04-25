<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%
//    commMethodMgr commen = new commMethodMgr();
    String id ="";// commen.GenTradeId();
    HttpSession  logsession = request.getSession(); 
     String menu_id = "";
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
    String mycode="";
    String cust_id="";
    ArrayList custlist = new ArrayList();
	Custinfo custmgr =  new Custinfo();
	 
	if (request.getParameter("cust_id") != null)
    {
        cust_id = request.getParameter("cust_id");
    }
%>
<html>
<head>
<title><bean:message key="str4132"/></title> 
    <link href="/style/layout.css" rel="stylesheet" type="text/css">
    <script src="/www/fuction/calendar.js" type="text/javascript"></script>
    <script language="JavaScript" src="/www/fuction/public.js"></script>
</head>
<body>	
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <jsp:include page="/inc/top.jsp"/>
	    <tr><!-- 中间 -->
            <td align="center" >        
	         <div id="manager_body"> <!--左边菜单-->
                <div id="manager_body_left">
                    <jsp:include page="/inc/left.jsp"/>
                </div>
                <div id="manager_body_right">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td>
                                <div id="righttop">
                                 <jsp:include page="/inc/menu.jsp">
								  <jsp:param name="menu_id" value="<%=menu_id%>" />
								</jsp:include>
                                </div>
                                <jsp:include page="serverlist.jsp">
								  <jsp:param name="cust_id" value="<%=cust_id%>" />
								</jsp:include>
								 
                          </td>
                        </tr>
                     </table>
                </div>  <!--右边 主体部分结束  -->
            </div>
            </td>  <!-- 中间 结束 -->  
        </tr>
        <tr><!-- 底部 -->
         <td align="center">
	    	<jsp:include page="/bottom.jsp"/>
          </td>
       </tr><!-- 底部结束 -->
    </table>
</body>
</html>