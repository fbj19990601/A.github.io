<%@ page contentType="text/html;charset=GBK" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
 
<html>
<head>
	<title><bean:message key="system.tittle"/></title>
<script language="javascript">
	function closeit() 
	{ 
		setTimeout("window.opener=null;window.close();",   2000);   
	}
</script>
<LINK href="/city/style/css.css" type=text/css rel=stylesheet>
</head>

<body onload="closeit()">
	<%
		 ArrayList resultlist = (ArrayList) request.getAttribute("backQ");
		 String backInfo = "";
		 for (Iterator it = resultlist.iterator(); it.hasNext();)
	     {
	        HashMap infoMaps = (HashMap)it.next();
	        if (infoMaps.get("RESULT_INFO")!= null)
	        {
	            backInfo = backInfo + infoMaps.get("RESULT_INFO").toString()+"\n";
	        }
	     }
	%>
	<center><br>
		<br>
	<strong class="orange"><p><%=backInfo%></strong>
    </center>
</body>
</html>
