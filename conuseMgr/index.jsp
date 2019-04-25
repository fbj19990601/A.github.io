<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.organizeMgr.OrganizeInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	HttpSession  logsession = request.getSession(); 
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String cust_id = "",con_id="";
	con_id=comm.GenTradeId();
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    OrganizeInfo orgInfo = new OrganizeInfo();
    String selectOrg = orgInfo.getSelectOrg(cust_id);
%>
<html>
	<head>
		<title><bean:message key="str4706"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
		form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WareHousePosInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
				<script type="text/javascript" src="userGird.js"></script>
		<script type="text/javascript">
		
		function setConClass(val){
			var conClassValue = val;
			if(conClassValue=='0'){
				document.getElementById('co_class').value='HR';
			}else if(conClassValue=='1'){
				document.getElementById('co_class').value='SALE';
			}
			else if(conClassValue=='2'){
				document.getElementById('co_class').value='PRO';
			}
			else if(conClassValue=='3'){
				document.getElementById('co_class').value='TRAS';
			}else if(conClassValue==''){
				document.getElementById('co_class').value='';
			}
		}
		
		 function confirmsub(){
		     var obj_cust_id=document.getElementById("obj_cust_id").value;
		     if(obj_cust_id=="" || obj_cust_id==null){
		       alert("请选择领用人！");
		       return false;
		     }
		     var con_no=document.getElementById("con_no").value;
		     if(con_no=="" || con_no==null){
		       alert("请填写合同编码！");
		       return false;
		     }
		     var re = /^[A-Za-z0-9]+$/;   
  			if(re.test(document.getElementById("con_no").value)){   
 
			}else{   
				 alert("合同编码格式不正确！"); 
				document.getElementById("con_no").value='';
				document.getElementById("con_no").focus();
				return false;
			} 
		     var con_date=document.getElementById("con_date").value;
		     if(con_date=="" || con_date==null){
		       alert("请选择领用时间！");
		       return false;
		     }
		     var con_class=document.getElementById("con_class").value;
		     if(con_class=="" || con_class==null){
		       alert("请选择合同类别！");
		       return false;
		     }
		     var con_dept=document.getElementById("con_dept").value;
		     if(con_dept=="" || con_dept==null){
		       alert("请选择领用人所属部门！");
		       return false;
		     }
		     var reason=document.getElementById("reason").value;
		     if(reason=="" || reason==null){
		       alert("请填写领用原因！");
		       document.getElementById("reason").focus();
		       return false;
		     }
		     return true;
		 }
		</script>
	</head>
	<body>
		<center>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1571"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="hidden" name="obj_cust_id" id="obj_cust_id" size="25" maxlength="100">
										<input type="text" name="obj_cust_name" id="obj_cust_name" size="25" maxlength="100" readonly="readonly">
										<input type="button" name="ubnt" value="选择" onclick="showUserWind()"><div id="grid5"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1572"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name=con_no id="con_no" type="text" size="25" maxlength="25"><font color="red"><bean:message key="str1831"/></font>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1573"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="con_date" type="text" id="con_date" size=10 maxlength=15 value="<%=start_Date%>" onfocus="setday(this);">
										<span style="color:red">(yyyy-MM-dd)</span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1723"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="con_class" id="con_class" onchange="setConClass(this.value)">
										    <option value=""><bean:message key="str1180"/></option>
											<option value="0"><bean:message key="str1832"/></option>
											<option value="1"><bean:message key="str1705"/></option>
											<option value="2"><bean:message key="str1706"/></option>
											<option value="3"><bean:message key="str1833"/></option>
										</select>
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1575"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="con_dept"  id="con_dept">
										 <option value=""><bean:message key="str1180"/></option>
										 <%=selectOrg%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1576"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<textarea rows="6" cols="50" name="reason" id="reason"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2810"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" size="52" maxlength="50" >
									</div>
								</td>
							</tr>
							<input name="publish_date" type="hidden" value="<%=start_Date%>">
							<input name="trade_type_code" type="hidden" value="1944">
							<input name="con_id" type="hidden" id="con_id" value="<%=con_id%>">
							<input name="co_class" type="hidden" id="co_class" value="">
							<input name="con_num" type="hidden" id="con_num" value="">
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
		</center>
	</body>
</html>

