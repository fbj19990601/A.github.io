<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title></title>
<style type="text/css">
     .table1 a:link{
		color:Orange;
		font-family:arial;
		text-decoration:none;
	}
	.table1 a:visited {
		color:Orange;
		font-family:arial;
		text-decoration:none;
	}
	.table1 a:active {
		font-family:arial;
		color:Orange;
		text-decoration:none;
	}
	.table1 a:hover {
		background-position:50% bottom;
		left:1px;
		top:1px;
		bordr:1px;
	    color:Orange; 
		background-repeat:repeat-x;
		position: relative; 
		text-decoration:underline;
	}
</style>
<script type="text/javascript">
	function showDiv1(){
		document.getElementById('div1').style.display='block';
		document.getElementById('div2').style.display='none';
		document.getElementById('div4').style.display='none';
		document.getElementById('div3').style.display='none';
		
		document.getElementById('span1').style.color='Orange';
		document.getElementById('span2').style.color='black';
		document.getElementById('span3').style.color='black';
		document.getElementById('span4').style.color='black';
	}
	function showDiv2(){
		document.getElementById('div2').style.display='block';
		document.getElementById('div1').style.display='none';
		document.getElementById('div4').style.display='none';
		document.getElementById('div3').style.display='none';
		
		document.getElementById('span1').style.color='black';
		document.getElementById('span2').style.color='Orange';
		document.getElementById('span3').style.color='black';
		document.getElementById('span4').style.color='black';
	}
	
	function showDiv3(){
		document.getElementById('div2').style.display='none';
		document.getElementById('div1').style.display='none';
		document.getElementById('div4').style.display='none';
		document.getElementById('div3').style.display='block';
		
		document.getElementById('span1').style.color='black';
		document.getElementById('span2').style.color='black';
		document.getElementById('span4').style.color='black';
		document.getElementById('span3').style.color='Orange';
	}
	function showDiv4(){
		document.getElementById('div2').style.display='none';
		document.getElementById('div1').style.display='none';
		document.getElementById('div4').style.display='block';
		document.getElementById('div3').style.display='none';
		
		document.getElementById('span1').style.color='black';
		document.getElementById('span2').style.color='black';
		document.getElementById('span4').style.color='Orange';
		document.getElementById('span3').style.color='black';
	}
</script>
</head>
<body>
<% 
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	Custinfo custInfo = new Custinfo();
	ArrayList custList = custInfo.getIncludeJspByCustId(cust_id,"1");
%>
	<table cellspacing="0" cellpadding="0" border="0">
		<tr>
		<!-- 
			<td>
				<span id="span1" style="background-color: white;font-size: small;cursor: hand;font-weight: bolder;color: orange;" onmouseover="showDiv1()">
					最新客户
				</span>
			</td>
			<td width="10"></td>
			 -->
			<td>
				<span id="span2" style="background-color: white;font-size: small;cursor: hand;font-weight: bolder;" onmouseover="showDiv2()">
					<bean:message key="str2786"/>
				</span>
			</td>
			<td width="10"></td>
			<td>
				<span id="span4" style="background-color: white;font-size: small;cursor: hand;font-weight: bolder;" onmouseover="showDiv4()">
					<bean:message key="str2787"/>
				</span>
			</td>
			<td width="10"></td>
			<!-- 
			<td>
				<span id="span3" style="background-color: white;font-size: small;cursor: hand;font-weight: bolder;" onmouseover="showDiv3()">
					最新竞争情报
				</span>
			</td>
			 -->
		</tr>
	</table>	
	<table width="700" cellpadding="0" cellspacing="0" class="table1">
		<tr style="display: none;" id="div1">
			<td>
				<jsp:include flush="true" page="/CRMMgr/newCustinfo.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="display: block;" id="div2">
			<td>
				<jsp:include flush="true" page="/CRMMgr/newActionInfo.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="display: none;" id="div3">
			<td>
				<jsp:include flush="true" page="/CRMMgr/newActionOppInfo.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="display: none;" id="div4">
			<td>
				<jsp:include flush="true" page="/CRMMgr/newActionConInfo.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>