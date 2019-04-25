<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%
	String job_key = "", prov_l = "", city_l = "", pub_job = "", para = "";
	String iStart = "0";
	int counter = 0;
	String defaultImg = "/zone_b2b/images/cp.gif";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("job_key") != null) {
		job_key = request.getParameter("job_key");
	}
	if (request.getParameter("prov_l") != null) {
		prov_l = request.getParameter("prov_l");
	}
	if (request.getParameter("city_l") != null) {
		city_l = request.getParameter("city_l");
	}
	if (request.getParameter("pub_job") != null) {
		pub_job = request.getParameter("pub_job");
	}
	if (request.getParameter("para") != null) {
		para = request.getParameter("para");
	}
	
	JobInfo jobinfo = new JobInfo();
	ArrayList jobList = new ArrayList();

	 if( city_l.equals("") || city_l == null )
	 {
		if(job_key.equals("") || job_key == null)
		{
			jobList = jobinfo.GetComByjob(Integer.valueOf(iStart).intValue(),prov_l,pub_job);
			counter = jobinfo.GetComByjob(prov_l,pub_job);
		}
		else
		{
			jobList = jobinfo.getComByJobCity(Integer.valueOf(iStart).intValue(),job_key,prov_l,pub_job);
			counter = jobinfo.getComByJobCity(job_key,prov_l,pub_job);
		}
	}
	else
	{
		if(job_key.equals("") || job_key == null)
		{
			jobList = jobinfo.getComByJobKey(Integer.valueOf(iStart).intValue(),prov_l,city_l,pub_job);
			counter = jobinfo.getComByJobKey(prov_l,city_l,pub_job);
		}
		else
		{
			jobList = jobinfo.getComByJobPro(Integer.valueOf(iStart).intValue(),job_key,prov_l,city_l,pub_job);
			counter = jobinfo.getComByJobPro(job_key,prov_l,city_l,pub_job);
		}
	}

	String pageTools = tools.getGoogleToolsBar(counter, "searchjobList.jsp?counter=" + counter + "&iStart=", Integer.parseInt(iStart), 10);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title><bean:message key = "str2252"/></title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="quoted.js"></script>
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
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="DCDCDC">
			<tr>
				<td height="29" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
					&nbsp;&nbsp;<bean:message key="str2253"/>
					<a href="/"><bean:message key="str2737"/></a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<a href="/zone_b2b/resume/newresumeList.jsp?talents=1"><bean:message key="str1395"/></a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<bean:message key="str1409"/>
				</td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="740" valign="top">
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr align="middle">
							<td width="134" height="32" align="center" background="/zone_b2b/images/sup_05.gif">
								<bean:message key="str2254"/>
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								<img src="/zone_b2b/images/sup_08.gif" align="middle">
							</td>
						</tr>
					</table>

					<table height="300" border="0" cellpadding="0" cellspacing="0" valign="top" width="736">
						<tr>
							<td height="255" valign="top" bgcolor="FFFFFF">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFC367">
									<tr>
										<td valign="top" bgcolor="FFFFFF"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="26%" height="30"><bean:message key="str1395"/></td>
													<td width="26%"><bean:message key="str2240"/></td>
													<td width="10%"><bean:message key="str2256"/></td>
													<td width="38%"><bean:message key="str1439"/></td>
												</tr>
												<tr>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
											</table>
											<table>
											<tr>
													<td height="10"></td>
											</tr>
											</table>
											<%
														if (jobList != null && jobList.size() > 0) {
														 for (Iterator it = jobList.iterator(); it.hasNext();) {
																HashMap map = (HashMap) it.next();
																String job_id = "", title = "", job_addr = "", publish_date = "", job_unit = "",cust_id="";
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
															String job_cust_name = new Custinfo().getCustNameById(job_unit);
															
															String file_path = "";
															if (map.get("file_path") != null) {
																file_path = map.get("file_path").toString();
																file_path = file_path.substring(23);
															}
															else
															{
														     file_path = defaultImg;
															}
									%>
								
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="26%" height="25"><!--a href="/zone_b2b/job/jobinfo.jsp?job_id=<%=job_unit%>" target="_blank" class="cpbt"></a-->													
													<!--a href="/zone_b2b/enterprise/customer/<%=job_unit%> /" class="lanse"--><%=job_cust_name%><!--/a--></td>
													<td width="26%"><!--a href="/zone_b2b/job/jobinfo.jsp?job_id=<%=job_unit%>" target=_blank class="lanse"--><%=title%><!--/a--></td>
													<td width="10%"><%=publish_date%></td>
													<td width="38%"><%=job_addr%></td>
												</tr>
												<tr>
													<td height="1" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
											</table>
										<%
										}
									 }
									%>
											</td>
									 </tr>
								</table>
								<table width="732" border="0" cellpadding="0" cellspacing="0" 0 height="22">
									<tr>
										<td height="10"></td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="E3E3E3">
									<tr>
										<td height="32" align="center" background="/zone_b2b/images/btt1.gif">
											<%=pageTools%>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0"0>
									<tr>
										<td height="10"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				<td valign="top">&nbsp;
				</td>
				<td width="228" valign="top">
					<jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp" />
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>
