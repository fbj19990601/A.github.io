<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.leavewordsMgr.LeavewordsInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String user_id="",user_name="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
     
    if( logsession.getAttribute("SESSION_USER_NAME")!= null)
    {
       user_name= logsession.getAttribute("SESSION_USER_NAME").toString();
    }
  LeavewordsInfo leavewords = new LeavewordsInfo();
  ArrayList leaveList = leavewords.getLeavelListByMy( Integer.valueOf(iStart).intValue(), user_name );
  //out.print( leaveList );
  ParamethodMgr paramObj = new ParamethodMgr();
  
  
  int counter = leavewords.getLeaveNumberByMy( user_name );
  int pages = counter/30 + 1;
	int pageUp = 0,pageDown = 0;
	int currenPage = Integer.valueOf( iStart ).intValue();
	if( pages > currenPage )
	{
	   if( currenPage > 0 )
	   {
				pageUp = currenPage - 1;
	   }
		pageDown = currenPage+1;
	}
  else if( pages == currenPage )
	{
	   pageUp = currenPage - 1;
	   if( pageUp == 0 )
	   		pageUp = 1;
	   pageDown = currenPage;
	}
%>
<html>
<head>
<title><bean:message key="str116"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width=100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13"></td>
	  </tr>
	  <tr>
	    <td>
		     <table width=560 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#dddddd">
		        <tr>
		        	<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str410"/></td>
			        <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="35%"><bean:message key="str319"/></td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str3803"/></td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%"><bean:message key="str3804"/></td>
		        </tr>
		        <%
		            if(leaveList != null && leaveList.size()>0)
		            {    
		            	int i=0;
              	  for (Iterator it = leaveList.iterator(); it.hasNext();)
                  {
							        HashMap map = (HashMap) it.next();
							        String trade_id=map.get("trade_id").toString();
							        user_name="";
							        String word_status="",word_status_value="";
							        String in_date = "";
							        String title="";
							        
							        if( map.get( "user_name" ) != null )
							        {
							           user_name = map.get( "user_name" ).toString();
							        }
							        if( map.get( "title" ) != null )
							        {
							           title = map.get( "title" ).toString();
							        }
							        if( map.get( "word_status" ) != null )
							        {
							           word_status_value = map.get( "word_status" ).toString();
							           word_status = bean.getParamNameByValue( "104", word_status_value );
							        }
							        if( map.get( "in_date" ) != null )
							        {
							          in_date =  map.get( "in_date" ).toString();
									      if( in_date.length() > 10 )
									      {
									        in_date = in_date.substring( 0, 10 );
									      }
							        }
							         
							   %>
						        
						          <tr style="background-color:#f9f9f9;">
					              <td style=" color:#000000; padding: 2px 5px;" align=center><%=word_status%></td>
					              <td style=" color:#000000; padding: 2px 5px;" align=left>
					              	<a href="showFeedbackInfo.jsp?trade_id=<%=trade_id%>"><%=title%></a>
					              </td>
					              <td style=" color:#000000;" align=center><%=user_name%></td>
					              <td style=" color:#000000;" align=center><%=in_date%></td>
					              <!--td   style=" color:#000000;" align=center><a href=/doTradeReg.do?user_state=2&user_id=<%=user_id%>&trade_type_code=0285 target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0></a></td-->
					            </tr>
						        
						        <%i++;
					     }
					     %>
					   <tr>
								<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
								<td  align="right" colspan="3"  style=" padding:2px 5px;">
								<a href="sendFeedbackInfo.jsp?iStart=0"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
								<% 
									if(Integer.parseInt(iStart)>0){
								%>
									<a href="sendFeedbackInfo.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
								<%
									}
									if(Integer.parseInt(iStart)<pages-1){
								%>
									<a href="sendFeedbackInfo.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/>  </a>&nbsp; 
								<%
									}
								%>
								<a  href="sendFeedbackInfo.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
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