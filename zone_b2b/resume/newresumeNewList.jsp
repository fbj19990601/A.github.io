<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.resumeMgr.ResumeInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.ordercastMgr.OrderCast"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%
	String iStart = "0";
	String province = "";
	HttpSession logsession = request.getSession();
	Custinfo custinfo = new Custinfo();
	OrderCast oc = new OrderCast();
	JobInfo jobinfo = new JobInfo();
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}

	int counter = new JobInfo().genNewJobListAll();

	String pageTools = tools.getGoogleToolsBar(counter,
			"newresumeNewList.jsp?sys_code=1&page=", Integer
			.parseInt(iStart), 30);

	AreaInfo area = new AreaInfo();
	province = area.getCountrySelect("5J2mc0X0G85BH");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key="str2243"/></title>
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
		<jsp:include flush="true" page="/zone_b2b/top.html" />
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
										<td width="17%"></td>
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
								<%
									ArrayList rec_list = oc.getRecommendJobAll(0, 5);

									if (rec_list != null && rec_list.size() > 0) {
										for (int i = 0; i < rec_list.size(); i++) {
											HashMap map = (HashMap) rec_list.get(i);
											String title = "";
											String cust_name = "";
											String end_date = "";
											String cust_id = "";
											if (map.get("job_unit") != null) {
										cust_id = map.get("job_unit").toString();
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
									<a href="/zone_b2b/enterprise/customer/<%=cust_id%>/" class="lanse"><%=cust_name%></a>
									<br>
									<span class="zi"><a href="/zone_b2b/job/jobinfo.jsp?cust_id=<%=cust_id%>" target=_blank class="lanse"><%=title%></a>|<%=end_date%></span>
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
										<td width="17%">
											<a href="/zone_b2b/enterprise/" class="lanse"><bean:message key="str2249"/></a>
										</td>
									</tr>
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
											String cust_id = "";
											String cust_name = "";
											if (map.get("cust_id") != null) {
										cust_id = map.get("cust_id").toString();
											}
											if (map.get("cust_name") != null) {
										cust_name = map.get("cust_name").toString();
											}
								%>
								<!--//重复-->
								<div class="rencei_table_xian" height="180%">
									·
									<a href="/zone_b2b/enterprise/customer/<%=cust_id%>/" class="lanse"><%=cust_name%></a>
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
							<td height="26" valign="top" bgcolor="#FFFFFF">
								<bean:message key="str2239"/>
								<a href="/zone_b2b/" class="lanse"><bean:message key="str1147"/></a> &gt;
								<a href="/zone_b2b/talents/" class="lanse"><bean:message key="str2029"/></a>
								 &gt; <bean:message key="str1514"/>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5"></td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="1">
								<img src="/zone_b2b/images/zixun_17.gif" width="1" height="24">
							</td>
							<td width="10" background="/zone_b2b/images/zixun_12.gif">
								&nbsp;
							</td>
							<td width="726" background="/zone_b2b/images/zixun_12.gif">
								<table width="100" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="3" height="24">
											<img src="/zone_b2b/images/ba_127.gif" width="3" height="24" alt="" />
										</td>
										<td align="center" background="/zone_b2b/images/ba_128.gif">
											<table width="96%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="85%" align="center" class="btlanse">
														<bean:message key="str1514"/>
													</td>
												</tr>
											</table>
										</td>
										<td width="2">
											<img src="/zone_b2b/images/ba_130.gif" width="2" height="24" alt="" />
										</td>
									</tr>
								</table>
							</td>
							<td width="1">
								<img src="/zone_b2b/images/zixun_17.gif" width="1" height="24">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="556" valign="top" bgcolor="#FFFFFF">
								<table width="687" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="540" valign="top">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="15%" height="30">
														<strong><bean:message key="str1414"/></strong>
													</td>
													<td width="10%">
														<strong><bean:message key="str720"/></strong>
													</td>
													<td width="15%">
														<strong><bean:message key="str711"/></strong>
													</td>
													<td width="10%">
														<strong><bean:message key="str731"/></strong>
													</td>
													<td width="10%">
														<strong><bean:message key="str887"/></strong>
													</td>
													<td width="15%">
														<strong><bean:message key="str5053"/></strong>
													</td>
													<td width="10%">
														<strong><bean:message key="str3531"/></strong>
													</td>
												</tr>
												<%
													ParamethodMgr para = new ParamethodMgr();
													ResumeInfo ri2 = new ResumeInfo();
													ArrayList resumelist = ri2.getResumeListAll(Integer
															.parseInt(iStart), 30);

													if (resumelist != null && resumelist.size() > 0) {
														for (int i = 0; i < resumelist.size(); i++) {
															HashMap map = (HashMap) resumelist.get(i);
															String resume_id = "";
															String name = "";
															String born_date = "";
															String age = "";
															String degree = "";
															String position = "";
															String grad_from = "";
															String work_history = "";
															String tel = "";

															if (map.get("name") != null) {
														name = map.get("name").toString();
															}
															if (map.get("resume_id") != null) {
														resume_id = map.get("resume_id").toString();
															}

															if (map.get("born_date") != null) {
														born_date = map.get("born_date").toString();
															}
															if (born_date.length() > 10) {
														born_date = born_date.substring(0, 10);
															}

															if (map.get("age") != null) {
														age = map.get("age").toString();
															}

															if (map.get("degree") != null) {
														degree = map.get("degree").toString();
														degree = para.getParamNameByValue("39", degree);
															}
															if (map.get("position") != null) {
														position = map.get("position").toString();
															}

															if (map.get("grad_from") != null) {
														grad_from = map.get("grad_from").toString();
															}

															if (map.get("tel") != null) {
														tel = map.get("tel").toString();
															}
												%>
												<!--//重复-->
												<tr>
													<td width="10%" height="25" class="rencei_table_xian">
														<a href="/zone_b2b/resume/resume_content.jsp?resume_id=<%=resume_id%>" class="lanse"><%=name%>
													</td>
													<td width="10%" class="rencei_table_xian"><%=age%></td>
													<td width="15%" class="rencei_table_xian"><%=position%></td>
													<td width="10%" height="25" class="rencei_table_xian"><%=degree%></td>
													<td width="15%" class="rencei_table_xian"><%=born_date%></td>
													<td width="25%" class="rencei_table_xian"><%=grad_from%></td>
													<td width="15%" class="rencei_table_xian"><%=tel%></td>
												</tr>
												<!--重复//-->
												<%
													}
													}
												%>
											</table>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr style="text-align: center">
													<%=pageTools%>
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
