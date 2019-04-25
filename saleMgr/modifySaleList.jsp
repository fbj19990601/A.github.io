<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.saleMgr.SaleInfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "1";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	SaleInfo saleObj = new SaleInfo();
	ArrayList saleList = saleObj.gentSalesByCust_id(Integer.valueOf(iStart).intValue(), cust_id);
	int counter = saleObj.getSaleListNumber(cust_id);
	String pageTools=tools.getPageTools(String.valueOf(counter),"30","modifyIndex.jsp?iStart=",Integer.parseInt(iStart));
%>
<html>
	<head>
		<title>B2B EC-platform</title>

	</head>
	<body>
		<table width="100%" border="0" cellpadding="2" cellspacing="1" align=center bgcolor="#e7e7e7" style="margin-top:13px">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
					<bean:message key="str423"/>
				</td>
				<!--td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="40%">ÄÚÈÝ</td-->

				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str425"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str426"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%">
					<bean:message key="str424"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%">
					<bean:message key="str156"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%">
					<bean:message key="str157"/>
				</td>
			</tr>
			<%
					if (saleList != null && saleList.size() > 0) {
					for (Iterator it = saleList.iterator(); it.hasNext();) {
						HashMap map = (HashMap) it.next();
						String sale_id = map.get("sale_id").toString();
						String title = "";
						String sale_addr = "";
						String start_date = "";
						String end_date = "";
						
						if (map.get("title") != null) {
					      title = map.get("title").toString();
						}
						if (map.get("sale_addr") != null) {
					        sale_addr = map.get("sale_addr").toString();
						}
						if (map.get("start_date") != null) {
					        start_date = map.get("start_date").toString();
							if (start_date.length() > 10) {
								start_date = start_date.substring(0, 10);
							}
						}
						
						if (map.get("end_date") != null) {
					        end_date = map.get("end_date").toString();
							if (end_date.length() > 10) {
								end_date = end_date.substring(0, 10);
							}
						}
			%>
			<tr style="background-color:#f9f9f9; ">
				<td style=" color:#000000; padding:3px 5px;" align=left>
					<a href="viewsaleinfo1.jsp?sale_id=<%=sale_id%>" title=<%=title%> target="_self"><%=title%>
					</a>
				</td>
				<td style=" color:#000000; padding:3px 5px;" align=left>
					<%=start_date%>
				</td>

				<td style=" color:#000000; padding:3px 5px;" align=left>
					<%=end_date%>
				</td>
				<td style=" color:#000000; padding:3px 5px; " align=left>
					<%=sale_addr%>
				</td>
				<td style=" color:#000000;" align=center>
					<a href=modifySaleInfo.jsp?sale_id=<%=sale_id%> TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="Edit Sales Information">
					</a>
				</td>
				<td style=" color:#000000;" align=center>
					<a href=/doTradeReg.do?sale_id=<%=sale_id%>&trade_type_code=0349 target="_self" onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="Delete sales information">
					</a>
				</td> 
			</tr>
			<%}
				}
			%>
			<tr>
				<%=pageTools%>
			</tr>
		</table>
	</body>
</html>
