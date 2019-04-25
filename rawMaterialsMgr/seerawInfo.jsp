<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.rawMaterialsMgr.RawMaterialsInfo"%>
<%
	String cust_id = "", raw_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("raw_id") != null) {
		raw_id = request.getParameter("raw_id");
	}
	String unit = "",unit1="";
	
	String raw_name="",raw_num="",raw_price="",raw_site="",raw_desc="",remark="";
	String currency1="",raw_price1="";
	RawMaterialsInfo raw = new RawMaterialsInfo();
	ArrayList list = raw.getListByRaw(cust_id , raw_id);
	if (list != null && list.size() > 0) {
		HashMap map = (HashMap) list.get(0);
		if(map.get("raw_name")!=null){raw_name = map.get("raw_name").toString();}
		if(map.get("raw_num")!=null){raw_num = map.get("raw_num").toString();}
		if(map.get("raw_price")!=null){
			raw_price = map.get("raw_price").toString();
			String delims = "";
			String dd[] =raw_price.split(delims);
			currency1 = bean.getParamNameByValue("98",dd[dd.length-1]);
			for(int a=0;a<dd.length-1;a++){
				raw_price1+=dd[a];
			}
		}
		if(map.get("raw_site")!=null){raw_site = map.get("raw_site").toString();}
		if(map.get("raw_desc")!=null){raw_desc = map.get("raw_desc").toString();}
		if(map.get("remark")!=null){remark = map.get("remark").toString();}
		if(map.get("unit")!=null){unit1 = map.get("unit").toString();}
			unit=bean.getParamNameByValue("91",unit1);
	}
%>
<html>
	<head>
		<title><bean:message key="str3242"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<style type="text/css" media="screen">
.user-Img {
	background-image: url(/img/customer.png) !important;
}

.cust-Img {
	background-image: url(/img/home.png) !important;
}
</style>
	</head>
	<body>
		<table width="725" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td valign="top">
					<form name=rawForm action=/doTradeReg.do method=post target="_self">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
									<bean:message key="str3243"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left colspan="3" width="85%">
									<div class="ping1">
										<%=raw_name%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3244"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<%=raw_num%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3245"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<%=raw_price1%><%=currency1%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3246"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<%=raw_site%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3247"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<%=unit%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3248"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<%=raw_desc%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
									<bean:message key="str164"/>
								</td>
								<td align="left" bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<%=remark%>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>