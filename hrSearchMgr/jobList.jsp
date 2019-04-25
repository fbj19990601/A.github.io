<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.indexLinkMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
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
     
	 /*****************************************/
	  String job_type="";
     if(request.getParameter("job_type")!=null)
     {
       job_type=request.getParameter("job_type");
     }
     JobInfo jobObj=new JobInfo();
	 ArrayList jobList=jobObj.getJobListByType(Integer.valueOf(iStart).intValue(),job_type);
	 int counter=jobObj.getJobNumberByType(job_type);
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
<meta name="Generator" content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
<title><bean:message key="str182"/></title>
</head>
<body>  
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	  <tr>
	    <td>
		     <table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str1460"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="40%"><bean:message key="str1461"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="30%"><bean:message key="str1462"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center"  width="15%" ><bean:message key="str2671"/></td>
		        </tr>
		        <%
					if(jobList != null  && jobList.size()>0)
					{
						int i=0;
						for (Iterator inIt = jobList.iterator(); inIt.hasNext();)
					    {
						    HashMap map = (HashMap) inIt.next();
						   	String title=map.get("title").toString();
							String job_addr="";
							if(map.get("job_addr") !=null)
							{
							  job_addr=map.get("job_addr").toString();
							}
							String content="";
							if(map.get("request") != null)
							{
							    content=map.get("request").toString();
							    content=content.replaceAll("<[^<>]+>","");
							}
							String publish_date="";
							if(map.get("publish_date")!=null)
							{
							  publish_date=map.get("publish_date").toString();
							  if(publish_date.length()>10)
							  {
							    publish_date=publish_date.substring(0,10);
							  }
							}
							%>
							<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onMouseOver="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onMouseOut="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
			        			<td style=" color:#000000; word-break:break-all;" align="left"><%=title%></td>
								<td style=" color:#000000;  word-break:break-all;" align="left" ><%=content%></td>
								<td style=" color:#000000;  word-break:break-all;" align="left" ><%=job_addr%></td>
								<td style=" color:#000000;  word-break:break-all;" align="left" ><%=publish_date%></td>
					        </tr>
							<%i++;
						}
						%>
						<tr >
							<td  align="left" style=" color:#000000;" colspan="2" ><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
							<td  align="left" style=" color:#000000;"  colspan="2" ><a href="resultIndex.jsp?job_type=<%=job_type%>&iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;<a href="resultIndex.jsp?job_type=<%=job_type%>&iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;<a href="resultIndex.jsp?job_type=<%=job_type%>&iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str1032"/>  </a>&nbsp; <a  href="resultIndex.jsp?job_type=<%=job_type%>&iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>
				         </tr>
						<%
					}
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="46">&nbsp;</td>
	  </tr>
</table>
</body>
</html>