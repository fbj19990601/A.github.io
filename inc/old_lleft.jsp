<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=GBK" %>
 
<%@ page import="java.util.*" %> 
<%@ page import="com.saas.biz.rightMgr.*" %> 
 
 
<%
    HttpSession  logsessions = request.getSession(); 
    String menu_id = "";
    String subsys_code="";
    String user_type="";
    String role_code="";
     
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
    if (request.getParameter("subsys_code") != null)
    {
        subsys_code = request.getParameter("subsys_code");
        HttpSession sessions = request.getSession();
        sessions.setAttribute("subsys_code",subsys_code);
    }
    else
    {
        if( logsessions.getAttribute("subsys_code")!= null)
		{
		  subsys_code=logsessions.getAttribute("subsys_code").toString();
		}
    }
    
	if(menu_id == null || menu_id.equals(""))
	{
		if( logsessions.getAttribute("menu_id")!= null)
		{
		  menu_id=logsessions.getAttribute("menu_id").toString();
		}
	}
%> 

<SCRIPT language=javascript>
<!--

function Menu_onclick() 
{
	var srcElement,targetElement,targetArrayElement,targetImgElement;
	var srcID,targetID;
	srcElement=window.event.srcElement;
	srcID=srcElement.id.substr(0,srcElement.id.length-2);
	if (srcElement.className.substr(0,4)=="Menu")
    {   
		targetID=srcID+"-div";
		targetElement=document.all(targetID);
		targetArrayElement = document.all(srcID+"-arrow");
		targetImgElement = document.all(srcID+"-k");
		if (targetElement.style.display=="none")
        {			  
			targetElement.style.display="";		
			targetArrayElement.style.display="";	
			targetImgElement.src="/images/arrow2.gif";
			/**
			var allDIV=document.all.tags("TR");
			for (var i=1;i<allDIV.length;i++)
            if (allDIV(i).id!=targetTrElement)
            {
                var otherID=allDIV(i).id.substr(0,allDIV(i).id.length-4);
                allDIV(i).style.display="none";
            }
            **/
        }
		else
        {
            targetElement.style.display="none";
            targetArrayElement.style.display="none";
            targetImgElement.src="/images/arrow1.gif";	
        }
    }
}

//-->
</SCRIPT> 
 
<%
    RightMenu RightMenuMgr = new RightMenu();
    HttpSession  logsession = request.getSession(); 
    String user_name = "";
    String user_class = "";
 String user_id = "";
     ArrayList firstMenuList = new ArrayList();
	  if(logsession.getAttribute("LINK_URL")!=null && !logsession.getAttribute("LINK_URL").equals(""))
	  {
	     String to_Url=logsession.getAttribute("LINK_URL").toString();
	     logsession.setAttribute("LINK_URL",null);
	     out.println("<meta http-equiv='refresh'  content='0;url="+to_Url+"'>");
	  }
    if (logsession.getAttribute("SESSION_USER_NAME") != null)
    {
        user_name = logsession.getAttribute("SESSION_USER_NAME").toString();
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
        user_class = logsession.getAttribute("SESSION_CUST_CLASS").toString();
        if (logsession.getAttribute("SESSION_ROLE_CODE")!= null) role_code = logsession.getAttribute("SESSION_ROLE_CODE").toString();
        user_type = logsession.getAttribute("SESSION_USER_TYPE").toString();
    }
	else
	{
		out.println("<meta http-equiv='refresh'  content='0;url=/index.jsp'>");
	}
    firstMenuList = RightMenuMgr.genSuperRightMenuList(user_id,user_name,"1",user_class,subsys_code,user_type,role_code);
