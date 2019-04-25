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
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
      ParamethodMgr comparList=new ParamethodMgr();
	 HashMap compMap=comparList.getCompareInfoByCode("CRM","link_type");
	 /*****************************************/
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
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str0987"/></title>
		<script language="javascript">
		  function chechIfo()
		  {
			   if(confirm('Confirm the deletion of records？')) 
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
		<link href="/style/css.css" rel="stylesheet" type="text/css">
        <style type="text/css">
		form {padding:0px; margin:0px;}
         .line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
         .line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
         .line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
         .line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
         </style>
	</head>
<body>  
	<table width="727" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	  <tr>
	    <td>
		     <table width="727" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="30%"><bean:message key="str1345"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str1354"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="30%"><bean:message key="str1355"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center"  width="10%" ><bean:message key="str0995"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center"  width="10%" ><bean:message key="str0996"/></td>
		        </tr>
		        <%
					if(linkArray != null  && linkArray.size()>0)
					{
						int i=0;
						for (Iterator inIt = linkArray.iterator(); inIt.hasNext();)
					    {
						    HashMap map = (HashMap) inIt.next();
						   	String linkName=map.get("link_name").toString();
							String linkIdx= map.get("link_no").toString();
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
							if(map.get("link_url") != null){
							  link_url=map.get("link_url").toString();
							}
							%>
							<tr style="background-color:#f9f9f9; ">
		        			<td  style=" color:#000000;" align="left"><a href="viewLinkInfo.jsp?link_no=<%=linkIdx%>"  TARGET=appwin onclick="mydefss()"><%=linkName%></a></td>
							<td  style=" color:#000000;" align="center" ><%=linkType%></td>
							<td  style=" color:#000000;" align="left" ><html:link href="<%=link_url%>"><%=link_url%></html:link></td>
					 		<td  style=" color:#000000;" align=center><a href=modifyLinkInfo.jsp?link_no=<%=linkIdx%>  TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="Laws Links"></a></td>
					 		<td  style=" color:#000000;" align=center><a href=/doTradeReg.do?cust_id=<%=cust_id%>&link_no=<%=linkIdx%>&trade_type_code=0299 target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="Delete Links"></a></td>
					    </tr>
							<%i++;
						}
						%>
						<tr class="line1">
							<td  align="left" colspan="2"  style="font-weight:normal;"><bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/></td>
							<td  align="right" colspan="3" ><a href="modifyIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"> <bean:message key="str613"/></a>&nbsp; &nbsp;<a href="modifyIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str614"/></a> &nbsp;<a href="modifyIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"> <bean:message key="str615"/></a>&nbsp; <a  href="modifyIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str616"/></a></td>
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