<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:useBean id="planBean" class="com.saas.biz.saleOrderMgr.SaleOrderInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String menu_id = "";
	HttpSession logsession = request.getSession();
	String iStart = "0";
	String menu_idx = "";
	String cust_id = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}

	ArrayList list = planBean.getOrderListByState(Integer.parseInt(iStart), cust_id, "0", "3", "4");
	int counter = planBean.getOrderCountByState(cust_id, "0", "3", "4");
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
	HashMap stateMap = bean.getCompareInfoByCode("CRM", "plan_state");
	HashMap typeMap = bean.getCompareInfoByCode("CRM", "form_type");
%>
<html>
	<head>
		<title><bean:message key="str2809"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
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
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<td align="center">
					<div id="manager_body">
						<div id="manager_body_left">
							<jsp:include page="/inc/left.jsp" />
						</div>
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<div id="righttop">
											<jsp:include page="/inc/menu.jsp">
												<jsp:param name="menu_id" value="<%=menu_id%>" />
											</jsp:include>
										</div>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="2"></td>
											</tr>
											<tr>
												<td valign="top">
													<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
														<tr>
															<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
																<bean:message key="str2827"/>
															</td>
															<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
																<bean:message key="str2828"/>
															</td>
															<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
																<bean:message key="str3361"/>
															</td>
															<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
																<bean:message key="str754"/>
															</td>
															<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
																<bean:message key="str755"/>
															</td>
															<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
																<bean:message key="str2808"/>
															</td>
														</tr>
														<%
																if (list != null && list.size() > 0) {
																for (int i = 0; i < list.size(); i++) {
																	HashMap map = (HashMap) list.get(i);
																	String quo_id = map.get("quo_id").toString();
																	String quo_name = "";
																	if (map.get("quo_name") != null) {
																quo_name = map.get("quo_name").toString();
																	}
																	String form_name = "";
																	if (map.get("form_name") != null) {
																form_name = map.get("form_name").toString();
																	}
																	String form_id = "";
																	if (map.get("form_id") != null) {
																form_id = map.get("form_id").toString();
																	}
																	String entity_type = "";
																	if (map.get("entity_type") != null) {
																entity_type = map.get("entity_type").toString();
																if (typeMap.get(entity_type) != null) {
																	entity_type = typeMap.get(entity_type).toString();
																}
																	}
																	String state_code = "", state = "";
																	if (map.get("state_code") != null) {
																state_code = map.get("state_code").toString();
																state = state_code;
																if (stateMap.get(state_code) != null) {
																	state_code = stateMap.get(state_code).toString();
																}
																	}
																	String end_date = new SimpleDateFormat("yyyy-MM-dd")
																	.format(new Date());
																	if (map.get("end_date") != null) {
																end_date = map.get("end_date").toString();
																if (end_date.length() > 10) {
																	end_date = end_date.substring(0, 10);
																}
																	}
																	if (state == "3" || state.equals("3")) {
														%>
														<tr style="background-color: #f9f9f9;">
															<td style="color: #000000;" align="left">
																<a href="/saleOrder/viewStateIndex.jsp?form_id=<%=form_id%>&name=<%=form_name%>&quo_id=<%=quo_id%>" TARGET=appwin onclick="mydefss()" title="查看订单"><%=quo_name%></a>
															</td>
															<td style="color: #000000;" align="left"><%=entity_type%></td>
															<td style="color: #000000;" align="left"><%=state_code%></td>
															<td style="color: #000000;" align="center">
																<img src=/img/edit.gif width=16 height=16 border=0 style="cursor: hand" alt="被拒绝的订单,不能修改<bean:message key="str754"/>！">
															</td>
															<td style="color: #000000;" align="center">
																<a href="/doTradeReg.do?trade_type_code=1091&form_id=<%=form_id%>&quo_id=<%=quo_id%>" target="_self"><img src=/img/del.gif width=16 height=16 border=0 style="cursor: hand" alt="删除">
																</a>
															</td>
															<td style="color: #000000;" align="center">
																<img src=/img/change.png width=20 height=20 border=0 style="cursor: hand" alt="被拒绝的订单,不能提交给上级审批!">
															</td>
														</tr>
														<%
														} else {
														%>
														<tr style="background-color: #f9f9f9;">
															<td style="color: #000000;" align="left">
																<a href="/saleOrder/viewStateIndex.jsp?form_id=<%=form_id%>&name=<%=form_name%>&quo_id=<%=quo_id%>" TARGET=appwin onclick="mydefss()" title="查看订单"><%=quo_name%></a>
															</td>
															<td style="color: #000000;" align="left"><%=entity_type%></td>
															<td style="color: #000000;" align="left"><%=state_code%></td>
															<td style="color: #000000;" align="center">
																<a href="/saleOrder/eiditSaleOrder.jsp?menu_id=<%=menu_idx%>&form_id=<%=form_id%>&quo_id=<%=quo_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 style="cursor: hand" alt="修改">
																</a>
															</td>
															<td style="color: #000000;" align="center">
																<a href="/doTradeReg.do?trade_type_code=1091&form_id=<%=form_id%>&quo_id=<%=quo_id%>" target="_self"><img src=/img/del.gif width=16 height=16 border=0 style="cursor: hand" alt="删除">
																</a>
															</td>
															<td style="color: #000000;" align="center">
																<a href="/doTradeReg.do?trade_type_code=1165&state_code=1&sale_quo_id=<%=quo_id%>&state_resean=提交&end_date=<%=end_date%>" target="_self"><img src=/img/change.png width=16 height=16 border=0 style="cursor: hand" alt="提交给上级审批">
																</a>
															</td>
														</tr>
														<%
																}
																}
															}
														%>
														<tr>
															<td align="left" colspan="2">
																<bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/>
															</td>
															<td align="right" colspan="4">
																<a href="editIndex.jsp?iStart=0&menu_id=<%=menu_idx%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
																<%
																if (Integer.parseInt(iStart) > 0) {
																%>
																<a href="editIndex.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_idx%>"><bean:message key="str1031"/></a> &nbsp;
																<%
																	}
																	if (Integer.parseInt(iStart) < pages - 1) {
																%>
																<a href="editIndex.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_idx%>"> <bean:message key="str1032"/></a>&nbsp;
																<%
																}
																%>
																<a href="editIndex.jsp?iStart=<%=pages - 1%>&menu_id=<%=menu_idx%>"><bean:message key="str1033"/></a>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<jsp:include page="/bottom.jsp" />
				</td>
			</tr>
		</table>
	</body>
</html>