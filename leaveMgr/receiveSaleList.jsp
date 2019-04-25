<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.enquirytrackMgr.EnquirytrackInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
   HttpSession  logsession = request.getSession(); 
    String user_id = "";
    String iStart ="0";
    String meun_idx="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
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
  EnquirytrackInfo enquiryObj=new EnquirytrackInfo();
  ArrayList newsList = enquiryObj.getSaleListByUser(Integer.valueOf(iStart).intValue(),user_id);
  // ParamethodMgr paramObj=new ParamethodMgr();
  //HashMap typeMap=paramObj.getCompareInfoByCode("CRM","news_type");
    int counter=enquiryObj.getSaleNumberByUser(user_id);
    int pages=counter/30+1;
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
<title><bean:message key="str116"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
</head>
<body>

<%
 if(newsList == null || newsList.size()<1)
 {   
	  %>
		  <div class="line6">
				 <div class="img"><img src="/images/icon3_manager_rightbody.gif" /></div>
				   <span class="title"><bean:message key="str680"/></span><br />                  
		  </div>
	  <%
 }
%>

	<table width="727" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13"></td>
	  </tr>
	  <tr>
	    <td>
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="25%"><bean:message key="str691"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%"><bean:message key="str682"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str683"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str684"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str685"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%" ><bean:message key="str686"/></td>
		        </tr>
		        <%
		            if(newsList != null && newsList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = newsList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String trade_id=map.get("trade_id").toString();
						        String title="";
						        String user_name="";
						        String enquiry_content="";
						        String enquiry_date="";
						        String deal_tag="";
						        if(map.get("title")!=null)
						        {
						         title=map.get("title").toString();
						        }
						         if(map.get("user_name")!=null)
						        {
						         user_name=map.get("user_name").toString();
						        }
						        if(map.get("enquiry_content")!=null)
						        {
						          enquiry_content=map.get("enquiry_content").toString();
						          if(enquiry_content.length()>30)
						          {
						             enquiry_content=enquiry_content.substring(0,30)+"...";
						          }
						         }
						         if(map.get("enquiry_date")!=null)
						        {
						          enquiry_date=map.get("enquiry_date").toString();
						          if(enquiry_date.length()>10)
						          {
						             enquiry_date=enquiry_date.substring(0,10);
						          }
						         }
						         if(map.get("deal_tag")!=null)
						        {
						          deal_tag=map.get("deal_tag").toString();
						          deal_tag=deal_tag.equals("0")?"Untreated":"Have been processed";
						        }
						        %>
						        
						        <tr  style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000;" align=left><%=title%></td>
					              <td  style=" color:#000000;" align=left><%=enquiry_content%></td>
					              <td  style=" color:#000000;" align=left><%=user_name%></td>
					              <td  style=" color:#000000;" align=left><%=enquiry_date%></td>
					              <td  style=" color:#000000;" align=left><%=deal_tag%></td>
					              <td  style=" color:#000000;" align=center><a href=trackLevelInfo.jsp?trade_id=<%=trade_id%> target=blank><img src=/img/del.gif width=16 height=16 border=0></a></td>
					            </tr>
					            
						        <%i++;
					     }
					     %>
					     
					     <tr>
							<td  align="left" colspan="2"  class="line1" style="font-weight:normal;"><bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/></td>
							<td  align="left" colspan="3"><a href="receivSaleIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str613"/> </a>&nbsp; &nbsp;<a href="receivSaleIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str614"/></a> &nbsp;<a href="receivSaleIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str615"/> </a>&nbsp; <a  href="receivSaleIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str616"/></a></td>
				         </tr>
					     
					     <%
		            }
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>