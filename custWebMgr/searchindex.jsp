<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str1955"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css"/>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
<script language="javascript" src="/js/Calendar_Ly.js"></script>
</head>
<body>
		<%
		  String factory = request.getParameter("factory");
		  String xcontury = request.getParameter("xcontury"); 
		  String keyword = request.getParameter("keyword");
		%>
	<jsp:include page="http://aaa.xsaas.com/searchIndex.jsp">
		<jsp:param name="factory" value="<%=factory %>"></jsp:param>
		<jsp:param name="xcontury" value="<%=xcontury %>"></jsp:param>
		<jsp:param name="keyword" value="<%=keyword %>"></jsp:param>
	</jsp:include>
ssss
</body>
</html>