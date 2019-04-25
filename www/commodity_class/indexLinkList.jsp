<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ include file="../fuction/include.jsp"%>
<%@ page import="com.saas.biz.indexLinkMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认注销本条记录？')) 
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
<h5><bean:message key="str4245"/></h5><br>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >

  <tr>    
    <td class="grayE" align="right" colspan="6">
    <a href="../../interface/getTradeInterf_fwd.jsp?trade_type_code=0911">
    <bean:message key="str4246"/></a>   
    </td>
  </tr>
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str3288"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str4247"/></td>
    <td class="grayD" align="center" width="8%"><bean:message key="str2776"/></td>
  </tr>
<%
    IndexlinkInfo	  linkList=new IndexlinkInfo();
    ArrayList linkArray = linkList.getGradeOneLinkInfo();
	if(linkArray != null  && linkArray.size()>0)
	{
		int i=0;
		for (Iterator inIt = linkArray.iterator(); inIt.hasNext();)
	    {
	    HashMap map = (HashMap) inIt.next();
	   	String 	linkName=	map.get("link_name").toString();
		String linkIdx= map.get("link_id").toString();
   %>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
       <%=linkName%>
    </td>
	<td class="grayBL" align="left">    
	<a href="../../interface/getTradeInterf_fwd.jsp?trade_type_code=0913&grp_id=<%=linkIdx%>">
    <bean:message key="str2551"/>
    </a></td>
    </tr>
	<%
	   i++;
		}
	}
   %>
</table>
	<body>
</html>
