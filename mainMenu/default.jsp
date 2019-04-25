<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	String subsys_code = "B2B";
	if (request.getParameter("subsys_code") != null) {
		subsys_code = request.getParameter("subsys_code");
		if(subsys_code=="out" || subsys_code.equals("out")){
		 %>
		  <jsp:forward page="/out.jsp"/>
		 <%
		 return;
		}
	}
%>
<html>
	<head>
		<title><bean:message key="str2705"/></title>
		<style type="text/css">
		.style2 { FONT-WEIGHT: bold; FONT-SIZE: x-small; COLOR: #376392; FONT-FAMILY: Arial, Helvetica, sans-serif }
	    .style3 { FONT-WEIGHT: bold; COLOR: #ffffff }
		</style>
		<!--  link href="/style/new_layout.css" rel="stylesheet" type="text/css" />-->
	</head>
	<frameset rows="103,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="top.jsp" name="top" scrolling="no" noresize>
		<frameset id="frame" cols="180,*" frameborder="no" framespacing="0" border="false">
			<frame src="left.jsp?subsys_code=<%=subsys_code%>" name="_left" scrolling="auto" noresize>
			<frame src="home.jsp" name="main" scrolling="yes" frameBorder="0">
		</frameset>
		<noframes>
			<body bgcolor="#FFFFFF">
				<table width="100" border="4" align="center" cellpadding="10" cellspacing="2" height="100%" id="Table1">
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
			</body>
		</noframes>
	</frameset>
</html>
