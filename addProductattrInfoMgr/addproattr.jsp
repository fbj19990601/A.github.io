<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	//String class_type=bean.getSelectItems("64");
	String attr_id = comm.GenTradeId();
	HttpSession httpSess = request.getSession();
	String cust_id = (String) httpSess.getAttribute("SESSION_CUST_ID");
%>
<html>
	<head>
		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="channal.js"></script>
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
      </style>
	</head>
	<body>
		<form name=productForm method=post action=/doTradeReg.do target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str431"/>
								</td>
								<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;" width="85%">
									<div class="ping1">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<div id="div-win"></div>
							<input type="hidden" name="trade_type_code" value="1221" />
							<input type="hidden" name="attr_id" value="<%=attr_id%>" />
							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
							<input name="attr_desc" id="attr_desc" type="hidden" value="">
							<input name="enable_tag" id="enable_tag" type="hidden" value="">
							<input name="default_value" id="default_value" type="hidden" value="">
							<input name="attr_no" id="attr_no" type="hidden" value="">
							<input name="remark" id="remark" type="hidden" value="">
							<input name="default_tag" id="default_tag" type="hidden" value="">
							<input name="class_id" id="class_id" type="hidden" value="">
							<input name="class_name" id="class_name" type="hidden" value="0">
							<input name="up_class_id" id="up_class_id" type="hidden" value="000000000000000">
							<input name="attr_name" id="attr_name" type="hidden" value="">
							<tr>
								<td height="30" align="center" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" colspan=2>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



