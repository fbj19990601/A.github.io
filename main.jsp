<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@ page contentType="text/html;charset=GBK" %>
    <%@ page import="java.util.*" %> 
    <%@ page import="com.saas.biz.rightMgr.*" %> 
    <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
    <%@ page import="com.saas.biz.CollectionsMgr.CollectionsInfo"%>
    <%
    
    response.sendRedirect("/mainMenu/default.jsp");
    
    %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><bean:message key="str3112"/></title>
<link href="style/new_layout.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/images/favicon.ico" />
<link rel="Bookmark" href="/images/favicon.ico"/> 

<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
    <SCRIPT>
             
            WinLIKE.definewindows=mydefss;
            function mydefss() {
                
            	var j=new WinLIKE.window('', 100, 100, '60%', 'WinLIKE.browsersize().Height -Top-30', 2);
            	j.Vis=false;
            	j.Nam='appwin';
            	WinLIKE.addwindow(j);
            };
    </SCRIPT>
<style type="text/css">
 #outer { 
margin:0 auto; 
width:150px; 
border-bottom:1px dashed #ccc;
} 
#outer a { 
display:block; 
background:#fff; 
} 
#outer a:hover {background:#EE9309;} 

 
 
ul, li{margin:0; border:0; list-style:none; padding:0;}
ul{border-bottom:dotted 1px #DEDEDE;}

li{display:inline;}
.menu span{border:solid 1px #EFEFEF;  border-bottom:none;  }
	.menu span a{font-weight:bold;}
	.menu span:hover{border:solid 1px #DEDEDE; border-right:1px solid #999999; border-bottom:none;}
	.arrow{margin-left:4px; cursor:pointer; }
.sub_menu{display:none; position:relative; border:solid 1px #DEDEDE; border-top:none; border-right:solid 1px #999999; border-bottom:1px solid #ccc; padding:2px; top:1px; width:150px; background:#FFFFFF;}
	.sub_menu a:link, .sub_menu a:visited, .sub_menu a:hover{display:block; font-size:13px; padding:4px;}
.item_line{border-top:solid 1px #DEDEDE;}

</style>
<script language="javascript">
function showMenu(id_menu){
var my_menu = document.getElementById(id_menu);
if(my_menu.style.display=="none" || my_menu.style.display==""){
	my_menu.style.display="block";
	} else { 
	my_menu.style.display="none";
	}
}
function swapImage(idStatus){
	if(idStatus==0){
		document.arrow_profile.src ="/images/arrow_hover.png";
	} else if(idStatus==1){
		document.arrow_profile.src ="/images/arrow_select.png";
	} else if(idStatus==2){
		document.arrow_profile.src ="/images/arrow.png";
	}
	
}
</script>
<script language="javascript">
function showMenu(id_menu){
var my_menu = document.getElementById(id_menu);
if(my_menu.style.display=="none" || my_menu.style.display==""){
	my_menu.style.display="block";
	} else { 
	my_menu.style.display="none";
	}
}
function swapImage(idStatus){
	if(idStatus==0){
		document.arrow_profile.src ="/images/arrow_hover.png";
	} else if(idStatus==1){
		document.arrow_profile.src ="/images/arrow_select.png";
	} else if(idStatus==2){
		document.arrow_profile.src ="/images/arrow.png";
	}
	
}
</script>

</head>
<%
    HttpSession  logsessions = request.getSession(); 
	String up_menu_id = "";
	String menu_class = "1";
	String subsys_code = "CTR";
	String user_name = "";
	RightMenu RightMenuPath = new RightMenu();
	if (request.getParameter("menu_id") != null) 
	{
		up_menu_id = request.getParameter("menu_id");
	}
	if(up_menu_id == null || up_menu_id.equals(""))
	{
		if( logsessions.getAttribute("menu_id")!= null)
		{
		  up_menu_id=logsessions.getAttribute("menu_id").toString();
		}
	}
	if (request.getParameter("menu_class") != null) 
	{
		menu_class = request.getParameter("menu_class");
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
%>
<%
   	HttpSession  logsession = request.getSession(); 
    String cust_id="",user_id="";
    String link_name="",link="",link_desc="",in_date="";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }	
		if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
        user_name = logsession.getAttribute("SESSION_USER_NAME").toString();
    }			
     
			     
    CollectionsInfo collections = new CollectionsInfo();
  
   	ArrayList list1 = collections.genCustCollections(cust_id,"1");
   	ArrayList list0 = collections.genCustCollections(cust_id,"0");
  	
%>

<body onResize=WinLIKE.resizewindows() onload="WinLIKE.init();" >

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <jsp:include page="/inc/top_nav.jsp">
    <jsp:param name="subsys_code" value="<%=subsys_code%>" />                
    <jsp:param name="up_menu_id" value="<%=up_menu_id%>" />                
    <jsp:param name="menu_class" value="<%=menu_class%>" />                
  </jsp:include>
  <tr> 
    <td valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="blue" valign="top">
            <jsp:include page="/inc/left_nav.jsp">
              <jsp:param name="subsys_code" value="<%=subsys_code%>" />                
              <jsp:param name="up_menu_id" value="<%=up_menu_id%>" />                
              <jsp:param name="menu_class" value="<%=menu_class%>" />                
            </jsp:include>
            <tr>
                <td width="100%" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td valign="top"><div class="mid-nr1">
                        <div class="mid-nran">
                          <div class="mid-nran1"><a href="javascript:history.go(-1)"><bean:message key="str5003"/></a></div>
                        </div>
                      <div class="mid-nran">
                          <div class="mid-nran3"><a href="/main.jsp"><bean:message key="str5004"/></a></div>
                      </div>
                      <div class="mid-nran" style="margin-left:10px">
                           <bean:message key="str3113"/>
                      </div>
                      <div class="mid-nran" style="display:none">
                          <div class="mid-nran3"><a href="/showCollection.jsp?link_type=1" TARGET=appwin onclick="mydefss()"><bean:message key="str5005"/></a></div>
                      </div>
                      <div class="mid-nran"  style="display:none">
                       <div id="container">
                        <ul>
                        <li class="menu" id="profile">
                        <span>
                        <div class="mid-nran3"><a href="#" onClick="javascript:showMenu('id_menu_profile')" ><bean:message key="str3114"/></a></div>
                        
                        </span>
                            <div class="sub_menu" id="id_menu_profile">
                                <%
          
                       			if(list0 != null && list0.size() > 0)
                       			{	
                       			  for(int i=0;i<list0.size();i++){
                       			   HashMap map=(HashMap)list0.get(i);
                       			   link_name = map.get("link_name").toString();	
                       			   link = map.get("link").toString();
                       			   link_desc = map.get("link_desc").toString();
                       			   in_date =  map.get("in_date").toString();		
                       			         
                       		%>  
                                           <div   id="outer">
                                           <a href="<%=link%>" TARGET=appwin onclick="mydefss()"> 
                                             <%=i%>、<%=link_name%>
                                            </a></div>
                                           
                              <%               
                       			  }
                       			  }
  		                        %>  
                        	</div>
                        </li>
                        </ul>
                        </div>
                        
                          <!--div class="mid-nran3"><a href="/showCollection.jsp?link_type=0" TARGET=appwin onclick="mydefss()">快捷</a></div-->
                      </div>
                      <div class="mid-nran"  style="display:none">
                          <div class="mid-nran3"><a href="/additem.reg"><bean:message key="str5006"/></a></div>
                      </div>
                      
                      <div class="mid-nran4"><bean:message key="str3115"/><%=RightMenuPath.getMenupath(up_menu_id)%></div>
                    </div></td>
                  </tr>
                  <tr>
                    <td valign="top"><div class="mid-nrone" > 
                        <jsp:include page="/inc/center_nav.jsp">
                        <jsp:param name="subsys_code" value="<%=subsys_code%>" />                
                        <jsp:param name="up_menu_id" value="<%=up_menu_id%>" />                
                        <jsp:param name="menu_class" value="<%=menu_class%>" />                
                      </jsp:include>
                    </div></td>
                  </tr>
                </table></td>
            </tr>
             
      </table>
    </td>
  </tr>
  <jsp:include page="/inc/bottom.jsp">
        <jsp:param name="user_name" value="<%=user_name%>" />
        <jsp:param name="cust_id" value="<%=cust_id%>" />
        <jsp:param name="user_id" value="<%=user_id%>" />
  </jsp:include>
</table>

</body>
</html>
