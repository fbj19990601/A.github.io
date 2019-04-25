<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String from_type = bean.getSelectItems("60");
	String field_type = bean.getSelectItems("59");
	String gen_idx = comm.GenTradeId();
	String area_id = comm.GenTradeId();
	String field_id = comm.GenTradeId();
%>
<html>
	<head>
		<title><bean:message key="str334"/>(http://soft.xsaas.com)</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
		form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.bnt{background-image: url('/images/zjtm.gif');width:100px;height: 26px;border:0;cursor:hand;margin-left: 5px;display:none;}
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		   if($F("form_name")=="" || $F("form_name")==null){
		     Ext.Msg.alert("XSaaS 提示","模板名称不能为空！");
		     return false;
		   }
		   if($F("field_type")=="" || $F("field_type")==null){
		     Ext.Msg.alert("XSaaS 提示","字段名称不能为空！");
		     return false;
		   }
		   if($F("field_type")=="a"){
		     Ext.Msg.alert("XSaaS 提示","请选择字段类型！");
			 return false;
			   if($F("field_type")=="3"){
			     if($F("default_value")=="" || $F("default_value")==null){
			      Ext.Msg.alert("XSaaS 提示","默认值不能为空！");
			      return false;
			     }
			   }
		   }
		  return true;
		}
		function addItmes(index){
		  if(index=="0"){
		    $("list-item").style.display="block";
		  }else if(index=="2"){
		    $("list-item").style.display="block";
		  }else{
		    $("list-item").style.display="none";
		  }
		}
		function showListPage(){
		  var form_id=$F("form_id");
		  var field_id=$F("field_id");
		  window.open ("addListItme.jsp?form_id="+form_id+"&field_id="+field_id);
		}
        </script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right width=15%>
									<bean:message key="str4018"/>
								</td>
								<td width=35% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="entity_type" id="entity_type">
											<%=from_type%>
										</select>
									</div>
								</td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right width=15%>
									<bean:message key="str4019"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="form_name" id="form_name" maxlength="100" size="25" width=35%>
									</div>
								</td>
							</tr>

							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4020"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_name" id="area_name" type="text" maxlength="100" size="30">
									</div>
								</td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4021"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_no" type="text" id="area_no" value="1" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')">
										<span style="margin-left: 5px"><bean:message key="str4022"/></span>
									</div>
								</td>
							</tr>
							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4013"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="field_name" type="text" id="field_name" size=20 maxlength=100>
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4012"/>
								</td>
								<td align=left bgcolor="#FFFFFF" style="display:inline;float: left;margin-left: 5px;display:inline">
									<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
											<td align=left bgcolor="#FFFFFF" width="40%">
												<div class="ping">
													<select name="field_type" id="field_type" onclick="addItmes(this.value)">
														<option value="a">
															<bean:message key="str158"/>
														</option>
														<%=field_type%>
													</select>
												</div>
											</td>
											<td align=left bgcolor="#FFFFFF" width="60%">
												<input type="button" name="list-item" id="list-item" class="bnt" onclick="showListPage()">
											</td>
										</tr>
									</table>

								</td>

							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4023"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="field_no" type="text" id="field_no" value="1" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')">
										<span style="margin-left: 5px"><bean:message key="str4022"/></span>
									</div>
								</td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str442"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="default_value" type="text" id="default_value" size=25 maxlength=50>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4017"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<textarea name="field_desc" id="field_desc" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1074">
							<input name="field_id" id="field_id" type="hidden" value=<%=field_id%>>
							<input name="form_id" id="form_id" type="hidden" value=<%=gen_idx%>>
							<input name="area_id" id="area_id" type="hidden" value="<%=area_id%>">
							<tr>

								<td style="background-color:#f6f6f6; color:#000000;text-align:left;margin-left: 25px;text-align:center;" colspan="4">
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
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

