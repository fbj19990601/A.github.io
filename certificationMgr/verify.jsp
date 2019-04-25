<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	String verify_id = comm.GenTradeId();
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String verify_type = param.getSelectItems("100");
%>
<html>
	<head>
		<title><bean:message key="str0987"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript">
		function Check_Value()
	    {
	    if($F("verify_type")=="" || $F("verify_type")==null)
		{
			alert("Please enter the verification type!!!");
			$("verify_type").focus();
			return false;
		}
		var verify_name=$F("verify_name");
		verify_name=delAllSpace(verify_name);
		if(verify_name=="" || verify_name==null)
		{
			alert("Enter the name of the certificate!");
			$("verify_name").focus();
			return false;
		}
		var req_date=$F("req_date");
		if(req_date=="" || req_date==null)
		{
			alert("The date of application can not be empty!");
			$("req_date").focus();
			return false;
		}
		return true;
	}
	 //É¾³ýËùÓÐ¿Õ¸ñ
		 function delAllSpace(str) {
			return str.replace(/^\s+|\s+$/g, "")
		 }
		</script>
	</head>
	<body>
		<form name=parentForm action=/doTradeReg.do method=post target="_self">
			<table width=750 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						Test type
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<select name="verify_type" maxlength="25">
								<%=verify_type%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
						Documents
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="35%">
						<div class="ping">
							<input type="text" name="verify_name" id="verify_name" maxlength="50" size="30">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
						<bean:message key="str185"/>
					</td>
					<td class="ping1" style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="35%">
						<textarea name=req_desc style="display:none"></textarea>
						<iframe id="req_desc" src="/www/ewebeditor/ewebeditor.htm?id=req_desc&style=coolblue" frameborder="0" scrolling="no" width="600" height="350"></iframe>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						For the time
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping">
							<input type="text" name="req_date" type="text" id="req_date" size="10" value="<%=start%>" onfocus="setday(this);">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str333"/>
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping1">
							<input name="remark" id="remark" size="35" maxlength="50" value="">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="4">
						<input class="tjan" name="submit" type="submit" value="" onclick="return Check_Value()">
					</td>
				</tr>
				<input type="hidden" name="oper_date" id="oper_date" value="<%=start%>">
				<input type="hidden" name="oper_user" id="oper_user" value="">
				<input type="hidden" name="verify_status" id="verify_status" value="0">
				<input type="hidden" name="verify_id" id="verify_id" value="<%=verify_id%>">
				<input type="hidden" name="trade_type_code" id="trade_type_code" value="012">
			</table>
		</form>
	</body>
</html>
