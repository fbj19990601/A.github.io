<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
    String from_type=bean.getSelectItems("60");
	String clew_type=bean.getSelectItems("55");
	String get_mode=bean.getSelectItems("56");
	String gen_idx=comm.GenTradeId();
	String area_id=comm.GenTradeId();
%>
<html>
	<head>
		<title><bean:message key="str4085"/>(http://soft.xsaas.com)</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		   
		  return true;
		}
        </script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
									<bean:message key="str826"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									 <input type="text" name="form_name" id="form_name" maxlength="100" size="30">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
									<bean:message key="str4042"/>
								</td>
								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="entity_type" id="entity_type">
										<%=from_type%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
									<bean:message key="str4008"/>
								</td>
								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="area_name" id="area_name" type="text" maxlength="100" size="300">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
									<bean:message key="str4021"/>
								</td>
								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_no" type="text" id="area_no" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')"><span style="margin-left: 5px"><bean:message key="str4049"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4044"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="cl_contactman" type="text" id="cl_contactman" size=10 maxlength=100>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4045"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="cl_addr" type="text" id="cl_addr" size=52 maxlength=100>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4046"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="cl_per" type="text" id="cl_per" size=3 maxlength=10 onkeyup="if(isNaN(value))execCommand('undo')"><span style="font-style:normal;"><bean:message key="str4050"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4047"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="cl_pay" type="text" id="cl_pay" size=5 maxlength=10 onkeyup="if(isNaN(value))execCommand('undo')"><span style="font-style:normal;"><bean:message key="str4051"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4048"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="get_mode" id="get_mode">
											<%=get_mode%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4052"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input type="text" name="get_user_name" id="get_user_name" size="10" maxlength="50">
										<input type="hidden" name="get_user_id" id="get_user_id" size="10" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4053"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<textarea name="content" id="content" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1068">
							<input name="form_id" id="form_id" type="hidden" value=<%=gen_idx%>>
							<input name="area_id" id="area_id" type="hidden" value="<%=area_id%>">
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

