<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
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
		#tr{
		 background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;text-align: center;
		}
		#tr1{
		 background-color:#f6f6f6; color:#000000; font-size:12px;
		}
		#tr2{
		 background-color:#ffffff; color:#000000; font-size:12px;
		}
		</style>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript">
		  function check_Value(){
		    var cust_name=$F("cust_name");
		    if(cust_name =="" || cust_name==null){
		      alert("Please enter a name ！");
		      $("cust_name").focus();
		      return false;
		    }
		    var id=$F("obj_cust_id");
		    if(id=="" || id==null){
		      alert("Entered incorrectly！\n please enter again！");
		      $("cust_name").focus();
		       return false;
		    }
		    var value_num=$F("value_num");
		    var sum=$F("sum");
		    if(value_num=="" || value_num==null){
		      alert("Please enter an amount of refund ！");
		      $("value_num").focus();
		      return false;
		    }
		    if(parseFloat(value_num)>parseFloat(sum)){
		      alert("the amount of refund is wrong！Please carefully calculated again !");
		      $("value_num").focus();
		     return false;
		    }
		    return true;
		  }
		  function chechCustName() {
			var data = Math.round(Math.random() * 10000);
			var name=$F('cust_name');
			 if(name =="" || name==null){
		      alert("Please enter the name of the customer！");
		      $("cust_name").focus();
		      return false;
		    }else{
		    $("sever-div").innerHTML="";
			   var myAjax = new Ajax.Updater('cust-div', 
					'refundList.jsp?cust_name=' + name + "&data=" + data, 
					{
						method : 'get',
						evalScripts: true
					});
		   }
		}
		function setCustId(id){
		var data = Math.round(Math.random() * 10000);
		  $("obj_cust_id").value=id;
		   var myAjax = new Ajax.Updater('sever-div', 
			'useSever.jsp?cust_id=' + id + "&data=" + data, 
			{
				method : 'get',
				evalScripts: true
			});
		}
		</script>
	</head>
	<%
	 String refund_type=bean.getSelectItems("13");
	  String account_id=comm.GenTradeId();
	%>
	<body>
	<form name="serverForm" id="serverForm" action=/doTradeReg.do method=post target="_self">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
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
															<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																<bean:message key="str310"/>
															</td>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
																<div class="ping">
																<select id="reg_type" name=reg_type>
																   <%=refund_type%>
																</select>
																</div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																<bean:message key="str290"/>
															</td>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
																<div class="ping">
																	<input type="text" name="cust_name" id="cust_name" maxlength="100" title="Please enter the name of the  custome">&nbsp;<input type="button" name="bnt" id="bnt" value="Enquiries" onclick="chechCustName()"><span style="margin-bottom:2px;color:red;"><bean:message key="str293"/></span>
																</div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#ffffff; color:#000000;  font-weight:bold; font-size:12px;text-align:right" colspan="2">
																<div id="cust-div"></div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#ffffff; color:#000000;  font-weight:bold; font-size:12px;text-align:right" colspan="2">
																<div id="sever-div"></div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																<bean:message key="str311"/>
															</td>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
																<div class="ping">
																 <input type="text" name="value_num" id="value_num" size="10" maxlength="15" style="height: 12px" onkeyup="if(isNaN(this.value))this.value=''">
																</div>
															</td>
														</tr>
														<tr>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=center colspan="2">
																<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
															</td>
														</tr>
														<input type="hidden" id="account_id" name="account_id" value="<%=account_id%>">
														<input type="hidden" id="obj_cust_id" name="obj_cust_id">
														<input type="hidden" id="trade_type_code" name="trade_type_code" value="1187">
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
