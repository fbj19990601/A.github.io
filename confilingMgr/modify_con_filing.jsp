<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.confilingMgr.ConFilingInfo"%>
<%
	String cust_id = "", filing_no = "",con_id="";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("con_id") != null) {
		con_id = request.getParameter("con_id");
	}
	if (request.getParameter("filing_no") != null) {
		filing_no = request.getParameter("filing_no");
	}
	String media = bean.getSelectItems("99");
	
	String filing_name="",con_name="",con_no="",file_name="",file_desc="",remark="",filing_id="";
	ConFilingInfo conInfo = new ConFilingInfo();
	ArrayList autoList = conInfo.getOneValue(cust_id,con_id,filing_no);
	if (autoList != null && autoList.size() > 0) {
		HashMap map = (HashMap) autoList.get(0);
		if (map.get("filing_name") != null) { filing_name = map.get("filing_name").toString();}
		if (map.get("filing_id") != null) { filing_id = map.get("filing_id").toString();}
		if (map.get("con_name") != null) { con_name = map.get("con_name").toString();}
		if (map.get("con_no") != null) { con_no = map.get("con_no").toString();}
		if (map.get("file_name")!=null){ file_name = map.get("file_name").toString();}
		if (map.get("file_desc")!=null){ file_desc = map.get("file_desc").toString();}
		if (map.get("remark")!=null){ remark = map.get("remark").toString();}
		if (map.get("media")!=null){ media = map.get("media").toString();}
			media=bean.getItemsBySelected("99",media);
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
		   if(document.getElementById("file_name").value=="" ||document.getElementById("file_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写资料名！");
		     return false;
		   }
		   if(document.getElementById("media").value=="" ||document.getElementById("media").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择介质！");
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
						<bean:message key="str1588"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left colspan="3" width="85%">
						<div class="ping">
							<input name="con_name" type="text" id="con_name" size=30 maxlength=30 value="<%=con_name%>" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1589"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="con_no" type="text" id="con_no" size=30 maxlength=100 value="<%=con_no%>" readonly>
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div1">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1585"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="filing_name" type="text" id="filing_name" size=30 maxlength=100 value="<%=filing_name%>" readonly>
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div2">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1590"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="file_name" type="text" id="file_name"  size="20" maxlength="20" value="<%=file_name%>">
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div3">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str1591"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping">
							<select id="media" name="media">
								<option value=""><bean:message key="str2655"/></option>
								<%=media%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div4">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str1592"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<textarea id="file_desc" name="file_desc" rows="6" cols="50"><%=file_desc%></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str2810"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<input name="remark" type="text" id="remark"  size="52" maxlength="50" value="<%=remark%>">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return check_Value()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand; text-align: center;">
					</td>
				</tr>
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1269">
				<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="oper_date" id="oper_date" type="hidden" value="">
				<input name="user_id" id="user_id" type="hidden" value="">
				<input name="filing_id" id="filing_id" type="hidden" value="<%=filing_id%>">
				<input name="con_id" id="con_id" type="hidden" value="<%=con_id%>">
				<input name="filing_no" id="filing_no" type="hidden" value="<%=filing_no%>">
			</table>
		</form>
	</body>
</html>



