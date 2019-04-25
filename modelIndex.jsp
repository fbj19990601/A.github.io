<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.ahbay.commenMgr.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<title>电子商务平台<bean:message key="str116"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
			</style>
	</head>
	<%
		
	%>
	<body>
		<html:form action="">
			<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">

				<tr>

					<td class="line1" align="left" colspan="6">
						<bean:message key="str2750"/>

					</td>

				</tr>

				<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align="right" width="18%">
					<bean:message key="str2752"/>
				</td>

				<td width="82%" align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">

					<div class="ping1">
						<input type="text" name="menu_name" value="" size="30" />
					</div>
				</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" width="18%">
						<bean:message key="str2753"/>
					</td>
					<td style="background-color:#ffffff; color:#000000; font-size:12px;" align="left">
						<div class="ping1">
							<html:text property="in_param_value1" maxlength="30" size="30" />
							<html:errors property="in_param_value1" />
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" width="18%">
						<bean:message key="str2754"/>
					</td>
					<td style="background-color:#ffffff; color:#000000; font-size:12px;" align="left">
						<div class="ping1">
							<html:text property="in_param_code2" maxlength="30" size="30" />
							<html:errors property="in_param_code2" />
						</div>
					</td>
				</tr>
				
			</table>
		</html:form>
	<body>
</html>