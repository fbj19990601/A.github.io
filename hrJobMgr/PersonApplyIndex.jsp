<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "1";
	
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	
	JobInfo jobObj = new JobInfo();
	ArrayList jobList =jobObj.gentjobByCust_id( Integer.valueOf( iStart ).intValue(),cust_id );
	
	int counter = jobObj.getjobListNumber(cust_id);
	String pageTools =tools.getPageTools(String.valueOf(counter),
			"30", "PersonApplyIndex.jsp?iStart=", Integer.parseInt(iStart));
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellpadding="2" cellspacing="1" align=center bgcolor="#e7e7e7" style="margin-top:13px">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
					<bean:message key="str732"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%">
					<bean:message key="str733"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
					<bean:message key="str734"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%">
					<bean:message key="str735"/>
				</td>
			</tr>
			<%
			       // out.println(jobList.size());
					if (jobList != null && jobList.size() > 0) {
					for (Iterator it = jobList.iterator(); it.hasNext();) {
						HashMap map = (HashMap) it.next();
						String job_id = map.get("job_id").toString();
						String title = "";
						String req = "";
						String job_addr = "";
						String publish_date = "";
					if (map.get("title") != null) {
					title = map.get("title").toString();
						}

						if (map.get("job_addr") != null) {
					job_addr = map.get("job_addr").toString();
						}

						if (map.get("publish_date") != null) {
					publish_date = map.get("publish_date").toString();
					if (publish_date.length() > 10) {
						publish_date = publish_date.substring(0, 10);
					}
				}
			%>
			<tr style="background-color:#f9f9f9; ">
				<td style=" color:#000000; padding:3px 5px;" align=left>
					<a href="viewjobinfo.jsp?job_id=<%=job_id%>" title=<%=title%> target="_self"><%=title%> </a>
				</td>

				<td style=" color:#000000; padding:3px 5px; " align=left>
					<%=job_addr%>
				</td>
				<td style=" color:#000000; padding:3px 5px;" align=left>
					<%=publish_date%>
				</td>

				<td style=" color:#000000;" align=center>
					<a href=viewJobinfo2.jsp?job_id=<%=job_id%> TARGET="_self"><img src=/img/edit.gif width=16 height=16 border=0 alt="Ó¦Æ¸ÐÅÏ¢"> </a>
				</td>

			</tr>

			<%
			}
			%>
			<tr>
				<%=pageTools%>
			</tr>
			<%
			}
			%>


		</table>
	</body>
</html>
