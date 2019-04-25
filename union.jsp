<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
//<script src='http://soft.xsaas.com/union.jsp?id=7I38i3K6JK&style=a' language='JavaScript' charset='gb2312'></script>

	String xsaas_style=request.getParameter("style");
	String union_id=request.getParameter("id");
	if(union_id == null) union_id = "7I38i3K6JK";
	if(xsaas_style==null) xsaas_style="a";
	String outputString="";
%>
<%
//高100，宽300
	if(xsaas_style.compareTo("a")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'><font color='#009900' style='font-size:15px; font-weight:bold' >租用式农业企业信息化软件平台</font></a><br>");
		document.write("<font color='#000' style='font-size:12px;' >300元就可以让你的企业无需考虑升级维护，<br>");
		document.write("即可使用网上办公、进销存、客户管理、<br>");
		document.write("企业网站等服务！犹豫什么？现在就试用</font><br>");
		document.write("<a href='http://soft.xsaas.com/'><font color='#0000FF'>soft.xsaas.com</font></a></p>");

<%
	}
	//高40，宽700；
else if(xsaas_style.compareTo("b")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'><font color='#009900' style='font-size:15px; font-weight:bold' >租用式农业企业信息化软件平台</font></a><br>");
		document.write("<font color='#000' style='font-size:12px;' >300元就可以让你的企业无需考虑升级维护，");
		document.write("即可使用网上办公、进销存、客户管理、");
		document.write("企业网站等服务！犹豫什么？现在就试用</font><br>");
		document.write("<a href='http://soft.xsaas.com/'><font color='#0000FF'>soft.xsaas.com</font></a></p>");


<%
	}
	

	//高100，宽340；
else if(xsaas_style.compareTo("c")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/c.gif' border=0></a></p>");


<%
	}
	
	//高58，宽200；
else if(xsaas_style.compareTo("d")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/d.gif' border=0></a></p>");


<%
	}
	
	//高90，宽950；
else if(xsaas_style.compareTo("e")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/e.gif' border=0></a></p>");


<%
	}
		//高90，宽950；
else if(xsaas_style.compareTo("f")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/f.gif' border=0></a></p>");


<%
	}
		out.println(outputString);
%>
