<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.indexLinkMgr.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "0";
	String meun_idx = "";
	if (request.getParameter("iStart") != null)
	{
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
	{
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null)
	{
		meun_idx = request.getParameter("menu_id");
		logsession.setAttribute("menu_id", meun_idx);
	}
	if (logsession.getAttribute("menu_id") != null)
	{
		meun_idx = (String) logsession.getAttribute("menu_id");
	}
	ParamethodMgr comparList = new ParamethodMgr();
	HashMap compMap = comparList.getCompareInfoByCode("CRM","link_type");

	/*****************************************/

	IndexlinkInfo linkList = new IndexlinkInfo();
	ArrayList linkArray = linkList.getLinkListByAll(Integer.valueOf(iStart).intValue());
	int counter = linkList.getLinkNumber();
	int pages = counter / 30 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage)
	{
		if (currenPage > 0)
		{
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	}
	else if (pages == currenPage)
	{
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
%>
<html>
	<head>
		<meta name="Generator" content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str2762"/></title>
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
	</head>
	<body>
		<div class="line6">
			<div class="img">
				<img src="/images/icon3_manager_rightbody.gif" />
			</div>
			<a href="addLinkInfo.jsp" TARGET=appwin onclick="mydefss()"><img src="/images/manager_button2.gif" style="border: 0px" />
			</a>
			<span class="title"> <bean:message key="str2763"/></span>
			<br/>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="13" background=""></td>
			</tr>
			<tr>
				<td>
					<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align="center" width="15%">
								<bean:message key="str2764"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align="left" width="25%">
								<bean:message key="str2765"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align="left" width="60%">
								<bean:message key="str2766"/>
							</td>
						</tr>
						<%
							if (linkArray != null && linkArray.size() > 0)
							{
								int i = 0;
								for (Iterator inIt = linkArray.iterator(); inIt.hasNext();)
								{
									HashMap map = (HashMap) inIt.next();
									String linkName = map.get("link_name").toString();
									String linkIdx = map.get("link_id").toString();
									String linkType = "";
									if (map.get("link_type") != null)
									{
								linkType = map.get("link_type").toString();
								if (compMap.get(linkType) != null)
								{
									linkType = compMap.get(linkType).toString();
								}
									}
									String linkDesc = "";
									if (map.get("link_desc") != null)
									{
								linkDesc = map.get("link_desc").toString();
								linkDesc = linkDesc.replaceAll("<[^<>]+>", "");
								if (linkDesc.length() > 30)
								{
									linkDesc = linkDesc.substring(0, 30);
								}
									}
						%>
						<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onMouseOver="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onMouseOut="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">

							<td style="color: #000000;" align="center"><%=linkType%></td>

							<td style="color: #000000; padding: 2px 5px;" align="left"><%=linkName%></td>

							<td style="color: #000000; padding: 2px 5px;" align="left"><%=linkDesc%></td>
						</tr>
						<%
								i++;
								}
						%>
						<tr>

							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>

							<td  align="right" colspan="3"  style=" padding:2px 5px;">
							<a href="pageIndex.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
							<% 
								if(Integer.parseInt(iStart)>0){
							%>
								<a href="pageIndex.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;
							<%
								}
								if(Integer.parseInt(iStart)<pages-1){
							%>
								<a href="pageIndex.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"> <bean:message key="str1032"/> </a>&nbsp; 
							<%
								}
							%>
							<a  href="pageIndex.jsp?iStart=<%=pages-1%>&menu_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>

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