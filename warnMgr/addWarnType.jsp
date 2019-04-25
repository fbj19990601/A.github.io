<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%
	
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String mod_id=comm.GenTradeId();
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	cal.add(Calendar.MONTH, 3);
	String end = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String warn_circle=bean.getSelectItems("86");
	String mod_type=bean.getSelectItems("87");
%>
<html>
	<head>
		<title><bean:message key="str4172"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="/js/date_time.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ConTractInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script type="text/javascript">
		  function check_Value(){
		    var mod_name=$F('mod_name');
		    if(mod_name=="" || mod_name==null){
		      alert("ÇëÌîÐ´Ô¤¾¯Ä£Ê½Ãû³Æ£¡");
		      return false;
		    }
		    
           if(!checkDate($F("start_date"),$F("end_date"))){
		     return false;
		   }
		    
		    var exec_date=$F("exec_date");
		    if(exec_date=="" || exec_date==null){
		      alert("ÇëÔ¤¾¯Ê±¼ä£¡");
		      return false;
		    }
		    
		    return true;
		  }
		  
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<jsp:include page="/inc/top.jsp" />
				<tr>
					<td align="center">
						<div id="manager_body">
							<div id="manager_body_left">
								<jsp:include page="/inc/left.jsp" />
							</div>
							<div id="manager_body_right">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="2">_</td>
												</tr>
												<tr>
													<td valign="top">
														<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4173"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	 <input type="text" name="mod_name" id="mod_name" maxlength="100" size="25">
																	 <input type="hidden" name="mod_id" id="mod_id" value="<%=mod_id%>">
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4174"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	<select name="mod_type" id="mod_type" onchange="showCon(this.value)">
																	 <%=mod_type%>
																	</select>
																	</div>
																</td>
															
															
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4175"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	<select name="warn_type" id="warn_type">
																	 <option value="0">E-mail</option>
																	  <option value="1"><bean:message key="str4176"/><bean:message key="str4176"/></option>
																	  <option value="2"><bean:message key="str4177"/><bean:message key="str4177"/></option>
																	</select>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<bean:message key="str4178"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping">
																	<select name="warn_circle" id="warn_circle">
																	 <%=warn_circle%>
																	</select>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str3820"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<input name="start_date" type="text" id="start_date" size=10 maxlength=20 value="<%=start%>" onfocus="setday(this);">
																		<span style="color:red">(yyyy-MM-dd)</span>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str3821"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<input name="end_date" type="text" id="end_date" size=10 maxlength=20 value="<%=end%>" onfocus="setday(this);">
																		<span style="color:red">(yyyy-MM-dd)</span>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str4179"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping">
																		<input name="exec_date" type="text" id="exec_date" size=10 maxlength=20 onfocus="_SetTime(this)">
																		<span style="color:red">(hh:mm:ss)</span>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	<bean:message key="str2835"/>
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<input name="remark" id="remark" size="52" maxlength="50" value="">
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
																	<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
				<input type="hidden" name="rsrv_str1" > 
				<input type="hidden" name="rsrv_str2" > 
				<input type="hidden" name="rsrv_str3" > 
				<input type="hidden" name="rsrv_str4" > 
				<input type="hidden" name="rsrv_str5" > 
				<input type="hidden" name="rsrv_str6" > 
				<input type="hidden" name="rsrv_str7" > 
				<input type="hidden" name="rsrv_str8" > 
				<input type="hidden" name="rsrv_str9" > 
				<input type="hidden" name="rsrv_str10"> 
				<input type="hidden" id="cust_id" value="<%=cust_id %>" name="cust_id">
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1173">
			</table>
		</form>
	</body>
</html>


