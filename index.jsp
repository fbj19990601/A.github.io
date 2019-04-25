<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">
        <link href="/css/master.css" rel="stylesheet" type="text/css" />
        <SCRIPT src="/js/sohuflash_1.js" type=text/javascript></SCRIPT>
        <title> <bean:message key="str3033"/></title>
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<link rel="shortcut icon" href="/images/favicon.ico" />  
 		<link rel="Bookmark" href="/images/favicon.ico"> 
 		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script> 
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/JavaScript">
		<!--
		
		function MM_swapImgRestore() { //v3.0
		  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
		}
		
		function MM_preloadImages() { //v3.0
		    loginForm.user_name.focus(); 
		  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		}
		
		function MM_findObj(n, d) { //v4.01
		  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
		  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
		  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
		  if(!x && d.getElementById) x=d.getElementById(n); return x;
		}
		
		function MM_swapImage() { //v3.0
		  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
		   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
		}
    	function Check_Value()
    	{
    		if (document.getElementById("user_name").value == ""||document.getElementById("user_name").value == null)
    		{
    			alert('User can not be empty！');
    			document.getElementById("user_name").focus();
    			return false;
    		}
    		if (document.getElementById("passwd").value == ""||document.getElementById("passwd").value == null)
    		{
    			alert("Password can not be empty！");
    			document.getElementById("passwd").focus();
    			return false;
    		}
            if (document.getElementById("userrand").value == ""||document.getElementById("userrand").value == null)
    		{
    			alert("Enter the verification code！");
    			document.getElementById("userrand").focus();
    			return false;
    		}
    		document.loginForm.submit();
    	}
		//-->
		</script>
		
		<script type="text/javascript">
        function changeCode()
          {
           document.getElementById("rc").src="checkImage";
          }
          function keysubmit(obj)
		  {
				 if(event.keyCode != "13") return;
				if (obj.user_name.value == ""||obj.user_name.value == null)
				{
					alert("Notice : Password is null!");
					return false;
				}
				if (obj.passwd.value == ""||obj.passwd.value == null)
				{
					alert("Notice : Password is null!");
					return false;
				}
		        if (obj.userrand.value == ""||obj.userrand.value == null)
				{
					alert("Please enter the right confirmation code  !");
					return false;
				}
				obj.submit();
		 }
        </script>
        
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #000f55;
}
-->
</style>
<link href="/style/logIndex.css" rel="stylesheet" type="text/css">
</head>
<% 
	HttpSession logsession = request.getSession();
	if(logsession.getAttribute("SESSION_USER_ID")!=null){
		if(!logsession.getAttribute("SESSION_USER_ID").equals("")){
%>
			<jsp:forward page="main.jsp"></jsp:forward>
<%		
		}
	}	
%>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="bg">
  <tr>
    <td align="center">
	
	<table width="706" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center"><img src="logImages/login_05.gif" width="422" height="106" alt="logo"></td>
      </tr>
      <tr>
        <td background="logImages/login_09.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="8"><img src="logImages/login_08.gif" width="8" height="282" alt=""></td>
            <td align="right" background="logImages/in_10.gif">
			<table width="698" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td width="424" height="263" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="17%" height="56">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td width="83%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str3048"/><br>
<bean:message key="str3049"/></td>
                  </tr>

                </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="53%" height="80"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="8"></td>
                        </tr>
                        <tr>
                          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str3050"/><br>
<bean:message key="str3051"/></td>
                        </tr>
                      </table></td>
                      <td width="47%"><table width="56%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="33" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="center">
	                          <a href="/Newcregister.jsp" target="_blank">
	                          <img src="logImages/Regist0.gif" width="118" height="34" border="0">	                          </a>                          </td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="14%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td width="86%" height="49"><bean:message key="str3052"/><br>
                        <bean:message key="str3053"/></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="27%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td width="73%" height="40"><bean:message key="str3054"/></td>
                    </tr>
                  </table></td>
                <td width="274"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                  </table>
                  
                   <form action="/stafflogin.do" name="loginForm" method="post">
                    
                    <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="100" height="22"><bean:message key="str359"/></td>
                        <td colspan="2" ><input name="user_name"  id="user_name" type="text" class="0" size="18"></td>
                      </tr>
                      <tr>
                        <td  height="22"><bean:message key="str5010"/></td>
                        <td colspan="2" ><input name="passwd" id="passwd" type="password" class="0" size="18"></td>
                      </tr>
                      <tr>
                        <td height="22"><bean:message key="str4405"/></td>
                        <td width="59"><input name="userrand" id="userrand" type="text" size="4" maxlength="4" class="0" onKeyDown="keysubmit(loginForm)"/></td>
                        <td width="68"><img src="checkImage" id="rc" onClick="changeCode()"></td>
                      </tr>
                    </table>
                    <table width="270" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      	<td height="27" align="left"><bean:message key="str5011"/></td>
                      	<td height="27" align="right">
                      		<select name="cookietime" id="cookietime">
                      			<option value="315360000"><bean:message key="str3057"/></option>
                      			<option value="315360000"><bean:message key="str3058"/></option>
                      			<option value="2592000"><bean:message key="str3059"/></option>
                      			<option value="86400"><bean:message key="str3060"/></option>
                      			<option value="3600"><bean:message key="str3061"/></option>
                      			<option value="0"><bean:message key="str3056"/></option>
                      		</select>                      	</td>
                      </tr>
                      <tr>
                        <td height="27" align="left" colspan="2"><a href="forgetPwd.jsp"><bean:message key="str3062"/></a></td>
                      </tr>
                    </table>
                  <table width="270" border="0" cellspacing="0" cellpadding="5">
                      <tr>
                        <td height="41" align="right"><img src="logImages/Key.gif" width="33" height="38" align="absmiddle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        		<a href="javascript:Check_Value()"><img src="logImages/Login.gif" width="54" height="33" border="0" align="top" style="cursor:hand;" onClick="return Check_Value()"></a>                        </td>
                      </tr>
                    </table>
                    <input name="trade_type_code" type="hidden" value="0123">
                  </form>
                  
                   <table width="270" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                       <td class="04"><img src="logImages/web.gif" width="113" height="5"></td>
                     </tr>
                   </table></td>
              </tr>
            </table></td>
            <td width="8"><img src="logImages/login_12.gif" width="8" height="282" alt=""></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="92" align="center" valign="bottom" background="images/login_14.gif"  style="color:#fff">
        	<center>
					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
					    <td valign="top" align=center>
						   
						      <a href="/links.jsp">Links</a> - <a href="/about.jsp">About</a> - <a href="/map.jsp">Map</a> - <a href="/contact.jsp">Contact</a> - <a href="/copyright.jsp">Copyright</a> - <a href="/job.jsp">Job</a>  <br />
						   		 	Copyright &copy 1998-2008. Orient Overseas Container Line Limited. All rights reserved.
					 		</td>
					  </tr>
					  </table>
					</center>
					</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html> 


