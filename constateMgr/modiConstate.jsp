<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%
	String cust_id = "", con_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if(request.getParameter("con_id")!=null){
		con_id=request.getParameter("con_id");
	}
	String state_code = bean.getSelectItems("94");
	
	ConTractInfo hello = new ConTractInfo();
	ArrayList autoList = hello.getListByConId(cust_id,con_id);
	if (autoList != null && autoList.size() > 0) {
		HashMap map = (HashMap) autoList.get(0);
		if(map.get("state_code")!=null){state_code = map.get("state_code").toString();}
			state_code=bean.getItemsBySelected("94",state_code);
	}

	
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/salesFormMgr/customer.js"></script>
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
	    	if(document.getElementById("state_code").value=="" ||document.getElementById("state_code").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择合同状态！");
		     return false;
		   }
		   return true;
	    }
		</script>
	</head>
	<body>
		<form name=autoForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
									<bean:message key="str1825"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left colspan="3" width="85%">
									<div class="ping">
										<select id="state_code" name="state_code">
											<option value=""><bean:message key="str2655"/></option>
											<option value="1"><bean:message key="str1603"/></option>
											<option value="2"><bean:message key="str1604"/></option>
											<option value="3"><bean:message key="str1605"/></option>
											<option value="4"><bean:message key="str1606"/></option>
											<option value="5"><bean:message key="str1607"/></option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
									<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
								</td>
							</tr>
							<input name="trade_type_code" id="trade_type_code" type="hidden" value="1264">
							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
							<input name="publish_date" id="publish_date" type="hidden" value="">
							<input name="start_date" id="start_date" type="hidden" value="">
							<input name="end_date" id="end_date" type="hidden" value="2050-12-31">
							<input name="oper_date" id="oper_date" type="hidden" value="">
							<input name="remark" id="remark" type="hidden" value="">
							<input name="user_id" id="user_id" type="hidden" value="">
							<input name="con_id" id="con_id" type="hidden" value="<%=con_id%>">
							<input name="state_code_date" id="state_code_date" type="hidden" value="">
							<input name="state_resean" id="state_resean" type="hidden" value="修改成[<%=state_code%>]">
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



