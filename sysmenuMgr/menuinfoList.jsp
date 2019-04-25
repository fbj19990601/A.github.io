<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.ahbay.RightMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.rightMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str3982"/></title>
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('你确定要删除？')) 
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
    MenuinfoMgr menuList = new MenuinfoMgr();
    RightMenu comm=  new RightMenu();
    String menuclass = request.getParameter("class");
    String upMenuId = "";
    String upMenuName = "";
    if (!menuclass.equalsIgnoreCase("1"))
    {
    	upMenuId = request.getParameter("menuId");
    	upMenuName = comm.getMenuNameById(upMenuId);
    }
    else
    {
    	upMenuName = "一级菜单栏目";
    }
    int iMenuClass = new Integer(menuclass).intValue() + 1;
    String strNextClass= String.valueOf(iMenuClass);
%>
<body>  
<h1><bean:message key="str3982"/>[<%=upMenuName%>]</h1>  
	 <div class="line6">
           <div class="img"><img src="/images/icon3_manager_rightbody.gif" /></div>
             <a href="addMenuInclude.jsp?class=<%=menuclass%>&menuId=<%=upMenuId%>"><img src="/images/manager_button2.gif" style="border:0px" /></a>
           <span class="title"><bean:message key="str3983"/></span><br />
      </div>
      <div class="line6">
  
<bean:message key="str3984"/>   <%
                                RightMenu sysright = new RightMenu();
                                ArrayList syslist = sysright.genSysServ();
                                if (syslist != null)
                                {
                                    for(Iterator it = syslist.iterator(); it.hasNext();)
                        		    {
                            			HashMap sysInfo = (HashMap)it.next();
                            			String sysname = "";
                            			String syscode = "";
                            			if (sysInfo.get("para_code1") != null) syscode =sysInfo.get("para_code1").toString();
                            			if (sysInfo.get("para_code2") != null) sysname =sysInfo.get("para_code2").toString();
                            %>
                                    『<a href = /sysmenuMgr/sysMenuList.jsp?class=1&sel_sys=<%=syscode%>&menu_id=<%=upMenuId%>&info_type=0><%=sysname%></a>』
                <%			
                                    }
                            			
                                }
                %>
 </div>     
<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7" >
  <tr>    
    <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="8%"><bean:message key="str1340"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str2531"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="30%"><bean:message key="str2542"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="30%"><bean:message key="str2543"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="8%"><bean:message key="str2677"/></td>
  </tr>
<%
    String sel_sys_code= "SYS";
	if (request.getParameter("sel_sys")!= null)
	{
	    sel_sys_code  =request.getParameter("sel_sys");
	}	 
 	menuList.setMenu_class(request.getParameter("class"));
 	menuList.setSubsys_code(sel_sys_code);
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
  		menumap.put("sel_sys",sel_sys_code);	
  			
  		menumap.put("class",strNextClass);				
  		pageContext.setAttribute("menumap",menumap);
%>
	<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onMouseOver="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onMouseOut="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	<td style=" color:#000000;" align="center"><%=String.valueOf(i+1)%></td>
    <td style=" color:#000000;" align="center">
    <html:link href="sysMenuList.jsp" name="menumap">
    <%=menuName%>
    </html:link></td>
	<td style=" color:#000000;" align="center"><%=menuName%></td>
	<td style=" color:#000000;" align="center"><%=menuDate%></td>
	<td style=" color:#000000;" align="center">    
	<html:link action="/delmenu" name="menumap" target="right" onclick="return confirmremove()">
    <img src="/img/del.gif" style="border:0px;">
    </html:link></td>
    </tr>

<%
    	
    	downBegin=String.valueOf(i+1);
    	j++;
    	if (j>=15) break;    
    }

%>
	<tr> 
	    <td colspan=7    class="line1"> 
		    <table width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
		    <tr> 
			    <td height="20"  style="font-weight:normal;"><bean:message key="str3988"/><%=strRows%>  <bean:message key="str2925"/></td>
			    <td width="273" align="right"> 
			    <div align="left" style="font-weight:normal;">
			    <%			                          	
			    	HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0"); 
			  		indexmap.put("class",request.getParameter("class")); 
			  		indexmap.put("menuId",upMenuId);		
			  		indexmap.put("sel_sys",sel_sys_code);						 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="sysMenuList.jsp" name="indexmap"><bean:message key="str1030"/> </html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
			  		upmap.put("menuId",upMenuId);
			  		upmap.put("class",request.getParameter("class")); 	
			  		upmap.put("sel_sys",sel_sys_code);								 
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="sysMenuList.jsp" name="upmap"><bean:message key="str1031"/></html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	downmap.put("menuId",upMenuId);
				  	downmap.put("sel_sys",sel_sys_code);			
				  	downmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="sysMenuList.jsp" name="downmap"><bean:message key="str1032"/> </html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	endmap.put("sel_sys",sel_sys_code);		
				  	endmap.put("menuId",upMenuId);
				  	endmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("endmap",endmap);
			  	%>
			  		  					
				<html:link href="sysMenuList.jsp" name="endmap"><bean:message key="str2545"/></html:link>
			    </div>
		      </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