%>
 <link href="/style/left.css" rel="stylesheet" type="text/css">

  <table width=100% cellspacing="0" cellpadding="0" valign=right border=0 class="new-left">
    <tr>
        <th align="left" style="font-size:14px; font-weight:bolder;">&nbsp;&nbsp;&nbsp;<img src="/images/icon3_menu.gif" width="11" height="11" /><a href="/main.jsp"><bean:message key="str2514"/></a></th>
    </tr> 
     <TR>
    <th>
        
		<TABLE width=100% cellspacing="0" cellpadding="0">
         <TBODY id="menu" language=javascript onclick="return Menu_onclick()">
	    	<%
	    	    if (firstMenuList != null && firstMenuList.size()>0)
	    	    {
	    	        for(Iterator it = firstMenuList.iterator(); it.hasNext();)
            		{
            			HashMap menuInfo = (HashMap)it.next();
            			String menuId = "";
            			String menuName = "";
            			 
            			if (menuInfo.get("var") != null)
            				menuId =menuInfo.get("var").toString();
            			if (menuInfo.get("text") != null)	
            				menuName = menuInfo.get("text").toString();
            %>
	    	<tr >
				<td  class="Menu-T" id=<%=menuId%>-p style="cursor:hand" style="font-size:14px; font-weight:bolder;">
				   &nbsp;&nbsp;&nbsp;<img src="/images/arrow1.gif" width="11" height="11" id="<%=menuId%>-k" />
                     <%=menuName%>
                    
                        <img src="/images/menu_arrow.gif"  style="margin-bottom:0px; border-top:0px;display: none;" id=<%=menuId%>-arrow />
                     
                </td>
			</tr>
			 
			<tr id=<%=menuId%>-div
			    <%
				        String firstMenuId = "";
				         
				        firstMenuId = RightMenuMgr.getfirstMenuId(menu_id);
                        
				        if (!menuId.equals(firstMenuId) || menuId.equals(""))
				        {
				        %>   
				            style="display: none;"
				        <%
				            }
				            else
				            {
				        %>
				            style="display: ;"     
				        <%
				        }
				        %>
			    > 
		  <td>
		    <table width=100% cellspacing="0" cellpadding="0" border="0">	
    				    <%
    				        ArrayList secdMenuList = new ArrayList();
    				        secdMenuList = RightMenuMgr.genchildRightMenuList(user_name,"2",menuId,user_class,role_code,user_type);
    				        if (secdMenuList != null && secdMenuList.size()>0)
            	    	    {
            	    	        for(Iterator secit = secdMenuList.iterator(); secit.hasNext();)
                        		{
                        			HashMap secmenuInfo = (HashMap)secit.next();
                        			String secmenuId = "";
                        			String secmenuName = "";
                        			String remark="";
                        			String images="";
                        			HashMap secmenuListMap = new HashMap();
                        			if (secmenuInfo.get("var") != null)
                        				secmenuId =secmenuInfo.get("var").toString();
                        			if (secmenuInfo.get("text") != null)	
                        				secmenuName = secmenuInfo.get("text").toString();   
                        		    if (secmenuInfo.get("image") != null)
                        		    {	
                        				images = secmenuInfo.get("image").toString(); 
                        		    }
                        		    else
                        		    {
                        		        images = "/images/menuimage/28.gif";
                        		    }
                        		    if (images.equals("")) images = "/images/menuimage/28.gif";
                        		     
									%> 								 	    
    								    <tr>     									   
        							        <td class="second_class_menu" onMouseOver=this.style.backgroundColor='#CCCCCC' onMouseOut=this.style.backgroundColor=''>
        							            <div style="float:left; margin-left:8px;"><img src="<%=images%>" width="30" height="30" border="0"/></div>
												<div style="float:left; line-height:30px; margin-left:5px;"><a href="/gettradeinterface.do?menu_id=<%=secmenuId%>&trade_type_code=0120" target="_self" style="font-size:14px">
        							                        <%=secmenuName%></a></div>
        							           <div style="width:150px; border-bottom:1px dashed #CCCCCC;"></div>
        							        </td>  	
    								    </tr>
								   <%
        			            }
        			        }
        			   %>    
			      </table>
			    
		    </td>
		    </tr> 
            <%				
            	    }
            	}
	    	%> 
	    	 </TBODY>
			 </TABLE> 
		 
  	</th>
    </TR> 
      <tr>
    <td class="bottom">
    <div style="display: none"><bean:message key="str2515"/><br /><img src="/images/manager_ask.jpg" /></div> 
	 </td>
  </tr>
</table> 

 

