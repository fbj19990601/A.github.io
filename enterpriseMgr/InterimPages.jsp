<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="tools.util.FileIO,com.saas.biz.commen.config"%>
<%
	String cust_id = "";
	if( request.getParameter( "cust_id" ) != null )
 	{
  		cust_id = request.getParameter( "cust_id" );
  }
	 
%>

<html>
	<head>
		<title><bean:message key="str316"/></title>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include flush="true" page="/zone_b2b/top.html" />
		<br><br><br><br>
<%
		config configFile = new config();
		configFile.init();
		String dirpat = configFile.getString("mysqlbase.rootpath");
		String filepath = dirpat + "enterprise/customer/"+ cust_id;
		 
		if ( !FileIO.ExistFloder(filepath) ) 
		{
			out.print( "<center><a href=javascript:history.go(-1)><img src=/images/sorry.gif border=0></a></center>" ); 
		}
		else 
		{
		%>
			<script language="javascript">
					window.location.href='/zone_b2b/enterprise/customer/<%=cust_id%>/';
			</script>
	  <%		 
		 }
    %>
    <br><br><br><br><br><br><br><br>
<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
</body>
</html>
