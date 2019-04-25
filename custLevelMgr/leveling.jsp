<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.custMgr.CustClass"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	String meun_idx = "";
	String iStart = "1";
	if (request.getParameter("iStart") != null) 
	{
		iStart = request.getParameter("iStart");
	}
	CustClass level=new CustClass();
	Custinfo custEntity = new Custinfo();
	ArrayList custArray = custEntity.getCustListByState(Integer.valueOf(iStart).intValue(), "0");
	int counter = custEntity.getCustStateNumber("0");
	String pageTools=tools.getPageTools(String.valueOf(counter),"30","index.jsp?iStart=",Integer.parseInt(iStart));
%>
<html>
	<head>
		<meta name="Generator" content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str182"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:center; font-size:12px;}  /*横栏样式1*/
			h1 {float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
		</style>
	</head>
 
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
	<body>
		<table width="727" border="0" cellpadding="2" cellspacing="1"
			align="center" bgcolor="#e7e7e7">
			<tr>
				<td class="line1"style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"align="center"  width="30%">
					<bean:message key="str195"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%">
					<bean:message key="str371"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%">
					<bean:message key="str372"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="25%">
					<bean:message key="str373"/>
				</td>
				<td
					style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"align="center" width="10%">
					<bean:message key="str156"/>
				</td>
			</tr>
			<%
			    if (custArray != null && custArray.size() > 0) 
			    {
						for (Iterator inIt = custArray.iterator(); inIt.hasNext();) 
						{
							HashMap map = (HashMap) inIt.next();
							String cust_id = "";
							String cust_name = "",cust_type="";
							String phone = "";
							String cust_addr = "";
							cust_id = map.get("cust_id").toString();
							cust_name = map.get("cust_name").toString();
							if (map.get("group_contact_phone") != null) 
							{
						      phone = map.get("group_contact_phone").toString();
							}
							if (map.get("company_address") != null) 
							{
						      cust_addr = map.get("company_address").toString();
							}
							cust_type = level.cust_Class_Name( cust_id );
					%>
					<tr style="background-color:#f9f9f9; ">
						<td style=" color:#000000;" align="left"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%></a></td>
						<td style=" color:#000000;" align="left"><%=cust_type%></td>
						<td style=" color:#000000;" align="left"><%=phone%></td>
						<td style=" color:#000000;" align="left"><%=cust_addr%></td>
						<td style=" color:#000000;" align=center><a href="modifyRelation.jsp?cust_id=<%=cust_id%>" TARGET=appwin onclick="mydefss()"  onClick="return chechIfo()"><img src=/img/edit.gif width=16 height=16 border=0></a></td>
					</tr>
					<%
					}
					%>
					<tr>
					 <%=pageTools%>
					</tr>
					<%
			}
			%>
		</table>
	<body>
</html>
