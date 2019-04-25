<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="gbk"%>   
<%request.setCharacterEncoding("gbk");%>
<%@ page language="java" import="java.util.*" errorPage="" %>
<%@ page import="com.saas.biz.searchMgr.SearchJob"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%	
	String infotype="",key="";
	int p = 0;	
	if(request.getParameter("p")!=null)
	{
		p=Integer.parseInt( request.getParameter("p") );
	}
	if(p!=0 && p>1){
	  p=p-1;
	}else if(p==1){
	  p=0;
	}
	if(request.getParameter("info_type")!=null)
	{
			infotype=request.getParameter("info_type");			
	}
	if(request.getParameter("key")!=null)
	{
			key=new String(request.getParameter("key").getBytes("ISO8859_1"),"GBK");	
			key=request.getParameter("key");	
	}	
	SearchJob searchjob = new SearchJob();
	ArrayList list = searchjob.doSearchJob(infotype,p*10,key);	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<title><bean:message key="str316"/><%=key%></title>
<link href="mycss.css" rel="stylesheet" type="text/css">
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/zone_b2b/js/index.js"></script>

</head>
<body onload = "checkR(<%=infotype%>)">
    <%@ include file="/zone_b2b/top.jsp"%>
	<table width=980 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		<tr>
			<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%" colspan="1"><bean:message key="str319"/></td>
			<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="75%" colspan="2"><bean:message key="str4486"/></td>			
		</tr>
	  <%
	  String counts="0",title="",ref="",linkstr="",pic_path="";
		  if(list != null && list.size()>0)
		  {
		    
		  	for (int i=0;i<list.size();i++)
		    {
					HashMap map = (HashMap)list.get(i);
					if(map.get("title")!=null){
					  title=map.get("title").toString();
					   title=title.replaceAll("<[^<>]+>",""); 
					  if(title.length()>20){
					    title=title.substring(0,15)+"...";
					  }
					}
					if(map.get("ref")!=null){ref=map.get("ref").toString();}
					if(map.get("linkstr")!=null){linkstr=map.get("linkstr").toString();}					
					if(map.get("pic_path")!=null){pic_path=map.get("pic_path").toString();}
					if(map.get("count")!=null){counts=map.get("count").toString();}		
		%>					        
		<tr style="background-color:#f9f9f9;">
			<td style=" color:#000000; padding:2px 5px; font-weight: bold;" align=left  colspan="1">					
				<a href=<%=linkstr%> > <%=title%> </a>
			</td>
			<td style=" color:#000000;" align=left  colspan="2"><%=ref%></td>		
		</tr>
		<%	}		
			if(p==0){
		     p=1;
		    }else{
		     p=p+1;
		    }
		   String pageTools = tools.getGoogleToolsBar(Integer.parseInt(counts), "searchListpage.jsp?key="+key+"&info_type="+infotype+"&p=",p,10);
		%>
		<tr>
		  <td style="font-weight: bold;text-align: center;" align="center"  colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=pageTools%>
		 </td>
       </tr>					     
	  <%}%>
	 </table>
	 <jsp:include flush="true" page="/zone_b2b/footer.jsp" />
</body>
<script type="text/javascript">
  function checkR(info_type){
  redio_bnt = document.getElementsByName("redio_bnt");
  for(var i=0;i<redio_bnt.length;i++){
      redio_bnt[i].checked =false;
  }
  if (info_type = "0141"){
		document.getElementById("supply").checked=true;
	} else if (info_type = "0154") {
		document.getElementById("stock").checked=true;
	} else if (info_type = "0139") {
		document.getElementById("customer").checked=true;
	} else if (info_type = "0161") {
		document.getElementById("news").checked=true;
	}
  }
</script>
</html>
