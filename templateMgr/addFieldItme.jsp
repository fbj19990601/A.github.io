<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%@ page import="java.util.*"%>
<html>
	<head>
		<title><bean:message key="str4005"/></title>

		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="/js/prototype.js"></script>
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		h1{float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
		#td
		{
		width:100px;
		text-align:right;
		margin-left:5px;
		height:30px;
		line-height:30px;
		}
		</style>
		<script type="text/javascript">
		  function closeWind()
		  {
		     window.opener=null;
		     window.close();
		  }
		  function confirmsub()
		  {
		    if($F("field_type")=="a")
		    {
		    alert("请选择字段类型！");
			   return false;
			   if($F("field_type")=="3")
			   {
			     if($F("default_value")=="" || $F("default_value")==null)
			     {
			       alert("默认值不能为空！");
			       return false;
			     }
			   }
		   }
		   if($F("field_name")==null || $F("item_name")==""){
		    alert("请填写字段名称!");
		     return false;
		   }
		    return true;
		  }
		</script>
	</head>
	<%
		String form_id = "", field_id = "", area_id = "", area_no = "1", 
					 entity_type = "", form_name = "", area_name = "";
					 
		HttpSession logsession = request.getSession();
		String cust_id = "";
		if (logsession.getAttribute("SESSION_CUST_ID") != null) 
		{
			cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
		}
		if (request.getParameter("area_id") != null)
		{
			area_id = request.getParameter("area_id");
		}
		if (request.getParameter("form_id") != null)
		{
			form_id = request.getParameter("form_id");
		}
		field_id = comm.GenTradeId();  
		String field_type = bean.getSelectItems("59");
		HashMap map = formBean.getTeplateAreaById(cust_id, form_id, area_id);
		
		if (map.get("area_no") != null)
		 {
			area_no = map.get("area_no").toString();
		}
		if (map.get("entity_type") != null)
		 {
			entity_type = map.get("entity_type").toString();
		}
		if (map.get("form_name") != null) 
		{
			form_name = map.get("form_name").toString();
		}
		if (map.get("area_name") != null) 
		{
			area_name = map.get("area_name").toString();
		}
	%>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7" style="margin-top: 30px;">
				<tr>
					<td class="line1" colspan="3" style="background-color:#e2e2e2; color:#000000;font-weight:bolder;" height="25" width="150" align="center">
						<span style="font-size:18px;"><bean:message key="str4011"/></span>
					</td>
				</tr>

				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4012"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping">
							<select name="field_type" id="field_type">
								<option value="a">
									<bean:message key="str3918"/>
								</option>
								<%=field_type%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4013"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping">
							<input type="text" name="field_name" id="field_name" size="20" maxlength="50">
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4014"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping1">
							<input type="text" name="default_value" id="default_value" size="20" maxlength="50">
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4015"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping1">
							<input name="field_no" type="text" id="field_no" value="1" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')">
							<span style="margin-left: 5px"><bean:message key="str4016"/></span>
						</div>
					</td>
				</tr>

				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4017"/>
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping1">
							<textarea name="field_desc" id="field_desc" cols="50" rows="6"></textarea>
						</div>
					</td>
				</tr>
				<tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str164"/>
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping1">
							<input name="remark2" id="remark2" size="52" maxlength="50">
						</div>
					</td>
				</tr>
				<input name="trade_type_code" type="hidden" value="1074">
				<input type="hidden" name="field_id" id="field_id" value="<%=field_id%>">
				<input type="hidden" name="form_id" id="form_id" value="<%=form_id%>">
				<input type="hidden" name="area_id" id="area_id" value="<%=area_id%>">
				<input type="hidden" name="area_no" id="area_no" value="<%=area_no%>">
				<input type="hidden" name="entity_type" id="entity_type" value="<%=entity_type%>">
				<input type="hidden" name="form_name" id="form_name" value="<%=form_name%>">
				<input type="hidden" name="area_name" id="area_name" value="<%=area_name%>">
				<tr style="background-color:#f9f9f9; ">
					<td height="40" colspan="3" style="color:#000000;text-align: center;">
						<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
						<input name="close" type="button" value="" onclick="return closeWind()" style="background-image: url('/images/gb.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
