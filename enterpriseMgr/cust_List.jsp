<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.custMgr.Custinfo" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="tools.util.PageTools"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.base.config.ProjectConfig"%>
<%
    HttpSession logsession = request.getSession();
		String cust_id = "";
		if (logsession.getAttribute("SESSION_CUST_ID") != null) 
		{
			cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
		}
	  ParamethodMgr comparList=new ParamethodMgr();
	  HashMap compMap=comparList.getCompareInfoByCode("CRM","cust_type");
    Custinfo custEntity=new Custinfo();
 
    String iStart ="0";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    String cust_state="0";
    ArrayList custArray = custEntity.getCustListByState( Integer.parseInt(iStart),cust_state );
    int counter=custEntity.getCustStateNumber( cust_state );
    int pages=(int)counter/20 + 1;//分页数
	  int pageUp=0,pageDown=0;
	  int currenPage = Integer.valueOf(iStart).intValue();
		if( pages > currenPage )
		{
		 	if( currenPage > 0 )
		 	{
				pageUp = currenPage - 1;
			}
		  pageDown = currenPage + 1; 
		}
		else if( pages == currenPage )
		{
		 		pageUp = currenPage - 1;
		 		pageDown = currenPage;
		}
		 
%>


<html> 
	<head>
		<meta name="Generator" content ="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str182"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
			h1 {float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
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
<div class="line6">
  <div class="img"><img src="/images/icon3_manager_rightbody.gif" /></div>
    <br/><br/><span class="title"><bean:message key="str1252"/></span>
 </div>
<table width="727" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
  <tr>    
    <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="25%" align="center" width="35%"><bean:message key="str2320"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str1254"/></td> 
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str1255"/></td> 
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str1420"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str1257"/></td>
  </tr>
<%
	if(custArray != null  && custArray.size()>0)
	{
	   
		  for (int i =0; i< custArray.size(); i++)
	    {
		    HashMap map=(HashMap)custArray.get(i);
		    cust_id="";
		    String cust_name="";
		    String cust_mail="";
		    String website="";
		    String group_contact_phone="";
   	    cust_id=map.get("cust_id").toString();
   	    cust_name=map.get("cust_name").toString();
   	    if(map.get("email")!=null)
   	    {
   	      cust_mail=map.get("email").toString();
   	    }
   	    if(map.get("website")!=null)
   	    {
   	      website=map.get("website").toString();
   	    }
   	    if(map.get("group_contact_phone")!=null)
   	    {
   	      group_contact_phone=map.get("group_contact_phone").toString();
   	    }
   %>
	 <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	     <td style=" color:#000000;" align="left"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%></a></td>
	     <td style=" color:#000000;" align="center"><%=website%></td>
	     <td style=" color:#000000;" align="center"><%=group_contact_phone%></td>
	     <td style=" color:#000000;" align="center"><%=cust_mail%></td>
			 <td style=" color:#000000;" align="center">
			 	<a href="modifyRank.jsp?cust_id=<%=cust_id%>&cust_name=<%=cust_name%>" target="_self" >
			 		<img src="/img/edit.gif"  border="0"  width="16"  height="16">
			 	</a>
			 </td>
   </tr>
	<%
	 }	   
	%>
	   <tr>
			<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%> <bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
			<td  align="right" colspan="3"  style=" padding:2px 5px;">
			<a href="userInfo.jsp?iStart=0" target="_self" ><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
			<% 
				if(Integer.parseInt(iStart)>0){
			%>
				<a href="userInfo.jsp?iStart=<%=pageUp%>"  target="_self" ><bean:message key="str1031"/></a> &nbsp;
			<%
				}
				if(Integer.parseInt(iStart)<pages-1){
			%>
				<a href="userInfo.jsp?iStart=<%=pageDown%>"  target="_self" > <bean:message key="str1032"/> </a>&nbsp; 
			<%
				}
			%>
			<a  href="userInfo.jsp?iStart=<%=pages-1%>"  target="_self" ><bean:message key="str1033"/></a></td>

    </tr>
	   
	   
		<%
	}
   %>
    </table>
	<body>
</html>
