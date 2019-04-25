<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<HTML>
	<head>
		<title><bean:message key="str0987"/></title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form name=form1 action=/doTradeReg.do method=post>
			<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<input type="text" name="trade_type_code" value="1028">
					<input type="text" name="result_code" value="20">
					<input type="text" name="contract_no" value="20586a02T6743iF">
					<input type="text" name="account_money" value="100">
					<input type="text" name="account_name" value="ÁõÑô">
				</tr>
			</table>
			<input type="submit" value="sub" name="sub">
		</form>
	</BODY>
</HTML>
