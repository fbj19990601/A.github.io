<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.addproductattrMgr.*"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "", class_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("class_id") != null) {
		class_id = request.getParameter("class_id");
	}
	AddProductAttrInfo group = new AddProductAttrInfo();
	ArrayList tableList = group.getProductById(cust_id, class_id);
%>
<html>
	<head>
		<title><bean:message key="str432"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductAttrInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="13" align="left">
				</td>
			</tr>
			<tr>
				<td>
					<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str433"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=left width="85%">
								<bean:message key="str964"/>
							</td>
						</tr>
						<%
							int size = 0;
							if (tableList != null && tableList.size() > 0) {
								size = tableList.size();
								for (int i = 0; i < tableList.size(); i++) {
									HashMap map = (HashMap) tableList.get(i);
									String attr_name = "", attr_id = "", default_value = "";
									if (map.get("class_id") != null) {class_id = map.get("class_id").toString();}
									if (map.get("attr_id") != null) {attr_id = map.get("attr_id").toString();}
									if (map.get("attr_name") != null) {attr_name = map.get("attr_name").toString();}
									if (map.get("default_value") != null) {default_value = map.get("default_value").toString();}
						%>
						<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
							<td style="color: #000000;" align="center"><%=attr_name%></td>
							<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
								<input type=text name="<%=attr_name%>&<%=attr_id%>" id="attr_value<%=i%>" value="<%=default_value%>">
							</td>
						</tr>
						<%
						}
						}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td height="13">
					<input type="hidden" id="size" name="size" value="<%=size%>">
				</td>
			</tr>
		</table>
	</body>
</html>
