<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String product_id = "", cust_id = "";
	product_id = bean.GenTradeId();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String product_type=comm.getSelectItems("84");
%>
<html>
	<head>
		<title>B2B EC-platform</title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript" src="/www/fuction/public.js"></script>
		<script src="/www/fuction/calendar.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="channal.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductAttrInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<style type="text/css">
		.Tree-Img {
			background-image: url(/img/org.png) !important;
		}
		
		.root-Img {
			background-image: url(/img/home.png) !important;
		}
		</style>
	</head>
	<body>
		<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="26" background="/img/bg-1.gif">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td background="/img/bg-2.gif">
					<form name="newproductform" action="/doTradeReg.do" method="post" target="_self">
						<table width="90%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str1276"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<input type=text name="product_name" id="product_name">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2429"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td width="100%" align="left" bgcolor="#FFFFFF" colspan="2">
									<div class="ping1">
										<div id="loading" style="display: none">
											<img src="/img/wait.gif" border="0">
											<bean:message key="str443"/>
										</div>
										<div id="product-div"></div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str944"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<select name="product_type" id="product_type">
										<option value="">
											<bean:message key="str1048"/>
										</option>
											<%=product_type%>
									</select> 
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2230"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<textarea name="product_abstract" id="product_abstract" cols="50" rows="6"></textarea>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2432"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<textarea name="product_desc" id="product_desc" cols="50" rows="6"></textarea>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2433"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="product_site" id="product_site">
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2434"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="product_unit" id="product_unit">
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2435"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="validity" id="validity" onfocus="setday(this);">
									(yyyy-mm-dd)
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2810"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="remark" id="remark">
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px; padding-top: 10px; padding-bottom: 10px;" align=center colspan=2>
									<input class="tjan" name=submit1 type=submit value="" onclick="return Check_Value()">
								</td>
							</tr>
							<input type=hidden name="trade_type_code" value="1226" />
							<input type=hidden name="cust_id" id="cust_id" value="<%=cust_id%>">
							<input type=hidden name="product_id" id="product_id" value="<%=product_id%>" />
							<input type=hidden name="product_class" id="product_class" value="" />
							<input type=hidden name="publish_user_id" id="publish_user_id" value="<%=cust_id%>" />
							<input type=hidden name="publish_date" id="publish_date" value="" />
							<input type=hidden name="audit_date" id="audit_date" value="" />
							<input type=hidden name="rsrv_str1" id="rsrv_str1" value="" />
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="46" background="/img/bg-3.gif"></td>
			</tr>
		</table>
	</body>
</html>