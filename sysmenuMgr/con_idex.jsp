<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title><bean:message key="str3942"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- ÖÐ¼ä -->
				<td align="center">
					<div id="manager_body">
						<!--×ó±ß²Ëµ¥-->
						<div id="manager_body_left">
							<jsp:include page="/inc/left.jsp" />
						</div>
						<div id="manager_body_right">
							<table width="740" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<div id="righttop">
											<%@ include file="create.jsp"%>
										</div>
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

