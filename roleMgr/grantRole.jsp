<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="roleBean" class="com.saas.biz.roleMgr.RoleInfo" scope="page"></jsp:useBean>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html>
	<head>
		<title><bean:message key="str355"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/salesFormMgr/userGird.js"></script>
		<style>
		 .l_td{background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;text-align:right;width: 15%}
		 .r_td{background-color:#ffffff; color:#000000;  font-size:12px;width: 85%}
		</style>
		<script type="text/javascript">
		 function check_Value(){
		  var role_code=$F("code");
		  if(role_code=="a"){
		    alert("Please choose  the role which is to be assigned！");
		    return false;
		  }else if(role_code=="n"){
		    alert("You don't set the role,
please set again!");
		    return false;
		  }
		  var user_name=$F("user_name");
		  if(user_name=="" || user_name==null){
		    alert("Please choose the user！");
		    return false;
		  }
		  return true;
		 }
		 
		 /***查看用户已有角色****/
		 function checkUserRole(){
		   $("role").style.display="block";
		   $("bnt").style.display="block";
		   $("check").style.display="none";
		   var cust_id=$F("cust_id");
		   var user_id=$F("sale_user_id");
		   var data = Math.round(Math.random() * 10000);
	       var myAjax = new Ajax.Updater('role-div', 
			'userRole.jsp?&user_id=' + user_id + "&cust_id="+cust_id+"&data=" + data, 
			{
				method : 'get',
				evalScripts: true
			});
		 }
		 
		 /****列出用户清单***********/
		 function showUserList(){
		   showUserWind();
		   $("bnt").style.display="none";
		   $("check").style.display="block";
		   $("role").style.display="none";
		 }
		</script>
		<%
		  HttpSession  logsession = request.getSession(); 
          String cust_id = "";
          if(logsession.getAttribute("SESSION_CUST_ID") != null)
	      {
	        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	      }
		  String roles=roleBean.getRoleSelectByType(cust_id,"1");
		%>
	</head>
	<body>
	<form name=resumeForm action=/doTradeReg.do method=post target="_self">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
			<tr>
				<!-- 中间 -->
				<td align="center" height="27px">
					<div id="manager_body">
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
												   <bean:message key="str356"/>(<span style="color: red"><bean:message key="str357"/></span>)
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str358"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping">
													<select name="code" id="code">
													 <option value="a"><bean:message key="str192"/></option>
													 <%=roles%>
													</select>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str359"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping" style="float: left">
													  <input type="text" name="user_name" id="sale_user_name" size="15" readonly onchange="checkUserRole()">
													  <input type="hidden" name="user_id" id="sale_user_id">
													  <input type="button" name="bnt" id="bnt" value="Please select" onclick="showUserList()">
													  <input type="button" style="display: none" value="check the role of user" name="check" id="check" onclick="checkUserRole()">
													  <div id="grid5"></div>
													</div>
												</td>
											</tr>
											<tr id="role" style="display: none">
												<td class="l_td">
													<bean:message key="str360"/>
												</td>
												<td align="left" class="r_td">
												   <div class="ping1">
													<div id="role-div"></div>
													</div>
												</td>
											</tr>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
													<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
												</td>
											</tr>
											<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id%>">
											<input type="hidden" name="trade_type_code" value="1190">
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>
