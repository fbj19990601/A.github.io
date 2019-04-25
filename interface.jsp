<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<script language="JavaScript" src="/www/fuction/public.js"></script>
<%
String toreg = "/Newcregister.jsp";
String code = "";
Custinfo cust = new Custinfo();
String cust_name = "";
ArrayList custlist = new ArrayList();
if (request.getParameter("code") != null)
{
    code = request.getParameter("code");
    custlist = cust.getCustListByCode(code);
}  
if (custlist == null || custlist.size() <= 0)
{
    out.print("授权码不存在或者，非法的授权码，禁止登录注册！");
    return;
}
if (custlist != null && custlist.size() > 0)
{
    HashMap map = (HashMap) (custlist.get(0));
    if (map.get("cust_name") != null)
    {
    	cust_name = map.get("cust_name").toString();
    }
}
toreg = toreg+"?code="+code;
%>
<html>
<head>
    <script language="javascript">
    function redirectit()
    {    
        setTimeout("redirectit1();",  2000);
    }
    function redirectit1()
    { 
        alert("业务受理成功！");         
                
        window.location.href("<%=toreg%>"); 
    }
    </script>
<STYLE type=text/css>BODY {
	BACKGROUND: #fff; MARGIN: 80px auto; FONT: 14px/150% Verdana, Georgia, Sans-Serif; COLOR: #000; TEXT-ALIGN: center
}
A:link {
	COLOR: #2c4c78; TEXT-DECORATION: underline
}
A:visited {
	COLOR: #2c4c78; TEXT-DECORATION: underline 
}
A:hover {
	COLOR: #2c4c78; TEXT-DECORATION: underline 
}
A:active {
	COLOR: #2c4c78; TEXT-DECORATION: underline 
}
H1 {
	PADDING-RIGHT: 4px; PADDING-LEFT: 4px; FONT-SIZE: 14px; BACKGROUND: #eee; PADDING-BOTTOM: 4px; MARGIN: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #84b0c7 1px solid
}
.info {
	BORDER-RIGHT: #84b0c7 1px solid;float:center; text-ALIGN:center;BORDER-TOP: #84b0c7 1px solid; BACKGROUND: #e5eef5; MARGIN: 0px auto; BORDER-LEFT: #84b0c7 1px solid; WIDTH: 500px; BORDER-BOTTOM: #84b0c7 1px solid
}
img {
	 MARGIN: 10px auto;float:left
}
P {
	PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; MARGIN: 0px; PADDING-TOP: 15px
}
</STYLE>
 

</head>    
<body>
    <table border=0>
        <tr>
            <td>
                <img src="/img/logo.gif">
            </td>
        </tr>
        <tr>
            <td>
            <DIV class="info">           
                <%
                    if (custlist != null && custlist.size() > 0)
                    {
                %>     
                <H1><bean:message key="str5009"/><font STYLE="color:red;"><%=cust_name%></font><bean:message key="str3072"/></H1>
                <P><bean:message key="str3073"/><b>soft.xsaas.com</b><bean:message key="str3074"/></p>
                <form name="regto" action="/Newcregister.jsp" method="post">
                    <input type="hidden" name="code" value="<%=code%>">
                    <input type="submit" value="确认注册">
                </form>
                <%
                    }
                    else
                    {
                %>
                <H1><font STYLE="color:red;"><bean:message key="str3075"/></font></H1>
                <P><bean:message key="str3076"/><a href="/">soft.xsaas.com</a><bean:message key="str3074"/></p>
                <form name="regto" action="/Newcregister.jsp" method="post">                     
                    <input type="submit" value="确认注册">
                </form>
                <%
                    }
                %>
            </DIV>
            </td>
        </tr>  
     </table> 
     <table STYLE="font-size:12px">
				<tr>
					<td align="center">
						 
                          <!--a target="_blank" href="https://www.xsaas.com/about-us-en.jsp">About XSaaS</a> | --> 
                          <p align="center">
                          <a target="_blank" href="https://www.xsaas.com/about-us.jsp"><bean:message key="str4512"/></a> | 
                          <a target="_blank" href="https://www.xsaas.com/cop.jsp"><font color="red"><bean:message key="str4513"/></font></a> | 
                          <a target="_blank" href="http://daohang.xsaas.com/?p=3"><bean:message key="str2478"/></a> | 
                          <a target="_blank" href="https://www.xsaas.com/links.jsp"><bean:message key="str3542"/></a> | 
                          <!--a target="_blank" href="https://www.xsaas.com/sitemap.jsp">站点地图</a> | -->
                          <a target="_blank" href="https://www.xsaas.com/copyright.jsp"><bean:message key="str4407"/></a> | 
                          <a target="_blank" href="http://bbs.xsaas.com/"><bean:message key="str4514"/></a> | 
                          <a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://360.xsaas.com')};"><bean:message key="str2016"/></a>
                          <br><bean:message key="str4408"/><a href="http://www.miibeian.gov.cn/">B2-20060012</a><bean:message key="str4409"/></p>
                          </p>
                         
                        
					</td>
				</tr>
			</table>    
</body>
</html>