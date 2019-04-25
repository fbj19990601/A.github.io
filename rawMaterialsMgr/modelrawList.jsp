<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.rawMaterialsMgr.RawMaterialsInfo"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String iStart = "0";
	String meun_idx = "";
	String cust_id = "", product_id = "";
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
	if (request.getParameter("product_id") != null) {
		product_id = request.getParameter("product_id");
	}

	RawMaterialsInfo proInfo = new RawMaterialsInfo();
	ArrayList autoList = proInfo.getRawMList(Integer.parseInt(iStart),cust_id, product_id);
	int counter = proInfo.getRawMList(cust_id, product_id);
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
		<title><bean:message key="str3249"/></title>
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
		<table width="725" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str3243"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str3251"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str3252"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="30%">
								<bean:message key="str3253"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str322"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str323"/>
							</td>
						</tr>
						<%
								if (autoList != null && autoList.size() > 0) {
								for (int i = 0; i < autoList.size(); i++) {
									HashMap map = (HashMap) autoList.get(i);
									String raw_id = "", raw_name = "", raw_num = "", raw_price = "", raw_site = "", unit = "";
									String unit1 = "", raw_price1 = "";
									String currency = "";
									if (map.get("raw_id") != null) {
								raw_id = map.get("raw_id").toString();
									}
									if (map.get("raw_name") != null) {
								raw_name = map.get("raw_name").toString();
									}
									if (map.get("raw_num") != null) {
								raw_num = map.get("raw_num").toString();
									}
									if (map.get("raw_price") != null) {
								raw_price = map.get("raw_price").toString();
								String delims = "";
								String dd[] = raw_price.split(delims);
								currency = comm.getParamNameByValue("98",
										dd[dd.length - 1]);
								for (int a = 0; a < dd.length - 1; a++) {
									raw_price1 += dd[a];
								}
									}
									if (map.get("raw_site") != null) {
								raw_site = map.get("raw_site").toString();
									}
									if (map.get("unit") != null) {
								unit = map.get("unit").toString();
								unit1 = comm.getParamNameByValue("91", unit);
									}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="center">
								<a href="seerawInfo.jsp?raw_id=<%=raw_id%>" TARGET=appwin onclick="mydefss()" title="查看产品信息"><%=raw_name%></a>
							</td>
							<td style="color: #000000;" align="center"><%=raw_num%><%=unit1%></td>
							<td style="color: #000000;" align="center"><%=raw_price1%><%=currency%></td>
							<td style="color: #000000;" align="center"><%=raw_site%></td>
							<td style="color: #000000;" align="center">
								<a href="modifyindex.jsp?menu_id=<%=meun_idx%>&raw_id=<%=raw_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="修改"> </a>
							</td>
							<td style="color: #000000;" align="center">
								<a href="/doTradeReg.do?trade_type_code=1273&raw_id=<%=raw_id%>" target="_self" onclick="return delet();"><img src=/img/delete.png width=16 height=16 border=0 style="cursor: hand" alt="删除"> </a>
							</td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td align="left" colspan="3">
								<bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str612"/>&nbsp;&nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/>
							</td>
							<td align="right" colspan="3">
								<a href="rawindex.jsp?iStart=0&product_id=<%=product_id%>"><bean:message key="str613"/> </a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="rawindex.jsp?iStart=<%=pageUp%>&product_id=<%=product_id%>"><bean:message key="str614"/></a> &nbsp;
								<%
									}
									if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="rawindex.jsp?iStart=<%=pageDown%>&product_id=<%=product_id%>"><bean:message key="str615"/> </a>&nbsp;
								<%
								}
								%>
								<a href="rawindex.jsp?iStart=<%=pages - 1%>&product_id=<%=product_id%>"><bean:message key="str616"/></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
