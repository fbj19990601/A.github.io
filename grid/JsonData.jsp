
<%@ page language="java" pageEncoding="GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.relationUuMgr.RelationUUInfo" scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Ext--Grid--</title>
	</head>
	<body>
		<%
			HttpSession logsession = request.getSession();
			String user_id = "";
			if (logsession.getAttribute("SESSION_USER_ID") != null) {
				user_id = logsession.getAttribute("SESSION_USER_ID").toString();
			}
			String callback = request.getParameter("callback");
				int index =1;
                if(request.getParameter("start")!=null){
                  index=Integer.parseInt(request.getParameter("start"));
                }
				int pageSize =20;;
				if(request.getParameter("limited")!=null){
				  pageSize=Integer.parseInt(request.getParameter("limited"));
                }
				String jsonStrng=bean.getJsonStore(user_id, "1", pageSize, index);
				String json = callback + "(" + jsonStrng + ")";
				response.getWriter().write(json);
				out.print(json);
		%>
	</body>
</html>


