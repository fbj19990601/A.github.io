<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.custMgr.CustClass"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
	<head>
		<title><bean:message key="str1890"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<style>
		 .l_td{background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;text-align:right;width: 20%}
		 .r_td{background-color:#ffffff; color:#000000;  font-size:12px;width: 80%}
		</style>
		<script language="javascript">
		function checkInfo()
		{
			var cls=$("old_class").value;
		 	var val=$("cust_class").value;
		 	var cust_name=$F("cust_name");
			if(cls == "1")
			{
				alert("未验证客户不能修改客户级别!请先申请验证！");
				return false;
			}
			
			if(val == "0"){
				alert("请选择客户级别!");
				return false;
			}else if(val == "1"){
			   alert("不能把【"+cust_name+"】的级别修改为未验证客户!");
			   return false;
			}
			
	       var start_date=$F("start_date");
		   start_date=delAllSpace(start_date);
		   if(start_date =="" || start_date==null){
		    alert("开始时间不能为空！");
		    $("start_date").focus();
		    return false;
		   }
		   
		   var end_date=$F("end_date");
		   end_date=delAllSpace(end_date);
		   if(end_date =="" || end_date==null){
		    alert("结束时间不能为空！");
		    $("end_date").focus();
		    return false;
		   }
		   //////////////////判断时间是否合理////////////////
		   if(!checkDate(start_date,end_date)){
		     return false;
		   }
		   ///////////////////////////////////////////////
		   return true;
		 }
		 //删除所有空格
		 function delAllSpace(str) {
			return str.replace(/^\s+|\s+$/g, "")
		 }
     </script>
	</head>
	<body>
		<%
		    String start_date = "";
			SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
			start_date = formate.format(new Date());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR, 50);
			String end_date = formate.format(cal.getTime());
			String cust_id = "";
			if (request.getParameter("cust_id") != null) {
				cust_id = request.getParameter("cust_id");
			}
			Custinfo custinfo = new Custinfo();
			ArrayList custArray = new ArrayList();
			custArray = custinfo.getCustInfo(cust_id);
			String cust_name = "", cust_phone = "", cust_addr = "";
			if (custArray != null && custArray.size() > 0) {
				HashMap map = (HashMap) custArray.get(0);
				if (map.get("cust_name") != null) {
					cust_name = map.get("cust_name").toString();
				}
				if (map.get("group_contact_phone") != null) {
					cust_phone = map.get("group_contact_phone").toString();
				}
				if (map.get("company_address") != null) {
					cust_addr = map.get("company_address").toString();
				}
			}
			CustClass level = new CustClass();
			String class_Name = level.cust_Class_Name(cust_id);
			ParamethodMgr paramCom = new ParamethodMgr();
			String customer_class = paramCom.getSelectItems("14");
			String cust_class=level.getCustClassById(cust_id);
		%>
		<form method="post" name="NewRegisterForm" id="NewRegisterForm" action=/doTradeReg.do>
		    <span style="padding: 15px">&nbsp;</span>
			<table width=550 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td class="line1" style="background-color:#e2e2e2; color:#000000; line-height:25px;  font-weight:bold; font-size:13px;" colspan="2">
						<bean:message key="str1891"/>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str3227"/>
					</td>
					<td class="r_td">
						<div class="ping1">
							<%=cust_name%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str3488"/>
					</td>
					<td class="r_td">
						<div class="ping1">
							<%=cust_phone%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str1203"/>
					</td>
					<td class="r_td">
						<div class="ping1" style="font-size:12px">
							<%=cust_addr%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str1849"/>
					</td>
					<td class="r_td">
						<div class="ping1" style="font-size:12px">
							<%=class_Name%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str1850"/>
					</td>
					<td class="r_td">
						<div class="ping" style="font-size:12px">
							<select name="cust_class" id="cust_class">
							    <option value="0"><bean:message key="str2655"/></option>
								<%=customer_class%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str2856"/>
					</td>
					<td class="r_td">
						<div class="ping" style="font-size:12px">
						  <input name="start_date" type="text" id="start_date" size=10 maxlength=15 value="<%=start_date%>" onfocus="setday(this);" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str2857"/>
					</td>
					<td class="r_td">
						<div class="ping" style="font-size:12px">
							<input name="end_date" type="text" id="end_date" size=10 maxlength=15 value="<%=end_date%>" onfocus="setday(this);" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td">
						<bean:message key="str164"/>
					</td>
					<td class="r_td">
						<div class="ping1" style="font-size:12px">
							<input type="text" name="remark" size="25" maxlength="50">
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_td" colspan="2" style="text-align: center;">
						<input class="tjan" type="submit" value="" onclick="return checkInfo()">
						<input type="hidden" name="trade_type_code" value="0566">
						<input type="hidden" name="cust_name" id="cust_name" value="<%=cust_name%>">
						<input type="hidden" name="old_class" id="old_class" value="<%=cust_class%>">
						<input type="hidden" name="cust_id" value="<%=cust_id%>">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
