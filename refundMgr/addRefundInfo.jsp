<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%

	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String sale_quo_id="",form_id="",quo_id="";
	quo_id=comm.GenTradeId();
	String currency_code=bean.getSelectItems("62");
	String ship_type=bean.getSelectItems("63");
    
    if (request.getParameter("quo_id") != null)
    {
        sale_quo_id = request.getParameter("quo_id");
    }
    if (request.getParameter("form_id") != null)
    {
        form_id = request.getParameter("form_id");
    }
%>
<html>
	<head>
		<title><bean:message key="str4086"/></title>
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
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript">
		 function confirmsub(){
		     var quo_name=document.getElementById("quo_name").value;
		     if(quo_name=="" || quo_name==null){
		       Ext.MessageBox.alert("XSaaS提示","请填写退货申请单名称！");
		       return false;
		     }
		     var back_num=document.getElementById("back_num").value;
		     if(back_num=="" || back_num==null){
		       Ext.MessageBox.alert("XSaaS提示","请填写退货数量！");
		       return false;
		     }
		     var surplus_num=document.getElementById("surplus_num").value;
		     if(surplus_num=="" || surplus_num==null){
		       Ext.MessageBox.alert("XSaaS提示","请填写退货剩余数量！");
		       return false;
		     }
		     var give_addr=document.getElementById("give_addr").value;
		     if(give_addr=="" || give_addr==null){
		       Ext.MessageBox.alert("XSaaS提示","请填写交货地点！");
		       return false;
		     }
		     var back_desc=document.getElementById("back_desc").value;
		     if(back_desc=="" || back_desc==null){
		       Ext.MessageBox.alert("XSaaS提示","请填写退货原因！");
		       return false;
		     }
		     var all_tag=document.getElementById("all_tag").value;
		     if(all_tag=="1"){
		       document.getElementById("state_code").value="3";
		     }
		     return true;
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
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3292"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="quo_name" id="quo_name" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3310"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									<select id="back_type" name="back_type">
									  <option value="0"><bean:message key="str3311"/></option>
									  <option value="1"><bean:message key="str3312"/></option>
									</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3313"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="all_tag"  id="all_tag">
										 <option value="0"><bean:message key="str810"/></option>
										 <option value="1"><bean:message key="str809"/></option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3297"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="back_num" id="back_num" size="15" type="text" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3298"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="surplus_num" id="surplus_num" size="15" type="text" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3299"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="give_date" type="text" id="give_date" size=10 maxlength=15 value="<%=start_Date%>" onfocus="setday(this);">
										<span style="color:red">(yyyy-MM-dd)</span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3300"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="give_addr" type="text" id="give_addr" size=35 maxlength=100>
										
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3301"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="currency_code"  id="currency_code">
										 <%=currency_code%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3302"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="ship_type"  id="ship_type">
										 <%=ship_type%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3303"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="ship_fee"  id="ship_fee" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3304"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name=tax id="tax" type="text" size="10"  onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3305"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="off_rate" id="off_rate" type="text"size="5"  onkeyup="if(isNaN(value))execCommand('undo')"><bean:message key="str3448"/>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str815"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="off_count" id="off_count" type="text" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str883"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="all_fee" id="all_fee" type="text" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3307"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									  <textarea name="back_desc" cols="50" id="back_desc" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50" >
									</div>
								</td>
							</tr>
							<input name="doc_date" type="hidden" value="<%=start_Date%>">
							<input name="trade_type_code" type="hidden" value="1097">
							<input name="form_id" type="hidden" value="<%=form_id%>">
							<input name="quo_id" type="hidden" value="<%=quo_id%>">
							<input name="state_code" type="hidden" id="state_code" value="2">
							<input name="sale_quo_id" type="hidden" value="<%=sale_quo_id%>">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand">
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

