<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	String cust_classs = bean.getSelectItems("14");
	String info_types = bean.getSelectItems("106");
%>
<html>
	<head>
		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.ping_1 {
	font-weight: bold;
	color: black;
}

#tr {
	background-color: #f6f6f6;
	color: #000000;
	font-weight: bold;
	font-size: 12px;
	text-align: center;
}

#tr1 {
	background-color: #f6f6f6;
	color: #000000;
	font-size: 12px;
}

#tr2 {
	background-color: #ffffff;
	color: #000000;
	font-size: 12px;
}
</style>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
	            WinLIKE.definewindows=mydefss;
	            function mydefss() {
	            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
	            	j.Vis=false;
	            	j.Nam='appwin';
	            	WinLIKE.addwindow(j);
	            };
	    </SCRIPT>
		<script type="text/javascript">
		  function check_Value(){
		 	if (document.serverForm.cust_class.value == ""||document.serverForm.cust_class.value == null)
			{
				alert("客户级别不可以为空！");
				document.serverForm.cust_class.focus(); 
				return false;
			}
			if (document.serverForm.info_type.value == ""||document.serverForm.info_type.value == null)
			{
				alert("信息类型不可以为空！");
				document.serverForm.info_type.focus(); 
				return false;
			}
			return true;
		   }
		</script>
	</head>
	<body>
		<form name="serverForm" id="serverForm" action="rankindex.jsp" method="post" TARGET=appwin>
			<table width="740" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="26">
								</td>
							</tr>
							<tr>
								<td style="margin-top: 20px">
									<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
												<bean:message key="str601"/>
											</td>
											<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
												<div class="ping">
													<select name="cust_class" id="cust_class">
														<option value="">
															<bean:message key="str318"/>
														</option>
														<%=cust_classs%>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
												<bean:message key="str602"/>
											</td>
											<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
												<div class="ping">
													<select name="info_type" id="info_type">
														<option value="">
															<bean:message key="str318"/>
														</option>
														<%=info_types%>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=center colspan="2">
												<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>