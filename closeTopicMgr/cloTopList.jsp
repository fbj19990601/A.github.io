<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%
	HttpSession logsession = request.getSession();
	String iStart = "0";
	String meun_idx = "";
	String cust_id = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}

	EnquirydInfo Info = new EnquirydInfo();
	ArrayList List = Info.getEnquiryOffed(Integer.parseInt(iStart));
	int counter = Info.getEnquiryOffed();
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
		<title><bean:message key="str116"/></title>
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
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
	            WinLIKE.definewindows=mydefss;
	            function mydefss() {
	            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
	            	j.Vis=false;
	            	j.Nam='appwin';
	            	WinLIKE.addwindow(j);
	            };
	    </SCRIPT>
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
							<td align="center" class="line1" width="40%">
								<bean:message key="str319"/>
							</td>
							<td align="center" width="20%">
								<bean:message key="str4687"/>
							</td>
							<td align="center" width="25%">
								<bean:message key="str4688"/>
							</td>
							<td align="center" width="15%">
								<bean:message key="str4689"/>
							</td>
						</tr>
						<%
							if (List != null && List.size() > 0) {
							for (int i = 0; i < List.size(); i++) {
								HashMap map = (HashMap) List.get(i);
								String rsrv_str3 = "", rsrv_str5 = "",  trade_id = "", enquiry_date = "";
								if (map.get("rsrv_str3") != null) {rsrv_str3 = map.get("rsrv_str3").toString();}
								if (map.get("rsrv_str5") != null) {rsrv_str5 = map.get("rsrv_str5").toString();}
								if (map.get("trade_id") != null) {trade_id = map.get("trade_id").toString();}
								if (map.get("enquiry_date") != null) {enquiry_date = map.get("enquiry_date").toString();}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left">
								<a href="" TARGET=appwin onclick="mydefss()"><%=rsrv_str3%> </a>
							</td>
							<td style="color: #000000;" align="center">
								<%=rsrv_str5%>
							</td>
							<td style="color: #000000;" align="center">
								<%=enquiry_date%> 
							</td>
							<td style="color: #000000;" align=center>
								<a href="/doTradeReg.do?trade_type_code=1313&trade_id=<%=trade_id%>" target="_self"><img src=/img/icon_key.png width=16 height=16 border=0 alt="关闭提问"> </a>
							</td>
						</tr>
						<%
						}
						%>
						<tr>
							<td align="left" colspan="2">
								<bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str612"/>&nbsp;&nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/>
							</td>
							<td align="right" colspan="2">
								<a href="index.jsp?iStart=0"><bean:message key="str613"/> </a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="index.jsp?iStart=<%=pageUp%>"><bean:message key="str614"/></a> &nbsp;
								<%
										}
										if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="index.jsp?iStart=<%=pageDown%>"> <bean:message key="str615"/></a>&nbsp;
								<%
								}
								%>
								<a href="index.jsp?iStart=<%=pages - 1%>"><bean:message key="str616"/></a>
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