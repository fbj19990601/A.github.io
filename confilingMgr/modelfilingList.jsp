<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.filingMgr.FilingInfo"%>
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
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
		logsession.setAttribute("menu_id", meun_idx);
	}

	FilingInfo filing = new FilingInfo();
	ArrayList autoList = filing.getFilingList(Integer.parseInt(iStart),
			cust_id);
	int counter = filing.getFilingList(cust_id);
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
		<title><bean:message key="str1580"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script src="/www/fuction/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="/www/fuction/public.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
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
		<script type="text/javascript">
		function delet(){
		 if(window.confirm('确定要删除本条记录？')){
		   return true;
		 }else{
		   return false;
		 }
		}
		</script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="2"></td>
			</tr>
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str4699"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
								<bean:message key="str4700"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str4701"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
								<bean:message key="str4702"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str1769"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str2677"/>
							</td>
						</tr>
						<%
								if (autoList != null && autoList.size() > 0) {
								for (int i = 0; i < autoList.size(); i++) {
									HashMap map = (HashMap) autoList.get(i);
									String filing_id = "", filing_name = "", filing_address = "", filing_date = "", filing_desc = "";
									if (map.get("filing_id") != null) {
								filing_id = map.get("filing_id").toString();
									}
									if (map.get("filing_name") != null) {
								filing_name = map.get("filing_name").toString();
									}
									if (map.get("filing_address") != null) {
								filing_address = map.get("filing_address").toString();
									}
									if (map.get("filing_date") != null) {
								filing_date = map.get("filing_date").toString();
									}
									if (filing_date.length() > 10) {
								filing_date = filing_date.substring(0, 10);
									}
									if (map.get("filing_desc") != null) {
								filing_desc = map.get("filing_desc").toString();
									}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left"><%=filing_name%></td>
							<td style="color: #000000;" align="left"><%=filing_address%></td>
							<td style="color: #000000;" align="left"><%=filing_date%></td>
							<td style="color: #000000;" align="center"><%=filing_desc%></td>
							<td style="color: #000000;" align="center">
								<a href="modelfiling.jsp?menu_id=<%=meun_idx%>&filing_id=<%=filing_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="修改"> </a>
							</td>
							<td style="color: #000000;" align="center">
								<a href="/doTradeReg.do?trade_type_code=1267&filing_id=<%=filing_id%>" target="_self" onclick="return delet();"><img src=/img/delete.png width=16 height=16 border=0 style="cursor: hand" alt="删除"> </a>
							</td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td align="left" colspan="3">
								<bean:message key="str1027"/><%=counter%><bean:message key="str1028"/> &nbsp;<bean:message key="str1145"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1146"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1146"/>
							</td>
							<td align="right" colspan="3">
								<a href="modelfilingindex.jsp?iStart=0"><bean:message key="str613"/> </a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="modelfilingindex.jsp?iStart=<%=pageUp%>"><bean:message key="str614"/></a> &nbsp;
								<%
									}
									if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="modelfilingindex.jsp?iStart=<%=pageDown%>"><bean:message key="str615"/> </a>&nbsp;
								<%
								}
								%>
								<a href="modelfilingindex.jsp?iStart=<%=pages - 1%>"><bean:message key="str616"/></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
