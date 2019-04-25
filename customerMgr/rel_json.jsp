<%@ page pageEncoding="GBK"%>
<%@ page contentType="text/xml; charset=gbk" language="java"%>
<%@ page language="java" import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.commen.ListConvertToJSON"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%
	PrintWriter xmlout = response.getWriter();
	RelationCcInfo store = new RelationCcInfo();
	int start = 0;
	if (request.getParameter("start") != null) {
		start = Integer.parseInt(request.getParameter("start"));
	}
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	ArrayList relationList = store.getRelationJSONByType(start, 20, cust_id, "1");
	int counter = store.getPateSizeByType(cust_id,"1");
	String json = ListConvertToJSON.getJSONByList(relationList, counter);
	try {
		xmlout.write(json);
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		xmlout.flush();
		xmlout.close();
	}
%>
