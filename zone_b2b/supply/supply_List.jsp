<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="areaBean" class="com.saas.biz.AreaInfoMgr.AreaInfo" scope="page" />
<jsp:useBean id="classBean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<%
	String country = areaBean.getCountrySelect("5J2mc0X0G85BH");
	String start_Page = "1", sys_code = "0";
	if (request.getParameter("page") != null) {
		start_Page = request.getParameter("page");
	}
	if (request.getParameter("sys_code") != null) {
		sys_code = request.getParameter("sys_code");
	}
	String saleClassInfo = classBean.getSelectedByComm("5", "1");
%>
<html>
	<head>
		<title><bean:message key="str316"/>-<bean:message key="str2722"/></title>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="supply.js"></script>
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
		</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
	</head>
	<body onload="autoLoad('<%=start_Page%>','<%=sys_code%>')">
		<input type="hidden" name="s_start" id="s_start" value="<%=start_Page%>">
		<input type="hidden" name="s_code" id="s_code" value="<%=sys_code%>">
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<img src="/zone_b2b/images/ba_41.gif" width="980" height="50" alt="" />
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="740" valign="top">
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr>
							<td width="134" height="32" align="center" background="/zone_b2b/images/sup_03.gif" class="bthong">
								&nbsp;&nbsp;<bean:message key="str3950"/>
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								<img src="/zone_b2b/images/sup_08.gif" align="absmiddle">
								&nbsp;
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="FFC367">
						<tr>
							<td valign="top" bgcolor="FFFFFF">
								<jsp:include flush="true" page="/zone_b2b/catalog.jsp">
									<jsp:param name="type" value="5" />
									<jsp:param name="level" value="1" />
								</jsp:include>
							</td>
						</tr>
					</table>
					<table width="50%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="10"></td>
						</tr>
					</table>
					<!--选项开始-->
					<!--JavaScript部分-->
					<style type=text/css>
					.ec4 {
						CURSOR: hand;
						background:url(/zone_b2b/images/sup_03.gif);
						COLOR: #8A0A0A;
						font-weight:bold;
						font-size: 13px;
					}
					.ec3 {CURSOR: hand; background:url(/zone_b2b/images/sup_05.gif); COLOR: #FE7C00; font-weight:bold;
						font-size: 12px;}
					}
						  </style>
					<!--HTML部分-->
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr align=middle>
							<td width="134" height="32" align="center" id="td0" class=ec4 onClick="javascript:secBoard(0)" style="padding-top:2;cursor: hand">
								<bean:message key="str5113"/>
							</td>
							<td width="2" align="middle" background="/zone_b2b/images/sup_04.gif"></td>
							<td width="134" height="32" align="center" id="td1" class=ec3 onClick="javascript:secBoard(1)" style="padding-top:2;cursor: hand">
								&nbsp;&nbsp;&nbsp;<bean:message key="str2065"/>
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								&nbsp; &nbsp; &nbsp;
							</td>
						</tr>
					</table>

					<!--供应列表-->
					<div id="sale-list">
						<jsp:include flush="true" page="saleList.jsp">
							<jsp:param name="sys_code" value="<%=sys_code%>"></jsp:param>
							<jsp:param name="page" value="<%=start_Page%>"></jsp:param>
						</jsp:include>
					</div>
					<!--最新供应-->
					<div id="sale-new-list" style="display: none">
						<jsp:include flush="true" page="saleOrderList.jsp">
							<jsp:param name="sys_code" value="<%=sys_code%>"></jsp:param>
							<jsp:param name="page" value="<%=start_Page%>"></jsp:param>
						</jsp:include>
					</div>
					<!--选项结束-->
				</td>
				<td valign="top">
					&nbsp;
				</td>
				<td width="228" valign="top">
					<jsp:include flush="true" page="sale_right.jsp" />
				</td>
		</table>
		<form action="supplyComparam.jsp" method="post" name="commpara" id="commpara" target="_blank">
			<input type="hidden" name="idx" id="idx">
		</form>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>
