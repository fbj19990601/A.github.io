<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%
    HttpSession  logsession = request.getSession(); 
    if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
%>
    <jsp:forward page="/main.jsp" /> 
<%
    }

%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="public.js"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码
---------------------------------------------------------------------->
<script language="JavaScript">
	function keysubmit(obj)
	{
		 if(event.keyCode != "13") return;
		if (obj.user_name.value == ""||obj.user_name.value == null)
		{
			Ext.MessageBox.alert('xsass','用户名不可以为空！');
			return false;
		}
		if (obj.passwd.value == ""||obj.passwd.value == null)
		{
			Ext.MessageBox.alert('xsass',"密码不可以为空！");
			return false;
		}
        if (obj.userrand.value == ""||obj.userrand.value == null)
		{
			Ext.MessageBox.alert('xsass',"请输入验证码！");
			return false;
		}
		obj.submit();
	}
	function show(){
            var scoketNewsWin;
              if(!scoketNewsWin){
    	        scoketNewsWin=new Ext.Window({
    		        title:'网龙月租型农业中小型企业综合服务系统证书',
    		        width:760,
    		        modal:true,
    		        autoHeight:true,
    		        html:'<img src="/images/saas-test.jpg"></img>',
    		        buttons: [{
						        text:'关闭',
						        handler: function(){
			                        scoketNewsWin.hide();
			                    }
						    }]
    	        });
    	      scoketNewsWin.show();
            }else{
    	       scoketNewsWin.show();
            }
         }
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=8859_1">
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">

		<title> <bean:message key="str3033"/></title>
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		
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
			alert('用户名不可以为空！');
			document.getElementById("user_name").focus();
			return false;
		}
		if (document.getElementById("passwd").value == ""||document.getElementById("passwd").value == null)
		{
			alert("密码不可以为空！");
			document.getElementById("passwd").focus();
			return false;
		}
        if (document.getElementById("userrand").value == ""||document.getElementById("userrand").value == null)
		{
			alert("请输入验证码！");
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
        </script>
		<link href="css/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="MM_preloadImages('images/new03.gif')" onkeydown="if(event.keyCode==27) return false;">
		<div style=" width:100%; height:590px; background: url(images/new01.gif) left top repeat-x; text-align:center;">
			<table width="800" border="0" cellspacing="0" cellpadding="0" style="margin-top:140px;">
				<tr>
					<td>
						<div style=" width:251px; height:416px; background:url(images/new05.gif) left center no-repeat;">
						   <div style="margin:100px 10px 10px 10px">
						     <font style="font-size:12px"><a href="javascript:show()"><img src="/images/testlogo.gif" border=0>
						          <bean:message key="str3034"/>
						     </a></font>
						   </div>
						</div>
					</td>
					<td>
						<div style=" width:549px; height:416px; margin:0px 0px 0px 0px; background: url(images/new02.gif) left center no-repeat;">
							<table width="240" border="0" cellspacing="0" cellpadding="0" style="float:right; margin-top:120px; font-size:12px; color:#CD8011;">
								<tr>
									<td width="160" valign="top">
										<html:form action="/stafflogin">
											<table width="100%" border="0" cellspacing="0" cellpadding="0" style=" font-size:12px; color:#CD8011; text-align:left;">
												<tr>
													<td height="30">
														<bean:message key="str359"/>
														<input name="user_name" id="user_name" type="text" size="13" tabindex="1" style="border:1px solid #CD8011;" />
													</td>
												</tr>
												<tr>
													<td height="30">
														<bean:message key="str4403"/>
														<input name="passwd" id="passwd" type="password" size="13" tabindex="2" style="border:1px solid #CD8011;" />
													</td>
												</tr>
												<tr>
													<td height="30">
													         <bean:message key="str4405"/>
														<input name="userrand" id="userrand" type="text" size="4" tabindex="3" style="border:1px solid #CD8011;" onKeyDown="keysubmit(loginForm)"/>
														<img src="checkImage" id="rc" onClick="changeCode()"><br>														 
														 &nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str4404"/>
														<input type="hidden" name="randomcode">
													</td>
												</tr>
											</table>
											<input name="trade_type_code" type="hidden" value="0123">
										</html:form>
									</td>
									<td width="80" valign="top">
										<table width="70" border="0" cellspacing="0" cellpadding="0" style="float:left;">
											<tr>
												<td valign="top">
													<a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('999','','images/new03.gif',1)"></a><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','images/new03.gif',1)"><img src="images/new04.gif" name="Image12" onClick="Check_Value()" width="69" height="101" border="0"> </a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td height="30" colspan="2" valign="top">
										<div class="loginone">
											<a href="/flashreg.jsp"><bean:message key="str4406"/></a>
										</div>
										<div class="logintwo">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<!--a href="/findpassword.jsp">忘记密码?</a-->
										</div>
									</td>
								</tr>
							</table>
							<!--table width="500" border="0" cellspacing="0" cellpadding="0" style="float:right; text-align:right; margin-top:40px; margin-right:5px; font-size:12px; color:#9B7947;">
								<tr>
									<td>
										<A href="https://www.xsaas.com" target="_blank">平台介绍</A> -
										<A href="http://daohang.xsaas.com/?p=3">联系我们</A>
									</td>
								</tr>
							</table-->
						</div>
					</td>
				</tr>
			</table>
			<table width="800" border="0" cellspacing="0" cellpadding="0" style="text-align:center; color:#fff; line-height:18px; font-size:12px;">
				<tr>
					<td>
						<div class="cpy width margin">
							<div class="about">
								
								<p align="center">
								    
									
								
									<a target="_blank" href="http://daohang.xsaas.com/?p=3"><bean:message key="str2478"/></a> |
								
									<a target="_blank" href="http://www.xsaas.com/?page_id=22"><bean:message key="str2479"/></a> |
									<a href="javascript:void(0);" onClick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://www.xsaas.com')};"><bean:message key="str4429"/></a> 
									<br><bean:message key="str3035"/>
									<a href="http://www.miibeian.gov.cn/">B2-20060012</a><bean:message key="str3078"/>
								</p>
							</div>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</body>
</html>
