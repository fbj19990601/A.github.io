<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.ahbay.RightMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str3268"/>(http://soft.xsaas.com)</title>
		<link href="style/list.css" rel="stylesheet" type="text/css">
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
    String menuclass = request.getParameter("class");
    String upMenuId = "";
    String upMenuName = "";
    if (!menuclass.equalsIgnoreCase("1"))
    {
    	upMenuId = request.getParameter("menuId");
    	upMenuName = comm.ConvertCodeToName("menuname",upMenuId);
    }
    else
    {
    	upMenuName = "一级栏目";
    }
    int iMenuClass = new Integer(menuclass).intValue() + 1;
    String strNextClass= String.valueOf(iMenuClass);
%>
<body>  
<table width="80%" border="0" cellpadding="10" cellspacing="0" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayE" align="right" colspan="6">
      <a href="sysAddMenu.jsp?class=<%=menuclass%>&menuId=<%=upMenuId%>"><bean:message key="str2541"/></a>
    </td>
  </tr>
 <tr class="list_tr"  style="background-image: url(../../images/bg1_list_td.gif); background-repeat: repeat-x;">
    <td  align="center" width="8%" class="list_td"><bean:message key="str2774"/></td>
    <td  align="center" width="20%" class="list_td"><bean:message key="str3985"/></td>
    <td  align="center" width="30%" class="list_td"><bean:message key="str3986"/></td>
    <td  align="center" width="30%" class="list_td"><bean:message key="str3987"/></td>
    <td  align="center" width="8%" class="list_td"><bean:message key="str1295"/></td>
  </tr>
<%
    MenuinfoMgr menuList = new MenuinfoMgr();
 	menuList.setMenu_class(request.getParameter("class"));
    String strSql = "";
    if (request.getParameter("class").equalsIgnoreCase("1"))
    {
    	strSql = "SEL_BY_CLASS_1";
    }
    else
    {
    	menuList.setUp_menu_id(upMenuId);
    	strSql = "SEL_BY_UP";
    }
    ArrayList menuArray = menuList.GetMenuList(strSql);
	MenuinfoMgr[] menuinfo = menuList.GetList(menuArray);
	String strRows =  String.valueOf(menuinfo.length);
 	int intBegin=0;                          
    int realcount=menuinfo.length;
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
	for (int i=intBegin;i<menuinfo.length;i++)
    {
    	String menuId = menuinfo[i].getMenu_id();
    	String menuName = menuinfo[i].getMenu_name();
    	String menuIntf = menuinfo[i].getModule_id();
    	String menuDate = menuinfo[i].getIn_date().substring(0,10);
    	HashMap menumap=new HashMap();
  		menumap.put("menuId",menuId);
  		menumap.put("upMenuId",upMenuId);		
  		menumap.put("class",strNextClass);				
  		pageContext.setAttribute("menumap",menumap);
%>
	<tr class="list_tr"  style="background-image: url(../../images/bg1_list_td.gif); background-repeat: repeat-x;">
	<td class="list_tr" align="center"><%=String.valueOf(i+1)%></td>
    <td class="list_tr" align="center">
    <html:link href="index.jsp" name="menumap">
    <%=menuName%>
    </html:link></td>
	<td class="list_tr" align="center"><%=comm.ConvertCodeToName("modulename",menuIntf)%></td>
	<td class="list_tr" align="center"><%=menuDate%></td>
	<td class="list_tr" align="center">    
	<html:link action="/delmenu" name="menumap" target="right" onclick="return confirmremove()">
    <bean:message key="str2677"/>
    </html:link></td>
    </tr>
<%
    	downBegin=String.valueOf(i+1);
    	j++;
    	if (j>=15) break;    
    }
%>
	 <tr class="list_tr"  style="background-image: url(../../images/bg1_list_td.gif); background-repeat: repeat-x;">
	    <td colspan=7> 
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		    <tr> 
			    <td height="20"><bean:message key="str3988"/><font color="#990000"><%=strRows%></font><bean:message key="str3989"/> </td>
			    <td width="220"> 
			    <div align="right">
			    <%			                          	
			    	HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0"); 
			  		indexmap.put("class",request.getParameter("class")); 
			  		indexmap.put("menuId",upMenuId);							 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
				<html:link href="index.jsp" name="indexmap"><bean:message key="str1030"/> </html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
			  		upmap.put("menuId",upMenuId);
			  		upmap.put("class",request.getParameter("class")); 							 
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
				<html:link href="index.jsp" name="upmap"><bean:message key="str1031"/></html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	downmap.put("menuId",upMenuId);
				  	downmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
				<html:link href="index.jsp" name="downmap"><bean:message key="str1032"/> </html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	endmap.put("menuId",upMenuId);
				  	endmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("endmap",endmap);
			  	%>
				<html:link href="index.jsp" name="endmap"><bean:message key="str2926"/> </html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
