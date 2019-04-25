<%@ page contentType="text/xml; charset=gbk" language="java" errorPage=""%>
<%@ page language="java" import="java.io.PrintWriter"%>
<%@ page import="com.saas.biz.userMgr.UserInfo" %>
<%
    HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	response.setHeader("Cache-Control", "no-cache");
	PrintWriter xmlout = response.getWriter();
	int start = 0;
	if(request.getParameter("start")!=null){
	  start=Integer.parseInt(request.getParameter("start"));
	}
	UserInfo store=new UserInfo();
	String json=store.getUserJsonData(start,cust_id,"0");
	
	xmlout.write(json);
%>
