<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    String code = "";
    String codeedit = "true";
    if (request.getParameter("code") != null)
    {
        code = request.getParameter("code");
        codeedit = "false";
    }
%>
<html>
	<head>
		<title><bean:message key="str3039"/></title>
		<link href="/style/login.css" rel="stylesheet" type="text/css">
		<link href="/style/commonality.css" rel="stylesheet" type="text/css">
		<link href="style/admin.css" rel="stylesheet" type="text/css">
		<link href="/css/layout.css" rel="stylesheet" type="text/css">
		<link href="/css/daohang.css" rel="stylesheet" type="text/css">
		<link href="/css/zx.css" rel="stylesheet" type="text/css">
		<link href="/css/foot.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
        .green {float:left;
        border-color: #485E00;
        border-style: solid;
        background-color: #F7FFDD;
        border-width: 1px;
        font-size: 12px;
        color: #485E00;
        font-family: 宋体;
        padding: 3px 3px;
        
        }
        
        .orange {float:left;
        border-color: #FF7300;
        border-style: solid;
        background-color: #FFF5D8;
        border-width: 1px;
        font-size: 12px;
        color: #000000;
        font-family: 宋体;
        padding: 3px 3px;
        
        }
    </style>
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/newcregister.js" language="jscript"type="text/jscript"></script>
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="76" align="center">
					<div class="header_admin">
                    <div class="logo_admin"><a href="index.jsp" target="_self"><a href="/index.jsp" target="_self"><img src="img/logo.gif" width="225" height="66" border="0" /></a></div>
                    <div class="header_admin_right">
                      
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
		<center>
			<div id="login-body">
				<div id="lg_content">

					<form method="post" name="NewRegisterForm" id="NewRegisterForm"
						action=/tempregister.do onsubmit="return Check_Value() ">
						<div id="lg_text">
							<div id="lg_title">
								<label>
									<input type="checkbox" checked disabled="disabled">
								</label>
								<bean:message key="str3042"/> &nbsp;&nbsp;
							</div>
						  <div id="lg_reg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="20%" height="30" align="right">
										<bean:message key="str3043"/></td>
										<td width="32%">
											<input name="user_name" type="text"
											onfocus="user_name_focus(true);"
												onblur="user_name_focus(false);" 
												maxlength="15"
												class="login_textarea">
										<font color="#ff0000">*</font>										</td>
										<td colspan="2">
											<div id="divUsername"> <bean:message key="str3044"/></div>		
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str1620"/></td>
										<td>
											<input type="password" name="password" maxlength="20"
												 class="login_textarea">
											<font color="#ff0000">*</font> </td>
										<td colspan="2" id="tdPassword">请再输入一遍密码：<bean:message key="str116"/>
											<input type="password" name="passwd" maxlength="20" class="login_textarea">
										</td>										
									</tr>
									 
									<tr>
										<td height="30" align="right">
											电子邮箱：</td>
										<td>
											<input type="text" name="email" size="50" maxlength="100" class="login_textarea"><!-- onblur="checkEmail()"-->
											<font color="#ff0000">*</font> </td>
										<td colspan="2">
											<div id="divQues">请认真填写邮箱地址，系统激活邮件将发送到这个邮箱 <bean:message key="str116"/></div>
										</td>
									</tr>
									
                                    <tr>
										<td height="30" align="right">
											联系电话：<bean:message key="str116"/>										</td>
										<td  >
											<input name="contact_phone" type="text" size="25"
												maxlength="25" class="login_textarea">										</td>
										<td colspan="2">
											<div id="divQues">我们的工作人员会及时和您联系! <bean:message key="str116"/></div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											企业名称：<bean:message key="str116"/></td>
										<td colspan="3" >
											<input type="text" name="cust_name" maxlength="80" size="73" ><font color="#ff0000">*</font>	
									    </td>										 
									</tr>		
									<tr style="display:none">
										<td height="30" align="right">
											推荐授权码：<bean:message key="str116"/>										</td>
										<td>
											<input name="develope_channel" type="input" maxlength="10" size="10" value="<%=code%>" readonly="true">
										</td>
										<td colspan="2" align="right">&nbsp;</td>
									</tr>
									  </table></td>
								  </tr>
								</table>
			              </div>
						</div>
						  
						<div id="lg_text">
							<div id="lg_title1">
								<br>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
								
								[ <a href="http://www.xsaas.com" target="_blank">全面了解XSaaS<bean:message key="str116"/></a> ]&nbsp; &nbsp; 
								[ <a href="">查看使用协议<bean:message key="str116"/></a> ]&nbsp;&nbsp;
								 <input type="image" name="imageField2" src="/images/tong.gif">
								<input type="hidden" name="trade_type_code" value="0811">
								<input name="id" type="hidden" value="">
							</div>
						</div>
					</form>
				</div>
			</div>
			 
			<table>
				<tr>
					<td align="center">
						<div class="bottom_admin">
                        <div class="containertow">
                        <div class="footer">
                       
                        <div class="footer3" style="margin-top:6px">
                         <div class="cpy width margin">
                         <div class="about">
                          <!--a target="_blank" href="https://www.xsaas.com/about-us-en.jsp">About XSaaS</a> | --> 
                          <p align="center">
                          <a target="_blank" href="https://www.xsaas.com/about-us.jsp">关于XSaaS<bean:message key="str116"/></a> | 
                          <a target="_blank" href="https://www.xsaas.com/cop.jsp"><font color="red">协办单位<bean:message key="str116"/></font></a> | 
                          <a target="_blank" href="http://daohang.xsaas.com/?p=3">联系我们<bean:message key="str116"/></a> | 
                          <a target="_blank" href="https://www.xsaas.com/links.jsp">友情链接<bean:message key="str116"/></a> | 
                          <!--a target="_blank" href="https://www.xsaas.com/sitemap.jsp">站点地图</a> | -->
                          <a target="_blank" href="https://www.xsaas.com/copyright.jsp">免责声明<bean:message key="str116"/></a> | 
                          <a target="_blank" href="http://bbs.xsaas.com/">在线客服<bean:message key="str116"/></a> | 
                          <a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://360.xsaas.com')};">设为首页<bean:message key="str116"/></a>
                          <br>安徽省农业信息委员会 协办 &copy;sCopyright XSaaS 2008 版权所有 皖ICP证<bean:message key="str116"/><a href="http://www.miibeian.gov.cn/">B2-20060012</a>号<bean:message key="str116"/></p>
                          </p>
                         </div> 
                        </div>
                        </div>
                        </div>
                        </div>
						</div>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
<<script type="text/javascript">
<!--
function setProvience(country){
    var country_id=country;
	AreaInfo.getAreaByParent(country_id,function(data){
	 DWRUtil.removeAllOptions("province");
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("province",data);
	});
}
function setCitys(prov){
   var provence=prov;
	 AreaInfo.getAreaByParent(provence,function(data){
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("eparchy_code",data);
	});
}
//-->
</script>
