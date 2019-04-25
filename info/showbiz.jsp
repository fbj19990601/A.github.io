<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:useBean id="dateformat" scope="session" class="com.xsaas.util.Dateformat" />
<%
	com.xsaas.util.DBConnection dbc = new com.xsaas.util.DBConnection(true);
	com.xsaas.util.Charset charset = new com.xsaas.util.Charset();
	
	String title = "",content="";
	dbc.getConnection();
	String id = request.getParameter("id");
	if (id==null) id ="0";
	ResultSet rs = dbc.getRS("select * from saasnews.agriyp where id='"+id+"'");
	
 
    String xcontury="";
    String xcity   ="";
    String xnumber ="";
    String xborn   ="";
    String xmodel  ="";
    String xaddress="";
    String xpost   ="";
    String xman    ="";
    String xtel    ="";
    String xfax    ="";
    String xphone  ="";
    String website ="";
    String email   ="";
    String xurl    ="";
    String xtime   ="";
    String xuser   ="";
    String xclass  ="";
    String xcolor  ="";

	while(rs.next())
	{
		title = charset.ISO_2_GBK(rs.getString("factory"));
		content = charset.ISO_2_GBK(rs.getString("xbrief"));  
		 
        xcontury=charset.ISO_2_GBK(rs.getString("xcontury"));
        xcity=charset.ISO_2_GBK(rs.getString("xcity"));
        xnumber=charset.ISO_2_GBK(rs.getString("xnumber"));
        xborn=charset.ISO_2_GBK(rs.getString("xborn"));
        xmodel=charset.ISO_2_GBK(rs.getString("xmodel"));
        xaddress=charset.ISO_2_GBK(rs.getString("xaddress"));
        xpost=charset.ISO_2_GBK(rs.getString("xpost"));
        xman=charset.ISO_2_GBK(rs.getString("xman"));
        xtel=charset.ISO_2_GBK(rs.getString("xtel"));
        xfax=charset.ISO_2_GBK(rs.getString("xfax"));
        xphone=charset.ISO_2_GBK(rs.getString("xphone"));
        website=charset.ISO_2_GBK(rs.getString("website"));
        email=charset.ISO_2_GBK(rs.getString("email"));
        xurl=charset.ISO_2_GBK(rs.getString("xurl"));
        xtime=charset.ISO_2_GBK(rs.getString("xtime"));
	}   
	content = content.replaceAll("&quot;","'");
%>      
<html>  
        
	<head>
        
		<title><bean:message key="str2559"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<link href="/css/new.css" rel="stylesheet" type="text/css" />
	</head>
        
	<body> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- 中间 -->
				<td align="center">
					<div id="manager_body">
						<!--左边菜单-->
						<div id="manager_body_left">
							<jsp:include page="/info/menu.jsp" />
						</div>
						<div id="manager_body_right">							 
							<div class="newxx">
            			     <div class="newxxone"><h1><%= title %></h1>
            				 </div>
            				 <div class="newxxone1"><%= content %></div><br>
            				 <div class="newxxone"><h1><bean:message key="str2595"/></h1>
            				 </div>
                             <div class="newxxone1"><bean:message key="str2603"/><%=xcontury%>  </div>
                             <div class="newxxone1"><bean:message key="str2604"/><%=xcity   %></div>
                             <div class="newxxone1"><bean:message key="str2605"/><%=xnumber %></div>
                             <div class="newxxone1"><bean:message key="str2606"/><%=xborn   %></div>
                             <div class="newxxone1"><bean:message key="str2607"/><%=xmodel  %>   </div>                        
                             <div class="newxxone1"><bean:message key="str2608"/><%=xaddress%></div>
                             <div class="newxxone1"><bean:message key="str2609"/><%=xpost   %></div>
                             <div class="newxxone1"><bean:message key="str2610"/><%=xman    %></div>
                             <div class="newxxone1"><bean:message key="str2611"/><%=xtel    %></div>
                             <div class="newxxone1"><bean:message key="str2612"/><%=xfax    %></div>
                             <div class="newxxone1"><bean:message key="str2613"/><%=xphone  %></div>
                             <div class="newxxone1"><bean:message key="str2614"/><%=website %></div>
                             <div class="newxxone1"><bean:message key="str2615"/><%=email   %></div>

            			    </div>

						</div>

						<!--右边 主体部分结束  -->

					</div>

				</td>

				<!-- 中间 结束 -->

			</tr>

			<tr>

				<!-- 底部 -->

				<td align="center">

					<jsp:include page="/bottom.jsp"/>

				</td>

			</tr>

			<!-- 底部结束 -->

		</table>

	</body>

</html>

