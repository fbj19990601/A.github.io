<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.productMgr.ProductInfo"%>
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

	ProductInfo proInfo = new ProductInfo();
	ArrayList autoList = proInfo.getProList(Integer.parseInt(iStart),cust_id);
	int counter = proInfo.getProductList(cust_id);
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
								<bean:message key="str3254"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str3255"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str3253"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="35%">
								<bean:message key="str3257"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str3258"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str3259"/>
							</td>
						</tr>
						<%
								if (autoList != null && autoList.size() > 0) {
								for (int i = 0; i < autoList.size(); i++) {
									HashMap map = (HashMap) autoList.get(i);
									String product_id = "", product_type = "", product_name = "", product_desc = "", product_site = "";
									if (map.get("product_id") != null) {
								product_id = map.get("product_id").toString();
									}
									if (map.get("product_type") != null) {
								product_type = map.get("product_type").toString();
									}
									if (product_type.equals("0") || product_type == "0") {
								product_type = "实物物料";
									} else if (product_type.equals("1") || product_type == "1") {
								product_type = "无形服务";
									} else if (product_type.equals("2") || product_type == "2") {
								product_type = "其他";
									}
									if (map.get("product_name") != null) {
								product_name = map.get("product_name").toString();
									}
									if (map.get("product_desc") != null) {
								product_desc = map.get("product_desc").toString();
									}
									if (map.get("unit") != null) {
								product_site = map.get("unit").toString();
									}
									if (product_site.equals("0") || product_site == "0") {
								product_site = "个!";
									} else if (product_site.equals("1") || product_site == "1") {
								product_site = "箱!";
									} else if (product_site.equals("2") || product_site == "2") {
								product_site = "包!";
									}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left">
								<a href="seeproInfo.jsp?product_id=<%=product_id%>" TARGET=appwin onclick="mydefss()" title="查看产品信息"><%=product_name%></a>
							</td>
							<td style="color: #000000;" align="center"><%=product_type%></td>
							<td style="color: #000000;" align="left"><%=product_site%></td>
							<td style="color: #000000;" align="center"><%=product_desc%></td>
							<td style="color: #000000;" align="center">
								<a href="addindex.jsp?menu_id=<%=meun_idx%>&product_id=<%=product_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/add.png width=16 height=16 border=0 style="cursor: hand" alt="添加原材料信息"> </a>
							</td>
							<td style="color: #000000;" align="center">
								<a href="rawindex.jsp?menu_id=<%=meun_idx%>&product_id=<%=product_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/views.png width=16 height=16 border=0 style="cursor: hand" alt="维护原材料信息"> </a>
							</td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td align="left" colspan="3">
								<bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str612"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str612"/>
							</td>
							<td align="right" colspan="3">
								<a href="index.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str613"/> </a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="index.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str614"/></a> &nbsp;
								<%
									}
									if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="index.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"><bean:message key="str615"/> </a>&nbsp;
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
