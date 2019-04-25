<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.custlinkMgr.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String link_no = "", link_name = "", link_type = "", rsrv_str3 = "", link_url = "";
	if (request.getParameter("link_no") != null) {
		link_no = request.getParameter("link_no");
		CustlinkInfo linkInof = new CustlinkInfo();
		ArrayList inofList = linkInof.genOneCustlink(link_no, cust_id);
		if (inofList != null && inofList.size() > 0) {
			HashMap map = (HashMap) inofList.get(0);
			if (map.get("link_name") != null) {
		     link_name = map.get("link_name").toString();
			}
			if (map.get("link_no") != null) {
		      link_no = map.get("link_no").toString();
			}
			if (map.get("link_type") != null) {
		       link_type = map.get("link_type").toString();
			}
			if (map.get("rsrv_str3") != null) {
		     rsrv_str3 = map.get("rsrv_str3").toString();
			}
			if (map.get("link_url") != null) {
		      link_url = map.get("link_url").toString();
			}
		}
	}
	ParamethodMgr paramCom = new ParamethodMgr();
	link_type = paramCom.getParamNameByValue("29",link_type);
%>
<html>
	<head>
		<title><bean:message key="str0987"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/
</style>
	</head>
	<body>
	        <bean:define id="content" value="<%=rsrv_str3%>"/>
			<table width="725" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td class="line1" align="left" colspan="2">
						<bean:message key="str1363"/>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align="right" width="15%">
						<bean:message key="str2757"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left  width="85%">
						<%=link_name%>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str1346"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<%=link_type%>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str1347"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<html:link href="<%=link_url%>"><%=link_url%></html:link>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str1349"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<bean:write name="content" filter="false"/>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px; padding-top:10px;padding-bottom:10px;" align=center colspan=2>
					</td>
				</tr>
			</table>
	</body>
</html>
