<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title><bean:message key="str1161"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>

		<SCRIPT>
	            WinLIKE.definewindows=mydefss;
	            function mydefss() {
	            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
	            	j.Vis=false;
	            	j.Nam='appwin';
	            	WinLIKE.addwindow(j);
	            };
	    </SCRIPT>
	</head>
	<body>
		<%
			HttpSession logsession = request.getSession();
			String cust_id = "";
			String iStart = "0";
			String menu_id = "";

			if (request.getParameter("iStart") != null) {
				iStart = request.getParameter("iStart");
			}
			if (logsession.getAttribute("SESSION_CUST_ID") != null) {
				cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
			}
			if (request.getParameter("menu_id") != null) {
				menu_id = request.getParameter("menu_id");
			}
			RelationCcInfo relation = new RelationCcInfo();
			ArrayList relationList = new ArrayList();
			relationList = relation.getCustByRelationTypeCode(Integer.valueOf(
					iStart).intValue(), cust_id, "4");

			int counter = relation.getCustByRelationTypeCode(cust_id, "4");

			int pages = counter / 20 + 1;
			int pageUp = 0, pageDown = 0;
			int currenPage = Integer.valueOf(iStart).intValue();
			if (pages > currenPage) {
				if (currenPage > 0) {
					pageUp = currenPage - 1;
				}
				pageDown = currenPage + 1;
			} else if (pages == currenPage) {
				pageUp = currenPage - 1;
				pageDown = currenPage;
			}
		%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td>
					<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
								<bean:message key="str1140"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								Email
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str1255"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str1159"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str1142"/>
							</td>
						</tr>
						<%
								if (relationList != null && relationList.size() > 0) {
								for (int i = 0; i < relationList.size(); i++) {
									HashMap map = (HashMap) relationList.get(i);
									String obj_cust_id = map.get("obj_cust_id").toString();
									String cust_name = "";
									String relation_type_code = "";
									String group_contact_phone = "";
									String start_date = "", level_name = "", email = "";
									if (map.get("cust_name") != null) {
								cust_name = map.get("cust_name").toString();
									}
									if (map.get("email") != null) {
								email = map.get("email").toString();
									}
									if (map.get("group_contact_phone") != null) {
								group_contact_phone = map.get("group_contact_phone")
										.toString();
									}
									if (map.get("start_date") != null) {
								start_date = map.get("start_date").toString();
								if (start_date.length() > 10) {
									start_date = start_date.substring(0, 10);
								}
									}
						%>

						<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
							<td style="color: #000000; padding: 2px 5px;" align=left>
								<a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%></a>
							</td>
							<td style="color: #000000; padding: 2px 5px;" align=left><%=email%></td>
							<td style="color: #000000; padding: 2px 5px;" align=left><%=group_contact_phone%></td>
							<td style="color: #000000;" align=center><%=start_date%></td>
							<td style="color: #000000;" align=center>
								<a href="addDealerExp.jsp?obj_cust_id=<%=obj_cust_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0>
								</a>
							</td>
						</tr>

						<%
						}
						%>

						<tr>

		               	<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
											
                        <td  align="right" colspan="3"  style=" padding:2px 5px;">
						 <a href="indexExp.jsp?iStart=0"> <bean:message key="str1030"/></a>&nbsp; &nbsp;
							 <% 
							 	if(Integer.parseInt(iStart)>0){
								 %>
								 <a href="indexExp.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
									 <%
									 }
							    if(Integer.parseInt(iStart)<pages-1){
							        %>
					 	<a href="indexExp.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/>  </a>&nbsp; 
						 <%
							 	}
				 	%>
						 <a  href="indexExp.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
											
					 </tr>

						<%
						}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td height="13"></td>
			</tr>
		</table>
	</body>
</html>