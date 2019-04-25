<%@ page contentType="text/html;charset=GBK" %><%@ include file="../fuction/include.jsp"%>
<%@ page import="com.saas.biz.ClassMgr.*" %>
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
<%
    commMethodMgr comm=  new commMethodMgr();
    String commodityclass = request.getParameter("class");
    String upClassId = "";
    String upClassName = "";
    int previous=0;
    if (!commodityclass.equalsIgnoreCase("1"))
    {
    	upClassId = request.getParameter("classId");
    	upClassName = comm.ConvertCodeToName("classname",upClassId);
    	 previous =new Integer(commodityclass).intValue() - 1;
    }
    else
    {
    	upClassName = "一级分类";
    	previous =1;
    }
    int iClass = new Integer(commodityclass).intValue() + 1;
    String strNextClass= String.valueOf(iClass);
%>
<body>  
<h5>属性管理[<%=upClassName%>]</h5><br>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%">序号</td>
    <td class="grayD" align="center" width="30%">分类名称</td>
    <td class="grayD" align="center" width="8%">操作</td>
  </tr>
<%
    ClassinfoMgr classList = new ClassinfoMgr();
 	classList.setClass_level(request.getParameter("class"));
    String strSql = "";
    if (request.getParameter("class").equalsIgnoreCase("1"))
    {
    	strSql = "SEL_BY_PRO";
    }
    else
    {
    	classList.setUp_class_id(upClassId);
    	strSql = "SEL_BY_PROUP";
    } 
    ArrayList classArray = classList.GetClassList(strSql);
 
	ClassinfoMgr[] classinfo = classList.GetList(classArray);
	String strRows =  String.valueOf(classinfo.length);
 	int intBegin=0;                          
    int realcount=classinfo.length;
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
	for (int i=intBegin;i<classinfo.length;i++)
    {
    	String classId = classinfo[i].getClass_id();
    	String className = classinfo[i].getClass_name();
    	HashMap classmap=new HashMap();
    	HashMap delmap=new HashMap();
    	classmap.put("classId",classId);
  		classmap.put("upClassId",upClassId);		
  		classmap.put("class",strNextClass);
  		delmap.put("class_id",classId);			
  		pageContext.setAttribute("classmap",classmap);
  		pageContext.setAttribute("delmap",delmap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
    <html:link href="sysproattr.jsp?class_type=2" name="classmap">
    <%=className%>
    </html:link></td>
	<td class="grayBL" align="left">    
	<html:link href="addproattr.jsp" name="classmap">
    新增属性
    </html:link>/
    <html:link href="attrdetails.jsp" name="classmap" target="right">
    查看属性
    </html:link>
    </td>
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
			    <td height="20">共<font color="#990000"><%=strRows%></font> 条信息 [ 每页最多显示15个信息 ] </td>
			    <td width="220"> 
			    <div align="right">
			    <%			                          	
			    	HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0"); 
			  		indexmap.put("class",request.getParameter("class")); 
			  		indexmap.put("classId",upClassId);							 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="sysproattr.jsp" name="indexmap">首页</html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
			  		upmap.put("classId",upClassId);
			  		upmap.put("class",request.getParameter("class")); 							 
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="sysproattr.jsp" name="upmap">上一页</html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	downmap.put("classId",upClassId);
				  	downmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="sysproattr.jsp" name="downmap">下一页</html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	endmap.put("attrId",upClassId);
				  	endmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("endmap",endmap);
			  	%>			  		  					
				<html:link href="sysproattr.jsp" name="endmap">末页</html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
