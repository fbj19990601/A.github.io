<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.ordercastMgr.OrderCast"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%
	String cust_id = "";
	String iStart = "1";
	String s_id = "";
	String province = "";

	HttpSession logsession = request.getSession();

	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("cust_id") != null) {
		cust_id = request.getParameter("cust_id");
	}
	s_id = (String) logsession.getAttribute("SESSION_USER_ID");

	OrderCast oc = new OrderCast();
	Custinfo custinfo = new Custinfo();
	AreaInfo area = new AreaInfo();
	province = area.getCountrySelect("5J2mc0X0G85BH");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key="str2232"/> </title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

#login {
	position: relative;
	display: none;
	top: 20px;
	left: 30px;
	background-color: #ffffff;
	text-align: center;
	border: solid 1px;
	padding: 10px;
	z-index: 1;
}
-->
</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="/zone_b2b/supply/inquiry.js"></script>
		<script type='text/javascript' src='/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='/dwr/engine.js'></script>
		<script type='text/javascript' src='/dwr/util.js'></script>
		<script language="javascript">
// 设置城市信息
function setCityInfo(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city_l");
			var fectureArray = new Array();
			fectureArray = ['地市信息..'];
			DWRUtil.addOptions("city_l", fectureArray);
			DWRUtil.addOptions("city_l", data);
		});
	} else {
		DWRUtil.removeAllOptions("city_l");
		var fectureArray = new Array();
		fectureArray = ['地市信息..'];
		DWRUtil.addOptions("city_l", fectureArray);
	}
}
//检测关键字
function checkKey_Word(){
	var pub_key=$F("job_key");
	alert(pub_key);
}

