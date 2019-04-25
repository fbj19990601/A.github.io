<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	String URL = request.getRequestURL().substring(0,24);
	String factory = "", obj_cust_id = "";
	String email="",phone="",com_addr="";
	if (request.getParameter("cust_name") != null) {
		factory = request.getParameter("cust_name");
	}
	if (request.getParameter("email") != null) {
		email = request.getParameter("email");
	}
	if (request.getParameter("phone") != null) {
		phone = request.getParameter("phone");
	}
	if (request.getParameter("com_addr") != null) {
		com_addr = request.getParameter("com_addr");
	}
	if (request.getParameter("obj_cust_id") != null) {
		obj_cust_id = request.getParameter("obj_cust_id");
	}
	
%>
<html>
	<head>
		<title><bean:message key="str4718"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript">
	function setCodeValue(){ 
	  	if(document.getElementById('keyword').value=='' || document.getElementById('keyword').value == null){ 
	  		alert('ÇëÄúÌîÐ´¹Ø¼ü×Ö£¡');
	  		return false;
	  	}else{
	     	document.viewForm.submit();
	    }
  	}
</script>
		<style type="text/css">
.line {
	BORDER-TOP: medium none;
	BORDER-LEFT: medium none;
	border-right: medium none;
	border-bottom: 1px solid #000000;
}
</style>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="13" align="left">
				</td>
			</tr>
			<tr>
				<td>
					<form action="http://aaa.xsaas.com/custsearchIndex.jsp" method="post" name="viewForm">
						<input type="hidden" name="URL" value="<%=URL%>">
						<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
							<tr>
								<td colspan="2" width="100%" align="left" valign="top" style="border-left: 2px solid #FF6600; border-top: 2px solid #fff; border-bottom: 1px solid #fff; padding-left: 10px; font-weight: bolder; font-size: 14px; color: #000000; background-color: #e0e0e0; line-height: 30px;">
									<bean:message key="str1957"/>
								</td>
							</tr>
							<tr>
							<tr>
								<td>
									<input name="obj_cust_id" id="obj_cust_id" type="hidden" value="<%=obj_cust_id%>">
								</td>
							</tr>
							<tr>
								<td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1371"/>
								</td>
								<td width="80%" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<%=factory%>
										<input name="factory" id="factory" type="hidden" value="<%=factory%>">
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
							</tr>
							
							<tr>
								<td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1956"/>
								</td>
								<td width="80%" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<input name="keyword" id="keyword" type="text" value="" size="25" maxlength="25">
									</div>
								</td>
							</tr>
							<input type="hidden" name="email_value" id="email_value" value="<%=email %>">
							<input type="hidden" name="phone_value" id="phone_value" value="<%=phone %>">
							<input type="hidden" name="com_addr_value" id="com_addr_value" value="<%=com_addr %>">
							<tr>
								<td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1958"/>
								</td>
								<td align="left" bgcolor="#FFFFFF" width="80%">
									<div class="ping" style="display: inline;">
										<input type="checkbox" name="email" id="email" value="<%=email%>">Email
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="phone" id="phone" value="<%=phone%>"><bean:message key="str3699"/>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="com_addr" id="com_addr" value="<%=com_addr%>"><bean:message key="str4719"/>
										&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</td>
							</tr>
							<input type="hidden" name="url" id="url" value="<%=URL %>">
							<tr>
								<td align="center" bgcolor="#FFFFFF" colspan="4">
									<input class="cxan" type="button" value="" style="cursor: hand" onclick="setCodeValue()">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="13"></td>
			</tr>
		</table>
	</body>
</html>