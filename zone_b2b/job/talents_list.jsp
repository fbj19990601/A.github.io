<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
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
	</head>
	<%
		String iStart = "1";
		HttpSession logsession = request.getSession();
		
		if (request.getParameter("iStart") != null) {
			iStart = request.getParameter("iStart");
		}
		
		int counter = new JobInfo().genNewJobListAll();
		
		String pageTools = tools.getGoogleToolsBar(counter, "talents_List.jsp?sys_code=1&page=", Integer.parseInt(iStart), 30);
	%>
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
					<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="9BBDD3">
						<tr>
							<td height="100" valign="top" bgcolor="#FFFFFF">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="26" class="leftbt14">
											<bean:message key="str2244"/>
										</td>
									</tr>
									<tr>
										<td height="3" class="xian"></td>
									</tr>
									<tr>
										<td height="26">
											<bean:message key="str2245"/>
											<select name="select2">
												<option>
													-<bean:message key="str2246"/>-
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td height="26">
											<bean:message key="str2247"/>
											<select name="select2">
												<option>
													--<bean:message key="str2248"/>--
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<input name="textfield3" type="text" class="0" value="������ؼ���" size="20">
											<a href="#"><img src="images/search.gif" width="56" height="21" border="0" align="absmiddle">
											</a>
										</td>
									</tr>
								</table>
								<!--//�ظ�-->
								<!--�ظ�//-->
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
								<img src="images/ba_105.gif" width="2" height="29" alt="">
							</td>
							<td align="center" background="images/ba_106.gif">
								<table width="96%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="5%">
											<img src="images/lujian.gif" width="5" height="9" />
										</td>
										<td width="78%" class="btlanse">
											<bean:message key="str2237"/>
										</td>
										<td width="17%">
											<a href="#" class="lanse"><bean:message key="str2249"/></a>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="images/ba_109.gif" width="2" height="29" alt="">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="9BBDD3">
						<tr>
							<td height="200" valign="top" bgcolor="#FFFFFF">
								<!--//�ظ�-->
								<table width="95%" border="0" align="center" cellpadding="2" cellspacing="0" class="rencei_table_xian">
									<tr>
										<td valign="top">
											<a href="#" class="lanse"><bean:message key="str2257"/></a>
											<br>
											<span class="zi"><bean:message key="str2258"/></span>
										</td>
									</tr>
								</table>
								<!--�ظ�//-->
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
								<img src="images/ba_105.gif" width="2" height="29" alt="">
							</td>
							<td align="center" background="images/ba_106.gif">
								<table width="96%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="5%">
											<img src="images/lujian.gif" width="5" height="9" />
										</td>
										<td width="78%" class="btlanse">
											<bean:message key="str2238"/>
										</td>
										<td width="17%">
											<a href="#" class="lanse"><bean:message key="str2249"/></a>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="images/ba_109.gif" width="2" height="29" alt="">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="9BBDD3">
						<tr>
							<td height="210" valign="top" bgcolor="#FFFFFF">
								<!--//�ظ�-->
								<div class="rencei_table_xian" height="180%">
									��
									<a href="#" class="lanse"><bean:message key="str2259"/></a>
								</div>
								<!--�ظ�//-->
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
								<a href="#" class="lanse"><bean:message key="str1030"/></a> &gt;
								<a href="#" class="lanse"><bean:message key="str2029"/></a> &gt; <bean:message key="str1395"/>
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
														<bean:message key="str1395"/>
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
													<td width="35%" height="30">
														<strong><bean:message key="str2250"/></strong>
													</td>
													<td width="35%">
														<strong><bean:message key="str2255"/></strong>
													</td>
													<td width="20%">
														<strong><bean:message key="str2251"/></strong>
													</td>
													<td width="10%">
														<strong><bean:message key="str758"/></strong>
													</td>
												</tr>
												<%
													ArrayList jobList = new JobInfo().genLatestJobList(Integer.parseInt(iStart), 30);
													if (jobList != null && jobList.size() > 0) {
														for (int i = 0; i < jobList.size(); i++) {
															HashMap map = (HashMap) jobList.get(i);
															String job_id = "", title = "", job_addr = "", publish_date = "", job_unit = "";
															if (map.get("job_id") != null) {
														job_id = map.get("job_id").toString();
															}
															if (map.get("title") != null) {
														title = map.get("title").toString();
															}
															if (map.get("job_addr") != null) {
														job_addr = map.get("job_addr").toString();
															}
															if (map.get("publish_date") != null) {
														publish_date = map.get("publish_date").toString();
															}
															if (publish_date.length() > 10) {
														publish_date = publish_date.substring(0, 10);
															}
															if (map.get("job_unit") != null) {
														job_unit = map.get("job_unit").toString();
															}
															String cust_name = new Custinfo().getCustNameById(job_unit);
												%>
												<!--//�ظ�-->
												<tr>
													<td width="35%" height="25" class="rencei_table_xian">
														<%=cust_name%>
													</td>
													<td width="35%" class="rencei_table_xian">
														<a href="jobinfo.jsp?cust_id=<%=job_unit%>" target=_blank class="lanse"><%=title%>
														</a>
													</td>
													<td width="20%" class="rencei_table_xian">
														<%=job_addr%>
													</td>
													<td width="10%" class="rencei_table_xian">
														<%=publish_date%>
													</td>
												</tr>
												<!--�ظ�//-->
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