//开始搜索
function searchJob(){
	alert("开始搜索");
}
</script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="260" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/ba_105.gif" width="2" height="29" alt="">
							</td>
							<td align="center" background="/zone_b2b/images/ba_106.gif">
								<table width="96%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td width="78%" class="btlanse">
											<bean:message key="str2237"/>
										</td>
										<!--td width="17%"><a href="#" class="lanse">更多&gt;&gt;</a></td-->
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/ba_109.gif" width="2" height="29" alt="">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="9BBDD3">
						<tr>
							<td height="200" valign="top" bgcolor="#FFFFFF">
								<!--//重复-->
								<%
									ArrayList rec_list = oc.getRecommendJobAll(0, 5);

									if (rec_list != null && rec_list.size() > 0) {
										for (int i = 0; i < rec_list.size(); i++) {
											HashMap map = (HashMap) rec_list.get(i);
											String title = "";
											String cust_name = "";
											String end_date = "";
											String custId = "";
											if (map.get("job_unit") != null) {
										custId = map.get("job_unit").toString();
											}
											if (map.get("title") != null) {
										title = map.get("title").toString();
											}
											if (map.get("cust_name") != null) {
										cust_name = map.get("cust_name").toString();
											}
											if (map.get("end_date") != null) {
										end_date = map.get("end_date").toString();
											}
											if (end_date.length() > 10) {
										end_date = end_date.substring(0, 10);
											}
								%>
								<div class="rencei_table_xian" height="180%">
									·
									<a href="/zone_b2b/enterprise/customer/<%=custId%>/" class="lanse"><%=cust_name%></a>
									<br>
									<span class="zi"><a href="jobinfo.jsp?cust_id=<%=custId%>" target=_blank class="lanse"><%=title%></a>|<%=end_date%></span>
									<%
										}
										}
									%>
								
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="8"></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/ba_105.gif" width="2" height="29" alt="">
							</td>
							<td align="center" background="/zone_b2b/images/ba_106.gif">
								<table width="96%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td width="78%" class="btlanse">
											<bean:message key="str2238"/>
										</td>
										<!--td width="17%"><a href="#" class="lanse">更多&gt;&gt;</a></td-->
									</tr>
									
									<input type = "text" onchange=""/>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/ba_109.gif" width="2" height="29" alt="">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="9BBDD3">
						<tr>
							<td height="210" valign="top" bgcolor="#FFFFFF">
								<%
											ArrayList list = custinfo.getCustNewById(Integer.parseInt(iStart),
											5);
									if (list != null && list.size() > 0) {
										for (int i = 0; i < list.size(); i++) {
											HashMap map = (HashMap) list.get(i);
											String cust_id1 = "";
											String cust_name = "";
											if (map.get("cust_id") != null) {
										cust_id1 = map.get("cust_id").toString();
											}
											if (map.get("cust_name") != null) {
										cust_name = map.get("cust_name").toString();
											}
								%>
								<!--//重复-->
								<div class="rencei_table_xian" height="180%">
									·
									<a href="/zone_b2b/enterprise/customer/<%=cust_id1%>/" class="lanse"><%=cust_name%></a>
								</div>
								<!--重复//-->
								<%
									}
									}
								%>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
					&nbsp;
				</td>
				<td width="710" valign="top">
					<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
								<bean:message key="str2239"/>
								<a href="/zone_b2b" class="lanse"><bean:message key = "str2879"/></a> 
								<a href="/zone_b2b/talents" class="lanse"><bean:message key = "str3603"/></a> 
								<!--a href="#" class="lanse"-->
								<bean:message key="str1395"/>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5"></td>
						</tr>
					</table>
					<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="556" valign="top" bgcolor="#FFFFFF">
								<table width="687" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="540" valign="top">
											<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="26" class="leftbt14">
														<img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle">
														<bean:message key="str1228"/>
													</td>
												</tr>
												<tr>
													<td height="3" class="xian"></td>
												</tr>
											</table>
											<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#f1f1f1">
												<%
												String scope = new Custinfo().gentCustNameById(cust_id);
												%>
												<tr>
													<td bgcolor="#FFFFFF">
														<%=scope%></td>
												</tr>
											</table>
											<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="26" class="leftbt14">
														<img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle">
														<bean:message key="str871"/>
													</td>
												</tr>
												<tr>
													<td height="3" class="xian"></td>
												</tr>
											</table>
											<table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#E1E1E1">
												<%
													ArrayList CustList = new Custinfo().getCustInfo(cust_id);
													if (CustList != null && CustList.size() > 0) {
														for (int i = 0; i < CustList.size(); i++) {
															HashMap map = (HashMap) CustList.get(i);
															String cust_name = "", company_address = "", website = "", fax_nbr = "", group_contact_phone = "", email = "";

															if (map.get("cust_name") != null) {
														cust_name = map.get("cust_name").toString();
															}
															if (map.get("company_address") != null) {
														company_address = map.get("company_address").toString();
															}
															if (map.get("website") != null) {
														website = map.get("website").toString();
															}
															if (map.get("fax_nbr") != null) {
														fax_nbr = map.get("fax_nbr").toString();
															}
															if (map.get("group_contact_phone") != null) {
														group_contact_phone = map.get("group_contact_phone")
																.toString();
															}
															if (map.get("email") != null) {
														email = map.get("email").toString();
															}
												%>
												<TR>
													<TD align="right" bgColor="#f7f7f7">
														<bean:message key="str1653"/>
													</TD>
													<TD vAlign="top" bgColor="#FFFFFF"><%=cust_name%></TD>
													<TD vAlign="top" align="right" bgColor="#f7f7f7">
														<bean:message key="str1422"/>
													</TD>
													<TD vAlign="top" bgColor="#FFFFFF"><%=company_address%></TD>
												</TR>
												<TR>
													<TD width="97" align="right" bgColor="#f7f7f7">
														<bean:message key="str5048"/>
													</TD>
													<TD vAlign="top" width="256" bgColor="#FFFFFF"><%=website%></TD>
													<TD vAlign="top" align="right" width="96" bgColor="#f7f7f7">
														<bean:message key="str3489"/>
													</TD>
													<TD vAlign="top" width="198" bgColor="#FFFFFF"><%=fax_nbr%></TD>
												</TR>
												<TR>
													<TD align="right" bgColor="#f7f7f7">
														<bean:message key="str3800"/>
													</TD>
													<TD vAlign="top" bgColor="#FFFFFF"><%=group_contact_phone%></TD>
													<TD vAlign="top" align="right" bgColor="#f7f7f7">
														<bean:message key="str3493"/>
													</TD>
													<TD vAlign="top" bgColor="#FFFFFF"><%=email%></TD>
												</TR>
												<%
													}
													}
												%>
											</table>
											<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="26" class="leftbt14">
														<img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle">
														<bean:message key="str1395"/>
													</td>
												</tr>
												<tr>
													<td height="3" class="xian"></td>
												</tr>
											</table>
											<!--//重复-->
											<table width="653" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#E1E1E1">
												<%
													ArrayList jobList = new JobInfo().genNewJobList(cust_id);
													if (jobList != null && jobList.size() > 0) {
														for (int i = 0; i < jobList.size(); i++) {
															HashMap map = (HashMap) jobList.get(i);
															String job_id = "", title = "", job_addr = "", publish_date = "", job_unit = "", req = "";
															if (map.get("job_id") != null) {
														job_id = map.get("job_id").toString();
															}
															if (map.get("job_unit") != null) {
														job_unit = map.get("job_unit").toString();
															}
															if (map.get("title") != null) {
														title = map.get("title").toString();
															}
															if (map.get("job_addr") != null) {
														job_addr = map.get("job_addr").toString();
															}
															if (map.get("request") != null) {
														req = map.get("request").toString();
															}
															if (map.get("publish_date") != null) {
														publish_date = map.get("publish_date").toString();
															}
															if (publish_date.length() > 10) {
														publish_date = publish_date.substring(0, 10);
															}
												%>
												<TR>
													<TD width="97" align="right" bgColor="#f7f7f7">
														<bean:message key="str2240"/>
													</TD>
													<TD width="30%" bgColor="#FFFFFF">
														<a href="jobinfo.jsp?cust_id=<%=job_unit%>" target="_blank" class="lanse"><%=title%></A>
													</TD>
													<TD width="96" align="right" vAlign="top" bgColor="#F7F7F7">
														<bean:message key="str2241"/>
													</TD>
													<TD width="198" vAlign="top" bgColor="#FFFFFF"><%=publish_date%></TD>
												</TR>
												<TR>
													<TD align="right" bgColor="#f7f7f7">
														<bean:message key="str1380"/>
													</TD>
													<TD colspan="3" vAlign="top" bgColor="#FFFFFF"><%=req%></TD>
												</TR>
												<TR>
													<TD align="right" bgColor="#f7f7f7">
														<bean:message key="str1381"/>
													</TD>
													<TD colspan="3" vAlign="top" bgColor="#FFFFFF"><%=job_addr%></TD>
												</TR>
												<TR>
													<TD align="right" bgColor="#f7f7f7">
														<bean:message key="str2242"/>
													</TD>
													<TD colspan="3" vAlign="top" bgColor="#FFFFFF" hight="40">
														<div>
															<%
															if (s_id != null && !s_id.equals("")) {
															%>
															<a href="jin.jsp?job_id=<%=job_id%>" target="_self"><img src="/zone_b2b/images/qiuzhi.gif" border="0" align="absMiddle" /> </a>&nbsp;发送求职意向,必须先登录
															<%
															 } else {
															 %>
															<a href="javascript:open();"><img src="/zone_b2b/images/qiuzhi.gif" border="0" align="absMiddle" />&nbsp;</a>发送求职意向,必须先登录
															<%
															}
															%>
														</div>
													</TD>
												</TR>
												<%
													}
													}
												%>
												<form action="/doTradeReg.do" name="loginForm" method="post" target="_self">
													<div id="login">
														<span><bean:message key = "str1975"/></span>
														<div id="panel">
															<bean:message key="str1678"/>
															<input type="text" name="user_name" id="user_name" size="20" />
															<br>
															<bean:message key="str1771"/>
															<input type="password" name="passwd" id="passwd" size="20">
														</div>
														<input type="hidden" name="trade_type_code" id="trade_type_code" value="1304">
														<input type="submit" value="登录" onClick=" return checkLogin()" />
														<a href="javascript:close();" style="color: red"><bean:message key = "str1978"/></a>
													</div>
												</form>
											</table>
											<TABLE width="95%" border=0 align="center" cellPadding=0 cellSpacing=0 class=xian>
												<TBODY>
													<TR>
														<TD height=10></TD>
													</TR>
												</TBODY>
											</TABLE>
											<!--重复//-->
											<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="42%" height="60" align="center">
														&nbsp:
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>