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
               out.println("根目录所对应的绝对路径:" + request.getRequestURI() + "<br/>");
  
  String strPathFile = application.getRealPath(request.getRequestURI());
  out.println("文件的绝对路径:" + strPathFile+ "<br/>");
out.println(application.getRealPath(request.getRequestURI()));
  String strDirPath = new File(application.getRealPath(request.getRequestURI())).getParent();
  out.println("目录的绝对路径:" + strDirPath + "<br/>");
               
            %>	
            
		</div>		
 