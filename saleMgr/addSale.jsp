<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/layout.css" rel="stylesheet">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- ÖÐ¼ä -->
				<td align="center">
					<div id="manager_body">
						<div id="manager_body_right">
							<table width="740" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<jsp:include flush="true" page="classEntity.jsp" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
