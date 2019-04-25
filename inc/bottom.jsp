<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>qWikiOffice</title>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.ahbay.interfaceMgr.*"%>
<%@ page import="com.saas.biz.roleMgr.RoleInfo"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.organizeMgr.OrganizeInfo"%>
<%@ page import="com.saas.biz.infoClassMgr.InfoClassinfo"%>
<%@ page import="java.util.*"%> 
<%@ page import="com.saas.biz.attachMgr.Attachinfo" %>
<%

      HttpSession  httpSesson = request.getSession();     
		  String org_id="";
		  String user_names = "",cust_name="",role_name="",org_name="";
			String cust_id="",role_code="",user_id="";
		  if (httpSesson.getAttribute("DEPART_CODE") != null)
		  {
		      org_id = httpSesson.getAttribute("DEPART_CODE").toString();
		  }
 		/*	if (httpSesson.getAttribute("SESSION_USER_ID") != null)
		  {
		      user_id = httpSesson.getAttribute("SESSION_USER_ID").toString();
		  }*/
    
		Custinfo cust = new Custinfo();
		RoleInfo role = new RoleInfo();
		UserInfo user = new UserInfo();
		OrganizeInfo org = new OrganizeInfo();
		if (request.getParameter("user_name") != null) 
		{
			user_names = request.getParameter("user_name");
		}
		if (request.getParameter("cust_id") != null) 
		{
			cust_id = request.getParameter("cust_id");
		} 
		if (request.getParameter("user_id") != null) 
		{
			user_id = request.getParameter("user_id");
		}  	  
		org_name = org.getOrgnaizeById(org_id); 		
		cust_name = cust.getCustomerNameById( cust_id );		 
	  role_code = user.searchRoleCode( cust_id );
		if( role_code != "" )
		{ 
			role_name = role.getRoleNameById( cust_id, role_code ); 
		}
	else
		{
			role_name="Î´·ÖÅä";
		}
		
%>
<!-- EXT -->
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<script type="text/javascript" src="/js/jquery-1.2.1.pack.js"></script>
<script src="/js/jquery.dimensions.js" type="text/javascript"></script>
<script src="/js/jquery.jdNewsScroll.js" type="text/javascript"></script>
<!-- DESKTOP -->
<script type="text/javascript" src="/js/StartMenu.js"></script>
<script type="text/javascript" src="/js/TaskBar.js"></script>
<script type="text/javascript" src="/js/cookies.js"></script>
<script type="text/javascript" src="/js/desktop.js"></script>
<script type="text/javascript" src="/js/plugins.js"></script>
<link rel="stylesheet" type="text/css" href="/css/desktop.css" />
<link href="/css/jdNewsScroll.css" rel="stylesheet" type="text/css" />
<!-- PLUGINS / APPS -->
<!-- LAYOUT WINDOW TEST -->
<script type="text/javascript" src="/plugins/layout-window/js/plugin.js"></script>
</head>
 
<body>


<tr id="foot"> 
    <td colspan="2" valign="top" > 
          <div class="bot-bj"> 
                <div class="bot-bjleft"> 
				<div class="bot-bjleft1"> 
                    <input type="hidden" id="user_name" value="<%=user_names%>">
<div id="ux-taskbar">
	<div id="ux-taskbar-start"></div>
	<div id="ux-taskbuttons-panel"></div>
	<div class="x-clear"></div>
</div>
</div>
</div>
    <div class="bot-bjright">
				<div class="bot-bjright1">
					
				 <%
					String files="";
					Attachinfo comm1 = new Attachinfo();							 
					files = comm1.getAttachPath( user_id, "0", "0" ); 								 
							               	  		             
				 %>	
				<img src="<%=files%>" width="90" height="70">
				<!--<img src="/images/khtx.gif" width="90" height="70">-->
				</div><strong></strong>
				  <div class="bot-bjright2">
				    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
              <tr>
                <td width="32%" height="19" align="right"><bean:message key="str2917"/></td>
                <td width="68%" height="19" align="left"><%=user_names%></td>
              </tr>
              <tr>
                <td height="19" align="right"><bean:message key="str968"/></td>
                <td height="19" align="left"><%=org_name%></td>
              </tr>
              <tr>
                <td height="19" align="right"><bean:message key="str1068"/></td>        
                <td height="19" align="left"><%=role_name%></td>        
              </tr>        
              <tr>        
                <td height="19" align="right"><bean:message key="str1653"/></td>        
                <td height="19" align="left"><%=cust_name%></td>        
              </tr>    
                 
            </table>
				  </div>
				  <div class="bot-bjright4"> 
				  	  <%
					      String file_path="";
						    Attachinfo comm = new Attachinfo();							 
							file_path = comm.getAttachPath( cust_id, "0", "0" );
							if(file_path.equals("/upload/userdefault.png") || file_path.equals("")){
				       %>	
				     			<font size="3" color="black"><b><%=cust_name%></b></font>
				      <%
				      }else{
				      %>
				      	<img src="<%=file_path%>" width="250" height="70"> 
				      <%
				      }
				      %>
				  </div>
				   
				</div>
          </div>
          <div class="bot-bq"> 
              <a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/18.html"><bean:message key="str2478"/></a> | 
              <a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/22.html"><bean:message key="str2479"/></a> | 
              <a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('soft.xsaas.com') != -1){this.setHomePage('https://soft.xsaas.com')}else{this.setHomePage('http://soft.xsaas.com')};"><bean:message key="str2481"/></a>
               |²£Á§°Í°Íµç×ÓÉÌÎñÍøÕ¾ Ð­°ì<bean:message key="str2482"/> &copy;Copyright bolibaba.com <bean:message key="str2480"/><a href="http://www.miibeian.gov.cn/">B2-20060012</a>ºÅ<bean:message key="str3078"/>
            	 <script src='http://s54.cnzz.com/stat.php?id=870998&web_id=870998' language='JavaScript' charset='gb2312'></script>   
          </div>
      </td>
  </tr>
  <tr> <td height="105px"> </td> </tr>
</body>
<div id="x-desktop">
	 
</div>
 

 
</html>