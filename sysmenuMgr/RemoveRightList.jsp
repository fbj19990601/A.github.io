<%@ page contentType="text/html;charset=GBK" %><%@ include file="../fuction/include.jsp"%>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import ="com.saas.biz.rightMgr.*"%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css"> 
	</head>

<%
	ArrayList MenuList = new ArrayList();
    commMethodMgr comm=  new commMethodMgr();
    RightMenu  rightMenu  = new RightMenu();
    String menu_class = request.getParameter("menu_class");
    String upMenuId = "";
    String upMenuName = "";
    if (!menu_class.equalsIgnoreCase("1"))
    {
    	upMenuId = request.getParameter("menu_id");
    	upMenuName = comm.ConvertCodeToName("menuname",upMenuId);
    }
    else
    {
    	upMenuName = "Ò»¼¶²Ëµ¥";
    }
    int iClass = new Integer(menu_class).intValue() + 1;
    String strNextClass= String.valueOf(iClass);
    
%>
<body>  
<h5><bean:message key="str2539"/>[<%=upMenuName%>]</h5><br>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str2774"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str2900"/></td>
    <td class="grayD" align="center" width="8%"><bean:message key="str2696"/></td>
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
	    	{  	
	      	xuhao = xuhao +1;
	    		String  menu_name="";
	    		String menuclass ="";
	    		String menu_id = "";
			HashMap menumap = (HashMap) its.next();
	    		HashMap passmap=new HashMap();
	    		menu_id = menumap.get("menu_id").toString();
	    		menu_name = menumap.get("menu_name").toString();
	    		passmap.put("menu_id",menu_id);
	    		passmap.put("menu_class",strNextClass);
	    		passmap.put("menu_name",menu_name);
	  		pageContext.setAttribute("passmap",passmap);
			%>
			<tr>
			<td class="grayBL" align="left"><%=xuhao%></td>
	      	<td class="grayBL" align="left">
	      	 <html:link href="RemoveRightList.jsp" name="passmap">
	    	       <%=menu_name %>
	          </html:link>
	         </td>
			<td class="grayBL" align="left">    
			<a href ="recoverRights.jsp?menu_id=<%=menu_id%>&menu_class=<%=menu_class%>">
	   		    <bean:message key="str2957"/>
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
