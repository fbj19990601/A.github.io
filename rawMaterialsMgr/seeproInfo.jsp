<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.productMgr.*"%>
<%@ page import="com.saas.biz.newproductattrMgr.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String product_id = "", cust_id = "";
	product_id = bean.GenTradeId();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("product_id") != null) {
		product_id = request.getParameter("product_id");
	}
	NewProductAttrInfo group = new NewProductAttrInfo();
	ArrayList tableList = group.getProductById(product_id);

	ProductInfo groups = new ProductInfo();
	ArrayList list = groups.getById(cust_id, product_id);

	String product_type = comm.getSelectItems("84");
	String unit = comm.getSelectItems("91");
	HashMap maps = (HashMap) list.get(0);
	String product_name = "", product_abstract = "", product_desc = "", product_site = "", validity = "", remark = "";
	String unit1="";
	if (maps.get("product_name") != null) {
		product_name = maps.get("product_name").toString();
	}
	if (maps.get("product_type") != null) {
		product_type = maps.get("product_type").toString();
	}
	product_type = comm.getItemsBySelected("84", product_type);
	if (maps.get("product_abstract") != null) {
		product_abstract = maps.get("product_abstract").toString();
	}
	if (maps.get("product_desc") != null) {
		product_desc = maps.get("product_desc").toString();
	}
	if (maps.get("product_site") != null) {
		product_site = maps.get("product_site").toString();
	}
	if (maps.get("product_unit") != null) {
		unit1 = maps.get("product_unit").toString();
	}
	if (maps.get("validity") != null) {
		validity = maps.get("validity").toString();
	}
	if (maps.get("remark") != null) {
		remark = maps.get("remark").toString();
	}
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
		<script type="text/javascript" src="modi_productInfo.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductAttrInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/inc/prototype.js"></script>
		<script type="text/javascript" src="/inc/upLoad.js"></script>
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
				<td height="26">
				</td>
			</tr>
			<tr>
				<td>
					<form name="newproductform" action="/doTradeReg.do" method="post" target="_self">
						<table width="712" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3275"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<%=product_name%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3276"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<%=product_type%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3278"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<%=product_abstract%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3279"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<div class="ping1">
										<%=product_desc%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3280"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<%=product_site%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3273"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										
											<%=unit1%>
										
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str3282"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<%=validity%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str164"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<div class="ping1">
										<%=remark%>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="46"></td>
			</tr>
		</table>
	</body>
</html>