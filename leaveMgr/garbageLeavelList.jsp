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
  ArrayList newsList = enquiryObj.getGarbageListByUser(Integer.valueOf(iStart).intValue(),user_id);
  // ParamethodMgr paramObj=new ParamethodMgr();
  //HashMap typeMap=paramObj.getCompareInfoByCode("CRM","news_type");
    int counter=enquiryObj.getGarbageNumber(user_id);
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
.line5 {width:727px; width:707px!important;border:#ffdf81 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px;}   /*横栏样式5---- 底部提醒1*/
</style>
<script language="javascript">
  function chechIfo()
  {
	   if(confirm('Confirm the deletion of messages？')) 
	{
		return true;
	}
	else
	{
		return false;
	}
  }
</script>
</head>
<body>
	<table width="727" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13"></td>
	  </tr>
	  <tr>
	    <td>
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
					<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="70%"><bean:message key="str682"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str684"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%" ><bean:message key="str689"/></td>
		        </tr>
		        <%
		            if(newsList != null && newsList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = newsList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String trade_id=map.get("trade_id").toString();
						        String enquiry_content="";
						        String enquiry_date="";
						        if(map.get("enquiry_content")!=null)
						        {
						           enquiry_content=map.get("enquiry_content").toString();
						        }
						        if(map.get("enquiry_date")!=null)
						        {
						           enquiry_date=map.get("enquiry_date").toString();
						           if(enquiry_date.length()>10)
						           {
						             enquiry_date=enquiry_date.substring(0,10);
						           }
						        }
						        %>
						        <tr  style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					             <td  style=" color:#000000;" align=center><%=enquiry_content%></td>
					             <td  style=" color:#000000;" align=center><%=enquiry_date%></td>
					             <td  style=" color:#000000;" align=center><a href=/doTradeReg.do?trade_id=<%=trade_id%>&trade_type_code=0503 target="_self"  onClick="return chechIfo()"><img src=/img/edit.gif width=16 height=16 border=0></a></td>
					            </tr>
					            
						        <%i++;
					     }
					     %>
					     
					     <tr>
							<td  align="left" class="line1" style="font-weight:normal;">total <%=counter%> <bean:message key="str611"/>  &nbsp;total <%=pages%><bean:message key="str1029"/></td>
							<td  align="left" colspan="3"><a href="garbageLeavelIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"> <bean:message key="str1030"/> </a>&nbsp; &nbsp;<a href="garbageLeavelIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;<a href="garbageLeavelIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str1032"/>  </a>&nbsp; <a  href="garbageLeavelIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>
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
    <div class="line5"><img src="/images/icon4_manager_rightbody.gif" />Important: The delete spam messages can not be able to resume ！</div>
                                      </div>
</body>
</html>