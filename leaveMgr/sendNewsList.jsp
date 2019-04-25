<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.leavewordsMgr.LeavewordsInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	 request.setCharacterEncoding("gbk");
     String start_time1 ="",end_time1 ="",code="",key_word="";
     Calendar cal = Calendar.getInstance();
     if (request.getParameter("start_time") != null) {
		start_time1 = request.getParameter("start_time");
	}
	if (request.getParameter("end_time") != null) {
		end_time1 = request.getParameter("end_time");
	}
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	if (request.getParameter("key_word") != null) {
		key_word = request.getParameter("key_word").trim();
	}
	String start_time = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String end_time = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
%>
<%
   HttpSession  logsession = request.getSession(); 
    String suser_name = "";
    String iStart ="0";
    String meun_idx="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_USER_NAME") != null)
    {
        suser_name = logsession.getAttribute("SESSION_USER_NAME").toString();
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
  LeavewordsInfo enquiryObj=new LeavewordsInfo();
  int counter = 0 ;
  ArrayList newsList = new ArrayList();

   	newsList = enquiryObj.getLeavelListByMy(Integer.valueOf(iStart).intValue(),suser_name);
  // ParamethodMgr paramObj=new ParamethodMgr();
  //HashMap typeMap=paramObj.getCompareInfoByCode("CRM","news_type");
    counter=enquiryObj.getLeaveNumberByMy(suser_name);


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
<link rel="stylesheet" type="text/css"  href="../css/mg.css"/>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
<script language="javascript">
  function chechIfo()
  {
	   if(confirm('Confirm the deletion of messages?')) 
	{
		return true;
	}
	else
	{
		return false;
	}
  }
</script>
<script language="javascript">
	  function Check_Value(){
	       if(document.getElementById("start_time").value ==null || document.getElementById("start_time").value ==""){
	        alert("Please select a start time!");
	        return false;
	       }
	       if(document.getElementById("end_time").value ==null || document.getElementById("end_time").value ==""){
	        alert("Please select the end of time!");
	        return false;
	       }
	    document.indexdateform.submit();
	  }
	  function Change()
	  {
	  	document.getElementById("keyword").value="";
	  	
	  }
	 function search(){
	 	document.indexkeyform.submit();
	 }
</script>
</head>
<body>
<%
 if(newsList == null && !"1".equals(code) && !"2".equals(code))
 {   
	  %>
		  <div class="line6">
				 <div class="img"><img src="/images/icon3_manager_rightbody.gif" /></div>
				   <span class="title">You are not released any news Message！</span><br />                  
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
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%">News Title</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="50%">Message Content</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="10%">Received Person</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="15%">Message Time</td>
		        </tr>
		        <%
		            if(newsList != null && newsList.size()>0)
		            {   int i=0;
		              	 for (Iterator it = newsList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String trade_id=map.get("trade_id").toString();
						        String title="";
						        String user_name="";
						        String content="";
						        String in_date="";
						        if(map.get("title")!=null)
						        {
						         title=map.get("title").toString();
						        }
						         if(map.get("user_name")!=null)
						        {
						         user_name=map.get("user_name").toString();
						        }
						        if(map.get("content")!=null)
						        {
						          content=map.get("content").toString();
						          if(1>2)//content.length()>30)
						          {
						             content=content.substring(0,30)+"...";
						          }
						         }
						         if(map.get("in_date")!=null)
						        {
						          in_date=map.get("in_date").toString();
						          if(in_date.length()>10)
						          {
						             in_date=in_date.substring(0,10);
						          }
						         }
						       
						        %>
						        
						        <tr  style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td    style=" color:#000000;" align=left><%=title%></td>
					              <td    style=" color:#000000;" align=left><%=content%></td>
					              <td    style=" color:#000000;" align=left><%=user_name%></td>
					              <td    style=" color:#000000;" align=left><%=in_date%></td>
					             <!--td  class=grayD align=center><a href=/doTradeReg.do?trade_id=<%=trade_id%>&trade_type_code=0273 target="_self"  onClick="return chechIfo()"><img src=/img/edit.gif width=16 height=16 border=0></a></td-->
					            </tr>
					            
						        <%i++;
					     }
					     %>
					     
					    <tr>
							<td align="left" colspan="2">
								Total&nbsp;<%=counter%>&nbsp;Article &nbsp;No.<%=Integer.parseInt(iStart) + 1%>&nbsp;Page&nbsp;&nbsp;Total&nbsp;<%=pages%>&nbsp;Page
							</td>
							<td align="right" colspan="2">
								<a href="sendNewsIndex.jsp?iStart=0">Home page</a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="sendNewsIndex.jsp?iStart=<%=pageUp%>">Previous page</a> &nbsp;
								<%
										}
										if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="sendNewsIndex.jsp?iStart=<%=pageDown%>">Next page</a>&nbsp;
								<%
								}
								%>
								<a href="sendNewsIndex.jsp?iStart=<%=pages - 1%>">Last page</a>
							</td>
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