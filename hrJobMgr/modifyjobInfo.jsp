<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>

<%
 String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
 String job_id="";
 String title="";
 String req="";
 String job_addr="";


 
 commMethodMgr commen = new commMethodMgr();
 String idx = commen.GenTradeId();
 
 if (request.getParameter("job_id") != null)
  {
      job_id = request.getParameter("job_id");
  }
 JobInfo jobObj=new JobInfo();
 ArrayList jobList=new ArrayList();
 if(job_id != null && ! job_id.equals(""))
 {
   jobList=jobObj.genOneJob(job_id);
   if(jobList != null && jobList.size()>0)
   {
      HashMap map=(HashMap)jobList.get(0);
       job_id=map.get("job_id").toString();
       if(map.get("title") != null)
       {
          title=map.get("title").toString();
       }
      if(map.get("request") != null)
       {
          req=map.get("request").toString();
       }
       if(map.get("job_addr") != null)
       {
          job_addr=map.get("job_addr").toString();
       }
   }
 }
 
%>
<html>
<head>
<title><bean:message key="str116"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/www/fuction/public.js"></script>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script language="JavaScript">
    function Check_Value()
	{
		       
		   if(document.getElementById("title").value.replace(/\s*/g,"")=="" || document.getElementById("title").value.replace(/\s*/g,"")==null)
				{
					alert("职位标题不能为空");
					document.getElementById("title").focus();
					return false;
					
				}
				 if(document.getElementById("request").value.replace(/\s*/g,"")=="" || document.getElementById("request").value.replace(/\s*/g,"")==null)
				{
					alert("职位要求不能为空");
					document.getElementById("request").focus();
					return false;
					
				}
 	    return true;
	}
     function check_none(current_obj)
     {
          if (current_obj.advshow.checked)
          {
      	    current_obj.submit1.disabled=false;        	     
      	}
      	else
      	{
      	    current_obj.submit1.disabled=true;
      	}
  	}
    	function exit()
    	{
    	    window.close();
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
</head>
<body>
	<form name=form1 action=/doTradeReg.do method=post target="_self">
		<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
			  <tr>
				    <td width="115" height="26" >&nbsp;</td>
			  </tr>
			  <tr>
				    <td>
			           <table width="93%" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				          <tr>    
			              <td  class="line1" align="left" colspan="2"><bean:message key="str156"/>  
			              </td>
			            </tr>  
			            <tr>
			             <td width="131" align=right   style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"><bean:message key="str732"/></td>
			             <td  class ="line1" width="751" align=left   style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;">
			             	<input type=text name=title value=<%=title%>></td>
			           </tr>
							     <tr>
			             <td width="131" align=right   style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"><bean:message key="str1386"/></td>
			             <td  class ="line1" width="751" align=left   style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;">
			             	<input type=text name="request" id="request"  value="<%=req%>"></td>
			           </tr>
			          <tr>
			          <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1387"/></td>
			          <td  class="line" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
			          	<input type=text name=job_addr value=<%=job_addr%>></td>
			        </tr>
			        <!--tr> 
				      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan="2" align="center">
				      	<INPUT id=advcheck name=advshow type=checkbox value=0 onclick=check_none(form1)>
				            以上资料正确无误。
						      
						  </td>
			     </tr-->
			     		<input type=hidden name=rsrv_num1 value=0>	   
			     		<input type=hidden name=job_id value="<%=job_id%>">
			      	<input type=hidden name=trade_type_code value="0387">
			    <tr>
			      <td align="center"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" colspan="2">
			      	<input class="tjan" name=submit type=submit value=""  onclick="return Check_Value()">
			      </td>
			    </tr>
			</table>  
			</form>
</body>
</html>
