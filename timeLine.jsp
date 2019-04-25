<%@ page contentType="text/html;charset=gb2312" pageEncoding="GB2312"%>
<%@ page import="com.hong.bean.LineXYChart"%>
<%@ page import = "java.io.PrintWriter" %>
<%
 LineXYChart xyChart=new LineXYChart();
 String fileName=xyChart.getLineXYChart(session,new PrintWriter(out));
  String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName; 
%>
<html>
</head>
 <title>
   JFreeChart使用例子<bean:message key="str4410"/>
 </title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<body>
<img src="<%= graphURL %>" width=500 height=300 border=0 usemap="#<%= fileName %>">
</body>
</html>