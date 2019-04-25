<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.ahbay.commenMgr.*"%>
<%@ page import="java.util.*"%>
 
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
			</style>
	</head>
	<%
		String module_id = "";
	%>
	<body>
		<form action="/doTradeReg.do" method="post">
			<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">
				<tr>
					<td class="line1" align="left" colspan="6">
						<bean:message key="str2750"/>
					</td>
				</tr>
				<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align="right" width="18%">
					<bean:message key="str2751"/>
				</td>
				<td width="82%" align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
					<div class="ping">
						<input name="module_id" type="text" value="">
					</div>
				</td>
				</tr>
				<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align="right" width="18%">
					<bean:message key="str2752"/>
				</td>
				<td width="82%" align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
					<div class="ping">
						<input type="text" name="module_name" value="" size="30" />
					</div>
				</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" width="18%">
						<bean:message key="str2753"/>
					</td>
					<td style="background-color:#ffffff; color:#000000; font-size:12px;" align="left">
						<div class="ping">
							<input type="text" name="module_file" value="" size="30" />
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" width="18%">
						<bean:message key="str2754"/>
					</td>
					<td style="background-color:#ffffff; color:#000000; font-size:12px;" align="left">
						<div class="ping">
							<input type="text" name="module_dir" value="" size="30" />
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" width="18%">
						<bean:message key="str2755"/>
					</td>
					<td style="background-color:#ffffff; color:#000000; font-size:12px;" align="left">
						<div class="ping1">
							<input type="text" name="module_type" value="" size="30" />
						</div>
					</td>
				</tr>
				 
				 <input name="trade_type_code" type="hidden" value="2457">
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
						<input class="tjan" type="submit" name="Submit1" value="提交">
					</td>
				</tr>
			</table>
		</form>
	<body>
</html>