<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String job_id = "";
	String title = "";
	String req = "";
	String publish_user_id = "";
	String cust_id = "";
	String cust_name = "";
	String job_addr = "";
	//String enquiry_date="";
	if (request.getParameter("job_id") != null) {
		job_id = request.getParameter("job_id");
	}

	JobInfo jobObj = new JobInfo();
	ArrayList jobList = new ArrayList();
	if (job_id != null && !job_id.equals("")) {
		jobList = jobObj.genOneJob(job_id);
		if (jobList != null && jobList.size() > 0) {
			HashMap map = (HashMap) jobList.get(0);
			job_id = map.get("job_id").toString();
			if (map.get("title") != null) {
		title = map.get("title").toString();
			}
			if (map.get("request") != null) {
		req = map.get("request").toString();
			}
			if (map.get("publish_user_id") != null) {
		publish_user_id = map.get("publish_user_id").toString();
		UserInfo userInfo = new UserInfo();
		ArrayList list = new ArrayList();
		HashMap map1 = new HashMap();
		list = userInfo.genOneUserInfo(publish_user_id);
		if (list != null && list.size() > 0) {
			map1 = (HashMap) list.get(0);
			cust_id = map1.get("cust_id").toString();
			Custinfo custInfo = new Custinfo();
			ArrayList list2 = new ArrayList();
			HashMap map2 = new HashMap();
			list2 = custInfo.genSpecCustInfo(cust_id);
			if (list2 != null && list2.size() > 0) {
				map2 = (HashMap) list2.get(0);
				cust_name = map2.get("cust_name").toString();
			}
		}
			}
			if (map.get("job_addr") != null) {
		job_addr = map.get("job_addr").toString();
			}
		}
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key = "str2232"/></title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#login{
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
.table_xian {
	border-bottom: #CDD4DA 1px dashed; margin-top:1px
}
.table_left_right_xian {
	border-left: #CDD4DA 1px dashed;border-right: #CDD4DA 1px dashed;
}
-->
</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
	</head>
	<body>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td width="276">
					<img src="/zone_b2b/images/qiuzhi_02.gif" width="276" height="94">
				</td>
				<td background="/zone_b2b/images/qiuzhi_03.gif">
					&nbsp;
				</td>

				<td width="237">
					<img src="/zone_b2b/images/qiuzhi_05.gif" width="237" height="94">
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="134" height="32" align="center"
					background="/zone_b2b/images/sup_03.gif" class="bthong">
					<bean:message key = "str1395"/>
				</td>
				<td align="right" valign="bottom" background="/zone_b2b/images/sup_04.gif">
					<table width="80%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="25" align="right">
								
								<img src="/zone_b2b/images/sup_08.gif" align="absmiddle" />
								&nbsp;
							</td>

						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="FFC367">
			<tr>
				<td width="100%" bgcolor="#FFFFFF">
					<table width="100%" border="0" cellspacing="0" cellpadding="5" class="table_xian">
						<tr>
							<td width="20%" align="right" bgcolor="F9F9F9" class="table_left_right_xian">
								<bean:message key="str1396"/>
							</td>

							<td width="80%">
								<%=title%>
								
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="5"
						class="table_xian">
						<tr>
							<td width="20%" align="right" bgcolor="F9F9F9" class="table_left_right_xian">
								<bean:message  key="str1397"/>
							</td>
							<td width="80%">
								<%=req%>
								
							</td>

						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="5"	class="table_xian">
						<tr>
							<td width="20%" align="right" bgcolor="F9F9F9" class="table_left_right_xian">
								<bean:message key = "str1401"/>
							</td>
							<td width="80%">
									<%=job_addr%>
							
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="5"	class="table_xian">

						<tr>
							<td width="20%" align="right" valign="top" bgcolor="F9F9F9" class="table_left_right_xian">
								<bean:message key = "str1399"/>
							</td>
							<td width="80%">
								<textarea name="enquiry_content" cols="60" rows="8"></textarea>
								
							</td>
						</tr>
					</table>
					    <input type="hidden" name="publish_user_id"	value="<%=publish_user_id%>">
						<input type="hidden" name="sale_id" value="<%=job_id%>">
						<input type="hidden" name="deal_tag" value="0">
						<input type="hidden" name="trade_type_code" value="2345">
					<table width="100%" border="0" cellspacing="0" cellpadding="5">

						<tr>
							<td width="20%" align="right" bgcolor="F9F9F9"	class="table_left_right_xian">
								&nbsp;
							</td>
							<td width="80%">
								<input type="submit" name="Submit" value="发送求职意向">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</form>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>
