<%@ page contentType="text/html;charset=GBK" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

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

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br><br><br><br><br><br>
<p>&nbsp;</p>
<table width="778" border="0" cellpadding="0" cellspacing="1" align="center">
  <tr> 
    <td>
        <table width="100%" border="0" cellpadding="10" cellspacing="0" align="center"  >
            <tr>
              <td height="16"  class="grayD"> WELCOME TO N2N OSS SYSTEM! </td>
            </tr>
        </table>
      </td>
  </tr>
  <tr>
    <td class="grayD">
     
    <table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" >
        <tr>
          <td width="60%" class="grayEF">
            <font class="td-top">N2N综合企业业务支撑系统</font><br><br>
            <div align="right"><font color="#000000" class="td-bot"> &nbsp;[ IDragon as a Service ]
                Since 2007@IDragon.com&nbsp;&nbsp;&nbsp;</div></td>
          <td width="30%" valign="top"  class="grayD">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="grayD">
                 <html:form action="/stafflogin">
			       <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left" height=93>
                    <tr> 
                      <td width="26%" class="grayD"> 用&nbsp;户&nbsp;名：</td>
                      <td width="74%" class="grayD"> <div align="left">
                          &nbsp;
                          <html:text property="user_name" size="15" maxlength="15" /></br>
                          </div></td>
                    </tr>
                    <tr> 
                      <td width="36%" class="grayD"> <div align="left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</div></td>
                      <td width="64%" class="grayD"> <div align="left"> 
                          &nbsp;
                          <html:password property="passwd" size="15" maxlength="15"/>
                           </div></td>
                    </tr>
                    <tr>
                    <td width="36%" class="grayD">验证码：</td>
                    <td width="64%" class="grayD">&nbsp;
                        <input type="text" name="userrand" maxlength="4" size=4>
                        <img src="checkImage">
                    <input type="hidden" name="randomcode">
                    </td>
                </tr>

                    <tr> 
                        <td class="grayD" colspan="2"  ><div align="right"> 
                            <input name="login" type="button" value="登录系统" onclick="Check_Value(loginForm)">
			                 <img src="img/cancel.gif" onClick="javascript:window.close();">
                             </div></td>
                    </tr>
                  </table>
                  <input name="trade_type_code" type="hidden" value = "0123">
				  </html:form>
				  </td>
              </tr>
            </table>
            </td>
          <td width="10%"> </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="22" class="grayE" align="center" > 
         N2N OSS Version 1.0 Copyright @ 2006-2008 All right reserved.  
    </td>
  </tr>
</table>
 
       
</body>
</html>
