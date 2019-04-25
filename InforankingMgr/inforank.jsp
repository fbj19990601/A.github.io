<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.propertyuMgr.PropertyuInfo"%>
<%@ page import="com.saas.biz.validityMgr.ValidityInfo"%>
<%
	String iStart = "0";
	int counter = 0;
	HashMap maps=bean.getPagetUrlByCode("106");
	String cust_class="",info_type="";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("cust_class") != null) {
		cust_class = request.getParameter("cust_class");
	}
	if (request.getParameter("info_type") != null){
		info_type = request.getParameter("info_type");
	}
	
	ValidityInfo info = new ValidityInfo();
	ArrayList infoList = new ArrayList();
	
	if  ( info_type.equals("1") || info_type=="1" ){
		infoList=info.getNewsById(Integer.parseInt(iStart),cust_class,info_type);
		counter = info.getNewsById(cust_class,info_type);
	}
	else if(info_type.equals("2") || info_type=="2"){
		infoList=info.getAdvertiseById(Integer.parseInt(iStart),cust_class,info_type);
		counter = info.getAdvertiseById(cust_class,info_type);
	}
	else if(info_type.equals("3") || info_type=="3" ){
		infoList=info.getSaleById(Integer.parseInt(iStart),cust_class,info_type);
		counter = info.getSaleById(cust_class,info_type);
	}
	else if(info_type.equals("4")|| info_type=="4"){
		infoList=info.getStockorderById(Integer.parseInt(iStart),cust_class,info_type);
		counter = info.getStockorderById(cust_class,info_type);
	}
	else if(info_type.equals("5") || info_type=="5"){
		infoList=info.getCategoryById(Integer.parseInt(iStart),cust_class,info_type);
		counter = info.getCategoryById(cust_class,info_type);
	} 
	else if(info_type.equals("6") || info_type=="6"){
		infoList=info.getJobById(Integer.parseInt(iStart),cust_class,info_type);
		counter = info.getJobById(cust_class,info_type);
	}
	
	int pages = counter / 20 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage) {
		if (currenPage > 0) {
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}

%>
<html>
	<head>
		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.ping_1 {
	font-weight: bold;
	color: black;
}

#tr {
	background-color: #f6f6f6;
	color: #000000;
	font-weight: bold;
	font-size: 12px;
	text-align: center;
}

#tr1 {
	background-color: #f6f6f6;
	color: #000000;
	font-size: 12px;
}

#tr2 {
	background-color: #ffffff;
	color: #000000;
	font-size: 12px;
}
</style>
		<script type="text/javascript" src="/js/prototype.js"></script>
	</head>
	<body>
		<form name="serverForm" id="serverForm" action="index.jsp" method="post">
			<table width="740" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="26">
								</td>
							</tr>
							<tr>
								<td style="margin-top: 20px">
									<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
											<td  colspan="2">
												<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
													<tr>
														<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
															<bean:message key="str1930"/>
														</td>
														<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
															<bean:message key="str752"/>
														</td>
														<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="40%">
															<bean:message key="str603"/>
														</td>
														<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
															<bean:message key="str196"/>
														</td>
														<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
															<bean:message key="str2640"/>
														</td>
													</tr>
													<%
														
														if (infoList != null && infoList.size() > 0) {
														for (int i = 0; i < infoList.size(); i++) {
															HashMap map = (HashMap) infoList.get(i);
															String titles="",audit_date="",para_code2="",cust_classs="",page_Url="",quo_id="";
															if (cust_class == "1" || cust_class.equals("1")) {cust_classs = "Ordinary(Not verified)";}
															 else if (cust_class == "2" || cust_class.equals("2")) {cust_classs = "Ordinary";}
															 else if (cust_class == "3" || cust_class.equals("3")) {cust_classs = "Bronze";}
															 else if (cust_class == "4" || cust_class.equals("4")) {cust_classs = "Silver";} 
															 else if (cust_class == "5" || cust_class.equals("5")) {cust_classs = "Gold";}
															 else if (cust_class == "6" || cust_class.equals("6")) {cust_classs = "VIP";}
															if(map.get("para_code2")!=null){para_code2 = map.get("para_code2").toString();}
															if(map.get("quo_id")!=null){quo_id = map.get("quo_id").toString();}
															if(map.get("title")!=null){titles = map.get("title").toString();}
															if(map.get("category_title")!=null){titles = map.get("category_title").toString();}
															if(map.get("audit_date")!=null){audit_date = map.get("audit_date").toString();}
															if (audit_date.length() > 10) {audit_date = audit_date.substring(0, 10);}
															if(map.get("publish_date")!=null){audit_date = map.get("publish_date").toString();}
															if (audit_date.length() > 10) {audit_date = audit_date.substring(0, 10);}
															if(map.get("start_date")!=null){audit_date = map.get("start_date").toString();}
															if (audit_date.length() > 10) {audit_date = audit_date.substring(0, 10);}
															if(maps!=null && maps.size()>0){
															  if(maps.get(info_type)!=null){ 
															    page_Url=maps.get(info_type).toString();
															    page_Url=page_Url+quo_id;
															  }
															}
													%>
													<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
														<td style="color: #000000; padding: 2px 5px;" align=center><%=cust_classs%></td>
														<td style="color: #000000;" align=center><%=para_code2%></td>
														<td style="color: #000000; padding: 2px 5px;" align=center>
															<a href="<%=page_Url%>" TARGET=appwin onclick="mydefss()"><%=titles%></a>
														</td>
														<td style="color: #000000;" align=center><%=audit_date%></td>
														<td style="color: #000000;" align=center>
															<a href="addrank.jsp?&quo_id=<%=quo_id%>&cust_class=<%=cust_class%>&info_type=<%=info_type%>&title=<%=titles%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="modify"></a>
														</td>
													</tr>
													<%
														}
														}
													%>
													<tr>
														<td align="left" colspan="3">
															<bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/>
														</td>
														<td align="right" colspan="3">
															<a href="rankindex.jsp?iStart=0&cust_class=<%=cust_class%>&info_type=<%=info_type%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
															<%
															if (Integer.parseInt(iStart) > 0) {
															%>
															<a href="rankindex.jsp?iStart=<%=pageUp%>&cust_class=<%=cust_class%>&info_type=<%=info_type%>"><bean:message key="str1031"/></a> &nbsp;
															<%
																}
																if (Integer.parseInt(iStart) < pages - 1) {
															%>
															<a href="rankindex.jsp?iStart=<%=pageDown%>&cust_class=<%=cust_class%>&info_type=<%=info_type%>"><bean:message key="str1032"/>  </a>&nbsp;
															<%
															}
															%>
															<a href="rankindex.jsp?iStart=<%=pages - 1%>&cust_class=<%=cust_class%>&info_type=<%=info_type%>"><bean:message key="str1033"/></a>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<input type="hidden" id="obj_cust_id" name="obj_cust_id">
												<input type="hidden" id="trade_type_code" name="trade_type_code" value="1187">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>