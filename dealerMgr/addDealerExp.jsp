<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custPublicMgr.CustPublicInfo"%>
<%@ page import="com.saas.biz.dealerMgr.DealerInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%
	String cust_id = "", obj_cust_id = "", menu_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	if (request.getParameter("obj_cust_id") != null) {
		obj_cust_id = request.getParameter("obj_cust_id");
	}

	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());

	CustPublicInfo custPublic = new CustPublicInfo();
	ArrayList custList = custPublic.getServalCustPublic(cust_id,obj_cust_id);

	DealerInfo dealerInfo = new DealerInfo();
	HashMap dealerMap = dealerInfo.getOneDealer(cust_id, obj_cust_id);
	String company_address = "", field_status = "请选择..", branch_store_number = "", service_condition = "请选择..", m_sales_volume = "";
	String y_sales_volume = "", act_brand = "", inventory_mgr = "请选择..", back_condition = "请选择..", financial_mgr = "请选择..";
	String staff_population = "", cooperate = "请选择..", transport_capacity = "";

	if (dealerMap.get("company_address") != null) {
		company_address = dealerMap.get("company_address").toString();
	}
	if (dealerMap.get("field_status") != null) {
		field_status = dealerMap.get("field_status").toString();
	}
	if (dealerMap.get("branch_store_number") != null) {
		branch_store_number = dealerMap.get("branch_store_number")
		.toString();
	}
	if (dealerMap.get("service_condition") != null) {
		service_condition = dealerMap.get("service_condition")
		.toString();
	}
	if (dealerMap.get("m_sales_volume") != null) {
		m_sales_volume = dealerMap.get("m_sales_volume").toString();
	}
	if (dealerMap.get("y_sales_volume") != null) {
		y_sales_volume = dealerMap.get("y_sales_volume").toString();
	}
	if (dealerMap.get("act_brand") != null) {
		act_brand = dealerMap.get("act_brand").toString();
	}
	if (dealerMap.get("inventory_mgr") != null) {
		inventory_mgr = dealerMap.get("inventory_mgr").toString();
	}
	if (dealerMap.get("back_condition") != null) {
		back_condition = dealerMap.get("back_condition").toString();
	}
	if (dealerMap.get("financial_mgr") != null) {
		financial_mgr = dealerMap.get("financial_mgr").toString();
	}
	if (dealerMap.get("staff_population") != null) {
		staff_population = dealerMap.get("staff_population").toString();
	}
	if (dealerMap.get("cooperate") != null) {
		cooperate = dealerMap.get("cooperate").toString();
	}
	if (dealerMap.get("transport_capacity") != null) {
		transport_capacity = dealerMap.get("transport_capacity").toString();
	}
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
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
.user-Img {
	background-image: url(/img/customer.png) !important;
}

