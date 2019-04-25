<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.validityMgr.ValidityInfo"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	String iStart = "1";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	
	String info_types = bean.getSelectItems("106");
	String infomation_type="";
	if (request.getParameter("info_type") != null) {
		infomation_type = request.getParameter("info_type");
	}
	
	ValidityInfo validty = new ValidityInfo();
	ArrayList linkArray = validty.getValidityList(Integer.valueOf(iStart).intValue(),infomation_type,"0");
	int counter = validty.getValidityCount(infomation_type,"0");
	String pageTools=tools.getPageTools(String.valueOf(counter),"20","validityList.jsp?info_type="+infomation_type+"&iStart=",Integer.parseInt(iStart));
	HashMap commap=param.getPagetUrlByCode("106");
%>
<html>
	<head>
		<title><bean:message key="str182"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid;
	font-weight: bold;
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
}  /*横栏样式1*/
.td {
	background-color: #e2e2e2;
	color: #000000;
	font-weight: bold;
	font-size: 13px;
}
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
      <script type="text/javascript">
      function checkRaleType(type){
	    if(type!="0"){
	       document.relationForm.submit();
	    }
	  }
      </script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align=center>
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td height="13" background="/images/kehu_list_17.gif" align="left">
					<form name="relationForm" id="relationForm" action="validityList.jsp" method="post">
						<bean:message key="str317"/>
						<select name="info_type" id="info_type" onchange="checkRaleType(this.value)">
							<option value="0">
								<bean:message key="str318"/>
							</option>
							<%=info_types%>
						</select>
						<input type="hidden" name="code" id="code" value="0">
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
						<tr class="line1">
							<td align="center" class="line1" width="25%">
								<bean:message key="str175"/>
							</td>
							<td align="center" width="15%">
								<bean:message key="str194"/>
							</td>
							<td align="center" width="25%">
								<bean:message key="str195"/>
							</td>
							<td align="center" width="15%">
								<bean:message key="str196"/>
							</td>
							<td align="center" width="10%">
								<bean:message key="str197"/>
							</td>
						</tr>
						<%
						if(linkArray != null && linkArray.size() > 0) 
						{
							for(int i=0;i<linkArray.size();i++) 
							{
								HashMap map = (HashMap) linkArray.get(i);
								String title="",info_type="",cust_id="",cust_name="",oper_date="";
								String quo_id="",type="",page_Url="",trade_id="";
								if(map.get("trade_id")!=null){trade_id=map.get("trade_id").toString();}
								if(map.get("quo_id")!=null){quo_id=map.get("quo_id").toString();}
								if(map.get("rsrv_str10")!=null){title=map.get("rsrv_str10").toString();}
								if(map.get("cust_name")!=null){cust_name=map.get("cust_name").toString();}
								if(map.get("cust_id")!=null){cust_id=map.get("cust_id").toString();}
								if(map.get("info_type")!=null){type=map.get("info_type").toString();info_type=param.getParamNameByValue("106",type);}
								if(map.get("oper_date")!=null){oper_date=map.get("oper_date").toString();}	
								if (oper_date.length() > 10) {oper_date = oper_date.substring(0, 10);}
								if(commap!=null && commap.size()>0){
								  if(commap.get(type)!=null){ 
								    page_Url=commap.get(type).toString();
								    page_Url=page_Url+quo_id;
								  }
								}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left">
								<a href="<%=page_Url%>" TARGET=appwin onclick="mydefss()"><%=title%> </a>
							</td>
							<td style="color: #000000;" align="center">
								<%=info_type%>
							</td>
							<td style="color: #000000;" align="left">
								<a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%> </a>
							</td>
							<td style="color: #000000;" align="center">
								<%=oper_date%>
							</td>
							<td style="color: #000000;" align=center>
								<a href="auditValidity.jsp?trade_id=<%=trade_id%>&info_type=<%=type%>&quo_id=<%=quo_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="进行审核"> </a>
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