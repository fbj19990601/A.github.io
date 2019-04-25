<%@ page contentType="text/html;charset=GBK" %> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<title><bean:message key="str334"/>(http://soft.xsaas.com)</title>
<link href="style/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="header_admin">
    <div class="logo_admin"><a href="index.jsp" target="_self"><a href="/index.jsp" target="_self"><img src="img/logo.gif" width="225" height="66" border="0" /></a></div>
    <div class="header_admin_right">
      <div class="toplink_admin">
       <ul>
       <li><a href="/Newcregister.jsp" target="_blank"><img src="img/register_button.gif" /></a></li>
       <li><a href="index.jsp"><img src="img/login_button.gif" /></a></li>
       <li><a href="/index.jsp"><bean:message key="str613"/></a></li>
       <li>|</li>
       <li><a href="javascript:window.external.AddFavorite('http://soft.xsaas.com', '企业信息化服务平台(http://soft.xsaas.com)')"><bean:message key="str2523"/></a></li>
       <li>|</li>
       <li> <a  onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://soft.xsaas.com');"  style="CURSOR: hand"><bean:message key="str2629"/></a></li>
       </ul></div>
      <div class="topclasslink_admin">
		   <table border="1" cellpadding="0" cellspacing="0" bordercolor="#ff7300">
			  <tr>
				<td width="100" align="center"><a href="https://www.xsaas.com"><bean:message key="str3040"/></a> </td>
				<td width="100" align="center"><a href="https://www.xsaas.com"><bean:message key="str3041"/></a></td>
			  <!--<td>阿里助手</td>-->
				<td width="90" align="center"><a href="http://news.xsaas.com"><bean:message key="str3179"/></a></td>
			  <!--<td>论坛 </td>-->
			  </tr>
		  </table>
      </div>
    </div>
  </div>
</body>