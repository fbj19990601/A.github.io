<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="house" class="com.saas.biz.wareHouseMgr.wareHouseInfo" scope="page" />
<jsp:useBean id="warnType" class="com.saas.biz.warntypeMgr.WarnTypeInfo" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String param_id=comm.GenTradeId();
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String store_name=house.getSelectHouse(cust_id);
	String mod_id="",mod_type="",modtype="";
	if(request.getParameter("mod_id")!=null){
	  mod_id=request.getParameter("mod_id");
	}
	if(request.getParameter("mod_type")!=null){
	  mod_type=request.getParameter("mod_type");
	  modtype=bean.getParamNameByValue("87",mod_type);
	}
	HashMap typeMap=warnType.getWarnTypeById(mod_id);
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	cal.add(Calendar.MONTH, 3);
	String end = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	if(typeMap.get("start_date")!=null){
	  start=typeMap.get("start_date").toString();
	}
	if(typeMap.get("end_date")!=null){
	  end=typeMap.get("end_date").toString();
	}
%>
<html>
	<head>
		<title><bean:message key = "str4151"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WareHousePosInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="warn.js"></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script type="text/javascript">
		  function _check_value(){
		   var param_name=$F("param_name");
		   if(param_name=="" || param_name==null){
		     alert("请填写预警参数名称!");
		     $("param_name").focus();
		     return false;
		   }
		   var param_type=$F("param_type");
		   if(param_type=="" || param_type==null){
		     alert("请选择预警参数类型!");
		     return false;
		   }
		     if(param_type=="0"){
			       if($("type_0").value=="" || $("type_0").value==null){
			       		alert("请填写数量！");
			       		return false;
			       }
			   }
			    if(param_type=="1"){
			      if($("type_1").value=="" || $("type_1").value==null){
			       		alert("请选择时间！");
			       		return false;
			       }
			   }
			    if(param_type=="2"){
			    if($("store_name").value=="" || $("store_name").value==null){
			       		alert("请选择仓库！");
			       		return false;
			       }
			   }
              if(param_type=="3"){
			    if($("type_3").value=="" || $("type_3").value==null){
			       		alert("请选择物料种类！");
			       		return false;
			       }
			   }
		  
		   if($("param_door").value=="" ||$("param_door").value==null){
		     alert("请填写告警值!");
		     return false;
		   }
		    if($("sum_type").value=="" ||$("sum_type").value==null){
		     alert("请选择运算方式!");
		     return false;
		   }
		    if($("start_date").value=="" ){
		     alert("请填写开始时间!");
		     return false;
		   }
		    if($("end_date").value=="" ){
		     alert("请填写结束时间!");
		     return false;
		   }
		   
           if(!checkDate($("start_date").value,$("end_date").value)){
		     return false;
		   }
		   return true;
		  }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<jsp:include page="/inc/top.jsp" />
				<tr>
					<td align="center">
						<div id="manager_body">
							<div id="manager_body_left">
								<jsp:include page="/inc/left.jsp" />
							</div>
							<div id="manager_body_right">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="2"></td>
												</tr>
												<tr>
													<td valign="top">
														<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4152"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	 <input type="text" name="param_name" id="param_name" maxlength="100" size="25">
																	 <input type="hidden" name="param_id" id="param_id" value="<%=param_id%>">
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4153"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	 <%=modtype%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4154"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	<select name="param_type" id="param_type" onclick="createHtml(this.value)">
																	 <option value=""><bean:message key = "str2655"/></option>
																	 <option value="0"><bean:message key="str2009"/></option>
																	 <option value="1"><bean:message key = "str1285"/></option>
																	 <option value="2"><bean:message key="str4157"/></option>
																	 <option value="3"><bean:message key="str4158"/></option>
																	</select>
																	</div>
																</td>
															</tr>
															<tr id="typeA" style="display:none">
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4159"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	    <input type="text" name="type_0" id="type_0" maxlength="20" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
																	</div>
																</td>
															</tr>
															<tr id="typeB" style="display:none">
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4156"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	    <input type="text" name="type_1" id="type_1" maxlength="100" size="10" value="<%=start%>" onfocus="setday(this);">
																	</div>
																</td>
															</tr>
															<tr id="typeC" style="display:none">
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4161"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	    <select name="store_name" id="store_name" size="5" onclick="setPosition(this.value)" style="float:left;display:inline;">
																		 <%=store_name%>
																		</select>
																		<select name="posit_name" id="posit_name" size="5" style="float:left;display:inline;" onclick="setParamValue(this.value)"></select>
																</td>
															</tr>
															<tr id="typeD" style="display:none">
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4158"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	    <input type="text" name="type_3" id="type_3" maxlength="100" size="20" readonly><input type=button id=goods name=goods onclick="javascript: window.open ('goods.jsp')" value=请选择>
																	</div>
																</td>
															</tr>
															<div id="store-div"></div>
															<div id="goods-div"></div>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4162"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping" style="display:inline;float:left">
																	<select name="rsrv_str1" id="rsrv_str1">
																	 <option value="0"><bean:message key="str4163"/></option>
																	 <option value="1"><bean:message key = "str4164"/></option>
																	</select>
																	  <input type="text" name="param_door" id="param_door" maxlength="100" size="5" onkeyup="if(isNaN(value))execCommand('undo')">
																	 <bean:message key="str5126"/>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4204"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	<select name="sum_type" id="sum_type">
																	  <option value="0"><bean:message key="str4166"/></option>
																	  <option value="1"><bean:message key="str4167"/></option>
																	</select><bean:message key="str4634"/>
																	
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str3820"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping">
																		<input name="start_date" type="text" id="start_date" size=10 maxlength=15 value="<%=start%>" onfocus="setday(this);">
																		<span style="color:red">(yyyy-MM-dd)</span>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str3821"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping">
																		<input name="end_date" type="text" id="end_date" size=10 maxlength=15 value="<%=end%>" onfocus="setday(this);">
																		<span style="color:red">(yyyy-MM-dd)</span>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str2835"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<input name="remark" id="remark" size="52" maxlength="50" value="">
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
																	<input class="tjan" name="submit" type="submit" value="" onclick="return _check_value()">
																</td>
															</tr>
														</table>
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
				<tr>
					<td>
						<input type="hidden" name="param_value" id="param_value"> 
						<input type="hidden" name="rsrv_str2" > 
						<input type="hidden" name="rsrv_str3" > 
						<input type="hidden" name="rsrv_str4" > 
						<input type="hidden" name="rsrv_str5" > 
						<input type="hidden" name="rsrv_str6" > 
						<input type="hidden" name="rsrv_str7" > 
						<input type="hidden" name="rsrv_str8" > 
						<input type="hidden" name="rsrv_str9" > 
						<input type="hidden" name="rsrv_str10"> 
						<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id%>">
						<input type="hidden" name="mod_type" id="mod_type" value="<%=mod_type%>">
						<input type="hidden" name="obj_param_id" id="obj_param_id" value="">
						<input type="hidden" name="publish_date" id="publish_date" value="<%=start%>">
						<input type="hidden" name="mod_id" id="mod_id" value="<%=mod_id%>">
						<input type="hidden" name="trade_type_code" id="trade_type_code" value="1175">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>