<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%
	String menu_id = "",reportId="";
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	if (request.getParameter("id") != null) {
		reportId = request.getParameter("id");
	}
%>

<html>
	<head>
		<title>Xsaas-���ϰ칫ϵͳ</title>
		
		
		<link href="/css/layout.css" rel="stylesheet" type="text/css">
		<link href="/css/daohang.css" rel="stylesheet" type="text/css">
		<link href="/css/manager.css" rel="stylesheet" type="text/css">
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
										<div id="righttop">
											<jsp:include page="/inc/menu.jsp">
												<jsp:param name="menu_id" value="<%=menu_id%>" />
											</jsp:include>
										</div>
									</td>
								</tr>
							</table>
							<jsp:include page="fileBrowsInfo.jsp">
							<jsp:param name="id" value="<%=reportId%>" />
							</jsp:include>
						</div>
						<!--�ұ� ���岿�ֽ���  -->
					</div>
				</td>
				<!-- �м� ���� -->
			</tr>
			<tr>
				<!-- �ײ� -->
				<td align="center">
					<div class="bottom_admin">
						<%@ include file="../../bottom.jsp"%>
					</div>
				</td>
			</tr>
			<!-- �ײ����� -->
		</table>
	</body>
</html>
