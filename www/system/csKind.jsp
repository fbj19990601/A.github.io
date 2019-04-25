<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%> 
<%@ page contentType="text/html;charset=GBK" %><%@ include file="/manage_it/fuction/include.jsp"%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">

		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
	    
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr><td bgcolor="#808080"><font size="2" color="#FFFFFF">客户类型参数</font></td></tr>
  <tr> 
    <td class="grayD">
        <html:form action="/addcsLevel">
			类型代码：<html:text property="paraCode" size="5"/><html:errors property="paraCode"/></br>
			类型名称：<html:text property="paraValue" size="15"/><html:errors property="paraValue"/></br>
			备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<html:text property="paraValue1" size="60"/><html:errors property="paraValue1"/></br>
	<td>
   </tr>
   <tr> 
    <td class="grayD" align=center>		
		<input type="submit" name="Submit" value="确定入库">
		</html:form>
    </td>
	
  </tr> 
</table>
	<body>
</html>
