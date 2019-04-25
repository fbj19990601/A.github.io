<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    HttpSession  logsession = request.getSession(); 
    String user_name = "";
    if (logsession.getAttribute("SESSION_USER_NAME") != null)
    {
        user_name = logsession.getAttribute("SESSION_USER_NAME").toString();
    }
%>

<style type="text/css">
	#wrap{word-wrap:break-word; width:200px;}
</style>

<SCRIPT language=javascript>
<!--

function Menu_onclick() 
{
	var srcElement,targetElement,targetArrayElement,targetImgElement;
	var srcID,targetID;
	srcElement=window.event.srcElement;
	srcID=srcElement.id.substr(0,srcElement.id.length-2);
	 
	if (srcElement.className.substr(0,7)=="mid-xx1")
    {   
		
		targetID=srcID+"-div";
		targetElement=document.all(targetID);
		 
		targetImgElement = document.all(srcID+"-k");
		if (targetElement.style.display=="none")
        {			  
			targetElement.style.display="";		
			 
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
            
            targetImgElement.src="/images/arrow1.gif";	
        }
    }
}

//-->
</SCRIPT> 
<script type="text/javascript">
var HttpRequest;
var url = "/ChatRoomServlet";
function getRequest(){
    if(window.XMLHttpRequest){
        return(new XMLHttpRequest());
    }else if(window.ActiveXObject){
        try{
            return(new ActiveXObject("Msxm12.XMLHTTP"));
        }catch(e){
            try{
                return(new ActiveXObject("Microsoft.XMLHTTP"));
            }catch(e){}
        }
    }
}
function sendRequest(){
    if(document.getElementById("txtMessage").value.length<=0){
        return false;
    }
    HttpRequest = getRequest();
    
    //HttpRequest.onreadystatechange = getMessage;
    HttpRequest.open("POST", url, true);
    HttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var msg;
    msg = "Action=AddMessage&Message=" + document.getElementById("txtMessage").value;
    HttpRequest.send(msg);
    document.getElementById("txtMessage").value = "";
    //document.getElementById("txtMessage").focus();
}
function DisplayMessage(){
    if(HttpRequest.readyState == 4 && HttpRequest.status == 200){
        //alert("abd");
        //alert(HttpRequest.responseText);
        var messages;
        //alert(HttpRequest.responseText);
        messages = HttpRequest.responseText.split("!@#");
        //document.writeln(messages[0]);
        //document.writeln(messages[1]);
        document.getElementById("Messages").innerHTML = messages[0];
        document.getElementById("userList").innerHTML = "User： <br>" + messages[1];
        //document.getElementById
    }
}
function logout(){
    HttpRequest = getRequest();
    HttpRequest.open("POST", url, true);
    HttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var msg;
    
    msg = "Action=Logout";
    HttpRequest.send(msg);
}
function getMessage(){
    HttpRequest = getRequest();
    HttpRequest.onreadystatechange = DisplayMessage;
    HttpRequest.open("POST", url, true);
    HttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var msg;
    msg = "Action=GetMessage";
    HttpRequest.send(msg);
    //document.getElementById("txtMessage").focus();
}
function login(){
    HttpRequest = getRequest();
    //var WshNetwork = new ActiveXObject("WScript.Network");
    
    HttpRequest.open("POST", url, true);
    HttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var msg;
    msg = "Action=Login&UserName=<%=user_name%>";// + WshNetwork.UserName;
    HttpRequest.send(msg);
    
    setInterval('getMessage();', 1000);
}
function chkSubmit(e){
    if(window.event){
        var keyNumber = e.keyCode;
        if(keyNumber == 13){
            sendRequest();
        }
    }
}
</script>
<tr>
    <td valign="top" rowspan="2"  >
        
        <div class="mid-bj" >
            <div class="mid-xx"   language=javascript onclick="return Menu_onclick()">
    		   <div class="mid-xx1"  class="Menu-T" id=sss-p style="cursor:hand">
    		      <div class="mid-xx3" ><bean:message key="str2485"/></div>
    			  <div class="mid-xx4">
    			    <img src="/images/arrow2.gif" width="11" height="11" id="sss-k">
    			    </div>
    		   </div>
    	       <div class="mid-xx2"  id=sss-div>
    		        <table>
    		            <tr><td><img src="/images/qlink/home22.gif" border=0></td><td><a href="/main.jsp" style="text-decoration:underline;"><bean:message key="str5004"/></a></td></tr> 
    			        <tr><td><img src="/images/qlink/cust22.gif" border=0></td><td><a href="/main.jsp?menu_id=2EpTpGfO71V2R8217W8S&menu_class=2&subsys_code=CRM" style="text-decoration:underline;">管理我的客户<bean:message key="str116"/></a></td></tr>
    			        <tr><td><img src="/images/qlink/conman22.gif" border=0></td><td><a href="/main.jsp?menu_id=X4c12v6jV1PVDO46v7k&menu_class=3&subsys_code=CRM" style="text-decoration:underline;">我的联系人<bean:message key="str116"/></a></td></tr>
    			        <tr><td><img src="/images/qlink/sale22.gif" border=0></td><td><a href="/main.jsp?menu_id=3Tp34JE0GT3nls6B134N&menu_class=2&subsys_code=CRM" style="text-decoration:underline;">竞争对手<bean:message key="str116"/></a></td></tr>
    			        <tr><td><img src="/images/qlink/group22.gif" border=0></td><td><a href="/main.jsp?menu_id=l1d853CqXO47m4eK48H8&menu_class=3&subsys_code=CRM" style="text-decoration:underline;">联系人和客户群组<bean:message key="str116"/></a></td></tr>
    			        <tr><td><img src="/images/qlink/agent22.gif" border=0></td><td><a href="/main.jsp?menu_id=4K0IW4hgf48e5q1s&menu_class=3&subsys_code=CRM" style="text-decoration:underline;">经销商和渠道<bean:message key="str116"/></a></td></tr>
    			        
    			    </table>
    		   </div>
    	     </div>
    		 <div class="mid-xx" language=javascript onclick="return Menu_onclick()">
    		   <div class="mid-xx1" class="Menu-T" id=kkk-p style="cursor:hand">
    		      <div class="mid-xx3"><bean:message key="str2486"/></div>
    			  <div class="mid-xx4"><img src="/images/arrow2.gif" width="11" height="11" id="kkk-k"></div>
    		   </div>
    		   <div class="mid-xx2" id=kkk-div>
    		     <ul>
    			  <li><bean:message key="str2492"/></li>
    			  <li><bean:message key="str2493"/></li>
    			  <li><bean:message key="str3085"/><A href="msnim:chat?contact=shpoly@hotmail.com" target=blank>MSN</A></li>
    			  <li><bean:message key="str2496"/></li>
    			  <li><bean:message key="str2497"/></li>
    			  <li><bean:message key="str2498"/></li>
    			  <li><bean:message key="str2499"/></li>
    			</ul>
    			 <div align="right"><a href=""><bean:message key="str2500"/></a></div>
    		   </div>
    		 </div>
    		 <div class="mid-xx" language=javascript onclick="return Menu_onclick()">
    		   <div class="mid-xx1" class="Menu-T" id=aaa-p style="cursor:hand">
    		      <div class="mid-xx3"><bean:message key="str3086"/></div>
    			  <div class="mid-xx4"><img src="/images/arrow2.gif" width="11" height="11" id="aaa-k"></div>
    		   </div>
    		   <div class="mid-xx2" id=aaa-div>
    		    <form action="#" onsubmit="return false;">
    		    <div >
    		    <table width="200" border="0" cellpadding="0" cellspacing="0">
    		     <tr id="wrap">
    		      <td id="Messages">
    		     </td>
    		     </tr> 
    		    </table>
    		    </div>
    			<input type="text" size="20" id="txtMessage" onkeypress="chkSubmit(event);">
    			 &nbsp;&nbsp;<button onclick="sendRequest();"><bean:message key="str3087"/></button>
    		</form>
    		<div id="userList"></div>
    		   </div>
    		 </div>
	   </div>	       
      </td>
</tr>