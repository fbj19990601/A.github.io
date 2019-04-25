<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.productclassMgr.Productclass"%>

<jsp:useBean id="bean" class="com.saas.biz.newsMgr.NewsInfo" scope="page" />
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%
	String news_id = "", title = "", content = "",news_type="",class_type="";
	if (request.getParameter("news_id") != null) {
		news_id = request.getParameter("news_id");
		ArrayList newsList = bean.genOneNews(news_id);
		if (newsList != null && newsList.size() > 0) {
			HashMap map = (HashMap) newsList.get(0);
			if (map.get("title") != null) {
		      title = map.get("title").toString();
			}
			if (map.get("content") != null) {
		        content = map.get("content").toString();
			}
			if (map.get("news_type") != null) {
		        news_type = map.get("news_type").toString();
		        ArrayList list=new Productclass().genUpclassByClassId(news_type);
		        if(list !=null && list.size()>0){
		          HashMap claMap=(HashMap)list.get(0);
		          if(claMap.get("class_name")!=null){
		           class_type=claMap.get("class_name").toString();
		          }
		        }
			}
		}
	}
%>
<html>
	<head>
		<title><bean:message key="str3267"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<form name="newform" action=/doTradeReg.do method="post">
			<table width="725" border=0 cellpadding=5 cellspacing=1 bgcolor="#dddddd" align=center>
				<tr>
				<td colspan="2" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;">&nbsp;</td>
				</tr>
				<tr>
					<td class="line1" align="left" colspan="2" height="25px">
						<bean:message key="str3925"/>
					</td>
				</tr>
				<tr>
					<td width="15%" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str3926"/>
					</td>
					<td width="85%" align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<%=class_type%>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str3927"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<%=title%>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right valign=top>
						<bean:message key="str3928"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
					    <bean:define id="news" value="<%=content%>"/>
						<bean:write name="news" filter="false"/>
					</td>
				</tr>
				<tr>
				<td colspan="2" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;">&nbsp;</td>
				</tr>
			</table>
		</form>
	</body>
</html>
