<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.stockorderMgr.Stockorderinfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>

<%
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String stock_id = "";
	String title = "";
	String content = "";
	String cust_id = "";
	String cust_name=""; 
	
	String stock_addr = "";
	String start_date = date;
	String end_date = date;
	
	if (request.getParameter("stock_id") != null)
	 {
		stock_id = request.getParameter("stock_id");
	}
	Stockorderinfo stockObj = new Stockorderinfo();
	ArrayList stockList = new ArrayList();
	
	if (stock_id != null && !stock_id.equals(""))
	 {
		stockList = stockObj.genOneStockorder(stock_id);
		if (stockList != null && stockList.size() > 0) 
		{
			HashMap map = (HashMap) stockList.get(0);
			stock_id = map.get("stock_id").toString();
			if (map.get("title") != null) 
			{
				title = map.get("title").toString();
			}
			if (map.get("content") != null) 
			{
				content = map.get("content").toString();
			}
			
			if (map.get("cust_id") != null) 
				{
					cust_id = map.get("cust_id").toString();
					Custinfo custInfo = new Custinfo();
					ArrayList list = new ArrayList(); 
					HashMap map1 = new HashMap();
					list = custInfo.genSpecCustInfo(cust_id);
					if (list != null && list.size() > 0)
					{
						  map1 = (HashMap) list.get(0);
						  cust_name = map1.get("cust_name").toString();
					}
				}
			
			if (map.get("stock_addr") != null) 
			{
				stock_addr = map.get("stock_addr").toString();
			}
			if (map.get("start_date") != null)
			 {
				start_date = map.get("start_date").toString();
				if (start_date.length() > 10)
				 {
					start_date = start_date.substring(0, 10);
				}
			}
			if (map.get("end_date") != null) 
			{
				end_date = map.get("end_date").toString();
				if (end_date.length() > 10) 
				{
					end_date = end_date.substring(0, 10);
				}
			}
		}
	}
%>
<html>
	<head>
		<title><bean:message key="str3924"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript">
    	function exit()
    	{
    	    window.close();
    	}
      </script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="26">&nbsp;</td>
			</tr>
			<tr>
				<td >
					<table width=93% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td class="line1" align="left" colspan="2">
								<bean:message key="str375"/>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
								<bean:message key="str376"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=85%>
								<%=title%>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right valign="top">
								<bean:message key="str377"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<%=content%>
							</td>
						</tr>
						
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right valign="top">
								<bean:message key="str378"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<%=cust_name%>
							</td>
						</tr>
						
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str386"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<%=stock_addr%>
							</td>
						</tr>
						
						
						
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str705"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<%=start_date%>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str706"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<%=end_date%>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px; padding-top:10px;padding-bottom:10px;" align="center" colspan="2">
							&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="12px">&nbsp;</td>
			</tr>
		</table>
	</body>
</html>

