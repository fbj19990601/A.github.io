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
	String product_type = comm.getSelectItems("84");
%>
<html>
	<head>
		<title><bean:message key="str784"/></title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="modi_productInfo.js"></script>
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
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td>
					<form name="newproductform" action="/doTradeReg.do" method="post" target="_self">
						<table width="718" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str943"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td width="718" align="left" bgcolor="#FFFFFF" colspan="2">
									<div class="ping1">
										<div id="loading" style="display: none">
											<img src="/img/wait.gif" border="0">
											<bean:message key="str1003"/>
										</div>
										<div id="product-div"></div>
									</div>
								</td>
							</tr>
							<input type=hidden name="trade_type_code" value="1226" />
							<input type=hidden name="cust_id" id="cust_id" value="<%=cust_id%>">
							<input type=hidden name="product_id" id="product_id" value="<%=product_id%>" />
							<input type=hidden name="product_type" id="product_type" value="" />
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
				<td height="46">
				</td>
			</tr>
		</table>
	</body>
</html>
