<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

		<div id="bg">
            <%
               out.print(request.getContextPath()+"<br>");
               out.print(request.getLocalAddr()+"<br>");
               out.print(request.getRequestURI()+"<br>");
               out.print("======================================");
               out.println("��Ŀ¼����Ӧ�ľ���·��:" + request.getRequestURI() + "<br/>");
  
  String strPathFile = application.getRealPath(request.getRequestURI());
  out.println("�ļ��ľ���·��:" + strPathFile+ "<br/>");
out.println(application.getRealPath(request.getRequestURI()));
  String strDirPath = new File(application.getRealPath(request.getRequestURI())).getParent();
  out.println("Ŀ¼�ľ���·��:" + strDirPath + "<br/>");
               
            %>	
            
		</div>		
 