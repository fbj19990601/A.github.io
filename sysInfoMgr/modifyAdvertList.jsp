<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.advertiseMgr.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
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
	ParamethodMgr comparList = new ParamethodMgr();
	HashMap adv_Map = comparList.getCompareInfoByCode("CRM", "adv_type");
	HashMap rang_Map = comparList.getCompareInfoByCode("B2B", "adv_posit");
	/*****************************************/
	AdvertiseInfo advertList = new AdvertiseInfo();
	ArrayList linkArray = advertList.genCustAdvertise(Integer.valueOf(iStart).intValue(), cust_id);
	int counter = advertList.getAdvertNumber(cust_id);
	String pageTools=tools.getPageTools(String.valueOf(counter),"20","modifyAdvertIndex.jsp?iStart=",Integer.parseInt(iStart));
	
%>
<html>
	<head>
		<meta name="Generator" content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str150"/>!!!!!!</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid; font-weight:bold; background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.td{background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;}
		</style>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
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
		<table width="727" border="0" cellspacing="0" cellpadding="0" align=center>
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td>
					<table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr class="line1">
							<td  align="center" class="line1" width="15%"><bean:message key="str151"/></td>
							<td  align="center" width="15%"><bean:message key="str152"/></td>
							<td  align="center" width="15%"><bean:message key="str153"/></td>
							<td  align="center" width="15%"><bean:message key="str154"/></td>
							<td  align="center" width="15%"><bean:message key="str155"/></td>
							<td  align="center" width="10%"><bean:message key="str156"/></td>
							<td  align="center" width="10%"><bean:message key="str157"/></td>
						</tr>
						<%
						if(linkArray != null && linkArray.size() > 0) {
							for(int i=0;i<linkArray.size();i++) {
								HashMap map = (HashMap) linkArray.get(i);
								String adv_id = map.get("adv_id").toString();
								String start_date = "",adv_type="";
								String end_date = "",own_range="";
								if(map.get("show_no") != null) {
								   start_date = map.get("show_no").toString();
								}
								if(map.get("adv_type") != null) {
								    adv_type = map.get("adv_type").toString();
									if (adv_Map.get(adv_type)!=null) {
										adv_type =adv_Map.get(adv_type).toString();
									}
								}
								if(map.get("own_range") != null) {
								    own_range = map.get("own_range").toString();
									if (rang_Map.get(own_range)!=null) {
										own_range =rang_Map.get(own_range).toString();
									}
								}
								if(map.get("end_date") != null){
								  end_date = map.get("end_date").toString();
								  if(end_date.length() > 10) {
									end_date = end_date.substring(0, 10);
								   }
								}
									%>
									<tr style="background-color:#f9f9f9; ">
										<td style=" color:#000000;" align="left"><%=adv_type%></td>
										<td style=" color:#000000;" align="left"><%=own_range%></td>
										<td style=" color:#000000;" align="center"><%=start_date%></td>
										<td style=" color:#000000;" align="center"><%=end_date%></td>
										<td style=" color:#000000;" align=center>
											<a href="viewAdvertInfo.jsp?adv_id=<%=adv_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/view.gif width=16 height=16 border=0 alt="Show  information"></a>
										</td>
										<td style=" color:#000000;" align=center>
											<a href="modifyAdvertInfo.jsp?adv_id=<%=adv_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="Update information"></a>
										</td>
										<td style=" color:#000000;" align=center>
											<a href="/doTradeReg.do?adv_id=<%=adv_id%>&trade_type_code=0308" target="_self" onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="Delete information"></a>
										</td>
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
				</td>
			</tr>
		</table>
	</body>
</html>
