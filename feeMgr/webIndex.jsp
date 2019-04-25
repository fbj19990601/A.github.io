<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.custMgr.Custinfo" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.ping_1{
		 font-weight: bold;color: black;
		}
		</style>
		<script type="text/javascript" src="/js/prototype.js"></script>
		
		<script type="text/javascript">
		  function check_Value(){
		    var cust_name=$F("cust_name");
		    if(cust_name =="" || cust_name==null){
		      alert("Please enter the name of the member！");
		      $("cust_name").focus();
		      return false;
		    }
		    var id=$F("obj_cust_id");
		    if(id=="" || id==null){
		      alert("Entered incorrectly！\n please enter again！");
		      $("cust_name").focus();
		       return false;
		    }
		     getCheckBox();
		    var value_num=$F("value_num");
		    if(value_num<1){
		      alert("Please select the name of the service which you want to order！");
		      return false;
		    }
		    if($("v_orderemail").value==""){
		      alert("the email can not be empty！");
		      return false;
		    }else {
		      var regexp=/^[a-zA-Z0-9_]{2,25}[@][a-zA-z0-9-]{1,100}[.]([a-zA-Z]{2,4}|[a-zA-Z]{2,4}[.][a-zA-Z]{2})$/g;
		      if(!regexp.test($("v_orderemail").value)){
		         alert("Please enter a legitimate email address！");
		        return false;
		      }
		    }  
		    $("v_amount").value=$F("value_num");
		    return true;
		  }
		function setCustId(id){
		  $("obj_cust_id").value=id;
		}
		//判断会员订购的服务类型
		function setServerInfo(s_name,s_value){
		 if($(s_name).checked){
		   $(s_value).focus();
		 }else{
		   var num=$F(s_value);
		   if(num!="" && num !=null){
		   var sum=parseFloat(parseFloat($F("value_num"))-parseFloat(num)*50);
		   $("value_num").value=sum;
		   }
		   $(s_value).value="";
		 }
		}
		function setSumServer(s_name,s_value){
		  if($(s_name).checked){
		   var num=$F(s_value);
		   if(num !="" && num!=null){
		    var sum=parseFloat(parseFloat($F("value_num"))+parseFloat(num)*50);
		    $("value_num").value=sum;
		   }else{
		     alert("Please enter a period of the service！");
		     $(s_name).checked=false;
		   }
		 }else{
		  var val=$F(s_value);
		  if(val>0){
		    alert("Do you want to order a service ,please choose a name of  services ！");
		  }else{
		   val=0;
		   var sum=parseFloat(parseFloat($F("value_num"))-parseFloat(val*50));
		   $("value_num").value=sum;
		  }
		 }
		}
		function getCheckBox(){
		  var value_id="";//存放服务名称和期限 oa&5#50|
		  var chkbox = document.getElementsByName('sev');    
	      var size=chkbox.length; 
	      for(var i=0;i<size;i++){
	        var obj=chkbox[i];
	        if(obj.checked){
	          var id=obj.id;
	          var val="f_"+id;
	          var month=parseFloat(parseFloat($F(val))*parseFloat(obj.value));
	          value_id=value_id+id+"&"+month+"|";
	        }
	      }
	      $("value_id").value=value_id;
	      return true;
         }
		</script>
	</head>
	<%
	HttpSession  logsession = request.getSession(); 
	String cust_id="",user_id="",cust_name="",phone="";
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
	if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }
    ArrayList list=bean.genSpecCustInfo(cust_id);
    if(list !=null && list.size()>0){
      HashMap map=(HashMap)list.get(0);
      if(map.get("cust_name")!=null){
        cust_name=map.get("cust_name").toString();
      }
      if(map.get("group_contact_phone")!=null){
        phone=map.get("group_contact_phone").toString();
      }
      
    }
    String account_id=comm.GenTradeId();
	%>
	<body>
	<form name=formbill action=/doTradeServe.do method="post"method=post target="_self">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<!-- 中间 -->
				<td align="center">
					<div id="manager_body">
						<!--左边菜单-->
						<div id="manager_body_left">
							<jsp:include page="/inc/left.jsp" />
						</div>
						<div id="manager_body_right">
							<table width="740" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="2">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td style="margin-top: 20px">
													<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
														<tr>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan="2" align=center width="100%">
																<div class="ping_1">
																	<input type="hidden" name="cust_name" id="cust_name" value="<%=cust_name%>"><bean:message key="str127"/>!
																</div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																<bean:message key="str128"/>
															</td>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
																<div class="ping">
																	<input type="text" name="v_orderemail" id="v_orderemail" maxlength="100" title="Please enter the correct email address " style="height: 12px"><span style="margin-bottom:2px;color:red;"><bean:message key="str116"/></span>
																</div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																<bean:message key="str131"/>
															</td>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
																<div class="ping">
																	<table width=100% border=0 cellpadding=2 cellspacing=1 align=center>
																		<tr>
																			<td style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str132"/><input type="checkbox" name="sev" id="b2b" value="1" onclick="setServerInfo('b2b','f_b2b')"><bean:message key="str135"/><input type="text" name="f_b2b" id="f_b2b" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('b2b','f_b2b')"><bean:message key="str133"/>
																				</div>
																			</td>
																			<td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																				    <bean:message key="str134"/><input type="checkbox" name="sev" id="oa" value="3" onclick="setServerInfo('oa','f_oa')"><bean:message key="str135"/><input type="text" size="3" name="f_oa" id="f_oa" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('oa','f_oa')"><bean:message key="str136"/>
																				</div>
																			</td>
																		</tr>
																		<tr>
																		  <td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str137"/><input type="checkbox" name="sev" id="crm" value="3" onclick="setServerInfo('crm','f_crm')"><bean:message key="str135"/><input type="text" name="f_crm" id="f_crm" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('crm','f_crm')"><bean:message key="str136"/>
																				</div>
																			</td>
																			<td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str138"/><input type="checkbox" name="sev" id="mrp" value="12" onclick="setServerInfo('mrp','f_mrp')"><bean:message key="str135"/><input type="text" name="f_mrp" id="f_mrp" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('mrp','f_mrp')"><bean:message key="str139"/>
																				</div>
																			</td>
																		</tr>
																		<tr>
																		  <td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str140"/><input type="checkbox" name="sev" id="sale" value="12" onclick="setServerInfo('sale','f_sale')"><bean:message key="str135"/><input type="text" name="f_sale" id="f_sale" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('sale','f_sale')"><bean:message key="str139"/>
																				</div>
																			</td>
																			<td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str142"/><input type="checkbox" name="sev" id="buy" value="12" onclick="setServerInfo('buy','f_buy')"><bean:message key="str135"/><input type="text" name="f_buy" id="f_buy" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('buy','f_buy')"><bean:message key="str139"/>
																				</div>
																			</td>
																		</tr>
																		<tr>
																		  <td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str143"/><input type="checkbox" name="sev" id="proj" value="12" onclick="setServerInfo('proj','f_proj')"><bean:message key="str135"/><input type="text" name="f_proj" id="f_proj" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('proj','f_proj')"><bean:message key="str139"/>
																				</div>
																			</td>
																			<td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str144"/><input type="checkbox" name="sev" id="form" value="12" onclick="setServerInfo('form','f_form')"><bean:message key="str135"/><input type="text" name="f_form" id="f_form" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('form','f_form')"><bean:message key="str139"/>
																				</div>
																			</td>
																		</tr>
																		<tr>
																		  <td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str145"/><input type="checkbox" name="sev" id="prod" value="12" onclick="setServerInfo('prod','f_prod')"><bean:message key="str135"/><input type="text" name="f_prod" id="f_prod" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('prod','f_prod')"><bean:message key="str139"/>
																				</div>
																			</td>
																			<td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str146"/><input type="checkbox" name="sev" id="trans" value="12" onclick="setServerInfo('trans','f_trans')"><bean:message key="str135"/><input type="text" name="f_trans" id="f_trans" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('trans','f_trans')"><bean:message key="str139"/>
																				</div>
																			</td>
																		</tr>
																		<tr>
																		  <td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1">
																					<bean:message key="str147"/><input type="checkbox" name="sev" id="cont"value="12" onclick="setServerInfo('cont','f_cont')"><bean:message key="str135"/><input type="text" name="f_cont" id="f_cont" size="3" maxlength="2" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''" onblur="setSumServer('cont','f_cont')"><bean:message key="str139"/>
																				</div>
																			</td>
																			<td  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
																				<div class="ping_1"><bean:message key="str148"/><input type="text" name="value_num" id="value_num" size="15" maxlength="20" value="0" style="height: 12px" readonly></div>
																			</td>
																		</tr>
																	</table>
																</div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=center colspan="2">
																<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
															</td>
														</tr>
														  <input type="hidden" id="obj_cust_id" name="obj_cust_id" value="<%=cust_id%>">
														  <input type="hidden" id="user_id" name="user_id" value="<%=user_id%>">
														  <input type="hidden" id="value_id" name="value_id">
														  <input type="hidden" id="account_id" name="account_id" value="<%=account_id%>">
														  <input name="v_oid" type="hidden" maxlength="64" value="<%=account_id%>"/>
									                      <input name="v_rcvemail" type="hidden" maxlength="64" value="sj@wanglong.cc"/>
									                      <input name="cust_id" id="cust_id" type="hidden" maxlength="64" value="<%=cust_id%>"/>
									                      
									                      <input name="v_rcvname" id="v_rcvname" type="hidden" value="<%=cust_name%>"/>
									                      <input name="v_rcvtel" id="v_rcvtel" type="hidden" value="<%=phone%>"/>
									                      <input name="v_amount" id="v_amount" type="hidden" value=""/>
									                      
									                      <input name="server_name" type="hidden" id="server_name" maxlength="64" value=""/>
									                      <input name="trade_type_code" type="hidden" id="trade_type_code" value="1186"/>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<!-- 中间 结束 -->
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
