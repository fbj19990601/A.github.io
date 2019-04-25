<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.indexLinkMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import ="java.util.*"%>
<%@ page import="java.util.Map.Entry" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str116"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('Whether to confirm the deletion of this article records and lower-level record ?')) 
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
<h5><bean:message key="str1339"/></h5>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str1340"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str1341"/></td>
    <td class="grayD" align="center" width="20%"><bean:message key="str1342"/></td>
  </tr>
<%
    IndexlinkInfo	  linkList=new IndexlinkInfo();
    ArrayList linkArray = linkList.getDefaultIndexLinkInfo();
	
	if(linkArray != null  && linkArray.size()>0)
	{
		int i=0;
		for (Iterator inIt = linkArray.iterator(); inIt.hasNext();)
	    {
			  HashMap map =(HashMap)inIt.next();
              Iterator itmp = map.entrySet().iterator();
		      while (itmp.hasNext())
		        {
			       Entry emp = (Entry) itmp.next();//��һ��һ������
			       HashMap em = (HashMap) emp.getKey();
			       ArrayList list = (ArrayList) emp.getValue();   
	            	String 	linkName=	em.get("link_name").toString();
		            String linkIdx= em.get("link_id").toString();
					pageContext.setAttribute("em",em);
         	   %>
					<tr>
					<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
					<td class="grayBL" align="left">
					
					<%=linkName%>
					</td>
					<td class="grayBL" align="center"> 
					
					<html:link action="/doTradeReg.do?trade_type_code=0912" name="em" target="right" onclick="return confirmremove()">
                     <bean:message key="str1343"/>
                   </html:link></td>
						  				
					</a></td>
					</tr>
			<%
				    if(list != null && list.size()>0)
					{
				        int j=0;
				        for (Iterator itera = list.iterator(); itera.hasNext();) 
						{
								 HashMap downMap =(HashMap)itera.next();
								 String name=downMap .get("link_name").toString();
								 String index=downMap.get("link_id").toString();
								 
								 pageContext.setAttribute("downMap",downMap);
								 %>
										<tr>
										<td class="grayBL" align="left"><%=String.valueOf(i+1)%><%=String.valueOf(j+1)%></td>
										<td class="grayBL" align="left">
										<%=name%>
										</td>
										<td class="grayBL" align="center">   
										
										<html:link action="/doTradeReg.do?trade_type_code=0912" name="downMap" target="right" onclick="return confirmremove()">
                                         <bean:message key="str1343"/>
                                       </html:link></td>
										</tr>
							  <%
						 j++;
						}
				    }
				}
	     i++;
		}
	}
   %>
</table>
	<body>
</html>
