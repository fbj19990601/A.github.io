<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%@ page import="com.base.config.ProjectConfig"%>
<html>
<head>
<title><bean:message key="str116"/></title> 
    <link href="/style/layout.css" rel="stylesheet" type="text/css">
    <script src="/www/fuction/calendar.js" type="text/javascript"></script>
    <script language="JavaScript" src="/www/fuction/public.js"></script>
</head>
<body>	
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <jsp:include page="/inc/top.jsp"/>
	   	 	<tr><!-- 中间 -->
            <td align="center" >        
	         			<div id="manager_body"> <!--左边菜单-->
		                <div id="manager_body_left">
		                    <jsp:include page="/inc/left.jsp"/>
		                </div>
		                <div id="manager_body_right">
                     	<table width="740" border="0" cellspacing="0" cellpadding="0">
	                        <tr>
	                          <td>
                                <div id="righttop">
                                 <%@ include file="new_create.jsp"%>
                                </div>
	                          </td>
	                        </tr>
                    	 </table>
                		</div>  <!--右边 主体部分结束  -->
            		</div>
            </td>  <!-- 中间 结束 -->  
        </tr>
        <tr><!-- 底部 -->
          <td align="center">
			    	<div class="bottom_admin">
			    		<%@ include file="../../bottom.jsp" %>
			    	</div>
          </td>
       </tr><!-- 底部结束 -->
    </table>
</body>
</html>