.cust-Img {
	background-image: url(/img/home.png) !important;
}
</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script language="JavaScript">
		function confirmsub(){
			var param_name1 = document.getElementsByName('param_name1');
			var param_id1 = document.getElementsByName('param_id1');
			var param_value1 = document.getElementsByName('param_value1');
			 for(var i = 0 ;i<param_name1.length;i++){
				document.getElementById('param_name').value +=param_name1[i].value+'|';
  			 }
			 for(var j = 0 ;j<param_id1.length;j++){
      			document.getElementById('param_id').value +=param_id1[j].value+'|';
  			 }
  			 for(var k = 0 ;k<param_value1.length;k++){
      			document.getElementById('param_value').value +=param_value1[k].value+'|';
  			 }

			return true;
		}
		
		 
		function showParam(){
			 var index = Math.random(); 
			 document.getElementById("div1").innerHTML+="<input type=\"hidden\" name=\"param_id1\" id=\"param_id1\" value="+index+"><input type=\"text\"  name=\"param_name1\" id=\"param_name1\" value=\"\">:<input type=\"text\"  name=\"param_value1\" id=\"param_value1\" value=\"\"><br>";   
			
			 
		}
		
        </script>
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
	            WinLIKE.definewindows=mydefss;
	            function mydefss() {
	            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
	            	j.Vis=false;
	            	j.Nam='appwin';
	            	WinLIKE.addwindow(j);
	            };
	    </SCRIPT>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="13"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1107"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input type="text" value="<%=company_address%>" name="company_address" id="company_address" size="25" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1108"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<b><bean:message key="str1109"/></b>
										<select name="field_status">
											<option value="<%=field_status%>"><%=field_status%></option>
											<option value="优">
												<bean:message key="str1110"/>
											</option>
											<option value="良">
												<bean:message key="str1111"/>
											</option>
											<option value="普通">
												<bean:message key="str1112"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1113"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input type="text" value="<%=branch_store_number%>" name="branch_store_number" id="branch_store_number" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1114"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="service_condition">
											<option value="<%=service_condition%>"><%=service_condition%></option>
											<option value="优">
												<bean:message key="str1110"/>
											</option>
											<option value="一般">
												<bean:message key="str1115"/>
											</option>
											<option value="差">
												<bean:message key="str1116"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align="right">
									<bean:message key="str1117"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<bean:message key="str1118"/>
										<input type="text" value="<%=m_sales_volume%>" name="m_sales_volume" id="m_sales_volume" size="25" maxlength="100">
										<br>
										<bean:message key="str1119"/>
										<input type="text" value="<%=y_sales_volume%>" name="y_sales_volume" id="y_sales_volume" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1120"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="act_brand" value="<%=act_brand%>" id="act_brand" size="25" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1121"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="inventory_mgr">
											<option value="<%=inventory_mgr%>"><%=inventory_mgr%></option>
											<option value="佳">
												<bean:message key="str1122"/>
											</option>
											<option value="一般">
												<bean:message key="str1125"/>
											</option>
											<option value="差">
												<bean:message key="str1116"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1123"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="back_condition">
											<option value="<%=back_condition%>"><%=back_condition%></option>
											<option value="无">
												<bean:message key="str1124"/>
											</option>
											<option value="一般">
												<bean:message key="str1125"/>
											</option>
											<option value="频繁">
												<bean:message key="str1126"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1127"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="financial_mgr">
											<option value="<%=financial_mgr%>"><%=financial_mgr%></option>
											<option value="佳">
												<bean:message key="str1122"/>
											</option>
											<option value="一般">
												<bean:message key="str1125"/>
											</option>
											<option value="差">
												<bean:message key="str1116"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1128"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="cooperate">
											<option value="<%=cooperate%>"><%=cooperate%></option>
											<option value="良好">
												<bean:message key="str1129"/>
											</option>
											<option value="普通">
												<bean:message key="str1112"/>
											</option>
											<option value="差">
												<bean:message key="str1116"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1130"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
									<bean:message key="str1131"/>
										<input name="transport_capacity" value="<%=transport_capacity%>" id="transport_capacity" size="5" maxlength="50">
										<bean:message key="str1132"/>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str1133"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="staff_population" value="<%=staff_population%>" id="staff_population" size="25" maxlength="50">
									</div>
								</td>
							</tr>
							<%
								String param_id = "", param_no = "", param_name = "", param_value = "";
								HashMap custMap = new HashMap();
								if (custList != null && custList.size() > 0) {
									for (int a = 0; a < custList.size(); a++) {
										custMap = (HashMap) custList.get(a);
										if (custMap.get("param_id") != null) {
									param_id = custMap.get("param_id").toString();
										}
										if (custMap.get("param_no") != null) {
									param_no = custMap.get("param_no").toString();
										}
										if (custMap.get("param_name") != null) {
									param_name = custMap.get("param_name").toString();
										}
										if (custMap.get("param_value") != null) {
									param_value = custMap.get("param_value").toString();
										}
							%>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<input type="text" name="param_namea" id="param_namea" value="<%=param_name%>">
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input type="text" name="param_valuea" id="param_valuea" value="<%=param_value%>">
										&nbsp;&nbsp;&nbsp;
										<a href="/doTradeReg.do?trade_type_code=8548&param_id=<%=param_id%>" target="_self"><bean:message key="str1134"/></a>
									</div>
								</td>
							</tr>
							<%
								}
								}
							%>
							<tr>
								<td align="center" bgcolor="#FFFFFF" colspan="2">
									<div id="div1">
										&nbsp;
									</div>
								</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" colspan="2" align="center">
									<bean:message key="str1135"/>
									<input name="button" type="button" value="" onclick="showParam()" style="background-image: url('/images/add.gif'); width: 16px; height: 16px; border: 0; cursor: hand">
								</td>
							</tr>
							<tr><td>
							<input name="trade_type_code" type="hidden" value="8547">
							<input name="param_name" type="hidden" id="param_name" value="<%=param_name%>">
							<input name="param_value" type="hidden" id="param_value" value="<%=param_value%>">
							<input name="param_id" type="hidden" id="param_id" value="<%=param_id%>">
							<input name="in_date" type="hidden" value="<%=start_Date%>">
							<input name="remark" id="remark" type="hidden" value="">
							<input name="obj_cust_id" id="obj_cust_id" type="hidden" value="<%=obj_cust_id%>">
							</td></tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px;" align="center" colspan=4>
									<input name="comit" type="submit" value="" onclick="return confirmsub();" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>