<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*" %> 
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.*" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="com.saas.biz.ClassMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认删除本条记录？')) 
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>
<%
    commMethodMgr comm=  new commMethodMgr();
    String classID = request.getParameter("classId"); 
%>
<body>  
<h5><bean:message key = "str2556"/></h5><br>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str2774"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str4250"/></td>
    <td class="grayD" align="center" width="8%"><bean:message key="str3940"/></td>
  </tr>
<%
    AttrMgr attrList = new AttrMgr();
    attrList.setClass_id(classID);
    String strSql = "";  
    strSql = "SEL_BY_CLASS_ID";
    ArrayList attrArray = attrList.GetClassList(strSql);
	AttrMgr[] attrinfo = attrList.GetList(attrArray);
	String strRows =  String.valueOf(attrinfo.length);
 	int intBegin=0;                          
    int realcount=attrinfo.length;
    String Begin="0";
	if (request.getParameter("Begin")==null)
    {
        intBegin=0;        						
    }
    else 
    {
    	intBegin = new Integer(request.getParameter("Begin")).intValue();
    }
    if (intBegin>=realcount) 
    {
    	intBegin=realcount;                      			 
    }
    if (intBegin<=0) 
    {
    	intBegin=0;                      			 
    }
    String upBegin = String.valueOf(new Integer(intBegin).intValue()-15);
    String downBegin= "0";
    String endBegin = String.valueOf(realcount-15);
	int j = 0;
	for (int i=intBegin;i<attrinfo.length;i++)
    {
    	String classId = attrinfo[i].getClass_id();
    	String attrID = attrinfo[i].getAttr_id();
    	String attrName = attrinfo[i].getAttr_name();
    	HashMap attrmap=new HashMap();
    	HashMap delmap=new HashMap();
    	attrmap.put("attrID",attrID);
    	attrmap.put("attrName",attrName);
  		delmap.put("attr_id",attrID);			
  		pageContext.setAttribute("attrmap",attrmap);
  		pageContext.setAttribute("delmap",delmap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
    <%=attrName%></td>
	<td class="grayBL" align="left">    
	<html:link action="/doTradeReg.do?trade_type_code=0704" name="delmap" target="right" onclick="return confirmremove()">
    <bean:message key="str2677"/>
    </html:link></td>
    </tr>
<%
    	
    	downBegin=String.valueOf(i+1);
    	j++;
    	if (j>=15) break;    
    }

%>
<tr> 
	    <td colspan=7> 
		    <table width="100%" border="0" cellspacing="1" cellpadding="0">
		    <tr> 
			    <td height="20">
			    <bean:message key="str1143"/><font color="#990000"><%=strRows%></font> 
			    <bean:message key="str2544"/> </td>
			    <td width="220"> 
			    <div align="right">
			    <%			                          	
			    	HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0"); 
			  		indexmap.put("class",request.getParameter("class")); 
			  		indexmap.put("classId",classID);							 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="attrdetails.jsp" name="indexmap">
				<bean:message key="str1030"/></html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
			  		upmap.put("classId",classID);
			  		upmap.put("class",request.getParameter("class")); 							 
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="attrdetails.jsp" name="upmap">
				<bean:message key="str1031"/></html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	downmap.put("classId",classID);
				  	downmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="attrdetails.jsp" name="downmap">
				<bean:message key="str1032"/></html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	endmap.put("classId",classID);
				  	endmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("endmap",endmap);
			  	%>			  		  					
				<html:link href="attrdetails.jsp" name="endmap">
				<bean:message key="str1033"/></html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>	
</table>
	<body>
</html>

