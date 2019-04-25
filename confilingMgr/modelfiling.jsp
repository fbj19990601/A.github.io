<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.filingMgr.FilingInfo"%>
<%
	String cust_id = "", filing_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("filing_id") != null) {
		filing_id = request.getParameter("filing_id");
	}
	
	String filing_name="",filing_address="",filing_date="",filing_desc="",remark="";
	FilingInfo filing = new FilingInfo();
	ArrayList filingList = filing.getOneValue(cust_id,filing_id);
	if (filingList != null && filingList.size() > 0) {
		HashMap map = (HashMap) filingList.get(0);
		if(map.get("filing_name")!=null){filing_name = map.get("filing_name").toString();}
		if(map.get("filing_address")!=null){filing_address = map.get("filing_address").toString();}
		if(map.get("filing_date")!=null){filing_date = map.get("filing_date").toString();}
		if(map.get("filing_desc")!=null){filing_desc = map.get("filing_desc").toString();}
		if(map.get("remark")!=null){remark = map.get("remark").toString();}
	}
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
							<input name="filing_name" type="text" id="filing_name" size=30 maxlength=30 value="<%=filing_name%>">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1601"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="filing_address" type="text" id="filing_address" size=30 maxlength=100 value="<%=filing_address%>">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1586"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="filing_date" type="text" id="filing_date" value="<%=filing_date%>" size="10" maxlength="10" onfocus="setday(this);" />
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1587"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping1">
							<textarea id="filing_desc" name="filing_desc" rows="6" cols="50"><%=filing_desc%></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str2810"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<input name="remark" id="remark" type="text" size="50" maxlength="50" value="<%=remark%>">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return check_Value()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand; text-align: center;">
					</td>
				</tr>
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1266">
				<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="oper_date" id="oper_date" type="hidden" value="">
				<input name="user_id" id="user_id" type="hidden" value="">
				<input name="filing_id" id="filing_id" type="hidden" value="<%=filing_id%>">
			</table>
		</form>
	</body>
</html>



