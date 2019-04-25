<%@ page contentType="text/html;charset=GBK" %>
<link href="/css/stylevista.css" media="all" rel="stylesheet" type="text/css" /> 
<%@ page import="java.util.*" %> 
<%@ page import="com.saas.biz.rightMgr.*" %> 

<%
    RightMenu RightMenuMgr = new RightMenu();
    HttpSession  logsession = request.getSession(); 
    String user_name = "";
    String user_class = "";
    String menu_id = "";
    String thmenuId = "";
    String thmenuClass = "";
    String thmenuName = "";
    String inmenuId = "";
    String inmenuClass = "";
    String inmenuName = "";
    String upmenuId = "";
    String user_type="";
    String role_code="";
    String menu_id_now = "";
    
    ArrayList firstMenuList = new ArrayList();
    ArrayList inMenuList = new ArrayList();
    ArrayList thirdMenuList = new ArrayList();
    if (logsession.getAttribute("SESSION_USER_NAME") != null)
    {
        user_name = logsession.getAttribute("SESSION_USER_NAME").toString();
        user_class = logsession.getAttribute("SESSION_CUST_CLASS").toString();
        if (logsession.getAttribute("SESSION_ROLE_CODE")!= null) role_code = logsession.getAttribute("SESSION_ROLE_CODE").toString();
        user_type = logsession.getAttribute("SESSION_USER_TYPE").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
	if(menu_id == null || menu_id.equals(""))
	{
		if( logsession.getAttribute("menu_id")!= null)
		{
		  menu_id=logsession.getAttribute("menu_id").toString();
		}
	}
    inMenuList = RightMenuMgr.getMenuInfo(menu_id);
    if (inMenuList != null  && inMenuList.size()>0)
    {
        for(Iterator init = inMenuList.iterator(); init.hasNext();)
    	{
    		HashMap inmenuInfo = (HashMap)init.next();
    		
    		if (inmenuInfo.get("menu_id") != null)
    			inmenuId =inmenuInfo.get("menu_id").toString();
    		if (inmenuInfo.get("menu_class") != null)
    			inmenuClass =inmenuInfo.get("menu_class").toString();	
    		if (inmenuInfo.get("up_menu_id") != null)
    			upmenuId =inmenuInfo.get("up_menu_id").toString();		
    		if (inmenuClass.equals("3"))
            {
                menu_id = upmenuId;
            }
             
    	}
    }     
    
    thirdMenuList = RightMenuMgr.genchildRightMenuList(user_name,"3",menu_id,user_class,role_code,user_type);

   if  (inmenuId.equals("")) 
    {
        menu_id_now = menu_id;
    }
    else
    {
        menu_id_now = inmenuId;
    }

%>
 
<div id="vista_toolbar">
<ul>
<%
    if (thirdMenuList != null && thirdMenuList.size()>0)
    {
        for(Iterator thit = thirdMenuList.iterator(); thit.hasNext();)
    	{
    		HashMap thmenuInfo = (HashMap)thit.next();
    		
    		if (thmenuInfo.get("var") != null)
    			thmenuId =thmenuInfo.get("var").toString();
    		if (thmenuInfo.get("text") != null)	
    			thmenuName = thmenuInfo.get("text").toString();   
           
%>

    <li>
     <a href="/gettradeinterface.do?menu_id=<%=thmenuId%>&trade_type_code=0120" target="_self"><span> 
        <img align="left" src="/images/details.gif" valign="top"/>
     <%
        if (menu_id_now.equals(thmenuId)) 
        {
     %>        
      <b><font style="color:black"><%=thmenuName%></font></b>
     <%
        }
        else
        {
     %>
        <%=thmenuName%>
     <%
        }
     %></span>
     </a>
     </li>
 


<%    			
    	}
    }
%> 

    <li>
        <a class="right" href="#">
            <span><img align="left" src="/images/sos.gif" alt="help" />Help</span>
        </a>
    </li>
</ul>
</div>
 