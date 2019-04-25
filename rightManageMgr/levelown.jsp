<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	String cust_class = bean.getSelectItems("14");
	String right_code = bean.getSelectItems("41");
	String limit_type = bean.getSelectItems("106");
%>
<html>
	<head>
		<title><bean:message key="str324"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript">
		 function check_Value(){
		 	if (document.resumeForm.cust_class.value == ""||document.resumeForm.cust_class.value == null)
			{
				alert("客户级别不可以为空！");
				document.resumeForm.cust_class.focus(); 
				return false;
			}
			if (document.resumeForm.right_code.value == ""||document.resumeForm.right_code.value == null)
			{
				alert("权限代码不可以为空！");
				document.resumeForm.right_code.focus(); 
				return false;
			}
			if (document.resumeForm.limit_type.value == ""||document.resumeForm.limit_type.value == null)
			{
				alert("限定类型不可以为空！");
				document.resumeForm.limit_type.focus(); 
				return false;
			}
			if (document.resumeForm.limit_value.value.replace(/\s*/g,"") == ""||document.resumeForm.limit_value.value.replace(/\s*/g,"") == null)
			{
				alert("限定值不可以为空！");
				document.resumeForm.limit_value.focus(); 
				return false;
			}
			return true;
		  }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
				<tr>
					<td height="13"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
									<bean:message key="str366"/>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
									<div class="ping">
										<select name="cust_class" id="cust_class">
											<option value="">
												<bean:message key="str160"/>
											</option>
											<%=cust_class%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
									<bean:message key="str367"/>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
									<div class="ping">
										<select name="right_code" id="right_code">
											<option value="">
												<bean:message key="str160"/>
											</option>
											<%=right_code%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
									<bean:message key="str368"/>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
									<div class="ping">
										<select name="limit_type" id="limit_type">
											<option value="">
												<bean:message key="str160"/>
											</option>
											<%=limit_type%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
									<bean:message key="str369"/>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
									<div class="ping">
										<input type="text" name="limit_value" id="limit_value" maxlength="10" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
									<bean:message key="str351"/>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
									<div class="ping1">
										<select name="enable_tag" id="enable_tag">
											<option value="0">
												<bean:message key="str352"/>
											</option>
											<option value="1">
												<bean:message key="str353"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right">
									<bean:message key="str164"/>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: left">
									<div class="ping1">
										<input type="text" name="remark" id="remark" maxlength="50" size="52">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan="2">
									<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
								</td>
							</tr>
							<tr>
								<td>
									<input type="hidden" name="update_staff_id" id="update_staff_id" value="">
									<input type="hidden" name="update_depart_id" id="update_depart_id" value="">
									<input type="hidden" name="update_time" id="update_time" value="">
									<input type="hidden" name="trade_type_code" value="1203">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>