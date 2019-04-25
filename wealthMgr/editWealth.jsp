<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="comparam" class="com.saas.biz.commen.ParamethodMgr" scope="page">
</jsp:useBean>
<html>
	<head>
		<title><bean:message key = "str863"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<style>
		 .l_td{background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;text-align:right;width: 15%}
		 .r_td{background-color:#ffffff; color:#000000;  font-size:12px;width: 85%}
		</style>
		<script type="text/javascript">
		 function check_Value(){
		   var para_code6=$F("para_code6");
		   para_code6=delAllSpace(para_code6);
		   if(para_code6 =="" || para_code6==null){
		    alert("Please choose the action of member£¡");
		    $("para_code6").focus();
		    return false;
		   }
		   $("para_code2").value=DWRUtil.getText("para_code6");
		   var para_code4=$F("para_code4");
		   para_code4=delAllSpace(para_code4);
		   if(para_code4=="" || para_code4==null){
		    alert("Please choose the lever of member £¡");
		    $("para_code4").focus();
		    return false;
		   }
		   var para_code3=$F("para_code3");
		   para_code3=delAllSpace(para_code3);
		   if(para_code3 =="" || para_code3==null){
		    alert("Please enter the amount of award gold£¡");
		    $("para_code3").focus();
		    return false;
		   }
		   var start_date=$F("start_date");
		   start_date=delAllSpace(start_date);
		   if(start_date =="" || start_date==null){
		    alert("The begin time can not be empty£¡");
		    $("start_date").focus();
		    return false;
		   }
		   var end_date=$F("end_date");
		   end_date=delAllSpace(end_date);
		   if(end_date =="" || end_date==null){
		    alert("The end time can not be empty£¡");
		    $("end_date").focus();
		    return false;
		   }
		   return true;
		 }
		 //É¾³ýËùÓÐ¿Õ¸ñ
		 function delAllSpace(str) {
			return str.replace(/^\s+|\s+$/g, "")
		 }
		</script>
		<%
			String start_date = "",para_code6="",actiont="";
			SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
			start_date = formate.format(new Date());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR, 50);
			String end_date = formate.format(cal.getTime());
			String cust_class = "";
			String para_code1 = "",para_code4="";
			if(request.getParameter("code1")!=null){
			  para_code1=request.getParameter("code1");
			}
			if(request.getParameter("code4")!=null){
			  para_code4=request.getParameter("code4");
			  cust_class=comparam.getParamNameByValue("14",para_code4);
			}
			HashMap map=comparam.getCommparamByCode4("B2B","101",para_code1,para_code4);
			String remark="",para_code2="",para_code3="",para_code5="";
			if(map.get("remark")!=null){
			  remark=map.get("remark").toString();
			}
			if(map.get("para_code5")!=null){
			  para_code5=map.get("para_code5").toString();
			}
			if(map.get("para_code2")!=null){
			  para_code2=map.get("para_code2").toString();
			}
			if(map.get("para_code6")!=null){
			  actiont=map.get("para_code6").toString();
			  para_code6=comparam.getParamNameByValue("102",actiont);
			}
			if(map.get("para_code3")!=null){
			  para_code3=map.get("para_code3").toString();
			}
			if(map.get("end_date")!=null){
			  end_date=map.get("end_date").toString();
			  if(end_date.length()>10){
			     end_date=end_date.substring(0,10);
			  }
			}
		   if(map.get("start_date")!=null){
			  start_date=map.get("start_date").toString();
			  if(start_date.length()>10){
			     start_date=start_date.substring(0,10);
			  }
			}
		%>
	</head>
	<body>
	<form name=resumeForm action=/doTradeReg.do method=post target="_self">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
			<tr>
				
				<td align="center" height="27px">
					<div id="manager_body">
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<table width=725 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
												 <div class="ping"> 
												    <bean:message key="str4236"/>
												 </div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str4237"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping">
													 <input type="text" size="25" name="action" value="<%=para_code6%>" readonly>
													<input type="hidden" name="para_code6" id="para_code6" value="<%=actiont%>">
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str4238"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping">
													    <input type="text" size="25" name="class_anem" value="<%=cust_class%>" readonly>
														<input type="hidden" name="para_code4" id="para_code4" value=<%=para_code4%>>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str4239"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping">
														<input type="text" name="para_code3" name="para_code3" size="5" maxlength="50" value="<%=para_code3%>"
														 onkeyup="if(isNaN(this.value))this.value=''">
														<bean:message key="str4240"/>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str3820"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping">
														<input name="start_date" type="text" id="start_date" size=10 maxlength=15 value="<%=start_date%>" onfocus="setday(this);" readonly>
														(yyyy-MM-dd)
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str3821"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping">
														<input name="end_date" type="text" id="end_date" size=10 maxlength=15 value="<%=end_date%>" onfocus="setday(this);" readonly>
														(yyyy-MM-dd)
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str2835"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<input name="remark" type="text" id="remark" size=50 maxlength=100 value="<%=remark%>">
													</div>
												</td>
											</tr>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
													<input class="xgan" name="submit" type="submit" value="" onclick="return check_Value()">
												</td>
											</tr>
											<input type="hidden" name="xtype" id="xtype" value="1">
											<input type="hidden" name="param_code" id="param_code" value="action">
											<input type="hidden" name="param_name" id="param_name" value="set wealth">
											<input type="hidden" name="subsys_code" id="subsys_code" value="B2B" />
											<input type="hidden" name="param_attr" id="param_attr" value="101" />
											<input type="hidden" name="para_code1" value="<%=para_code1%>">
											<input type="hidden" name="para_code5" value="<%=para_code5%>">
											<input type="hidden" name="para_code2" value="<%=para_code2%>">
											<input type="hidden" name="para_code7">
											<input type="hidden" name="para_code8">
											<input type="hidden" name="para_code9">
											<input type="hidden" name="para_code10">
											<input type="hidden" name="para_code11">
											<input type="hidden" name="para_code12">
											<input type="hidden" name="para_code13">
											<input type="hidden" name="para_code14">
											<input type="hidden" name="para_code15">
											<input type="hidden" name="para_code16">
											<input type="hidden" name="para_code17">
											<input type="hidden" name="para_code18">
											<input type="hidden" name="para_code19">
											<input type="hidden" name="para_code20">
											<input type="hidden" name="para_code21">
											<input type="hidden" name="para_code22">
											<input type="hidden" name="para_code23">
											<input type="hidden" name="para_code24">
											<input type="hidden" name="para_code25">
											<input type="hidden" name="para_code26">
											<input type="hidden" name="para_code27">
											<input type="hidden" name="para_code28">
											<input type="hidden" name="para_code29">
											<input type="hidden" name="para_code30">
											<input type="hidden" name="trade_type_code" value="1188">
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
