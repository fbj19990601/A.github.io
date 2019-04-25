<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="public.js"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码
---------------------------------------------------------------------->
<script language="JavaScript">
	function Check_Value(obj)
	{
		if (obj.user_name.value == ""||obj.user_name.value == null)
		{
			alert("用户名不可以为空！");
			return false;
		}
		if (obj.passwd.value == ""||obj.passwd.value == null)
		{
			alert("密码不可以为空！");
			return false;
		}
        if (obj.userrand.value == ""||obj.userrand.value == null)
		{
			alert("请输入验证码！");
			return false;
		}
		obj.submit();
	}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/admin.css" rel="stylesheet" type="text/css">
<title>B2B EC-platform</title>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="76" align="center">
  <div class="header_admin">
    <div class="logo_admin"><a href="index.jsp" target="_self"><a href="index.jsp" target="_self"><img src="img/logo.gif" width="225" height="66" border="0" /></a></div>
    <div class="header_admin_right">
      <div class="toplink_admin">
       <ul>
       <li><a href="Newcregister.jsp"><img src="img/register_button.gif" /></a></li>
       <li><a href="login.html"><img src="img/login_button.gif" /></a></li>
       <li><a href="/index.jsp"><bean:message key="str3858"/></a></li>
       <li>|</li>
       <li><a href="#"><bean:message key="str2523"/></a></li>
       <li>|</li>
       <li><a href="#"><bean:message key="str2629"/></a></li>
       </ul></div>
      <div class="topclasslink_admin"><table border="1" cellpadding="0" cellspacing="0" bordercolor="#ff7300">
  <tr>
    <td width="100" align="center"><a href="order.jsp"><bean:message key="str3040"/></a> </td>
    <td width="100" align="center"><a href="supply.jsp"><bean:message key="str3041"/></a></td>
  <!--<td>阿里助手</td>-->
    <td width="90" align="center"><a href="infocenter.jsp"><bean:message key="str3179"/></a></td>
  <!--<td>论坛 </td>-->
  </tr>
</table>
      </div>
    </div>
  </div></td>
  </tr>
  <tr>
    <td align="center"><div class="middleline_admin"><img src="img/icon_attion_16.gif" /> <bean:message key="str3090"/></div>
    <div class="middlebody_admin">
      <div class="middlebody_admin_left">
        <table width="352" border="0" cellpadding="0" cellspacing="0">
        	 <html:form action="/stafflogin">
          <tr>
            <td><img src="img/signin_01.gif" width="352" height="26" /></td>
          </tr>
          <tr>
            <td height="161" align="center" background="img/signin_02.gif" ><table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30"><bean:message key="str3091"/></td>
              </tr>
              <tr>
                <td  height="30" align="left"><span style="font-size:14px; font-weight:bold"><bean:message key="str3092"/></span>
                  <input name="user_name" type="text" size="18" /></td>
              </tr>
              <tr>
                <td  height="30" align="left"><span style="font-size:14px; font-weight:bold"><bean:message key="str3093"/></span>
                <input name="passwd" type="password" size="18" /></td>
              </tr>
              <tr>
                <td  height="30" align="left" valign="middle"><span style="font-size:14px; font-weight:bold"><bean:message key="str4405"/>
                </span>
                  <input name="userrand" type="text" size="4" />
                  <img src="checkImage">
                    <input type="hidden" name="randomcode"></td>
              </tr>
              <tr>
                <td  height="30" align="center"><input name="" type="button"  value="登录系统" class="button_login" onClick="Check_Value(loginForm)"/>&nbsp;&nbsp;
                <a href="findpassword.jsp" target="_self"><bean:message key="str5008"/></a></td>
              </tr>
            </table></td>
          </tr>
          <input name="trade_type_code" type="hidden" value = "0123">
		 </html:form>
        </table>
      </div>
      <div class="middlebody_admin_right">
      <table width="352" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="26"><img src="img/signin_03.gif" width="352" height="26" /></td>
          </tr>
          <tr>
            <td><a href="Newcregister.jsp" target="_self"><img src="img/signin_04.gif" width="352" height="118" border="0" /></a></td>
          </tr>
          <tr>
            <td><a href="Newcregister.jsp" target="_self"><img src="img/signin_05.gif" width="352" height="43" /></a></td>
          </tr>
        </table></div>
    </div>
    </td>
  </tr>
  <tr>
    <td align="center"><div class="bottom_admin"><div class="containertow">
<div class="footer" style="width:100%">
<div class="footer2" style="height: 2px; background-color: #FF4500; width:1003px;"><img src="img/032.gif" width="12" height="2"></div>
<div class="footer3" style="margin-top:6px">
 <a href="/about/copyright.jsp"><bean:message key="str3094"/></a> | <a href="/about/anno.jsp"><bean:message key="str3095"/></a> | <a href="/about/searve.jsp"><bean:message key="str3096"/></a> | <a href="/about/intimacy.jsp"><bean:message key="str3097"/></a> | <a href="/about/contact.jsp"><bean:message key="str3597"/></a> | <a href="/about/ad.jsp"><bean:message key="str3865"/></a> | <a href="/about/cooperate.jsp"><bean:message key="str3098"/></a> | <a href="/about/zztsearve.jsp"><bean:message key="str3099"/></a><br>
<bean:message key="str4574"/>
</div>
</div>
</div></div></td>
  </tr>
</table>
</body>
</html>
