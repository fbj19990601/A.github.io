<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../fuction/include.jsp"%>
<%@ page import="com.saas.biz.ClassMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css"> 
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
    String class_type = request.getParameter("class_type");
    String  trade_type_code = request.getParameter("trade_type_code");
    String upClassId = "";
    String upClassName = "";
    String grp_name = "";
	String grp_id = "";
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
    if (request.getParameter("strnamegrp")==null)
    {  
    	upClassName=upClassName;
    }
    else
    {
        upClassName = new String(request.getParameter("strnamegrp").getBytes("GBK"), "UTF-8");
        if(upClassName.equals(""))
        upClassName = "一级分类";
         grp_name  = upClassName;
    }
%>
<body>  
<br><center>
<h3>请选择分类发布商业信息</h3>
<table width="60%" border="0" cellpadding="2" cellspacing="1" align="center" bordercolor="#D1D1D1" >
    <tr><td>
        分类级别：[<%=commodityclass%>]，上级分类：[<%=upClassName%>]
</td></tr></table>
</center>
<table width="60%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="4%">序号</td>
    <td class="grayD" align="center" width="20%">分类名称</td>
    <td class="grayD" align="center" width="30%">分类说明</td>
    <td class="grayD" align="center" width="10%">操作</td>
  </tr>
<%
    ClassinfoMgr classList = new ClassinfoMgr();
 	classList.setClass_level(request.getParameter("class"));
 	classList.setClass_type(request.getParameter("class_type"));
    String strSql = "";
    if (request.getParameter("class").equalsIgnoreCase("1"))
    {
    	strSql = "SEL_BY_CLASS_1";
    }
    else
    {
    	classList.setUp_class_id(upClassId);
    	strSql = "SEL_BY_UP";
    } 
    ArrayList classArray = classList.GetClassList(strSql);
 
	ClassinfoMgr[] classinfo = classList.GetList(classArray);
	
	for (int i=0;i<classinfo.length;i++)
    {
    	String classId = classinfo[i].getClass_id();
    	String className = classinfo[i].getClass_name();
    	String classDesc = classinfo[i].getClass_desc();
    	String  stridgrp="";
    	String  strnamegrp="";
    	//取群标志
    	if(request.getParameter("stridgrp")==null)
    	{
    	    stridgrp=classId;
    	   //  grp_id = stridgrp;
    	}
    	else
    	{
    		grp_id = request.getParameter("stridgrp");
    	    stridgrp=request.getParameter("stridgrp")+"|"+classId;
    	}
    	//取群名
    	if(request.getParameter("strnamegrp")==null)
    	{  
    	    strnamegrp=className;
    	}
    	else
    	{
    	    strnamegrp=new String(request.getParameter("strnamegrp").getBytes("GBK"), "UTF-8")+"|"+className;
    	}
    	if (classDesc == null) classDesc = "无";
    	HashMap classmap=new HashMap();
    	HashMap delmap=new HashMap();
    	classmap.put("classId",classId);
    	classmap.put("grp_id",grp_id);
    	classmap.put("grp_name",grp_name);
    	classmap.put("class_type",class_type);
  		classmap.put("upClassId",upClassId);		
  		classmap.put("class",strNextClass);
  		classmap.put("current_class",commodityclass);
  		classmap.put("stridgrp",stridgrp);
  		classmap.put("className",className);
  		classmap.put("strnamegrp",strnamegrp);
  		classmap.put("trade_type_code",trade_type_code);			
  		pageContext.setAttribute("classmap",classmap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
    <html:link href="enterClass.jsp" name="classmap">
    <%=className%>
    </html:link></td>
    <td class="grayBL" align="left"><%=classDesc%></td>
	<td class="grayBL" align="left">    
	<html:link href="/www/interface/getTradeInterf_fwd.jsp" name="classmap">
	点击增加 >>
    </html:link></td>
    </tr>
    
<%   	
    }
%>
	 
</table>
	<body>
</html>
