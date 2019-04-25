<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.shopneedMgr.ShopneedInfo"%>
<%@ page import="com.saas.biz.storeformOutMgr.StoreformOutInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	HttpSession  logsession = request.getSession(); 
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String task_id="",need_id="",cust_id = "";
	task_id=comm.GenTradeId();
	
	String log_type=bean.getSelectItems("88");
	String unit=bean.getSelectItems("91");
	String ship_type=bean.getSelectItems("63");
    
    if (request.getParameter("need_id") != null)
    {
        need_id = request.getParameter("need_id");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    
    ShopneedInfo needInfo = new ShopneedInfo();
    String pre_date="",act_date="",from_addr="",to_addr="";
	String log_type1="",ship_type1="",need_num="",unit1="",remark="";
	String unit2="",ship_type2="",log_type2="";
    ArrayList needList = needInfo.getOneShopNeed(cust_id,need_id);
    if(needList!=null && needList.size()>0){
	    HashMap needMap = (HashMap)needList.get(0);
	    if(needMap.get("pre_date")!=null){pre_date = needMap.get("pre_date").toString();}
	    if(needMap.get("act_date")!=null){act_date = needMap.get("act_date").toString();}
	    if(needMap.get("from_addr")!=null){from_addr = needMap.get("from_addr").toString();}
	    if(needMap.get("to_addr")!=null){to_addr = needMap.get("to_addr").toString();}
	    if(needMap.get("log_type")!=null){
	    	log_type1 = needMap.get("log_type").toString();
	    	log_type2 = bean.getParaCode2ByParaCode1("88",log_type1);
	    }
	    if(needMap.get("ship_type")!=null){
	    	ship_type1 = needMap.get("ship_type").toString();
	    	ship_type2 = bean.getParaCode2ByParaCode1("63",ship_type1);
	    }
	    if(needMap.get("need_num")!=null){need_num = needMap.get("need_num").toString();}
	    if(needMap.get("unit")!=null){
	    	unit1 = needMap.get("unit").toString();
	    	unit2 = bean.getParaCode2ByParaCode1("91",unit1);
	    }
	    if(needMap.get("remark")!=null){remark = needMap.get("remark").toString();}
	}
%>
<html>
	<head>
		<title>(http://soft.xsaas.com)<bean:message key="str4086"/></title>
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
		<script type="text/javascript">
		 function confirmsub(){
		     var task_title=document.getElementById("task_title").value;
		     if(task_title=="" || task_title==null){
		       alert("请填写任务标题！");
		       document.getElementById("task_title").focus();
		       return false;
		     }
		     var task_obj_id=document.getElementById("task_obj_id").value;
		     if(task_obj_id=="" || task_obj_id==null){
		       alert("请选择责任主题！");
		       document.getElementById("task_obj_id").focus();
		       return false;
		     }
		     return true;
		 }
		</script>
	</head>
	<body>
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
									<bean:message key="str4416"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="task_title" id="task_title" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4417"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="task_obj_id" id="task_obj_id" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4418"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="pre_date" type="hidden" id="pre_date" size=10 maxlength=15 value="<%=pre_date.substring(0,10) %>">
										<%=pre_date.substring(0,10) %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4419"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="act_date" type="hidden" id="act_date" size=10 maxlength=15 value="<%=act_date.substring(0,10) %>">
										<%=act_date.substring(0,10) %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4420"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input type="hidden" name="from_addr" id="from_addr" value="<%=from_addr %>" size="25" maxlength="100">
										<%
										if(from_addr !="" || !from_addr.equals("")){
											String delims = "[|]";
											String aa = "";
											String dd[] = from_addr.split(delims);
											%>
											<bean:message key="str4421"/><%=dd[0]%>&nbsp;&nbsp;&nbsp;<bean:message key="str4422"/>
											<%
											for (int i = 1; i < dd.length; i++) {
												aa = aa+dd[i]+">>";
											}
											%>
											  <%=aa.substring(0,aa.length())%>
											<%
										}
										%> 
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4423"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="to_addr" type="hidden" id="to_addr" value="<%=to_addr %>">
										<%=to_addr %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4424"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="log_type" type="hidden" id="log_type" value="<%=log_type1 %>">
										<%=log_type2 %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4425"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="ship_type" type="hidden" id="ship_type" value="<%=ship_type1 %>">
										<%=ship_type2 %>
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4426"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name=need_num id="need_num" type="hidden" value="<%=need_num %>">
										<%=need_num %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4427"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name=unit id="unit" type="hidden" value="<%=unit1 %>">
										<%=unit2 %>
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size="52" maxlength="50" >
									</div>
								</td>
							</tr>
							<input name="publish_date" type="hidden" value="<%=start_Date%>">
							<input name="state_code_date" type=hidden value="<%=start_Date%>">
							<input name="trade_type_code" type="hidden" value="1985">
							<input name="shopo_id" id="shopo_id" type="hidden" value="<%=need_id%>">
							<input name="task_id" id="task_id" type="hidden" value="<%=task_id%>">
							<input name="state_code" type="hidden" id="state_code" value="0"><!-- 0:代表新录入 -->
							<input name="code" type="hidden" id="code" value="3">
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
	</body>
</html>

