<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%><%@ include file="../fuction/include.jsp"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import ="com.saas.biz.commen.*"%> 
<%@ page import="java.util.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认分配')) 
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>
<body>  
<h5></h5><br>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str3288"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str3228"/></td>
    <td class="grayD" align="center" width="20%"><bean:message key="str2776"/></td>
  </tr>
<%
	ArrayList ClassList = new ArrayList();
    ParamethodMgr  compars  = new ParamethodMgr();
    String menu_id  = request.getParameter("menu_id");  
    String menu_class  = request.getParameter("menu_class"); 
	ClassList  = compars.getCompareInfo("CRM","cust_class");
	int xuhao =0;
	if(ClassList!=null && ClassList.size()>0)
	{
		for (Iterator its = ClassList.iterator(); its.hasNext();) 
	    	{  
	    		xuhao = xuhao +1;
	    		String  class_code = "";
	    		String  class_name = "";	
			HashMap classMap = (HashMap) its.next();
			class_name  =  classMap.get("para_code2").toString();
			class_code   = classMap.get("para_code1").toString();
			%>
			<tr>
			<td class="grayBL" align="left"><%=xuhao%></td>
	      	<td class="grayBL" align="left">〖<%=class_code%>级〗
	     	<%=class_name%></td>
			<td class="grayBL" align="left">    
			<a  href="/doTradeReg.do?trade_type_code=0905&class_code=<%=class_code%>&menu_id=<%=menu_id%>&menu_class=<%=menu_class%>"  target="_self" onclick="return confirmremove()">
	   		<bean:message key="str2538"/></a>【<%=class_name%>】
	    	</td>
	    	</tr>
			<% 	 
		}
  }	
%>
</table>
	<body>
</html>
