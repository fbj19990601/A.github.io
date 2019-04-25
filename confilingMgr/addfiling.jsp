<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String cust_id = "", filing_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	filing_id = comm.GenTradeId();
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
%>
<html>
	<head>
		<title><bean:message key="str1584"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<style type="text/css" media="screen">
		.user-Img {
			background-image: url(/img/customer.png) !important;
		}
		
		.cust-Img {
			background-image: url(/img/home.png) !important;
		}
		</style>
		<script type="text/javascript">
	   //空值判断
	    function check_Value(){
	    	if(document.getElementById("filing_name").value=="" ||document.getElementById("filing_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写档案名！");
		     return false;
		   }
		   
		   if(document.getElementById("filing_address").value=="" ||document.getElementById("filing_address").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写档案位置！");
		     return false;
		   }
	      
	      if(document.getElementById("filing_date").value=="" ||document.getElementById("filing_date").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写建档时间！");
		     return false;
		   }
		   if(document.getElementById("fee").value=="" ||document.getElementById("fee").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写费用！");
		     return false;
		   }
		   if(document.getElementById("pay_type").value=="" ||document.getElementById("pay_type").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择付款方式！");
		     return false;
		   }
		   return true;
	    }
		</script>
	</head>
	<body>
		<form name=autoForm action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
						<bean:message key="str1585"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left colspan="3" width="85%">
						<div class="ping">
							<input name="filing_name" type="text" id="filing_name" size=30 maxlength=30>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1601"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="filing_address" type="text" id="filing_address" size=30 maxlength=100>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1586"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="filing_date" type="text" id="filing_date" value="<%=start%>" size="10" maxlength="10" onfocus="setday(this);" />
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1587"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping1">
							<textarea id="filing_desc" name="filing_desc" rows="6" cols="50"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
					<bean:message key="str2810"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<input name="remark" id="remark" type="text" size="50" maxlength="50">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return check_Value()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand; text-align: center;">
					</td>
				</tr>
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1265">
				<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="oper_date" id="oper_date" type="hidden" value="">
				<input name="user_id" id="user_id" type="hidden" value="">
				<input name="filing_id" id="filing_id" type="hidden" value="<%=filing_id%>">
			</table>
		</form>
	</body>
</html>



