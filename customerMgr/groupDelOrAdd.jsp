<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.groupInfoMgr.GroupInfo"%>
<html>
	<head>
		<title>groupDelOrAdd</title>
		<script type="text/javascript">
		  function autoSubmit(){
		   //document.groupForm.submit();
		  }
		</script>
	</head>
	<body onload="setTimeout('autoSubmit()',1000)">
	 <%
       String user_id="",class_id="",group_type="",code="";
	   if(request.getParameter("class_id") != null) {
		 class_id = request.getParameter("class_id");
	   }
	   if(request.getParameter("group_type") != null) {
		group_type = request.getParameter("group_type");
	   }
	   if(request.getParameter("user_id") != null) {
		user_id = request.getParameter("user_id");
	   } 
	   if(request.getParameter("code") != null) {
		code = request.getParameter("code");
	   } 
     %>
    <form name="groupForm" id="groupForm" action="/doTradeReg.do" method="post" target="_self">
     <input type="hidden" name="trade_type_code" value=<%=code%>>
     <input type="hidden" name="user_id" value=<%=user_id%>>
     <input type="hidden" name="group_type" value=<%=group_type%>>
     <input type="hidden" name="class_id" value=<%=class_id%>>
    </form>
    out.print(code+"==="+user_id+"=="+class_id);
	</body>
</html>
