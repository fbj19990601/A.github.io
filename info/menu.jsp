<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.rightMgr.*" %> 
<%
    RightMenu RightMenuMgr = new RightMenu();
    HttpSession  logsession = request.getSession(); 
    
      
	if(logsession.getAttribute("LINK_URL")!=null && !logsession.getAttribute("LINK_URL").equals(""))
	{
	   String to_Url=logsession.getAttribute("LINK_URL").toString();
	   logsession.setAttribute("LINK_URL",null);
	   out.println("<meta http-equiv='refresh'  content='0;url="+to_Url+"'>");
	}
    if (logsession.getAttribute("SESSION_USER_NAME") != null)
    {
        
    }
	else
	{
		out.println("<meta http-equiv='refresh'  content='0;url=/index.jsp'>");
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
 <link href="/style/left.css" rel="stylesheet" type="text/css">
<table width=100% cellspacing="0" cellpadding="0" valign=right border=0 class="new-left">
    <tr>
        <th align="left">&nbsp;&nbsp;&nbsp;<img src="/images/icon3_menu.gif" width="16" height="16" />
            <a href="/main.jsp"><bean:message key="str2514"/></a></th>
    </tr> 
    <TR>
     
         <TBODY id="Menu" language=javascript onclick="return Menu_onclick()">	    	
	    	<tr>
				<td  class="Menu-T" id=nhs35VKuD6X51A3-p style="cursor:hand" >
				   &nbsp;&nbsp;&nbsp;<img src="/images/arrow2.gif" width="11" height="11" id="nhs35VKuD6X51A3-k" />
                      <bean:message key="str2579"/>                   
                    <img src="/images/menu_arrow.gif"  style="margin-bottom:0px; border-top:0px;display: none;" id=nhs35VKuD6X51A3-arrow />
                </td>
			</tr>			 
			<tr id=nhs35VKuD6X51A3-div style="display: yes;">
				<td>
    				<table width=100% cellspacing="0" cellpadding="0">    				        				    
					    <tr> 
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=1" target="_self"><bean:message key="str2580"/></a>
					    	</td>
					    </tr>		    
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=2" target="_self"><bean:message key="str2581"/></a>
					    	</td>
					    </tr>		    
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=3" target="_self"><bean:message key="str2582"/></a>
					    	</td>
					    </tr> 
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=4" target="_self"><bean:message key="str2583"/></a>
					    	</td>
					    </tr> 
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=5" target="_self"><bean:message key="str2584"/></a>
					    	</td>
					    </tr> 
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=6" target="_self"><bean:message key="str2585"/></a>
					    	</td>
					    </tr> 
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=7" target="_self"><bean:message key="str2586"/></a>
					    	</td>
					    </tr> 
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getinfodate.jsp?type=0&class=8" target="_self"><bean:message key="str2587"/></a>
					    	</td>
					    </tr> 
			      </table>			        
			    </td>
		    </tr> 
            
	    	<tr>
				<td  class="Menu-T" id=5v4uD017Mj0L20t-p style="cursor:hand" >
				   &nbsp;&nbsp;&nbsp;<img src="/images/arrow2.gif" width="11" height="11" id="5v4uD017Mj0L20t-k" />
                    <bean:message key="str2588"/>
                    <img src="/images/menu_arrow.gif"  style="margin-bottom:0px; border-top:0px;display: none;" id=5v4uD017Mj0L20t-arrow />
                     
                </td>
			</tr>
			 
			<tr id=5v4uD017Mj0L20t-div style="display: yes;">
				<td>
    				<table width=100% cellspacing="0" cellpadding="0">
    				    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getmarketdate.jsp?type=2" target="_self"><bean:message key="str2589"/></a>
					    	</td>
					    </tr>
					    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getmarketdate.jsp?type=3" target="_self"><bean:message key="str2590"/></a>
					    	</td>
					    </tr>
			      </table>
			        
			    </td>
		    </tr> 
            
	    	<tr >
				<td  class="Menu-T" id=pf2mMM080X0G85BH-p style="cursor:hand" >
				   &nbsp;&nbsp;&nbsp;<img src="/images/arrow2.gif" width="11" height="11" id="pf2mMM080X0G85BH-k" />
                    <bean:message key="str2591"/>                   
                   <img src="/images/menu_arrow.gif"  style="margin-bottom:0px; border-top:0px;display: none;" id=pf2mMM080X0G85BH-arrow />                     
                </td>
			</tr>
			 
			<tr id=pf2mMM080X0G85BH-div style="display: yes;" >
				<td>
    				<table width=100% cellspacing="0" cellpadding="0">
    				    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getbizdate.jsp?type=0" target="_self"><bean:message key="str2592"/></a>
					    	</td>
					    </tr>
					     
			      </table>
			    </td>
		    </tr> 
            
	    	<tr >
				<td  class="Menu-T" id=45r65810WNA30A5-p style="cursor:hand" >
				   &nbsp;&nbsp;&nbsp;<img src="/images/arrow2.gif" width="11" height="11" id="45r65810WNA30A5-k" />
                     <bean:message key="str2593"/>
                     <img src="/images/menu_arrow.gif"  style="margin-bottom:0px; border-top:0px;display: none;" id=45r65810WNA30A5-arrow />                     
                </td>
			</tr>
			 
			<tr id=45r65810WNA30A5-div style="display: yes;">
				<td>
    				<table width=100% cellspacing="0" cellpadding="0">
    				    <tr>    
					    	<td class="second_class_menu">
					    	   <img src="/images/icon3_menu.gif" width="16" height="16" />
					    	   <a href="/info/getpricedate.jsp?type=0" target="_self"><bean:message key="str2594"/></a>
					    	</td>
					    </tr>
					     
			      </table>			        
			    </td>
		    </tr>              
	    	</TBODY>
	    	 
    </TR>
	    	</TABLE> 