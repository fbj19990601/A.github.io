<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custrightsMgr.RightManage"%>
<%
	String cust_class = "", right_code = "", limit_type = "";
	if (request.getParameter("cust_class") != null) {
		cust_class = request.getParameter("cust_class");
	}
	if (request.getParameter("right_code") != null) {
		right_code = request.getParameter("right_code");
	}
	if (request.getParameter("limit_type") != null) {
		limit_type = request.getParameter("limit_type");
	}
	
	String limit_value = "", enable_tag1 = "", remark = "";
	String cust_classs="",right_codes="",limit_types="";
	
	RightManage right = new RightManage();
	ArrayList ageList = right.genAllrightsByClass(cust_class, right_code, limit_type);
	if (ageList != null && ageList.size() > 0) {
		HashMap map = (HashMap) ageList.get(0);
		if (map.get("cust_class") != null) {
			cust_classs = map.get("cust_class").toString();
		}
		if (map.get("right_code") != null) {
			right_codes = map.get("right_code").toString();
		}
		if (map.get("limit_type") != null) {
			limit_types = map.get("limit_type").toString();
		}
		if (map.get("limit_value") != null) {
			limit_value = map.get("limit_value").toString();
		}

		if (map.get("remark") != null) {
			remark = map.get("remark").toString();
		}
		if (map.get("enable_tag") != null) {
			enable_tag1 = map.get("enable_tag").toString();
		}
		if (enable_tag1 == "0" || enable_tag1.equals("0")) {
			enable_tag1 = "有效";
		} else if (enable_tag1 == "1" || enable_tag1.equals("1")) {
			enable_tag1 = "无效";
		}
		if (cust_classs == "1" || cust_classs.equals("1")) {
			cust_classs = "普通客户(未验证)";
		} else if (cust_classs == "2" || cust_classs.equals("2")) {
			cust_classs = "普通客户";
		} else if (cust_classs == "3" || cust_classs.equals("3")) {
			cust_classs = "铜牌客户";
		} else if (cust_classs == "4" || cust_classs.equals("4")) {
			cust_classs = "银牌客户";
		} else if (cust_classs == "5" || cust_classs.equals("5")) {
			cust_classs = "金牌客户";
		} else if (cust_classs == "6" || cust_classs.equals("6")) {
			cust_classs = "VIP客户";
		}

		if (right_codes == "SYS" || right_codes.equals("SYS")) {
			right_codes = "框架";
		} else if (right_codes == "B2B" || right_codes.equals("B2B")) {
			right_codes = "电子商务";
		} else if (right_codes == "COM" || right_codes.equals("COM")) {
			right_codes = "社区管理";
		} else if (right_codes == "OA" || right_codes.equals("OA")) {
			right_codes = "行政";
		} else if (right_codes == "HRM" || right_codes.equals("HRM")) {
			right_codes = "人力资源";
		} else if (right_codes == "CRM" || right_codes.equals("CRM")) {
			right_codes = "客户";
		} else if (right_codes == "CTR" || right_codes.equals("CTR")) {
			right_codes = "控制面板";
		} else if (right_codes == "INFO" || right_codes.equals("INFO")) {
			right_codes = "情报";
		} else if (right_codes == "HELP" || right_codes.equals("HELP")) {
			right_codes = "助理";
		} else if (right_codes == "MRP" || right_codes.equals("MRP")) {
			right_codes = "库存";
		} else if (right_codes == "SALE" || right_codes.equals("SALE")) {
			right_codes = "销售";
		} else if (right_codes == "BUY" || right_codes.equals("BUY")) {
			right_codes = "采购";
		} else if (right_codes == "PROJ" || right_codes.equals("PROJ")) {
			right_codes = "计划";
		} else if (right_codes == "FORM" || right_codes.equals("FORM")) {
			right_codes = "订单";
		} else if (right_codes == "PROD" || right_codes.equals("PROD")) {
			right_codes = "产品";
		} else if (right_codes == "TRANSPOR"
		|| right_codes.equals("TRANSPOR")) {
			right_codes = "运输";
		} else if (right_codes == "CONTRACT"
		|| right_codes.equals("CONTRACT")) {
			right_codes = "合同";
		}

		if (limit_types == "1" || limit_types.equals("1")) {
			limit_types = "资讯信息";
		} else if (limit_types == "2" || limit_types.equals("2")) {
			limit_types = "广告信息";
		} else if (limit_types == "3" || limit_types.equals("3")) {
			limit_types = "销售信息";
		} else if (limit_types == "4" || limit_types.equals("4")) {
			limit_types = "采购信息";
		} else if (limit_types == "5" || limit_types.equals("5")) {
			limit_types = "合作信息";
		} else if (limit_types == "6" || limit_types.equals("6")) {
			limit_types = "招聘信息";
		}
	}
%>
<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript">
		 function check_Value(){
		 	
			if (document.resumeForm.limit_value.value.replace(/\s*/g,"") == ""||document.resumeForm.limit_value.value.replace(/\s*/g,"") == null)
			{
				alert("限定值不可以为空！");
				document.resumeForm.limit_value.focus(); 
				return false;
			}
			return true;
		  }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
				<tr>
					<!-- 中间 -->
					<td align="center" height="27px">
						<div id="manager_body">
							<div id="manager_body_right">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="13"></td>
									</tr>
									<tr>
										<td valign="top">
											<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
														<bean:message key="str366"/>
													</td>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
														<div class="ping">
															<%=cust_classs%>
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
														<bean:message key="str367"/>
													</td>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
														<div class="ping">
															<%=right_codes%>
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
														<bean:message key="str368"/>
													</td>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
														<div class="ping">
															<%=limit_types%>
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
														<bean:message key="str369"/>
													</td>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
														<div class="ping">
															<input type="text" name="limit_value" id="limit_value" value="<%=limit_value%>" maxlength="10" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
														<bean:message key="str1307"/>
													</td>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
														<div class="ping1">
															<%=enable_tag1%>
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
														<bean:message key="str1569"/>
													</td>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
														<div class="ping1">
															<input type="text" name="remark" id="remark" maxlength="50" size="52" value="<%=remark%>">
														</div>
													</td>
												</tr>
												<tr>
													<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan="2">
														<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
													</td>
												</tr>
												<tr>
													<td>
														<input type="hidden" name="update_staff_id" id="update_staff_id" value="">
														<input type="hidden" name="cust_class" id="cust_class" value="<%=cust_class%>">
														<input type="hidden" name="right_code" id="right_code" value="<%=right_code%>">
														<input type="hidden" name="limit_type" id="limit_type" value="<%=limit_type%>">
														<input type="hidden" name="enable_tag" id="enable_tag" value="0">
														<input type="hidden" name="update_depart_id" id="update_depart_id" value="">
														<input type="hidden" name="update_time" id="update_time" value="">
														<input type="hidden" name="trade_type_code" value="1203">
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>