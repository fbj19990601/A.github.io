<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title><bean:message key="str3215"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.user-Img {
		    background-image:url(/img/customer.png) !important;
		}
		.cust-Img {
		    background-image:url(/img/home.png) !important;
		}
		.edit {
		    background-image:url(/img/edit.png) !important;
		}
		.remove {
		    background-image:url(/img/delete.png) !important;
		}
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="refundGrid.js"></script>
	</head>
	<%
	  String menu_id="";
	  if(request.getParameter("menu_id")!=null){
	    menu_id=request.getParameter("menu_id");
	  }
	 %>
	<body>
		<form name=re_form id="re_form" action="" method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="13" align="left">
					</td>
				</tr>
				<tr>
					<td>
						<table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
							<tr>
								<td>
									<div id="refund-div"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
			<input type="hidden" name="form_id" id="form_id">
			<input type="hidden" name="quo_id" id="quo_id">
			<input type="hidden" name="menu_id" id="menu_id" value="<%=menu_id%>">
			<input type="hidden" name="sale_quo_id" id="sale_quo_id">
			<input type="hidden" name="trade_type_code" id="trade_type_code" value="1098">
		</form>
	</body>
</html>
