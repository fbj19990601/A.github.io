<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="custBean" class="com.saas.biz.custMgr.Custinfo" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.testListMgr.TestListInfo"%>
<%
	String cust_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String test_id="";
	if(request.getParameter("test_id")!=null){
		test_id = request.getParameter("test_id");
	}
	String channels_type=bean.getSelectItems("64");
	
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String end_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	
	TestListInfo testInfo = new TestListInfo();
	ArrayList valueInfoList = testInfo.getOneTest(cust_id,test_id);
	HashMap valueMap = new HashMap();
	String obj_cust_id="",test_month="",test_date="",test_name="";
	String test_value="",test_desc="",enable_tag="",remark="";
	String obj_cust_name="";
	if(valueInfoList!=null && valueInfoList.size()>0){
		valueMap = (HashMap)valueInfoList.get(0);
		if(channels_type!=null){channels_type = valueMap.get("channels_type").toString();}
			channels_type=bean.getItemsBySelected("64",channels_type);
		
		if(valueMap.get("obj_cust_id")!=null){
			obj_cust_id = valueMap.get("obj_cust_id").toString();
			obj_cust_name = custBean.getCustNameById(obj_cust_id);
		}
		if(valueMap.get("test_name")!=null){test_name = valueMap.get("test_name").toString();}
		if(valueMap.get("test_month")!=null){test_month = valueMap.get("test_month").toString();}
		if(valueMap.get("test_date")!=null){test_date = valueMap.get("test_date").toString();}
		if(valueMap.get("test_value")!=null){test_value = valueMap.get("test_value").toString();}
		if(valueMap.get("test_desc")!=null){test_desc = valueMap.get("test_desc").toString();}
		if(valueMap.get("enable_tag")!=null){enable_tag = valueMap.get("enable_tag").toString();}
		if(valueMap.get("remark")!=null){remark = valueMap.get("remark").toString();}
	} 
	
	
	
%>
<html>
	<head>
		<title><bean:message key="str4067"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript">
	   //空值判断
	    function Check_Value(){
	    	
	       if(document.getElementById("channels_type").value ==null || document.getElementById("channels_type").value  ==""){
	       alert("请选择渠道！");
	        return false;
	       }
	    
	       if(document.getElementById("obj_cust_id").value ==null || document.getElementById("obj_cust_id").value ==""){
	        alert("请选择经销商！");
	        return false;
	       }
	       
	       if(document.getElementById("test_id").value ==null || document.getElementById("test_id").value ==""){
	        alert("请选择返利规则！");
	        return false;
	       }
	        
	       if(document.getElementById("test_value").value ==null|| document.getElementById("test_value").value ==""){
	        alert("请填写返利值！");
	        return false;
	       }
	       if(document.getElementById("test_month").value ==null|| document.getElementById("test_month").value ==""){
	        alert("请填写考核年月！");
	        return false;
	       }
	      
	    }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
						<bean:message key="str4068"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left colspan="3" width="85%">
						<div class="ping1">
							<select name="channels_type" id="channels_type">
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
							<select name="obj_cust_id" id="obj_cust_id">
								<option value="<%=obj_cust_id%>"><%=obj_cust_name%></option>
							</select> 
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4070"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<select id="test_id" name="test_id">
								<option value="<%=test_id%>"><%=test_name%></option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4743"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<input value="<%=test_value%>" name="test_value" type="text" id="test_value" size=20 maxlength=20>
						</div>
					</td>
				</tr>
				
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4072"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping">
							<input value="<%=test_month%>" name="test_month" type="text" id="test_month" size="10" maxlength="10" onfocus="setday(this);" value="<%=start_Date%>">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str4073"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping1">
							<input name="test_date" type="text" id="test_date" size="10" maxlength="10" onfocus="setday(this);" value="<%=test_date %>">
							<span style="color: red">(yyyy-MM-dd)</span>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
						<bean:message key="str446"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<textarea name="test_desc" id="test_desc" cols="50" rows="6"><%=test_desc %></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
						<bean:message key="str1307"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
						<div class="ping1">
							<select name="enable_tag" id="enable_tag">
								<option value="0"><bean:message key="str1308"/></option>
								<option value="1"><bean:message key="str1309"/></option>
							</select> 
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
						<bean:message key="str1569"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<input value="<%=remark%>"name="remark" id="remark" type="text" size=52 maxlength="50">
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return Check_Value()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1248">
				<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="in_date" id="in_date" type="hidden" value="">
				<input name="oper_user_id" id="oper_user_id" type="hidden" value="">
			</table>
		</form>
	</body>
</html>



