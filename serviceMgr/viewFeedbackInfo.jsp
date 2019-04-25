<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.leavewordsMgr.LeavewordsInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
  
    String trade_id = "",cust_id="",user_name = "",word_status="",title = "",content="",email="",in_date = "";
    if( request.getParameter("trade_id") != null )
      trade_id =  request.getParameter("trade_id");
          
  LeavewordsInfo leavewords = new LeavewordsInfo();
  ArrayList leaveList = leavewords.getLeaveByTradeId( trade_id );
  if(leaveList != null && leaveList.size()>0)
  {    
	      HashMap map = ( HashMap ) leaveList.get( 0 );
        if( map.get( "cust_id" ) != null )
        {
        		cust_id = map.get( "cust_id" ).toString();
        } 
        if( map.get( "user_name" ) != null )
        {
           user_name = map.get( "user_name" ).toString();
        }
        if( map.get( "title" ) != null )
        {
           title = map.get( "title" ).toString();
        }
        if( map.get( "content" ) != null )
        {
           content = map.get( "content" ).toString();
        }
        if( map.get( "email" ) != null )
        {
           email = map.get( "email" ).toString();
        }
        if( map.get( "word_status" ) != null )
        {
           word_status = map.get( "word_status" ).toString();
            
        }
        
        if( map.get( "in_date" ) != null )
        {
          in_date =  map.get( "in_date" ).toString();
		      if( in_date.length() > 10 )
		      {
		        in_date = in_date.substring( 0, 10 );
		      }
        }
	  } 

%>
<html>
<head>
<title><bean:message key="str116"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function back_message()
	{
		  document.getElementById("trade_type_code").value="2124";
		  document.classForm.submit();
		  window.location='receiveFeedbackInfo.jsp';
			return true;
	}
	function revert_message()
	{
		  var cid = document.getElementById( "cust_id" ).value;
			document.getElementById("trade_type_code").value="2124";
			document.classForm.submit();
			window.location='revertFeedbackInfo.jsp?cust_id='+cid;
			return true;
	}
  function del_message()
	{
		 document.getElementById("trade_type_code").value="2123";
		 document.classForm.submit();
		 window.location='receiveFeedbackInfo.jsp'; 
		 
	   return true;
	}
	 
</script>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="0" align=center>
	  <tr>
	    <td height="13"></td>
	  </tr>
	  <tr>
	    <td>
		       <table width=600 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#dddddd">
		        <tr>
			        <td style=" color:#000000; font-weight:bolder;" align=right width="15%"><bean:message key="str3809"/></td>
			        <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align=left><%=user_name%> [ <%=email%> ] </td>
			      </tr>
			      <tr>  
							 <td style=" color:#000000; font-weight:bolder;" align=right width="15%"><bean:message key="str3810"/></td>
							 <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left"><%=in_date%></td>
		        </tr>
		  
		    
		      <!--  
		      tr width="600" style="background-color:#f9f9f9;">
	            <td style="color:#000000;align=center">
	            	<div style="text-align:center;">
	            	
	            		<font size="4"><%=title%></font>
	            	</div>		
	            </td>
	          </tr> 
	          -->
	            <tr>  
					<td style=" color:#000000; font-weight:bolder;" align=right width="15%"><bean:message key="str3811"/></td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left"><%=title%></td>
		        </tr>
	           <tr>  
					<td style=" color:#000000; font-weight:bolder;" align=right width="15%"><bean:message key="str3812"/></td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left"><%=content%></td>
		        </tr>
		  
		    </table>
		    <form name="classForm" method="post" action="/doTradeReg.do" target="_self">
		    <table  width="600" align="center" >
		    	<hr/>
		    	<tr>
							<td>
								<input  name="bnt1" type="button" value="<<·µ»Ø" onclick="return back_message()"  />
							 
								<input  name="bnt2" type="button" value="»Ø ¸´" onclick="return revert_message( )"/>
							 
								<input  name="bnt3" type="button" value="É¾ ³ý" onclick="return del_message()"/>
							</td>
					</tr>
					<input name= "trade_type_code" id="trade_type_code" type="hidden" value="">
					<input name= "trade_id" id="trade_id" type="hidden" value="<%=trade_id%>">
					<input name= "word_status" id="word_status" type="hidden" value="1">
					<input name= "cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
		    </table>
		    </form>	
	
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>