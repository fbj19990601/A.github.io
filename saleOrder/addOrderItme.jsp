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
	String item_id = comm.GenTradeId();
	String form_id = "", field_id = "", quo_id = "";
	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	if (request.getParameter("field_id") != null) {
		field_id = request.getParameter("field_id");
	}
	if (request.getParameter("quo_id") != null) {
		quo_id = request.getParameter("quo_id");
	}
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
		   if($F("field_value")=="" || $F("field_value")==null){
		     Ext.Msg.alert("XSaaS 提示","条目名称不能为空！");
		     return false;
		   }
		   if($F("item_value")=="" || $F("item_value")==null){
		     Ext.Msg.alert("XSaaS 提示","条目内容不能为空！");
		     return false;
		   }
		  return true;
		}
		Ext.onReady(function(){
          Ext.QuickTips.init();}
       );
        </script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top: 25px">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						   <tr>
								
								<td width=100% align=left bgcolor="#FFFFFF" colspan="2" style="font-weight:bold;">
									<div class="ping1">
										<bean:message key="str3410"/>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right width=15%>
									<bean:message key="str3411"/>
								</td>
								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="field_value" id="field_value" size="25" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4733"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<textarea name="item_value" id="item_value" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50" value="">
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1090">
							<input name="form_id" type="hidden" value="<%=form_id%>">
							<input name="field_id" type="hidden" value="<%=field_id%>">
							<input name="quo_id" type="hidden" value="<%=quo_id%>">
							<input name="quo_name" type="hidden" value="">
							<input name="item_id" type="hidden" value="<%=item_id%>">
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

