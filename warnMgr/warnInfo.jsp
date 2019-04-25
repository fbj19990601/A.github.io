<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="house" class="com.saas.biz.wareHouseMgr.wareHouseInfo" scope="page" />
<jsp:useBean id="warnType" class="com.saas.biz.warntypeMgr.WarnTypeInfo" scope="page" />
<jsp:useBean id="warn" class="com.saas.biz.warnparaMgr.WarnparaInfo" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String cust_id = "",user_id="";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (logsession.getAttribute("SESSION_USER_ID") != null) {
		user_id = logsession.getAttribute("SESSION_USER_ID").toString();
	}
	ArrayList list=warn.getUserWarnList(cust_id,user_id,"2");
	HashMap paraMap=bean.getCompareInfoByCode("CRM","mod_type");
%>
<html>
	<head>
		<title><bean:message key="str3924"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<style type="text/css">
		#tr{
		 background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;
		}
		#tr1{
		 background-color:#f6f6f6; color:#000000; font-size:12px;
		}
		#tr2{
		 background-color:#ffffff; color:#000000; font-size:12px;
		}
		</style>
		<script type="text/javascript">
		  function deleteDefine(){
			 if(window.confirm("确定要删除所选择记录？")){
			  return true;
			 }else{
			 return false;
		 }
		}
		</script>
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
		            WinLIKE.definewindows=mydefss;
		            function mydefss() {
		                
		            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
		            	j.Vis=false;
		            	j.Nam='appwin';
		            	WinLIKE.addwindow(j);
		            };
    </SCRIPT>
	</head>
	<body>
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
												<td height="2"></td>
											</tr>
											<tr>
												<td valign="top">
													<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
														<tr id="tr">
																<td  align="center" width="20%"><bean:message key="str4201"/></td>
																<td  align="center" width="15%"><bean:message key="str4175"/></td>
																<td  align="center" width="10%"><bean:message key="str4198"/></td>
																<td  align="center" width="15%"><bean:message key="str4199"/></td>
																<td  align="center" width="10%"><bean:message key="str4217"/></td>
															</tr>
															<%
															 if(list !=null && list.size()>0){
															  for(int i=0;i<list.size();i++){
															   HashMap map=(HashMap)list.get(i);
															   String param_id=map.get("param_id").toString();
															   String param_name=map.get("param_name").toString();
															   String sum_type="",param_door="",mod_type="";
															   if(map.get("sum_type")!=null){
															   sum_type=map.get("sum_type").toString();
															   if(sum_type=="0" || sum_type.equals("0")){sum_type="E-mail";}
															    else if(sum_type=="1" || sum_type.equals("1")){sum_type="底部通知";}
															    else if(sum_type=="2" || sum_type.equals("2")){sum_type="手工查询";}
															   }
															   if(map.get("param_door")!=null){
															     param_door=map.get("param_door").toString();
															   }
															   if(map.get("mod_type")!=null){
															     mod_type=map.get("mod_type").toString();
															     if(paraMap.get(mod_type)!=null){
															       mod_type=paraMap.get(mod_type).toString();
															     }
															   }
															   if(i%2==0){
															    %><tr id="tr2"><%
															   }else{
															    %><tr id="tr1"><%
															   }
															%>
																<td  align="left" width="20%">
																<a href="viewWarnParam.jsp?param_id=<%=param_id%>" TARGET=appwin onclick="mydefss()"><%=param_name%></a></td>
																<td  align="left" width="15%"><%=mod_type%></td>
																<td  align="left" width="10%"><%=param_door%></td>
																<td  align="left" width="15%"><%=sum_type%></td>
																<td  align="center" width="10%"><a href="/doTradeReg.do?trade_type_code=1176&param_id=
																<%=param_id%>" target="_self" onclick="return deleteDefine()">
																<img src=/img/del.gif width=16 height=16 border=0 alt="删除"></a></td>
																</tr>
															<%}
															}%>
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
		</table>
	</body>
</html>



