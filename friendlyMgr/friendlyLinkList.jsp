<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.custlinkMgr.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
      ParamethodMgr comparList=new ParamethodMgr();
	  HashMap compMap=comparList.getCompareInfoByCode("CRM","link_type");
	  CustlinkInfo  linkList=new CustlinkInfo();
	  ArrayList linkArray = linkList.getCustLinkListByAll(Integer.valueOf(iStart).intValue(),cust_id);
	  int counter=linkList.getLinkNumber(cust_id);
      int pages=counter/30+1;
	 int pageUp=0,pageDown=0;
	 int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
				pageUp=currenPage-1;
				if( pageUp == 0 )
				 	pageUp = 1;
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

<title><bean:message key="str182"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
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
	<br>
	 <div class="line6">
           <div class="img"><img src="/images/icon3_manager_rightbody.gif" border="0"/></div>
             <a href="addLinkInfo.jsp" TARGET=appwin onclick="mydefss()"><img src="/images/manager_button2.gif" border="0"/></a>
           <span class="title"><bean:message key="str5115"/></span><br />
      </div>
	<table width="727" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="26">&nbsp;</td>
	  </tr>
	  <tr>
	    <td>
		     <table width="727" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td  class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="35%"><bean:message key="str1345"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str1346"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="45%"><bean:message key="str1347"/></td>
		        </tr>
		        <%
					if(linkArray != null  && linkArray.size()>0)
					{
						int i=0;
						for (Iterator inIt = linkArray.iterator(); inIt.hasNext();)
					    {
						    HashMap map = (HashMap) inIt.next();
						    String link_no=map.get("link_no").toString();
						   	String linkName=map.get("link_name").toString();
							String linkType="";
							if(map.get("link_type") != null)
							{
							   linkType=map.get("link_type").toString();
							   if(compMap.get(linkType) !=null)
							   {
							     linkType=compMap.get(linkType).toString();
							   }
							}
							String link_url="";
							if(map.get("link_url") != null)
							{
							  link_url=map.get("link_url").toString();
							}
							%>
							<tr style="background-color:#f9f9f9; ">
			        			<td style="color:#000000;" align="left"><a href="viewLinkInfo.jsp?link_no=<%=link_no%>"  TARGET=appwin onclick="mydefss()"><%=linkName%></a></td>
								<td style="color:#000000;" align="center"><%=linkType%></td>
								<td style=" color:#000000;" align="left"><html:link href="<%=link_url%>"><%=link_url%></html:link></td>
					        </tr>
							<%i++;
						}
						%>
						<tr class="line1">
							<td  align="left" colspan="2" ><bean:message key="str3988"/><%=counter%> <bean:message key="str1144"/>&nbsp;<bean:message key="str1143"/><%=pages%><bean:message key="str1146"/></td>
							<td  align="right"><a href="friendlyIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str1147"/> </a>&nbsp; &nbsp;<a href="friendlyIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1148"/></a> &nbsp;<a href="friendlyIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str1149"/> </a>&nbsp; <a  href="friendlyIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1150"/></a></td>
				         </tr>
						<%
					}
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	</table>
</body>
</html>