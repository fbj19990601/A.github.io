<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.newsMgr.NewsInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "1";
	String news_types = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("news_type") != null) {
		news_types = request.getParameter("news_type");
	}
	String str1 = "";
	ArrayList classlist = bean.getClassByUpId();
	if (classlist != null && classlist.size() > 0) {
		String class_name = "", class_id = "";
		for (int a = 0; a < classlist.size(); a++) {
			HashMap class_map = (HashMap) classlist.get(a);
			if (class_map.get("class_name") != null) {
		class_name = class_map.get("class_name").toString();
			}
			if (class_map.get("class_id") != null) {
		class_id = class_map.get("class_id").toString();
			}
			str1 += "<option value=" + class_id + ">" + class_name
			+ "</option>";
		}
	}
	out.println("-------------------------->"+news_types);
	NewsInfo newsObj = new NewsInfo();
	ArrayList newsList = newsObj.getNewsListByCustId(Integer.valueOf(
			iStart).intValue(), cust_id, news_types);
	int counter = newsObj.getNewsListByCustId(cust_id, news_types);
	String pageTools = tools.getPageTools(String.valueOf(counter),
			"20", "modityNewsIndex.jsp?news_type="+news_types+"&iStart=", Integer
			.parseInt(iStart));
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid;
	background-color: #fff8ee;
	text-align: left;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #000000;
	margin-top: 13px;
}  /*横栏样式6---- 头部提醒1*/
.line6 .img {
	width: 53px;
	height: 53px;
	float: left;
	margin-right: 20px;
}
.line6 .title {
	font-size: 14px;
	font-weight: bold;
	color: #ff5400;
}
.line1 {
	border-left: #ff7300 3px solid;
	background-color: #e2e2e2;
	color: #333333;
	text-align: left;
	font-size: 12px;
} /*横栏样式1*/
</style>
		<script language="javascript">
  function checkRaleType(type){
  	if(type!="0"){
	       document.relationForm.submit();
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
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td height="13" background="/images/kehu_list_17.gif" align="left">
					<form name="relationForm" id="relationForm" action="modityNewsIndex.jsp" method="post">
						<bean:message key="str750"/>
						<select name="news_type" id="news_type" onchange="checkRaleType(this.value)">
							<option value="0">
								<bean:message key="str318"/>
							</option>
							<%=str1%>
						</select>
					</form>
				</td>
			</tr>
			<table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
				<tr>
					<td width="2" background="/images/kehu_list_03.gif" height="8"></td>
					<td width="704" background="/images/kehu_list_04.gif" height="8"></td>
					<td width="2" background="/images/kehu_list_06.gif" height="8"></td>
				</tr>
			</table>
			<tr>
				<td>
					<table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="30%">
								<bean:message key="str319"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str320"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str321"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str322"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str323"/>
							</td>
						</tr>
						<%
								if (newsList != null && newsList.size() > 0) {
								for (Iterator it = newsList.iterator(); it.hasNext();) {
									HashMap map = (HashMap) it.next();
									String news_id = map.get("news_id").toString();
									String title = "";
									String class_name = "";
									String publish_date = "";
									if (map.get("title") != null) {title = map.get("title").toString();}
									if (map.get("news_type") != null) {class_name = map.get("news_type").toString();
										ArrayList list = bean.genUpclassByClassId(class_name);
										if (list != null && list.size() > 0) {
											HashMap claMap = (HashMap) list.get(0);
											if (claMap.get("class_name") != null) {
												class_name = claMap.get("class_name").toString();
											}
										}
									}
									if (map.get("publish_date") != null) {
										publish_date = map.get("publish_date").toString();
										if (publish_date.length() > 10) 
											publish_date = publish_date.substring(0, 10);
									}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align=left>
								<a href="viewNewsInfo.jsp?news_id=<%=news_id%>" title=<%=title%> TARGET=appwin onclick="mydefss()"><%=title%></a>
							</td>
							<td style="color: #000000;" align=center><%=class_name%></td>
							<td style="color: #000000;" align=center><%=publish_date%></td>
							<td style="color: #000000;" align=center>
								<a href="modifyNewsInfo.jsp?news_id=<%=news_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="Information edit information"> </a>
							</td>
							<td style="color: #000000;" align=center>
								<a href="/doTradeReg.do?news_id=<%=news_id%>&trade_type_code=0291" target="_self"><img src=/img/del.gif width=16 height=16 border=0 alt="Delete information information"> </a>
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