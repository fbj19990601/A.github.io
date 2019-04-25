<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String cust_id = "", raw_id = "", product_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("product_id") != null) {
		product_id = request.getParameter("product_id");
	}
	raw_id = comm.GenTradeId();
	String unit = bean.getSelectItems("91");
	String currency = bean.getSelectItems("98");
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
		<script type="text/javascript">
	   //空值判断
	    function check_Value(){
	    	if(document.getElementById("raw_name").value=="" ||document.getElementById("raw_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写原材料名称！");
		     return false;
		   }
		   
		   if(document.getElementById("raw_num").value=="" ||document.getElementById("raw_num").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写原材料用量！");
		     return false;
		   }
	      
	      if(document.getElementById("raw_price").value=="" ||document.getElementById("raw_price").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写原材料单价！");
		     return false;
		   }
		   document.getElementById("raw_price").value+=document.getElementById("currency").value;
		   return true;
	    }
		</script>
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
									<div class="ping">
										<input name="raw_name" type="text" id="raw_name" size=30 maxlength=30>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3244"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping">
										<input name="raw_num" type="text" id="raw_num" size=10 maxlength=10 onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3245"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping">
										<input name="raw_price" type="text" id="raw_price" size="10" maxlength="10" onkeyup="if(isNaN(value))execCommand('undo')">
										<select name="currency" id="currency">
											<%=currency %>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3246"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<input name="raw_site" type="text" id="raw_site" size="30" maxlength="30">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3247"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<select id="unit" name="unit">
											<%=unit%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
									<bean:message key="str3248"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
									<div class="ping1">
										<textarea id="raw_desc" name="raw_desc" rows="6" cols="50"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
									<bean:message key="str164"/>
								</td>
								<td align="left" bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
									<input name="comit" type="submit" value="" onclick="return check_Value()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand; text-align: center;">
								</td>
							</tr>
							<tr>
								<td>
									<input name="trade_type_code" id="trade_type_code" type="hidden" value="1271">
									<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
									<input name="publish_date" id="publish_date" type="hidden" value="">
									<input name="user_id" id="user_id" type="hidden" value="">
									<input name="raw_id" id="raw_id" type="hidden" value="<%=raw_id%>">
									<input name="product_id" id="product_id" type="hidden" value="<%=product_id%>">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>