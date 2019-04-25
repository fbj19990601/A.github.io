<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.saleOrderMgr.SaleOrderInfo" scope="page" />
<%
	String form_id = "", quo_id = "", cust_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	if (request.getParameter("quo_id") != null) {
		quo_id = request.getParameter("quo_id");
	}
	ArrayList list = bean.getOrderDetailByList(cust_id, form_id, quo_id);
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
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="center" width=25%>
									<bean:message key="str3426"/>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="center" width=75%>
									<div class="ping">
										<bean:message key="str3427"/>
									</div>
								</td>
							</tr>
							<%
							 if(list !=null && list.size()>0){
							 for(int i=0;i<list.size();i++){
							  HashMap map=(HashMap)list.get(i);
							  String item_name=map.get("field_value").toString();
							  String item_value=map.get("item_value").toString();
							  if(i%2==0){
							%>
							<tr>
								<td style="background-color:#FFFFFF; color:#000000;font-size:14px;text-align:left;margin-left: 15px">
									<%=item_name%>
								</td>
								<td style="background-color:#FFFFFF; color:#000000;font-size:14px;text-align:left;margin-left: 10px">
									<%=item_value%>
								</td>
							</tr>
							<%
										}
										else {
							%>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;font-size:14px;text-align:left;margin-left: 15px">
									<%=item_name%>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;font-size:14px;text-align:left;margin-left: 10px">
									<%=item_value%>
								</td>
							</tr>
							<%
									}
									}
								}
							%>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;font-size:14px;text-align:center;margin-left: 15px" colspan="2">
									<div style="cursor:hand;color: red" onclick="exitWind()">
										<bean:message key="str3428"/>
									</div>
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

<script type="text/javascript">
<!--
function exitWind(){
  window.opener=null;
  window.close();
}
//-->
</script>
