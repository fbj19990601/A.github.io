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
//��100����300
	if(xsaas_style.compareTo("a")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'><font color='#009900' style='font-size:15px; font-weight:bold' >����ʽũҵ��ҵ��Ϣ�����ƽ̨</font></a><br>");
		document.write("<font color='#000' style='font-size:12px;' >300Ԫ�Ϳ����������ҵ���迼������ά����<br>");
		document.write("����ʹ�����ϰ칫�������桢�ͻ�����<br>");
		document.write("��ҵ��վ�ȷ�����ԥʲô�����ھ�����</font><br>");
		document.write("<a href='http://soft.xsaas.com/'><font color='#0000FF'>soft.xsaas.com</font></a></p>");

<%
	}
	//��40����700��
else if(xsaas_style.compareTo("b")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'><font color='#009900' style='font-size:15px; font-weight:bold' >����ʽũҵ��ҵ��Ϣ�����ƽ̨</font></a><br>");
		document.write("<font color='#000' style='font-size:12px;' >300Ԫ�Ϳ����������ҵ���迼������ά����");
		document.write("����ʹ�����ϰ칫�������桢�ͻ�����");
		document.write("��ҵ��վ�ȷ�����ԥʲô�����ھ�����</font><br>");
		document.write("<a href='http://soft.xsaas.com/'><font color='#0000FF'>soft.xsaas.com</font></a></p>");


<%
	}
	

	//��100����340��
else if(xsaas_style.compareTo("c")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/c.gif' border=0></a></p>");


<%
	}
	
	//��58����200��
else if(xsaas_style.compareTo("d")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/d.gif' border=0></a></p>");


<%
	}
	
	//��90����950��
else if(xsaas_style.compareTo("e")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/e.gif' border=0></a></p>");


<%
	}
		//��90����950��
else if(xsaas_style.compareTo("f")==0){

%>
		document.write("<p><a href='http://soft.xsaas.com/interface.jsp?code=<%= union_id %>'>");
		document.write("<img src='http://soft.xsaas.com/unionMgr/f.gif' border=0></a></p>");


<%
	}
		out.println(outputString);
%>
