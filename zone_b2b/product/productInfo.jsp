<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
  
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<title><bean:message key = "str2739"/><bean:message key = "str2265"/></title>
	<script type="text/javascript" src="/js/prototype.js"></script>
	<script type="text/javascript" src="quoted.js"></script>
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	#login{
     position: relative;
     display: none;
         top: 20px;
         left: 30px;
         background-color: #ffffff;
         text-align: center;
         border: solid 1px;
         padding: 10px;
         z-index: 1;
   }
	-->
	</style>
	<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <jsp:include flush="true" page="/zone_b2b/top.jsp" />
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="980" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="DCDCDC">
		<tr>
			<td height="29" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
				&nbsp;&nbsp;<bean:message key="str2253"/> 
				<bean:message key="str2727"/>
				<bean:message key="str5047"/>/ <bean:message key="str5052"/> / 
				<bean:message key="str5053"/>
			</td>
		</tr>
	</table>
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="740" valign="top">

				<table border=0 cellpadding=0 cellspacing=0 width="100%">
					<tr>
						<td width="134" height="32" align="center" background="/zone_b2b/images/sup_03.gif" class="bthong">
							产品名称
						</td>
						<td align="right" background="/zone_b2b/images/sup_04.gif">
							<img src="/zone_b2b/images/sup_08.gif" align="absmiddle">
							&nbsp;
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="FFC367">
					<tr>
						<td height="255" valign="top" bgcolor="FFFFFF">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1">
								<tr>
									<td width="47%" align="center">
										///////////////////////////////////////在些写
									</td>
								</tr>
							</table>
							<table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				&nbsp;
			</td>
			<td width="228" valign="top">
				<jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp"/>
			</td>
		</tr>
	</table>
	<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
</body>
</html>
