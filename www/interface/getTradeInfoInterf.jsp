<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>

<%
    ArrayList resultlist = new ArrayList();
    ArrayList interfList = new ArrayList();
    ArrayList queryList = new ArrayList();
    
    resultlist = (ArrayList) request.getAttribute("result");
    interfList = (ArrayList) resultlist.get(0);
    queryList = (ArrayList) resultlist.get(1);
%>

<html>
	<head>
        <title><bean:message key="system.tittle"/></title>
        <link href="style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<body>
    <table width="818" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" background="img/bg-1.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="img/bg-2.gif">
     <table width=95% border=0 cellpadding=10 cellspacing=1 align=center bordercolor=#000000>
        <%
            if (interfList != null && interfList != null)
            {
                
                for (Iterator qit = queryList.iterator(); qit.hasNext();)
                {
	                
	               
	                HashMap queryMap= (HashMap) qit.next();
	                for (Iterator iit = interfList.iterator(); iit.hasNext();)
	                {	
	                	out.print("<tr>");
	                	HashMap interfMap= (HashMap) iit.next();
	                	String fieldName = interfMap.get("element_name").toString();
	                	if (queryMap.get(fieldName) != null )
	                	{
	                		if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("4")
	                		    || interfMap.get("element_view").toString().trim().equalsIgnoreCase("1"))
    	            	    {
    	                		out.print("<td  class=graymn align=left>");    	                		
    	                		out.print(interfMap.get("element_label").toString());
    	                		out.print("</td>");
    	                		out.print("<td  class=graymn align=left>");    	                		
    	                		out.print(queryMap.get(fieldName));
    	                		out.print("</td>");
    	                	}
	                	}
	                    else if (queryMap.get(fieldName) == null
	                            && (interfMap.get("element_view").toString().trim().equalsIgnoreCase("4")
	                             || interfMap.get("element_view").toString().trim().equalsIgnoreCase("1")))
	                    {
	                            out.print("<td  class=graymn align=left>");    	                		
    	                		out.print(interfMap.get("element_label").toString());
    	                		out.print("</td>");
    	                		out.print("<td  class=graymn align=left>");    	                		
    	                		out.print("</td>");
	                    }
	                     out.print("</tr>");
		            }
		           
		       }
           }
        %>
    </table>
     </td>
  </tr>
  <tr>
    <td height="46" background="img/bg-3.gif">&nbsp;</td>
  </tr>
</table>
</body>

</html>