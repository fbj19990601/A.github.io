<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<html>
	<head>
		<title><bean:message key="str4516"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
        <link href="style/admin.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		 function exit(){
		   window.close();
		 }
		 function autoComit(){
			 document.index.submit();
		 }
		</script>
	</head>
	<body onload="autoComit()">
	<form name="index" id="index" action="index.jsp" method="post">
	</form>
	   <table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td height="76" align="left">
					<div class="header_admin">
                    <div class="logo_admin"><a href="index.jsp" target="_self"><a href="/index.jsp" target="_self"><img src="img/logo.gif" width="225" height="66" border="0" /></a></div>
                    <div class="header_admin_right">
                      <!--div class="toplink_admin">
                       <ul>
                       <li><a href="/Newcregister.jsp" target="_blank"><img src="img/register_button.gif" /></a></li>
                       <li><a href="index.jsp"><img src="img/login_button.gif" /></a></li>
                       <li><a href="/index.jsp">首页</a></li>
                       <li>|</li>
                       <li><a href="javascript:window.external.AddFavorite('http://soft.xsaas.com', '企业信息化服务平台(http://soft.xsaas.com)')">加入收藏</a></li>
                       <li>|</li>
                       <li> <a  onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://soft.xsaas.com');"  style="CURSOR: hand">设为首页</a></li>
                       </ul></div-->
                      <div class="topclasslink_admin">
                		   <table border="1" cellpadding="0" cellspacing="0" bordercolor="#ff7300">
                			  <tr>
                				<td width="100" align="center"><a href="http://b2b.xsaas.com/supply/"><bean:message key="str3040"/></a> </td>
                				<td width="100" align="center"><a href="http://b2b.xsaas.com/stock/"><bean:message key="str3041"/></a></td>
                			  <!--<td>阿里助手</td>-->
                				<td width="90" align="center"><a href="http://news.xsaas.com"><bean:message key="str3179"/></a></td>
                			  <!--<td>论坛 </td>-->
                			  </tr>
                		  </table>
                      </div>
                    </div>
                  </div>
				</td>
			</tr>
		</table>
		<table width="800" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top: 15px">
			<tr>
				<td align="left">
					<div class="containertwo">
						<div class="content">
							<div class="contentone">
								<div class="contentone2">
									<div class="contentone3">
										<table width="100%" border="0" cellspacing="1" cellpadding="0">
											
											<tr>
												<td bgcolor="FFF9F3" height="10px">
													<div style="text-align:left;">
														<b style="font-size:13px"><bean:message key="str3180"/></b><br><bean:message key="str3181"/>
													</div>
												</td>
											</tr>
											<tr>
												<td bgcolor="FFF9F3" height="10px">
													<table border="0" cellpadding="3" cellspacing="0" bordercolor="#99FFFF">
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://www.xsaas.com"><bean:message key="str3182"/> </a></td>
                                                           <td bgcolor="#ffffff" width="57%"><bean:message key="str4520"/> </td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://www.xsaas.com" target="_blank">http://www.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://news.xsaas.com">XSaaS</a><bean:message key="str4522"/></td>
                                                           <td bgcolor="#ffffff" width="57%"><bean:message key="str116"/></td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://daohang.xsaas.com/" target="_blank">http://daohang.xsaas.com/</a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://soft.xsaas.com"> <bean:message key="str4450"/></a></td>
                                                           <td bgcolor="#ffffff" width="57%"><bean:message key="str4610"/> </td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://soft.xsaas.com" target="_blank">http://soft.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://lianmeng.xsaas.com"><bean:message key="str4524"/> </a></td>
                                                           <td bgcolor="#ffffff" width="57%"> <bean:message key="str4525"/></td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://lianmeng.xsaas.com" target="_blank">http://lianmeng.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://nongye.xsaas.com"> <bean:message key="str4526"/></a></td>
                                                           <td bgcolor="#ffffff" width="57%"><bean:message key="str4527"/> </td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://nongye.xsaas.com" target="_blank">http://nongye.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://saas.xsaas.com"><bean:message key="str4528"/> </a></td>
                                                           <td bgcolor="#ffffff" width="57%"><bean:message key="str4529"/> </td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://saas.xsaas.com" target="_blank">http://saas.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1" width="17%"><a href="http://blog.xsaas.com"><bean:message key="str4530"/> </a></td>
                                                           <td bgcolor="#ffffff" width="57%"><bean:message key="str4531"/> </td>
                                                           <td bgcolor="#ffffff" width="26%"><a href="http://blog.xsaas.com" target="_blank">http://blog.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1"><a href="http://b2b.xsaas.com"><bean:message key="str4532"/></a></td>
                                                           <td bgcolor="#ffffff"> <bean:message key="str4533"/></td>
                                                           <td bgcolor="#ffffff"><a href="http://b2b.xsaas.com" target="_blank">http://b2b.xsaas.com </a></td>
                                                         </tr>
                                                         <tr>
                                                           <td align="left" bgcolor="#fafef1"><a href="http://news.xsaas.com"> <bean:message key="str4534"/></a></td>
                                                           <td bgcolor="#ffffff"><bean:message key="str4535"/> </td>
                                                           <td bgcolor="#ffffff"><a href="http://news.xsaas.com" target="_blank">http://news.xsaas.com </a></td>
                                                         </tr>
                                                       </table>
                                    												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		 <table width="500" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td align="center">
                          <!--a target="_blank" href="http://www.xsaas.com/about-us-en.jsp">About XSaaS</a> | --> 
                          <p align="center">
                          <a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/20.html"><bean:message key="str2625"/> </a> | 
                          <a target="_blank" href="http://www.xsaas.com/cop.jsp"><font color="red"><bean:message key="str2626"/> </font></a> | 
                          <a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/18.html"><bean:message key="str2216"/> </a> | 
                          <a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/19.html"><bean:message key="str2216"/> </a> | 
                          
                          <a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/22.html"><bean:message key="str2479"/> </a> | 
                          <a target="_blank" href="http://bbs.xsaas.com/"><bean:message key="str2501"/> </a> | 
                          <a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('http://www.xsaas.com')}else{this.setHomePage('http://www.xsaas.com')};"><bean:message key="str2629"/> </a>
                          <br><bean:message key="str4515"/> <a href="http://www.miibeian.gov.cn/">B2-20060012</a><bean:message key="str2483"/> </p>
                          </p>
                          
					</td>
				</tr>
			</table>
	</body>
</html>
