<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="bean" class="com.saas.biz.wareHouseMgr.wareHouseInfo" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String store_name=bean.getSelectHouse(cust_id);
%>
<html>
	<head>
		<title><bean:message key="str863"/>(http://soft.xsaas.com)</title>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WareHousePosInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript">
		 function  setPosition(house_id){
		   var cust_id=document.getElementById("cust_id").value;
		   alert(house_id+"=="+cust_id);
		   WareHousePosInfo.getOnePosByHouseId(cust_id,house_id,function(data){
		      DWRUtil.removeAllOptions("posit_name");
		      DWRUtil.addOptions("posit_name",data);
		   }) 
		 }
		</script>
	</head>
	<body>
		<table width="350" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="50%">
					<bean:message key="str891"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="50%">
					<bean:message key="str4206"/>
				</td>
			</tr>
			<tr style="background-color:#f9f9f9">
				<td style=" color:#000000; padding:3px 5px;" align=center>
					<select name="store_name" id="store_name" size="10" onclick="setPosition(this.value)">
					 <%=store_name%>
					</select>
				</td>
				<td style=" color:#000000;" align=center>
					<select name="posit_name" id="posit_name" size="10"></select>
				</td>
				<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id%>">
			</tr>
		</table>
	</body>
</html>
