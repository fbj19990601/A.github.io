<%@ page contentType="text/html;charset=GBK"%><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.stockorderMgr.StockInfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%
	String stock_key="",pro="",city="",part="",param="";
	String iStart = "0";
	int counter = 0;
	String defaultImg="/zone_b2b/images/cp.gif";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if(request.getParameter("stock_key")!=null){
		stock_key = request.getParameter("stock_key");
	}
	if(request.getParameter("pro")!=null){
		pro = request.getParameter("pro");
	}
	if(request.getParameter("city")!=null){
		city = request.getParameter("city");
	}
	if(request.getParameter("part")!=null){
		part = request.getParameter("part");
	}
	if(request.getParameter("param")!=null){
		param = request.getParameter("param");
	}
	
	StockInfo stockInfo = new StockInfo();
	ArrayList stockList = new ArrayList();
	if( city.equals("") || city == null ){
		if(stock_key.equals("") || stock_key == null){
			stockList = stockInfo.getProductByStockOffKey(Integer.valueOf(iStart).intValue(),pro,part);
			counter = stockInfo.getProductByStockOffKey(pro,part);
		}else{
			stockList = stockInfo.getProductByStockOffCity(Integer.valueOf(iStart).intValue(),stock_key,pro,part);
			counter = stockInfo.getProductByStockOffCity(stock_key,pro,part);
		}
	}
	else {
		if(stock_key.equals("") || stock_key == null){
			stockList = stockInfo.getProductByOff(Integer.valueOf(iStart).intValue(),pro,city,part);
			counter = stockInfo.getProductByOff(pro,city,part);
		}else{
			stockList = stockInfo.getProductByStock(Integer.valueOf(iStart).intValue(),stock_key,pro,city,part);
			counter = stockInfo.getProductByStock(stock_key,pro,city,part);
		}
	}
	String pageTools = tools.getGoogleToolsBar(counter, "searchStockList.jsp?counter="+counter+"&iStart=", Integer.parseInt(iStart),10);
	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title><bean:message key="str2265"/></title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="quoted.js"></script>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

#login {
	position: relative;
	display: none;
	top: 20px;
	left: 30px;
	background-color: #ffffff;
	text-align: center;
	border: solid 1px;
	padding: 10px;
	z-index: 1;
}
-->
</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="DCDCDC">
			<tr>
				<td height="29" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
					&nbsp;&nbsp;<bean:message key="str2253"/>
					<a href="/zone_b2b/"><bean:message key="str1147"/></a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<a href="/zone_b2b/stock/"><bean:message key="str1510"/></a> 
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<bean:message key="str5047"/>
				</td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="740" valign="top">
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr align="middle">
							<td width="134" height="32" align="center" background="/zone_b2b/images/sup_05.gif">
								<bean:message key="str5088"/>
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								<img src="/zone_b2b/images/sup_08.gif" align="middle">
							</td>
						</tr>
					</table>
					<!--供应列表-->
					<table height="300" border="0" cellpadding="0" cellspacing="0" valign="top" width="736">
						<tr>
							<td height="200" valign="top" bgcolor="FFFFFF">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFC367">
									<tr>
										<td valign="top" bgcolor="FFFFFF">
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="24%" height="30">
														<img src="/zone_b2b/images/jiantou.gif" width="20" height="17">
													<td width="34%" class="STYLE2">
														<bean:message key="str5089"/>
													</td>
													<td width="13%" class="STYLE2">
														<bean:message key = "str2256"/>
													</td>
													<td width="13%" class="STYLE2">
														<bean:message key="str2151"/>
													</td>
													<td width="16%" class="STYLE2">
														<bean:message key="str2152"/>
													</td>
												</tr>
												<tr>
													<td height="1" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
											</table>
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
											<%	
						 		        		if (stockList != null && stockList.size() > 0) {
						 		        		for (Iterator it = stockList.iterator(); it.hasNext();) {
						 		        			HashMap map = (HashMap) it.next();
						 		        			String stock_id = "", title = "", content = "", cust_name = "", start_date="", end_date = "", stock_addr = "";
						 		        			if (map.get("stock_id") != null) {stock_id = map.get("stock_id").toString();}
						 		        			if (map.get("title") != null) {title = map.get("title").toString();}
						 		        			if (map.get("content") != null) {content = map.get("content").toString();
						 		        				 content=content.replaceAll("<[^<>]+>","");
						 		        				if(content.length()>30){content = content.substring(0,30)+"..";}
						 		        			}
						 		        			if (map.get("cust_name") != null) {cust_name = map.get("cust_name").toString();}
						 		        			if (map.get("start_date") != null) {start_date = map.get("start_date").toString();
						 		        				if(start_date.length()>10){start_date = start_date.substring(0,10);}
						 		        			}
						 		        			if (map.get("end_date") != null) {end_date = map.get("end_date").toString();
						 		        				if(end_date.length()>10){end_date = end_date.substring(0,10);}
						 		        			}
						 		        			if (map.get("stock_addr") != null) {stock_addr = map.get("stock_addr").toString();}
						 		        			String file_path="";
												     if(map.get("file_path")!=null){
												       file_path=map.get("file_path").toString();
												       file_path=file_path.substring(23);
													}else{
													file_path=defaultImg;
													}
						 		        	%>
												<tr>
													<td width="18%" height="130">
														<a href="stockInquiry.jsp?stock_id=<%=stock_id%>" target="_blank" class="cpbt"><img  src="<%=file_path%>" width="100" height="100" alt="" /></a>
													</td>
													<td width="40%">
														<a href="/zone_b2b/stock/sendInquiryInfo.jsp?stock_id=<%=stock_id%>" target=_blank class="cpbt"><%=title%></a> 
														<br>
														<%=cust_name%>&nbsp;<%=start_date%>
														<br>
														<%=content%>
													</td>
													<td width="13%">
														<%=end_date%>
													</td>
													<td width="13%">
														<%=stock_addr%>
													</td>
													<td width="16%">
														<a href="/zone_b2b/stock/sendInquiryInfo.jsp?stock_id=<%=stock_id%>" target=_blank><img src="/zone_b2b/images/zx.gif" width="75" height="21">
														</a><img src="/zone_b2b/images/msn.gif" width="16" height="16">
													</td>
												</tr>
												<tr>
													<td height="1" colspan="2" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
													<%
											   		}
											   	}
											   	%>
											</table>
										</td>
									</tr>
								</table>
								<table width="732" border="0" cellpadding="0" cellspacing="0"0 height="22">
									<tr>
										<td height="10"></td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="E3E3E3">
									<tr>
										<td height="32" align="center" background="/zone_b2b/images/btt1.gif"><%=pageTools%></td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0"0>
									<tr>
										<td height="10"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				<td valign="top">
					&nbsp;
				</td>
				<td width="228" valign="top"><jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp" />
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>