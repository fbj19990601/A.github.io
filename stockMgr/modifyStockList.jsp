<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.stockorderMgr.Stockorderinfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "1";
	String meun_idx = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	
	Stockorderinfo stockObj = new Stockorderinfo();
	ArrayList stockList = stockObj.getStockListByAll(Integer.valueOf(iStart).intValue(), cust_id);
	int counter = stockObj.getStockListNumber(cust_id);
  String pageTools=tools.getPageTools(String.valueOf(counter),"30","modifyIndex.jsp?iStart=",Integer.parseInt(iStart));
%>
<html>
	<head>
		<title><bean:message key="str150"/></title>
		<script language="javascript">
  function chechIfo()
  {
	   if(confirm('Confirm the deletion of records£¿')) 
	{
		return true;
	}
	else
	{
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
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
						<tr>
							<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%">
								<bean:message key="str389"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
								<bean:message key="str381"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
								<bean:message key="str382"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%">
								<bean:message key="str156"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%">
								<bean:message key="str157"/>
							</td>
						</tr>
						<%
								if (stockList != null && stockList.size() > 0) {
								for (Iterator it = stockList.iterator(); it.hasNext();) {
									HashMap map = (HashMap) it.next();
									String stock_id = map.get("stock_id").toString();
									String title = "";
									String end_date = "";
									String stock_addr = "";
									if (map.get("title") != null) {
								       title = map.get("title").toString();
									}
									if (map.get("end_date") != null) {
										end_date = map.get("end_date").toString();
										if (end_date.length() > 10) {
											end_date = end_date.substring(0, 10);
										}
									}
									if (map.get("stock_addr") != null) {
								       stock_addr = map.get("stock_addr").toString();
									}
						%>
						<tr style="background-color:#f9f9f9; ">
							<td style=" color:#000000; padding:3px 5px;" align="left">
								<a href="viewStockInfo.jsp?stock_id=<%=stock_id%>" TARGET=appwin onclick="mydefss()"><%=title%>
								</a>
							</td>
							<td style=" color:#000000; padding:3px 5px;" align="left">
								<%=stock_addr%>
							</td>
							<td style=" color:#000000; padding:3px 5px;" align="center">
								<%=end_date%>
							</td>
							<td style=" color:#000000;" align="center">
								<a href=modifyStockInfo.jsp?stock_id=<%=stock_id%>&trade_type_code=0343 TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="modify procurement information">
								</a>
							</td>
							<td style=" color:#000000;" align=center>
								<a href=/doTradeReg.do?stock_id=<%=stock_id%>&trade_type_code=0345 target="_self" onClick="return chechIfo()"><img src="/img/del.gif" width=16 height=16 border=0 alt="delete procurement information">
								</a>
							</td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<%=pageTools%>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="0"></td>
			</tr>
		</table>
	</body>
</html>
