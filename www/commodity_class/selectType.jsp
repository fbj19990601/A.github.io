<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ include file="../fuction/include.jsp"%>
<%@ page import="com.saas.biz.ClassMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<body>  
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str3288"/>序号</td>
    <td class="grayD" align="center" width="30%"><bean:message key="str2997"/>分类名称</td>
    <td class="grayD" align="center" width="8%"><bean:message key="str2696"/>操作</td>
  </tr>
<%
    EnterInfo enterList = new EnterInfo();
    enterList.setParam_attr("26");
    String strSql = "";
    strSql = "SEL_BY_ENTER";
    ArrayList enterArray = enterList.GetEnterList(strSql);
 
	EnterInfo[] enterinfo = enterList.GetList(enterArray);
	String strRows =  String.valueOf(enterinfo.length);
 	int intBegin=0;                          
    int realcount=enterinfo.length;
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
	for (int i=intBegin;i<enterinfo.length;i++)
    {
    	String para_code1 = enterinfo[i].getPara_code1();
    	String para_code2 = enterinfo[i].getPara_code2();
    	HashMap entermap=new HashMap();
    	entermap.put("para_code1",para_code1);
    	entermap.put("para_code2",para_code2);		
  		pageContext.setAttribute("classmap",entermap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">  
    <%=para_code2%>
	<td class="grayBL" align="center">    
	<a  href="syscommodity.jsp?class_type=<%=para_code1%>&class=1">
   	进入查看<bean:message key="str2555"/>
    </a></td>
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
			    <bean:message key="str1143"/>共<font color="#990000"><%=strRows%></font> 
			    <bean:message key="str2544"/>条信息 [ 每页最多显示15个信息 ] </td>
			    <td width="220"> 
			    <div align="right">
			    <%			                          	
			    	HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0"); 						 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="selectType.jsp" name="indexmap">
				<bean:message key="str1030"/>首页</html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
					pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="selectType.jsp" name="upmap">
				<bean:message key="str1031"/>上一页</html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);			  
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="selectType.jsp" name="downmap">
				<bean:message key="str1032"/>下一页</html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);
				  	pageContext.setAttribute("endmap",endmap);
			  	%>			  		  					
				<html:link href="selectType.jsp" name="endmap">
				<bean:message key="str1033"/>末页</html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
