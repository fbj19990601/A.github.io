<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%
    String tf_id=request.getParameter("tf_id"); 
    String tf_type=request.getParameter("tf_type");
    String login_tag = "0";
    String user_name = "";
    HttpSession userloginses=request.getSession();
	if (userloginses.getAttribute("SESSION_USER_ID") != null)
	{
	    login_tag = "1";
	    user_name = userloginses.getAttribute("SESSION_USER_NAME").toString();
	}
%>
<html>
<head>
<title><bean:message key="str116"/></title> 

    <script src="/www/fuction/calendar.js" type="text/javascript"></script>
    <script language="JavaScript" src="/www/fuction/public.js"></script>
    <script>   
    window.setTimeout("document.all.formtest.submit();",1000);   
  </script>
</head>
<body> 
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <jsp:include page="/inc/top.jsp"/> 
       
        <%
            if (login_tag.equals("1"))
            {
        %> 
                <bean:message key="str2621"/>
                <form action="/doTradeinterf.do" name="formtest">
                    <input name="tf_type" type="hidden" value = <%=tf_type%>>
                    <input name="tf_id" type="hidden" value = <%=tf_id%>>
                    <input name="login_tag" type="hidden" value = <%=login_tag%>>
                    <input name="user_name" type="hidden" value = <%=user_name%>>\
                </form>
        <%         
            }
        else
            {
        %>
	    <tr><!-- 中间 -->
	        <td align="left">
	            <%
	                if (!tf_type.equals("4"))
	                {
	            %>
        	        <form action="/doTradeinterf.do">
                        <table width="40%" border="0" cellpadding="0" cellspacing="0" valign="top" align="center" >
                            <tr>
                                <td>
                                    <bean:message key="str2622"/><input name="user_name" type="text" size="13"  tabindex="1" style="border:1px solid #CD8011;"/>                       
                                </td>
                                <td>                        
                                    <bean:message key="str2623"/><input name="passwd" type="password" size="13"  tabindex="2"style="border:1px solid #CD8011;"/>

                                </td>                                
                                <!--td height="30">验证码：
                                    <input name="userrand" type="text" size="4"  tabindex="3" style="border:1px solid #CD8011;"/>
                                    <img src="/checkImage">
                                    <input type="hidden" name="randomcode">
                                </td-->
                                <td>      
                                                      
                                   <input name="submit" type="submit" value="确定" />
                                </td>
                                <input name="tf_type" type="hidden" value = <%=tf_type%>>
                                <input name="tf_id" type="hidden" value = <%=tf_id%>>
                            </tr>
                        </table>
                    </form>
                <%
                    }
                else
                    {
                    %>
                     <table width="40%" border="0" cellpadding="0" cellspacing="0" valign="top" align="center" >
                            <tr>
                                <td>
                                    <br><h3><bean:message key="str2624"/></h3>
                                </td>
                            </tr>
                    </table>
                    </form>
                    <%
                    }
                    }
                %>
                
            </td>
        </tr>
        <tr><!-- 底部 -->
         <td align="center">
	    	<div class="bottom_admin">
	    		<div class="containertow">
                <div class="footer">
                <div class="footer2" style="height: 2px; background-color: #FF4500"><img src="images/032.gif" width="12" height="2"></div>
                <div class="footer3" style="margin-top:6px">
                 <div class="cpy width margin">
                 <div class="about">
                  <!--a target="_blank" href="https://www.xsaas.com/about-us-en.jsp">About XSaaS</a> | --> 
                  <a target="_blank" href="https://www.xsaas.com/about-us.jsp"><bean:message key="str2625"/></a> | 
                  <a target="_blank" href="https://www.xsaas.com/cop.jsp"><font color="red"><bean:message key="str2626"/></font></a> | 
                  <a target="_blank" href="http://daohang.xsaas.com/?p=3"><bean:message key="str3597"/></a> | 
                  <a target="_blank" href="https://www.xsaas.com/links.jsp"><bean:message key="str3542"/></a> | 
                  <!--a target="_blank" href="https://www.xsaas.com/sitemap.jsp">站点地图</a> | -->
                  <a target="_blank" href="https://www.xsaas.com/copyright.jsp"><bean:message key="str4407"/></a> | 
                  <a target="_blank" href="http://bbs.xsaas.com/"><bean:message key="str4514"/></a> | 
                  <a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://360.xsaas.com')};"><bean:message key="str2016"/></a>
                  <bean:message key="str2630"/> &copy;sCopyright XSaaS 2008 <bean:message key="str4726"/><br><bean:message key="str2632"/><a href="http://www.miibeian.gov.cn/">B2-20060012</a><bean:message key="str2633"/></p>
                 
                 </div> 
                
                  
                    
                </div>
                </div>
                </div>
                </div>
	    	</div>
          </td>
       </tr><!-- 底部结束 -->
    </table>
</body>
</html>