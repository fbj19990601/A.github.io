<%@ page contentType="text/html;charset=GBK" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>欢迎访问后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset rows="103,*,62" framespacing="0" frameborder="no" border="0">
  <frame src="./manage_it/top.htm" name="top" scrolling="NO" noresize >
  <frameset rows="*" cols="174,51,*">
    <frame src="./manage_it/left.jsp?staffid=<%=request.getAttribute("user")%>" name="left" noresize>
    <frame src="./manage_it/center.htm" name="center" noresize>
    <frame src="./manage_it/right.jsp" scrolling="yes" name="right" noresize>
  </frameset>
  <frame src="./manage_it/bot.htm" name="bot" scrolling="NO" noresize>
</frameset>
<noframes><body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

</body></noframes>
</html>
