<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.advertiseMgr.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
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
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
		logsession.setAttribute("menu_id", meun_idx);
	}
	if (logsession.getAttribute("menu_id") != null) {
		meun_idx = (String) logsession.getAttribute("menu_id");
	}
	ParamethodMgr comparList = new ParamethodMgr();
	HashMap adv_Map = comparList.getCompareInfoByCode("CRM", "adv_type");
	HashMap rang_Map = comparList.getCompareInfoByCode("CRM", "own_range");
	/*****************************************/
	AdvertiseInfo advertList = new AdvertiseInfo();
	ArrayList linkArray = advertList.genCustAdvertise(Integer.valueOf(iStart).intValue(), cust_id);
	int counter = advertList.getAdvertNumber(cust_id);
	int pages = counter / 30 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage)
	{
		if (currenPage > 0) 
		{
			pageUp = currenPage - 1;
			if( pageUp == 0 )
				pageUp = 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
%>
<html>
	<head>
		<meta name="Generator" content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str116"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid; font-weight:bold; background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*������ʽ6---- ͷ������1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*������ʽ1*/
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
							<td  align="center" class="line1" width="15%"><bean:message key="str1876"/></td>
							<td  align="center" width="15%"><bean:message key="str152"/></td>
							<td  align="center" width="15%"><bean:message key="str425"/></td>
							<td  align="center" width="15%"><bean:message key="str426"/></td>
							<td  align="center" width="15%"><bean:message key="str2561"/></td>
							<td  align="center" width="10%"><bean:message key="str156"/></td>
							<td  align="center" width="10%"><bean:message key="str323"/></td>
						</tr>
						<%
						if(linkArray != null && linkArray.size() > 0) {
							for(int i=0;i<linkArray.size();i++) {
								HashMap map = (HashMap) linkArray.get(i);
								String adv_id = map.get("adv_id").toString();
								String start_date = "",adv_type="";
								String end_date = "",own_range="";
								if(map.get("start_date") != null) {
								   start_date = map.get("start_date").toString();
									if (start_date.length() > 10) {
										start_date = start_date.substring(0, 10);
									}
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
											<a href="viewAdvertInfo.jsp?adv_id=<%=adv_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/view.gif width=16 height=16 border=0 alt="�鿴�����Ϣ"></a>
										</td>
										<td style=" color:#000000;" align=center>
											<a href="modifyAdvertInfo.jsp?adv_id=<%=adv_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="�޸Ĺ����Ϣ"></a>
										</td>
										<td style=" color:#000000;" align=center>
											<a href="/doTradeReg.do?adv_id=<%=adv_id%>&trade_type_code=0308" target="_self" onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="ɾ�������Ϣ"></a>
										</td>
									</tr>
									<%
								}
						%>
						<tr>
							<td align="left" class="line1" colspan="3" style="font-weight:normal;"><bean:message key="str610"/><%=counter%><bean:message key="str1028"/> &nbsp;<bean:message key="str1027"/><%=pages%><bean:message key="str1029"/></td>
							<td align="right" class="td" colspan="4"><a href="modifyAdvertIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str1030"/></a>&nbsp; &nbsp;
							  <a href="modifyAdvertIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;
							  <a href="modifyAdvertIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str1032"/> </a>&nbsp;
							  <a href="modifyAdvertIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1033"/></a>
							</td>
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
