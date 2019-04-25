<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String menu_id = "";
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	cal.add(Calendar.YEAR, 1);
	String end = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String auditSel=bean.getSelectItems("80");
	String class_type=bean.getSelectItems("46");
%>
<html>
	<head>
		<title><bean:message key="str1938"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="defintion.js"></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
      </style>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
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
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																	<bean:message key="str1939"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="35%">
																	<div class="ping">
																		<select  name="subsys_code" id="subsys_code" onchange="checkCode(this.value)">
																		<option value=""><bean:message key="str1019"/></option>
																		 <%=auditSel%>
																		</select>
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																	<bean:message key="str1940"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="35%">
																	<div class="ping">
																		<select name="leve_sel" id="leve_sel" onclick="checkLevel(this.value)">
																		 <option value=""><bean:message key="str1019"/></option>
																		 <option value="0"><bean:message key="str1930"/></option>
																		 <option value="1"><bean:message key="str1931"/></option>
																		 <option value="2"><bean:message key="str1932"/></option>
																		 <option value="4"><bean:message key="str1941"/></option>
																		 <option value="all"><bean:message key="str1942"/></option>
																		</select><div id="level-div" style="float: left;"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																	<bean:message key="str1943"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="35%">
																	<div class="ping">
																		<div id="depart-tree"></div>
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																	<bean:message key="str1944"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="35%">
																	<div class="ping">
																	<select name="role_sel" id="role_sel" onclick="checkRole(this.value)">
																		 <option value="0"><bean:message key="str1019"/></option>
																		 <option value="1"><bean:message key="str1945"/></option>
																		 <option value="all"><bean:message key="str1946"/></option>
																		</select>
																		<div id="role-div"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																	<bean:message key="str1947"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="35%">
																	<div class="ping">
																		<select name="class_type" id="class_type" onchange="createClass(this.value)">
																		  <option value=""><bean:message key="str2283"/></option>
																		  <%=class_type%>
																		  <option value="all"><bean:message key="str4717"/></option>
																		</select>
																	</div>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;float:left" align=left colspan="2" width="50%">
																	<div class="ping">
																		<div id="type-tree"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str2643"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<input name="start_date" type="text" id="start_date" value="<%=start%>" size="10" maxlength="10" onfocus="setday(this);" />
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str2644"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<input name="end_date" type="text" id="end_date" value="<%=end%>" size="10" maxlength="10" onfocus="setday(this);" />
																	</div>
																</td>
															</tr>

															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
																	<bean:message key="str2810"/>
																</td>
																<td align="left" bgcolor="#FFFFFF" colspan="3">
																	<div class="ping1">
																		<input name="remark" id="remark" type="text" size=52 maxlength="50" />
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan=4>
																	<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
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
				<input type="hidden" name="para_code1">
				<input type="hidden" name="para_code2">
				<input type="hidden" name="para_code3">
				<input type="hidden" name="para_code4">
				<input type="hidden" name="para_code5">
				<input type="hidden" name="para_code6">
				<input type="hidden" name="para_code7">
				<input type="hidden" name="para_code8">
				<input type="hidden" name="para_code9">
				<input type="hidden" name="para_code10">
				<input type="hidden" id="leve_group" name="leve_group"/>
				<input type="hidden" id="role_group" name="role_group"/>
				<input type="hidden" id="depart_group" name="depart_group"/>
				<input type="hidden" id="type_group" name="type_group"/>
				<input type="hidden" name="trade_type_code" value="1170">
				<tr>
					<td align="center">
						<div class="bottom_admin">
							<%@ include file="/bottom.jsp"%>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



