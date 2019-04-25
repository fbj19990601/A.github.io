<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.CollectionsMgr.CollectionsInfo"%>
<%@ page import="java.util.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><bean:message key="str182"/></title>
<link href="style/new_layout.css" rel="stylesheet" type="text/css" />
</head>
 
<body>
  <%
   	HttpSession  logsession = request.getSession(); 
    String cust_id="",user_id="";
    String link_name="",link="",link_desc="",in_date="";
    String link_type ="";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }	
		if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }			
     
    if(request.getParameter("link_type") != null )
	 {		
	 		link_type = request.getParameter("link_type");
	 }
			     
    CollectionsInfo collections = new CollectionsInfo();

   	 ArrayList list = collections.genCustCollections(cust_id,link_type);
  	
 		 %>
  
			<table width="100%" border="0" cellspacing="0" cellpadding="0" > 
			<tr> 
    		    <td valign="top"><div class="new-scone"><bean:message key="str4428"/></div></td>
    		</tr>
 			<tr> 
    		<td valign="top">
    			<table width="90%" height="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="blue" valign="top">
      			<%
         
       			if(list != null && list.size() > 0)
       			{	
       			  for(int i=0;i<list.size();i++){
       			   HashMap map=(HashMap)list.get(i);
       			   link_name = map.get("link_name").toString();	
       			   link = map.get("link").toString();
       			   link_desc = map.get("link_desc").toString();
       			   in_date =  map.get("in_date").toString();		
       			 %>
				  <div  class="new-sc">
			  <div class="new-sc1"><a href="<%=link%>" ><%=link_name%></a></div><div class="new-sc2"><%=in_date%></div>
			  <div class="new-sc3"><%=link_desc%></div>
			  <div class="new-sc4"><%=link%></div>
			</div>
       			 <%         
           		  
       			  }
  		
       			}
       
      		 %>      
                         
      		</table>
			
    		</td>
  		</tr>  
  		<tr id="foot"> 
    <td colspan="2" valign="top" >  
        
      <div class="bot-bq"> 
      <a target="_blank" href="http://daohang.xsaas.com/?p=3"><bean:message key="str2478"/></a> | 
  <a target="_blank" href="http://www.xsaas.com/?page_id=22"><bean:message key="str2479"/></a> | 
  <a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://www.xsaas.com')};"><bean:message key="str2481"/></a>
   <bean:message key="str4430"/><a href="http://www.miibeian.gov.cn/">B2-20060012</a>
	 <script src='http://s54.cnzz.com/stat.php?id=870998&web_id=870998' language='JavaScript' charset='gb2312'></script>   
     </td>
  </tr>
 
		</table>
		 
		
</body>
</html>
