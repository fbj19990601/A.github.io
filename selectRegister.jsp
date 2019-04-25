<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html>
	<head>
		<title><bean:message key="str4482"/></title>
		<link href="/style/login.css" rel="stylesheet" type="text/css">
		<link href="/css/layout.css" rel="stylesheet" type="text/css">
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
		<script src="/js/newcregister.js" language="jscript" type="text/jscript"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<center>
			<div id="login-body">
				<div id="lg_content">
					<div  style=" width:100%;" align="center"> 
						<a href="/Newcregister.jsp?class_level=4"><img src="/images/login_yp.gif" border="0"></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/PerCregister.jsp"><img src="/images/login_gr.gif" border="0"></a> 
					</div>
				</div>
			</div>
			<div class="login_bottom"></div>
			<table>
				<tr>
					<td align="center">
						<div class="bottom_admin">
							<div class="containertow">
								<div class="footer">
									<div class="footer3" style="margin-top:6px">
										<div class="cpy width margin">
											<div class="about">
												<p align="center">
													<a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/18.html"><bean:message key="str2478"/></a> |
													<a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/22.html"><bean:message key="str2479"/></a> |
													<a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://www.xsaas.com')};">设为首页<bean:message key="str4429"/></a>
													<br>
											                   <bean:message key="str3135"/>
													<a href="http://www.miibeian.gov.cn/">B2-20060012</a><bean:message key="str3137"/>
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
