<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="comparam" class="com.saas.biz.commen.ParamethodMgr" scope="page"></jsp:useBean>
<jsp:useBean id="roleBean" class="com.saas.biz.roleMgr.RoleInfo" scope="page"></jsp:useBean>
<html>
	<head>
		<title><bean:message key="str334"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="menuTree.js"></script>
		<style>
		 .l_td{background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;text-align:right;width: 15%}
		 .r_td{background-color:#ffffff; color:#000000;  font-size:12px;width: 85%}
		 .Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
		</style>
	</head>
	<body>
		<%
		    HttpSession sesson=request.getSession();
            String cust_id=(String)sesson.getAttribute("SESSION_CUST_ID");
			String start_date = "";
			SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
			start_date = formate.format(new Date());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR, 50);
			String end_date = formate.format(cal.getTime());
			String role_code=roleBean.getRoleSelectByType(cust_id,"1");
			String server_code=comparam.getCustServerSelect(cust_id,"3","0","41");
		%>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
				<tr>
					<!-- ÖÐ¼ä -->
					<td align="center" height="27px">
						<div id="manager_body">
							<div id="manager_body_right">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width=95% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
												<tr>
													<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:15px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
														<div style="color: red">
															<bean:message key="str3269"/>
														</div>
													</td>
												</tr>
												<tr>
													<td class="l_td">
														<div style="color: red">
															<bean:message key="str3270"/>
														</div>
													</td>
													<td align="left" class="r_td">
													    <div style="color: red">
														<bean:message key="str3354"/>
														</div>
													</td>
												</tr>
												<tr>
													<td class="l_td">
															<bean:message key="str3355"/>
													</td>
													<td align="left" class="r_td">
													    <select id="sub_code" name="sub_code" onchange="selectServer(this.value)">
													      <option value="0"><bean:message key="str160"/></option>
													      <%=server_code%>
													    </select>
													</td>
												</tr>
												<tr>
													<td class="l_td">
															<bean:message key="str349"/>
													</td>
													<td align="left" class="r_td">
													    <select id="role_code" name="role_code" onchange="creatTree(this.value)">
													      <option value="0"><bean:message key="str160"/></option>
													      <%=role_code%>
													    </select>
													</td>
												</tr>
												<tr>
													<td class="l_td">
														<bean:message key="str3357"/>
													</td>
													<td align="left" class="r_td">
														<div id="send-tree"></div>
													</td>
												</tr>
												<tr>
													<td class="l_td">
														<bean:message key="str3820"/>
													</td>
													<td align="left" class="r_td">
														<div class="ping">
															<input name="start_date" type="text" id="start_date" size=10 maxlength=15 value="<%=start_date%>" onfocus="setday(this);" readonly>
															(yyyy-MM-dd)
														</div>
													</td>
												</tr>
												<tr>
													<td class="l_td">
														<bean:message key="str3821"/>
													</td>
													<td align="left" class="r_td">
														<div class="ping">
															<input name="end_date" type="text" id="end_date" size=10 maxlength=15 value="<%=end_date%>" onfocus="setday(this);" readonly>
															(yyyy-MM-dd)
														</div>
													</td>
												</tr>
												<tr>
													<td class="l_td">
														<bean:message key="str164"/>
													</td>
													<td align="left" class="r_td">
														<div class="ping1">
															<input name="remark" type="text" id="remark" size=50 maxlength=100>
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
														<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
													</td>
												</tr>
												<input type="hidden" name="menu_id" id="menu_id" value="0">
												<input type="hidden" name="trade_type_code" value="1204">
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
