<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.enquirytrackMgr.EnquirytrackInfo"%>
<%@ page import="com.saas.biz.rightMgr.RightMenu"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
    if ( request.getParameter( "iStart" ) != null)
    {
        iStart = request.getParameter( "iStart" );
    }
    if ( logsession.getAttribute( "SESSION_CUST_ID" ) != null)
    {
        cust_id = logsession.getAttribute( "SESSION_CUST_ID" ).toString();
    }
    if ( request.getParameter( "menu_id" ) != null )
    {
        meun_idx = request.getParameter( "menu_id" );
        logsession.setAttribute( "menu_id", meun_idx );
        
    }
    if( logsession.getAttribute( "menu_id" ) != null )
    {
       meun_idx=( String )logsession.getAttribute( "menu_id" );
    }
	 
  JobInfo jobObj = new JobInfo();
  ArrayList jobList = jobObj.gentjobByCust_id( Integer.valueOf( iStart ).intValue(), cust_id );
  //out.print( " jobList " + jobList );
  int counter = jobObj.getjobListNumber( cust_id );
  int pages = counter/30 + 1;
  int pageUp = 0,pageDown = 0;
  int currenPage  = Integer.valueOf(iStart).intValue();
  if( pages > currenPage )
  {
	 if( currenPage > 0 )
	 {
		 pageUp = currenPage-1;
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
			<title><bean:message key="str116"/></title>
	       <link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
			<body>
	        	<table  width="100%" border="0" cellpadding="2" cellspacing="1" align=center bgcolor="#e7e7e7" style="margin-top:13px">
	            <tr>
	              <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str1382"/></td>

	              <!--td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="40%">内容</td-->
	              <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%"><bean:message key="str1383"/></td>
	              <td  style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str1393"/></td>
				   <td  style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str1440"/></td>
	            </tr>
	            <%
	              
	              if( jobList != null && jobList.size() > 0 )
	              {
	                 for (Iterator it = jobList.iterator(); it.hasNext();)
	                 {
								      HashMap map = (HashMap) it.next();
									    String job_id = map.get("job_id").toString();
									  	String title ="";
									    String req ="";
									    String job_addr="";
									    String publish_date="";
									    if(map.get("title") != null)
									    {
									       title=map.get("title").toString();
									    }
									     
									    if(map.get("job_addr") != null)
									    { 
									      job_addr=map.get("job_addr").toString();
									    }
				              
										if (map.get("publish_date") != null)
										{
									         publish_date = map.get("publish_date").toString();
											if (publish_date.length() > 10) 
											{
												publish_date = publish_date.substring(0, 10);
											}
										}
				
	             %>
	            <tr style="background-color:#f9f9f9; ">
	              <td  style=" color:#000000; padding:3px 5px;" align=left>
	              	<a href="viewjobinfo.jsp?job_id=<%=job_id%>" title=<%=title%> target="_self"><%=title%></a>
	            </td>
	            
	              <td  style=" color:#000000; padding:3px 5px; " align=left><%=job_addr%></td>
	               <td  style=" color:#000000; padding:3px 5px;" align=left><%=publish_date%></td>
	             
	               <td  style=" color:#000000;" align=center><a href=viewJobapplicantsInfo.jsp?job_id=<%=job_id%> TARGET="_self"><img src=/img/edit.gif width=16 height=16 border=0 alt="应聘信息"></a></td>
				   			
	            </tr>
	            <%}
	            }%>
				   <tr>
			          <td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;
							   <bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
						
							  <td  align="right" colspan="3"  style=" padding:2px 5px;">
							  <a href="updatejobindex.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
							  <% 
							    if(Integer.parseInt(iStart)>0){
							  %>
							   <a href="updatejobindex.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;
							  <%
							  }
							  if(Integer.parseInt(iStart)<pages-1){
							  %>
							  <a href="updatejobindex.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"><bean:message key="str1032"/>  </a>&nbsp; 
							  <%
							  }
							 %>
							<a  href="updatejobindex.jsp?iStart=<%=pages-1%>&menu_id=<%=meun_idx%>"><bean:message key="str1033"/></a>
							</td>

 </tr>
     </table>
</body>
</html>
