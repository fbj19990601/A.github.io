<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.resumeMgr.ResumeInfo"%>
<%@ page import="com.saas.biz.JobMgr.*"%>
<%@ page import="com.saas.biz.enquirytrackMgr.EnquirytrackInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "1";
	
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
 
	JobInfo Jobinfo = new JobInfo();
	ArrayList jobList = Jobinfo.genNewJobList(cust_id);

	
	ParamethodMgr paramCom = new ParamethodMgr();
	
	int counter = new JobInfo().genNewJobCount(cust_id);
	String pageTools = tools.getPageTools(String.valueOf(counter), "30", "jobResumeIndex.jsp?iStart=", Integer.parseInt(iStart));
%>
<html>
	<head>
		<meta name="Generator"
			content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
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
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<table width="100%" border=0 cellpadding=2 cellspacing=1
						align=center bgcolor="#e7e7e7">
						<tr>
							<td class="line1"
								style=" height:25px; background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"
								align="center" width="25%">
								<bean:message key="str737"/>
							</td>
							<td
								style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"
								align="center" width="15%">
								<bean:message key="str1392"/>
							</td>
			
							<td
								style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"
								align="center" width="25%">
								 <bean:message key="str1393"/>
							</td>
							<td
								style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"
								align="center" width="10%">
								<bean:message key="str1394"/>
							</td>
						</tr>
						 <%
						 
									 if(jobList != null && jobList.size() > 0) 
										{
											for(int i=0;i<jobList.size();i++) 
											{
												HashMap map = (HashMap) jobList.get(i);
												String job_id="",title="",publish_date="";
											  String name="";
											  String user_id="";
												if( map.get("job_id")!= null )
												{ job_id=map.get("job_id").toString(); }
												if( map.get("user_name")!=null )
												{ name=map.get("user_name").toString(); }
											 	if( map.get("publish_user_id")!=null )
												{ user_id=map.get("publish_user_id").toString(); }
												if( map.get("title")!=null )
												{ title=map.get("title").toString(); }
												
												if( map.get("publish_date")!=null )
												{ publish_date=map.get("publish_date").toString(); }	
												if (publish_date.length() > 10) 
												{ publish_date = publish_date.substring(0, 10); }
									
									%>
							      
										  <tr style="background-color:#f9f9f9; ">
											<td style=" color:#000000; padding:2px 5px;">
										   <%=title%>
											</td>
											<td style=" color:#000000; padding:2px 5px;">
											
											  
											  		<a href="/zone_b2b/resume/resume_content.jsp?resume_id=<%=user_id%>" target=_blank class="lanse"><%=name%></a>
											</td>
											<td align="center" style=" color:#000000;">
												<%=publish_date%>
											</td>
											<td align=center style=" color:#000000;">
											  <a href=revertFeedbackInfo.jsp?resume_id= <%=user_id%>
												TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif
													width=16 height=16 border=0> </a>
							       </td>
											
											
											<td align=center style=" color:#000000;">
												
											</td>
					   	</tr>
						<%
						}
						}
						%>
						<tr>
							<%=pageTools%>
						</tr>
					
					</table>
				</td>
			</tr>
			<tr>
				<td height="46">
					&nbsp;
				</td>
			</tr>
		</table>
	</body>
</html>
