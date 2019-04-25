<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="enqBean" class="com.saas.biz.enquirydealMgr.EnquirydInfo" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	String iStart = "1";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	HttpSession logsession = request.getSession();
	String user_id = "";
	if (logsession.getAttribute("SESSION_USER_ID") != null) {
		user_id = logsession.getAttribute("SESSION_USER_ID").toString();
	}
	ArrayList linkArray = enqBean.getEnquiryByMySelf(Integer.parseInt(iStart), user_id, "1");
	int counter = enqBean.getEnquiryByMySelf(user_id, "1");
	String pageTools = tools.getPageTools(String.valueOf(counter), "20", "receiveList.jsp?iStart=", Integer.parseInt(iStart));
%>
<html>
	<head>
		<title><bean:message key="str149"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid; font-weight:bold; background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.td{background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;}
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
							<td align="center" class="line1" width="30%">
								<bean:message key="str405"/>
							</td>
							<td align="center" width="15%">
								<bean:message key="str408"/>							</td>
							<td align="center" width="15%">
								<bean:message key="str409"/>
							</td>
							<td align="center" width="15%">
								<bean:message key="str410"/>
							</td>
							<td align="center" width="15%">
								<bean:message key="str155"/>
							</td>
						</tr>
						<%
							if (linkArray != null && linkArray.size() > 0) {
							for (int i = 0; i < linkArray.size(); i++) {
								HashMap map = (HashMap) linkArray.get(i);
								String trade_id=map.get("trade_id").toString();
								String title=map.get("rsrv_str3").toString();
								String enquiry_date="",rsrv_str1="";
								if(map.get("enquiry_date")!=null){
								  enquiry_date=map.get("enquiry_date").toString();
								  if(enquiry_date.length()>10){
								    enquiry_date=enquiry_date.substring(0,10);
								  }
								}
								if(map.get("rsrv_str1")!=null){
								  rsrv_str1=map.get("rsrv_str1").toString();
								  if(rsrv_str1=="0" ||rsrv_str1.equals("0")){
								    rsrv_str1="Unread";
								  }else if(rsrv_str1=="1" ||rsrv_str1.equals("1")){
								    rsrv_str1="Has resumed";
								  }else{
								    rsrv_str1="Be removed";
								  }
								}
								String user_name="";
								if(map.get("user_name")!=null){
								  user_name=map.get("user_name").toString();
								}
						%>
						<tr style="background-color:#f9f9f9; ">
							<td style=" color:#000000;" align="left">
								<a href="viewEnquiry.jsp?trade_id=<%=trade_id%>" TARGET=appwin onclick="mydefss()"><%=title%> </a>
							</td>
							<td style=" color:#000000;" align="center">
							    <%=enquiry_date%>
							</td>
							<td style=" color:#000000;" align="center">
							   <%=user_name%>
							</td>
							<td style=" color:#000000;" align="center">
							   <%=rsrv_str1%>
							</td>
							<td style=" color:#000000;" align=center>
								<a href="viewEnquiry.jsp?trade_id=<%=trade_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/views.png width=16 height=16 border=0 alt="Show details"> </a>
							</td>
						</tr>
						<%
						}
						%>
						<tr>
							<%=pageTools%>
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
