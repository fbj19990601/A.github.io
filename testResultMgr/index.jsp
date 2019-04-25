<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	String menu_id = "";
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
%>
<html>
	<head>
		<title><bean:message key="str4075"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- �м� -->
				<td align="center">
					<div id="manager_body">
						<!--��߲˵�-->
						<div id="manager_body_left">
							<jsp:include page="/inc/left.jsp" />
						</div>
						<div id="manager_body_right">
							<table width="740" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<jsp:include page="addTestResultInfo.jsp"/>
									</td>
								</tr>
							</table>
						</div>
						<!--�ұ� ���岿�ֽ���  -->
					</div>
				</td>
				<!-- �м� ���� -->
			</tr>
			<tr>
				<!-- �ײ� -->
				<td align="center">
					<jsp:include page="/bottom.jsp" />
				</td>
			</tr>
			<!-- �ײ����� -->
		</table>
	</body>
</html>
