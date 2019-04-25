<%@ page contentType="text/xml; charset=gbk" language="java" errorPage=""%>
<%@ page language="java" import="java.io.PrintWriter"%>
<%@ page import="com.saas.biz.refundMgr.RefundInfo" %>
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
	RefundInfo store=new RefundInfo();
	//退货类型 0退货 1换货
	String refund_type="1";
	String json=store.getJsonDataByCust(start,cust_id,refund_type);
	
	xmlout.write(json);
%>
