<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.ahbay.bookMgr.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.*" %> 


<%
 		com.ahbay.bookMgr.bookMgr books=new com.ahbay.bookMgr.bookMgr();
	    books.id=request.getParameter("id");
	    books.CheckBookInfo();
		
	 out.println("<script language=javascript>alert('�����Ѿ�����');window.location='Application_manage.jsp';</script>"); 
	 
%>
	 
