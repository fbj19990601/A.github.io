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
	String menu="";
	if(request.getParameter("menu_id")!=null){
	  menu=request.getParameter("menu_id");
	}
	String area_id=comm.GenTradeId();
	String form_id = comm.GenTradeId();
	 request.setCharacterEncoding("GBK");
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
		   if($F("form_name")=="" || $F("form_name")==null){
		     Ext.Msg.alert("XSaaS 提示","模板名称不能为空！");
		     return false;
		   }
		  return true;
		}
        </script>
	</head>
	<body>
		<form name=resumeForm action="formListIndex.jsp" method=post>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right width=15%>
									<bean:message key="str4018"/>
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
									<bean:message key="str4034"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_name" id="area_name" type="text" maxlength="100" size="30">
									</div>
								</td>
							</tr>
							<tr style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4035"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_no" type="text" id="area_no" value="1" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')">
										<span style="margin-left: 5px"> <bean:message key="str4022"/></span>
									</div>
								</td>
								<input name="area_no" type="hidden" value="1"><!--默认区域肯定是第一个，不需要输入区域顺序-->
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;text-align:left;margin-left: 25px;text-align:center;" colspan="2">
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/xyb.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
								</td>
							</tr>
							<input type="hidden" name="menu_id" id="menu_id" value="<%=menu%>">
							<input type="hidden" name="form_id" id="form_id" value="<%=form_id%>">
							<input type="hidden" name="area_id" id="area_id" value="<%=area_id%>">
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

