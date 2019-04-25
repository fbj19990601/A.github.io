 <%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><bean:message key="str2572"/></title>
<link href="/css/new.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="980" border="0" cellspacing="0" cellpadding="0" style="margin-left:15px;">
  <tr>
    <td valign="top">
	   <%@include file="/inc/head.jsp" %>
	</td>
  </tr>
  <tr>
    <td valign="top">
	   <div class="containerone">
	      <div class="newlbleft">
		     <div class="newlbleftone"><bean:message key="str2573"/>&nbsp;&gt;&gt;&nbsp;<bean:message key="str2574"/></div>
			 <div class="newlblefttwo">
			   <div class="newlblefttwo1">
			      <div class="newlbone">
				    <div class="newlboneleft"><bean:message key="str2574"/></div>
					<div class="newlboneright"></div>
				  </div>
				  <div class="newlbtwo">
				  <%
com.xsaas.util.DBConnection dbc = new com.xsaas.util.DBConnection(true);
 
dbc.getConnection();
String spage= request.getParameter("p"),type= request.getParameter("t"),stmp="0",content="";
String con = "";

if(type!=null)
	con = " where title like '%"+type+"%'";

if(spage==null) spage="0";
else{
	stmp = Integer.toString(Integer.parseInt(spage)*10);
	}
 String sqltext = "select id,title from saasnews.agriinfo "+con+" order by id desc limit "+stmp+",10";
//out.println(sqltext);
String title = "";
com.xsaas.util.Charset charset = new com.xsaas.util.Charset();
java.sql.ResultSet rs = dbc.getRS(charset.GBK_2_ISO(sqltext));
while(rs.next()){
 %>
				    <div class="newlbtwo1">
				      <div class="newlbtwo2 lblj"><a href='showgq.jsp?id=<%= rs.getString(1) %>' target='_blank'>
                        <%
	  title = charset.ISO_2_GBK(rs.getString(2)) ;
	  if(title.length()>30){
	  	title=title.substring(0,30)+"...";
	  }
	  out.println(title);
	 %>
                      </a></div>
				       <!--div class="newlbtwo3">2008-02-25&nbsp;&nbsp;点机数:127次</div-->
					   <div class="newlbtwo4"><% 
	content= com.xsaas.util.ETTagsSequence.getBody((content),false).trim();

if((content!=null)&&(content.length()>100)){
	  	content=content.substring(0,100);
	  }
	  out.println(content);

%>
                        ...</div>
				   </div>
<%
	}
	rs=null;
dbc.close();
%>
			     </div>
				  <div class="newlbtwo lbg" style="text-align:center;"><%
out.println(dbc.getPageList(dbc," saasnews.agriinfo ","  ","listgq.jsp?p=",spage,6,20));
%>
</div>
			   </div>
			 </div>
	      </div>
	      <div class="newlbright">
	         <%@include file="/inc/right.jsp" %>
	      </div>
	   </div>
	</td>
  </tr>
  <tr>
    <td valign="top">
	   <div class="containertwo">
	     <%@include file="/inc/foot.jsp" %>
	   </div>
	</td>
  </tr>
</table>
</body>
</html>
