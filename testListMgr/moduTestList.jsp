<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.testListMgr.TestListInfo"%>
<%
	HttpSession  logsession = request.getSession(); 
    String iStart ="0";
    String meun_idx="";
    String cust_id="";
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
        logsession.setAttribute("menu_id",meun_idx);
    }
    
    TestListInfo testInfo = new TestListInfo();
    ArrayList valueList=testInfo.getAllTestList(Integer.parseInt(iStart),cust_id);
	int counter= testInfo.getAllTestList(cust_id);
	
	//out.print(valueList);
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
	
%>
<html>
	<head>
		<title><bean:message key="str4144"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script src="/www/fuction/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="/www/fuction/public.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript"  src="/js/Calendar_Ly.js"></script>
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
				<td height="2"></td>
			</tr>
			
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%">
								<bean:message key="str4062"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
								<bean:message key="str4063"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%">
								<bean:message key="str4064"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
								<bean:message key="str4065"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
								<bean:message key="str4066"/>
							</td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
							  	<bean:message key="str1769"/>
							</td>
						</tr>
						<%
						 if(valueList !=null && valueList.size()>0){
						   for(int i=0;i<valueList.size();i++){
						     HashMap map=(HashMap)valueList.get(i);
						     String test_month="",test_date="",test_value="",cust_name="";
						     String test_name="",test_id="",obj_cust_id="";
						     if(map.get("test_month")!=null){test_month=map.get("test_month").toString();}
						     if(map.get("test_date")!=null){test_date=map.get("test_date").toString();}
						     if(test_month.length()>10){
						      test_month=test_month.substring(0,10);
						     }
						     if(test_date.length()>10){
						      test_date=test_date.substring(0,10);
						     }
						     if(map.get("test_value")!=null){test_value=map.get("test_value").toString();}
						     if(map.get("cust_name")!=null){cust_name=map.get("cust_name").toString();}
						     if(map.get("test_name")!=null){test_name=map.get("test_name").toString();}
						     if(map.get("test_id")!=null){test_id=map.get("test_id").toString();}
						     if(map.get("obj_cust_id")!=null){obj_cust_id=map.get("obj_cust_id").toString();}
						     %>
						     <tr style="background-color:#f9f9f9;">
				              <td style="color:#000000;" align="left"><%=cust_name%></td>
				              <td style="color:#000000;" align="left"><%=test_name%></td>
				              <td style="color:#000000;" align="left"><%=test_value%></td>
				              <td style="color:#000000;" align="center"><%=test_month%></td>
				              <td style="color:#000000;" align="center"><%=test_date%></td>
				              <td style="color:#000000;" align="center"><a href="updateTestInfo.jsp?menu_id=<%=meun_idx%>&test_id=<%=test_id%>&obj_cust_id=<%=obj_cust_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="¿¼ºËÐÞ¸Ä"></a></td>
				            </tr>
						    <%
						   }
						   }
						%>
						<tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="modiTestIndex.jsp?iStart=0"> <bean:message key="str1030"/> </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="modiTestIndex.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="modiTestIndex.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/>  </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="modiTestIndex.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
											
															         </tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
