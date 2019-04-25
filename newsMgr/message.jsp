<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%
	HttpSession logs = request.getSession();
	String iStart = "0";
	String meun_idx = "";
	String cust_id = "",sale_id="";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logs.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logs.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("news_id") != null) {
		sale_id = request.getParameter("news_id");
	}

	EnquirydInfo Info = new EnquirydInfo();
	ArrayList List = Info.getEnqList(Integer.parseInt(iStart),sale_id);
	int counter = Info.getEnqList(sale_id);
	int pages = counter / 20 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage) {
		if (currenPage > 0) {
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
%>
<html>
	<head>
		<title><bean:message key="str2788"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid;
	font-weight: bold;
	background-color: #fff8ee;
	text-align: left;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #000000;
	margin-top: 13px;
}  /*横栏样式6---- 头部提醒1*/
.line6 .img {
	width: 53px;
	height: 53px;
	float: left;
	margin-right: 20px;
}

.line6 .title {
	font-size: 14px;
	font-weight: bold;
	color: #ff5400;
}

.line1 {
	border-left: #ff7300 3px solid;
	background-color: #e2e2e2;
	color: #333333;
	text-align: left;
	font-size: 12px;
}  /*横栏样式1*/
.td {
	background-color: #e2e2e2;
	color: #000000;
	font-weight: bold;
	font-size: 13px;
}
</style>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align=center>
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td>
					<table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr class="line1">
							<td align="center" class="line1" width="20%">
								<bean:message key="str2789"/>
							</td>
							<td align="center" width="50%">
								<bean:message key="str2790"/>
							</td>
							<td align="center" width="20%">
								<bean:message key="str2791"/>
							</td>
							<td align="center" width="10%">
								<bean:message key="str2677"/>
							</td>
						</tr>
						<% 
							if (List != null && List.size() > 0) {
							for (int i = 0; i < List.size(); i++) {
								HashMap map = (HashMap) List.get(i);
								String rsrv_str5 = "", trade_id="",enquiry_content = "", enquiry_date = "";
								if (map.get("rsrv_str5") != null) {rsrv_str5 = map.get("rsrv_str5").toString();}
								if (map.get("trade_id") != null) {trade_id = map.get("trade_id").toString();}
								if (map.get("enquiry_content") != null) {enquiry_content = map.get("enquiry_content").toString();}
								if (map.get("enquiry_date") != null) {enquiry_date = map.get("enquiry_date").toString();
									if(enquiry_date.length()>10){enquiry_date=enquiry_date.substring(0,10);}
								}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left">
								<a href="" TARGET=appwin onclick="mydefss()"><%=rsrv_str5%> </a>
							</td>
							<td style="color: #000000;" align="left">
								<%=enquiry_content%>
							</td>
							<td style="color: #000000;" align="center">
								<%=enquiry_date%> 
							</td>
							<td style="color: #000000;" align=center>
								<a href="/doTradeReg.do?trade_type_code=1321&trade_id=<%=trade_id%>" target="_self"><img src=/img/delete.png width=16 height=16 border=0 alt="Delete Message"> </a>
							</td>
						</tr>
						<%
						}
						%>
						<tr>
							<td align="left" colspan="2">
								<bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/>
							</td>
							<td align="right" colspan="2">
								<a href="messageindex.jsp?iStart=0"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="messageindex.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
								<%
										}
										if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="messageindex.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/>  </a>&nbsp;
								<%
								}
								%>
								<a href="messageindex.jsp?iStart=<%=pages - 1%>"><bean:message key="str1033"/></a>
							</td>
						</tr>
						<%
						}
						%>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>