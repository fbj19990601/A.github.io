<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.cmdStateMgr.CmdStateInfo"%>

<%
	HttpSession logs = request.getSession();
	String iStart = "0";
	String meun_idx = "";
	String cust_id = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logs.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logs.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
		logs.setAttribute("menu_id", meun_idx);
	}

	CmdStateInfo order = new CmdStateInfo();
	ArrayList orderList = order.getCmdStateList(Integer
			.parseInt(iStart), cust_id);
	int counter = order.getCmdStateList(cust_id);
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
		<title><bean:message key="str1846"/></title>
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
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
							<bean:message key="str4690"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str4691"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str4692"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str4693"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str4434"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str182"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str410"/>
							</td>
						</tr>
						<%
								if (orderList != null && orderList.size() > 0) {
								for (int i = 0; i < orderList.size(); i++) {
									HashMap map = (HashMap) orderList.get(i);
									String shopo_title = "", from_addr = "", to_addr = "", cmd_num = "", pre_date = "", state_code = "", cmd_obj_name = "";
									if (map.get("shopo_title") != null) {
								shopo_title = map.get("shopo_title").toString();
									}
									if (map.get("from_addr") != null) {
								from_addr = map.get("from_addr").toString();
									}
									if (map.get("to_addr") != null) {
								to_addr = map.get("to_addr").toString();
									}
									if (map.get("cmd_num") != null) {
								cmd_num = map.get("cmd_num").toString();
									}
									if (map.get("pre_date") != null) {
								pre_date = map.get("pre_date").toString();
									}
									if (pre_date.length() > 10) {
								pre_date = pre_date.substring(0, 10);
									}
									if (map.get("state_code") != null) {
								state_code = map.get("state_code").toString();
									}
									if (state_code.equals("0") || state_code == "0") {
								state_code = "新录入!";
									} else if (state_code.equals("1") || state_code == "1") {
								state_code = "执行中!";
									} else if (state_code.equals("2") || state_code == "2") {
								state_code = "已执行!";
									}
									if (map.get("cmd_obj_name") != null) {
								cmd_obj_name = map.get("cmd_obj_name").toString();
									}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left"><%=shopo_title%></td>
							<td style="color: #000000;" align="left"><%=cmd_obj_name%></td>
							<td style="color: #000000;" align="left"><%=from_addr%></td>
							<td style="color: #000000;" align="center"><%=to_addr%></td>
							<td style="color: #000000;" align="center"><%=cmd_num%></td>
							<td style="color: #000000;" align="center"><%=pre_date%></td>
							<td style="color: #000000;" align="center"><%=state_code%></td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td align="left" colspan="2">
								<bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str1029"/>
							</td>
							<td align="right" colspan="4">
								<a href="index.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str1030"/></a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="index.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;
								<%
									}
									if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="index.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"> <bean:message key="str1032"/></a>&nbsp;
								<%
								}
								%>
								<a href="index.jsp?iStart=<%=pages - 1%>&menu_id=<%=meun_idx%>"><bean:message key="str1033"/></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
