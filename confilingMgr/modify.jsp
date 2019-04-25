<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.confilingMgr.ConFilingInfo"%>
<%
	HttpSession logsession = request.getSession();
	String iStart = "0";
	String meun_idx = "";
	String cust_id = "",con_id="";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("con_id") != null) {
		con_id = request.getParameter("con_id");
	}
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
		logsession.setAttribute("menu_id", meun_idx);
	}
	ConFilingInfo conInfo = new ConFilingInfo();
	ArrayList autoList = conInfo.getConFilingList(Integer.parseInt(iStart), cust_id ,con_id);
	int counter = conInfo.getConFilingList(cust_id ,con_id);
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
		<title><bean:message key="str1584"/></title>
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
								<bean:message key="str1594"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
							<bean:message key="str1602"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str4696"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str4697"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str4698"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str156"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str157"/>
							</td>
						</tr>
						<%
						if (autoList != null && autoList.size() > 0) {
						for (int i = 0; i < autoList.size(); i++) {
							HashMap map = (HashMap) autoList.get(i);
							String  con_name = "",filing_no="", 
							filing_name = "", oper_date = "", file_desc = "",file_name="";
							if (map.get("con_name") != null) {
								con_name = map.get("con_name").toString();
							}
							if (map.get("filing_no") != null) {
								filing_no = map.get("filing_no").toString();
							}
							if (map.get("filing_name") != null) {
								filing_name = map.get("filing_name").toString();
							}
							if (map.get("file_name") != null) {
								file_name = map.get("file_name").toString();
							}
							if (map.get("oper_date") != null) {
								oper_date = map.get("oper_date").toString();
							}
							if (oper_date.length() > 10) {
								oper_date = oper_date.substring(0, 10);
							}
							if (map.get("file_desc") != null) {
								file_desc = map.get("file_desc").toString();
							}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left"><%=con_name%></td>
							<td style="color: #000000;" align="left"><%=filing_name%></td>
							<td style="color: #000000;" align="left"><%=file_name%></td>
							<td style="color: #000000;" align="center"><%=file_desc%></td>
							<td style="color: #000000;" align="center"><%=oper_date%></td>
							<td style="color: #000000;" align="center">
								<a href="modify_con_filing.jsp?menu_id=<%=meun_idx%>&con_id=<%=con_id%>&filing_no=<%=filing_no%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="修改">
								</a>
							</td>
							<td style="color: #000000;" align="center">
								<a href="/doTradeReg.do?trade_type_code=1270&con_id=<%=con_id%>&filing_no=<%=filing_no%>" target="_self" onclick="return delet();"><img src=/img/delete.png width=16 height=16 border=0 style="cursor: hand" alt="删除">
								</a>
							</td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td align="left" colspan="3">
								<bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str612"/>
							</td>
							<td align="right" colspan="3">
								<a href="modify.jsp?iStart=1&menu_id=<%=meun_idx%>&con_id=<%=con_id%>"><bean:message key="str613"/> </a>&nbsp; &nbsp;
								<a href="modify.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>&con_id=<%=con_id%>"><bean:message key="str614"/></a> &nbsp;
								<a href="modify.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>&con_id=<%=con_id%>"><bean:message key="str615"/> </a>&nbsp;
								<a href="modify.jsp?iStart=<%=pages%>&menu_id=<%=meun_idx%>&con_id=<%=con_id%>"><bean:message key="str616"/></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
