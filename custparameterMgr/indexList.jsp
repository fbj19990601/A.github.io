<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.custDefinitionMgr.CustomerDefinitionInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String menu_id = "";
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	ArrayList list = comm.getCustomerDefinitionByCust(cust_id);
	HashMap audMap=bean.getCompareInfoByCode("CRM","audit_order");
%>
<html>
	<head>
		<title><bean:message key="str1927"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
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
											<div id="righttop">
												<jsp:include page="/inc/menu.jsp">
													<jsp:param name="menu_id" value="<%=menu_id%>" />
												</jsp:include>
											</div>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="2"></td>
												</tr>
												<tr>
													<td valign="top">
														<table width=100% border=0 cellpadding=1 cellspacing=1 align=center bgcolor="#dddddd">
															<tr id="tr">
																<td  align="center" width="10%"><bean:message key="str1950"/></td>
																<td  align="center" width="15%"><bean:message key="str2694"/></td>
																<td  align="center" width="15%"><bean:message key="str2695"/></td>
																<td  align="center" width="10%"><bean:message key="str156"/></td>
																<td  align="center" width="10%"><bean:message key="str157"/></td>
															</tr>
															<%
															 if(list !=null && list.size()>0){
															  for(int i=0;i<list.size();i++){
															   HashMap map=(HashMap)list.get(i);
															   String subsys_code="",start_date="",end_date="",param_code="",type="";
															   if(map.get("subsys_code")!=null){
															    subsys_code=map.get("subsys_code").toString();
															    if(audMap.get(subsys_code)!=null){subsys_code=audMap.get(subsys_code).toString();}
															   }
															   if(map.get("start_date")!=null){
															     start_date=map.get("start_date").toString();
															     if(start_date.length()>10){
															       start_date=start_date.substring(0,10);
															     }
															   }
															   if(map.get("end_date")!=null){
															     end_date=map.get("end_date").toString();
															     if(end_date.length()>10){
															       end_date=end_date.substring(0,10);
															     }
															   }
															   String id="";
															   if(map.get("id")!=null){id=map.get("id").toString();}
															   if(i%2==0){
															    %><tr id="tr2"><%
															   }else{
															    %><tr id="tr1"><%
															   }
															%>
																<td  align="left" width="10%"><%=subsys_code%></td>
																<td  align="left" width="15%"><%=start_date%></td>
																<td  align="left" width="15%"><%=end_date%></td>
																<td  align="center" width="10%"><a href="editIndex.jsp?menu_id=<%=menu_id%>&id=<%=id%>" target="_self"><img src=/img/edit.gif width=16 height=16 border=0 alt="修改"></a></td>
																<td  align="center" width="10%"><a href="/doTradeReg.do?trade_type_code=1172&menu_id=<%=menu_id%>&id=<%=id%>" target="_self" onclick="return deleteDefine()"><img src=/img/del.gif width=16 height=16 border=0 alt="删除"></a></td>
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
		</form>
	</body>
</html>



