<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import ="com.saas.biz.rightMgr.*"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str4085"/>(http://soft.xsaas.com)</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css"> 
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
	ArrayList MenuList = new ArrayList();
    commMethodMgr comm=  new commMethodMgr();
    RightMenu  rightMenu  = new RightMenu();
    String menu_class = request.getParameter("class");
    String upMenuId = "";
    String upMenuName = "";
    if (!menu_class.equalsIgnoreCase("1"))
    {
    	upMenuId = request.getParameter("menuId");
    	upMenuName = comm.ConvertCodeToName("menuname",upMenuId);
    }
    else
    {
    	upMenuName = "一级菜单";
    }
    int iClass = new Integer(menu_class).intValue() + 1;
    String strNextClass= String.valueOf(iClass);
    
%>
<body>  
<table width="80%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str1340"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str2531"/></td>
    <td class="grayD" align="center" width="8%"><bean:message key="str2532"/></td>
  </tr>
<%
	if(menu_class.equals("1"))
	MenuList  = rightMenu.genMenuRight("1");
	else
	MenuList = rightMenu.genDownMenu(upMenuId);
	int xuhao =0;
	if(MenuList!=null)
	{
		for (Iterator its = MenuList.iterator(); its.hasNext();) 
    	{  	xuhao = xuhao +1;
    		String  menu_name="";
    		String menuclass ="";
    		String menu_id = "";
			HashMap menumap = (HashMap) its.next();
    		HashMap passmap=new HashMap();
    		menu_id = menumap.get("menu_id").toString();
    		menu_name = menumap.get("menu_name").toString();
    		passmap.put("menuId",menu_id);
    		passmap.put("class",strNextClass);
    		passmap.put("menu_name",menu_name);
  			pageContext.setAttribute("passmap",passmap);
		%>
		<tr>
		<td class="grayBL" align="left"><%=xuhao%></td>
    	<td class="grayBL" align="left">
    	<html:link href="MenuRightMgr.jsp" name="passmap">
    	<%=menu_name %>
    	</html:link></td>
		<td class="grayBL" align="left">    
		<a href ="addMenuRights.jsp?menu_id=<%=menu_id%>&menu_class=<%=menu_class%>">
   		<bean:message key="str2533"/>
    	</a>|
		<a href ="recoverRights.jsp?menu_id=<%=menu_id%>&menu_class=<%=menu_class%>">
	   		    <bean:message key="str2534"/>
	      	</a>
    	</td>
    	</tr>
		<% 	 
		}
	}	
%>
</table>
	<body>
</html>
