<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.channelsValueMgr.ChannelsValueInfo"%>
<%
	String cust_id = "",str1="",str2="";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String channels_type=bean.getSelectItems("64");
	
	RelationCcInfo area = new RelationCcInfo();
	ArrayList tableList =area.getCoustomerById(cust_id);
	if (tableList != null && tableList.size() > 0) {
		for (int i = 0; i < tableList.size(); i++) {
			HashMap map1 = (HashMap) tableList.get(i);
			if (map1.get("cust_name") != null) {
		 		String id = map1.get("cust_id").toString();
		 		String name = map1.get("cust_name").toString();
				str1 = str1 + "<option value=" + id + ">"+ name + "</option>";
			}
		}
	}
	
	ChannelsValueInfo value = new ChannelsValueInfo();
	ArrayList tableList1 =  value.getValueById(cust_id);
	if (tableList1 != null && tableList1.size() > 0) {
		for (int i = 0; i < tableList1.size(); i++) {
			HashMap map2 = (HashMap) tableList1.get(i);
			if (map2.get("value_name") != null) {
		 		String id = map2.get("value_id").toString();
		 		String name = map2.get("value_name").toString();
				str2 = str2 + "<option value=" + id + ">"+ name + "</option>";
			}
		}
	}
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String end_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
%>
<html>
	<head>
		<title><bean:message key = "str4143"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript">
	   //空值判断
	    function Check_Value(){
	    	
	       if(document.getElementById("channels_type").value ==null || document.getElementById("channels_type").value ==""){
	        alert("请选择渠道！");
	        return false;
	       }
	    if(document.getElementById("obj_cust_id").value ==null || document.getElementById("obj_cust_id").value ==""){
	        alert("请选择经销商！");
	        return false;
	       }
	       if(document.getElementById("test_id").value ==null || document.getElementById("test_id").value =="")
	       {
	        alert("请选择返利规则！");
	        return false;
	       }
	     if(document.getElementById("test_value").value ==null || document.getElementById("test_value").value =="")   
	       {
	        alert("请填写返利值！");
	        return false;
	       }
	        if(document.getElementById("test_month").value ==null || document.getElementById("test_month").value =="")   
	       {
	        alert("请填写日期！");
	        return false;
	       }
	      return true
	    }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
						<bean:message key="str4136"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left colspan="3" width="85%">
						<div class="ping">
							<select name="channels_type" id="channels_type">
								<option value="">
									<bean:message key="str2655"/>
								</option>
									<%=channels_type%>
							</select> 
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4069"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<select name="obj_cust_id" id="obj_cust_id" >
								<option value="">
									<bean:message key="str1180"/>
								</option>
									<%=str1%>
							</select> 
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4137"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<select id="test_id" name="test_id" >
								<option value="">
									<bean:message key="str2655"/>
								</option>
									<%=str2%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4139"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<input name="test_value" type="text" id="test_value" size=20 maxlength=20>
						</div>
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4140"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<input name="test_month" type="text" id="test_month" size="10" maxlength="10" onfocus="setday(this);" value="<%=start_Date%>">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4141"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping1">
							<input name="test_date" type="text" id="test_date" size="10" maxlength="10" onfocus="setday(this);" value="<%=end_Date%>">
							<span style="color: red">(yyyy-MM-dd)</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
						<bean:message key="str2993"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<textarea name="test_desc" id="test_desc" cols="50" rows="6"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str3266"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping1">
							<select name="enable_tag" id="enable_tag">
								<option value="0"><bean:message key="str1308"/></option>
								<option value="1"><bean:message key="str1015"/></option>
							</select> 
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
						<bean:message key="str333"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<input name="remark" id="remark" type="text" size=52 maxlength="50">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return Check_Value()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1245">
				<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="in_date" id="in_date" type="hidden" value="">
				<input name="oper_user_id" id="oper_user_id" type="hidden" value="">
			</table>
		</form>
	</body>
</html>



