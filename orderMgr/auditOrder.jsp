<jsp:directive.page import="java.text.SimpleDateFormat" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.formStateMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="saleBean" class="com.saas.biz.saleOrderMgr.SaleOrderInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String quo_id = "", form_id = "", cust_id = "", quo_name = "", remark2 = "", trade_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}

	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	if (request.getParameter("quo_id") != null) {
		quo_id = request.getParameter("quo_id");
	}
	ArrayList orderList = saleBean.getOrderInfoById(cust_id, form_id, quo_id);
	HashMap orderMap = saleBean.getOrderById(cust_id, form_id, quo_id);
	if (orderMap.get("quo_name") != null) {
		quo_name = orderMap.get("quo_name").toString();
	}
	if (orderMap.get("remark2") != null) {
		remark2 = orderMap.get("remark2").toString();
	}
	trade_id = comm.GenTradeId();
	String audit_state = bean.getItemsBySelected("72", "2");
	String audit_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String end_date = audit_date;
	if (orderMap.get("end_date") != null) {
		String end_time = orderMap.get("end_date").toString();
		if (end_time.length() > 10) {
			end_time = end_time.substring(0, 10);
			end_date = end_time;
		}
	}
%>
<html>
	<head>
		<title><bean:message key="str2809"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
form {
	padding: 0px;
	margin: 0px;
}

.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid;
	background-color: #fff8ee;
	text-align: left;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #000000;
	margin-top: 13px;
	margin-bottom: 13px;
}  /*横栏样式6---- 头部提醒1*/
.line6 .img {
	width: 53px;
	height: 53px;
	float: left;
	margin-right: 20px;
}

.line6 .title {
	font-size: 14px;
	font-weight: bold;
	color: #ff5400;
}

.line1 {
	border-left: #ff7300 3px solid;
	background-color: #e2e2e2;
	color: #333333;
	text-align: left;
	font-size: 12px;
}  /*横栏样式1*/
.bnt {
	background-image: url('/images/zjtm.gif');
	width: 100px;
	height: 26px;
	border: 0;
	cursor: hand;
	margin-left: 5px;
	display: none;
}
</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript">
		  function check_Value(){
		   var state=$F("audit_state");
		   if(state>1){
		     $("state_code").value=state;
		   }else{
		     Ext.MessageBox.alert("XSaaS 提示","请选择审核状态！");
		     return false;
		   }
		   if($F("audit_msg")==null ||$F("audit_msg")=="" ){
		     Ext.MessageBox.alert("XSaaS 提示","请填写审核意见！");
		     return false;
		   }
		   return true;
		  }
		</script>
	</head>
	<body>
		<table width="700" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px" bgcolor="#dddddd" align="center">
			<tr>
				<td height="2"></td>
			</tr>
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#FFFFFF">
						<tr height="25px">
							<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: center" align=center>
								<%=quo_name%>
							</td>
						</tr>
						<tr>
							<td align=left bgcolor="#FFFFFF">
								<%
										if (orderList != null && orderList.size() > 0) {
										for (int i = 0; i < orderList.size(); i++) {
											FormAreaEnity areaEnity = (FormAreaEnity) orderList.get(i);
											String area_nam = areaEnity.getArea_name();
											ArrayList fieldList = areaEnity.getField();
								%>
								<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#dddddd">
									<tr>
										<td bgcolor="#FFFFFF" style="margin-left: 5px; font-weight: bold;" colspan="3">
											<div class="ping1">
												<%=area_nam%>
											</div>
										</td>
									</tr>
									<%
											if (fieldList != null && fieldList.size() > 0) {
											for (int j = 0; j < fieldList.size(); j++) {
												FormFieldEntity fieldEnity = (FormFieldEntity) fieldList
												.get(j);
												String field_name = "", field_type = "", field_id = "", field_value = "";
												field_name = fieldEnity.getField_name();
												field_id = fieldEnity.getField_id();
												field_type = fieldEnity.getField_type();
												field_value = fieldEnity.getFiled_value();
												if (field_type == "1" || field_type.equals("1")) {
													ArrayList itemList = fieldEnity.getList();
													if (itemList != null && itemList.size() > 0) {
												for (int k = 0; k < itemList.size(); k++) {
													HashMap map = (HashMap) itemList.get(k);
													if (map.get("field_value") != null) {
														field_value = map.get("field_value").toString();
													}
												}
													}
												} else if (field_type == "2"
												|| field_type.equals("2")) {
													ArrayList itemList = fieldEnity.getList();
													if (itemList != null && itemList.size() > 0) {
												field_value = "";
												for (int k = 0; k < itemList.size(); k++) {
													HashMap map = (HashMap) itemList.get(k);
													String tempValue = "";
													if (map.get("field_value") != null) {
														tempValue = map.get("field_value").toString();
													}
													field_value = field_value
													+ "<div style=color:red;margin-left:5px;display:inline;><"
													+ (k + 1) + "></div>"
													+ tempValue + "<br>";
												}
													} else {
												field_value = "";
													}
												} else if (field_type == "0"
												|| field_type.equals("0")) {

													ArrayList itemList = fieldEnity.getList();
													if (itemList != null && itemList.size() > 0) {
												HashMap map = (HashMap) itemList.get(0);
												if (map.get("item_name") != null) {
													field_value = map.get("item_name")
													.toString();
												}
													}
												}
									%>
									<tr>
										<td style="background-color: #f6f6f6; color: #000000; font-size: 12px; margin-left: 15px; text-align: right" width="20%">
											<div style="text-align: right; margin-right: 2px;">
												<%=field_name%>:
											</div>
										</td>
										<td style="background-color: #FFFFFF; color: #000000; font-size: 12px; margin-left: 15px" colspan="2" width="80%">
											<div style="margin-left: 2px;">
												<%=field_value%>
											</div>
										</td>
									</tr>
									<%
												}
												}
									%>
								</table>
								<%
									}
									}
								%>
							</td>
						</tr>
						<tr height="25px">
							<td style="background-color: #f6f6f6; color: #000000; text-align: left;" width=100%>
								<bean:message key="str2810"/>
								<div style="margin-left: 10px; display: inline;"><%=remark2%></div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=700 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
						<bean:message key="str2811"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
						<div class="ping">
							<select name="audit_state" id="audit_state">
								<%=audit_state%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
						<bean:message key="str2812"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
						<div class="ping">
							<textarea name="audit_msg" id="audit_msg" cols="50" rows="6"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
						<bean:message key="str2810"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
						<div class="ping1">
							<input type="text" name="remark2" id="remark2" size="52">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
						<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
					</td>
				</tr>
				<tr><td>
				<input type="hidden" name="trade_id" id="trade_id" value="<%=trade_id%>" />
				<input type="hidden" name="obj_id" id="obj_id" value="<%=quo_id%>" />
				<input type="hidden" name="sale_quo_id" id="sale_quo_id" value="<%=quo_id%>" />
				<input type="hidden" name="audit_date" id="audit_date" value="<%=audit_date%>" />
				<input type="hidden" name="state_resean" id="state_resean" value="审核" />
				<input type="hidden" name="trade_type_code" id="trade_type_code" value="1166">
				<input type="hidden" name="state_code" id="state_code" value="">
				<input type="hidden" name="end_date" id="end_date" value="<%=end_date%>" />
				</td></tr>
			</table>
		</form>
	</body>
</html>
