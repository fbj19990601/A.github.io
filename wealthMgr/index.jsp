<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="comparam" class="com.saas.biz.commen.ParamethodMgr" scope="page"></jsp:useBean>
<jsp:useBean id="property" class="com.saas.biz.propertyuMgr.PropertyuInfo" scope="page"></jsp:useBean>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<title><bean:message key="str324"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style>
		 .l_td{background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;}
		 .t1{background-color:#ffffff; color:#000000;font-size:12px;}
		 .t2{background-color:#f6f6f6; color:#000000;font-size:12px;}
		</style>
		<%
		  String cust_class="",user_id="";
		  HttpSession  sesion = request.getSession(); 
		  if(sesion.getAttribute("SESSION_CUST_CLASS")!=null){
		     cust_class=sesion.getAttribute("SESSION_CUST_CLASS").toString();
		     cust_class=comparam.getParamNameByValue("14",cust_class);
		  }
		  if(sesion.getAttribute("SESSION_USER_ID")!=null){
		     user_id=sesion.getAttribute("SESSION_USER_ID").toString();
		  }
		  String date="";
		  SimpleDateFormat formate= new SimpleDateFormat("yyyy-MM-dd");
		  date=formate.format(new Date());
		  ArrayList list = comparam.getCompareInfoByAttr("101");
		  String menoy=property.getUserPropertyValue(user_id,"0");
		%>
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
			<tr>
				<!-- ÖÐ¼ä -->
				<td align="center" height="27px">
					<div id="manager_body">
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
											<tr>
												<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;text-align: left;margin-left: 10px" colspan="4">
													<bean:message key="str4222"/>
												</td>
											</tr>
											<tr>
												<td height="22" colspan="2" align="center" bgcolor="#fefaf4">
													<bean:message key="str2982"/>
												</td>
												<td colspan="2" align="center" bgcolor="#ffffff">
													<bean:message key="str337"/>
													<span class="gray3"><bean:message key="str338"/><%=date%><bean:message key="str339"/></span>
												</td>
											</tr>
											<tr>
												<td width="14%" align="center" bgcolor="#fefaf4">
													<bean:message key="str4227"/>
												</td>
												<td width="26%" align="center" bgcolor="#fefaf4">
													<bean:message key="str4228"/>
												</td>
												<td width="20%" align="center" bgcolor="#ffffff">
													<bean:message key="str4229"/>
												</td>
												<td width="16%" align="center" bgcolor="#ffffff">
													<bean:message key="str342"/>
												</td>
											</tr>
											<tr>
												<td align="center" bgcolor="#fefaf4">
													<span class="red14"><%=menoy%><bean:message key="str4231"/></span>
												</td>
												<td align="center" bgcolor="#fefaf4">
													<p style="font-family: serif;font-weight: bold;">
													 <%=cust_class%>
													</p>
												</td>
												<td align="center" bgcolor="#ffffff">
													<%=menoy%><bean:message key="str4231"/>
												</td>
												<td align="center" bgcolor="#ffffff">
													0
												</td>
											</tr>
											<tr>
											 <td colspan="4">
											    <table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
													<tr>
														<td class="l_td" align="center" width="15%">
															<bean:message key="str4228"/>
														</td>
														<td class="l_td" align="center" width="30%">
															<bean:message key="str2988"/>
														</td>
														<td class="l_td" align="center" width="15%">
															<bean:message key="str4234"/>
														</td>
													</tr>
													<%
													  if(list !=null && list.size()>0){
													    for(int i=0;i<list.size();i++){
													       HashMap map=(HashMap)list.get(i);
													       String para_code1="";
													       if(map.get("para_code1")!=null){para_code1=map.get("para_code1").toString();}
													       String para_code2="";
													       if(map.get("para_code2")!=null){para_code2=map.get("para_code2").toString();}
													       String para_code3="";
													       if(map.get("para_code3")!=null){para_code3=map.get("para_code3").toString();}
													       String para_code4="";
													       if(map.get("para_code4")!=null){para_code4=map.get("para_code4").toString();}
													       String para_code5="";
													       if(map.get("para_code5")!=null){para_code5=map.get("para_code5").toString();}
													       if(i%2==0){
													        out.print("<tr class=t1>");
													       }else{
													        out.print("<tr class=t2>");
													       }
													 %>
														<td align="left" width="15%">
															<%=para_code5%>
														</td>
														<td align="left" width="30%">
															<%=para_code2%>
														</td>
														<td align="center" width="15%">
															<%=para_code3%><bean:message key="str2990"/>
														</td>
													</tr>
													 <%      
													    }
													  }
													%>
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
