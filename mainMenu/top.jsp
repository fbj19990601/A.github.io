<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="java.util.*"%>
<%@ page import="tools.util.FileIO;"%>
<%
	HttpSession top_session = request.getSession();
	String user_name = "", login_cust_id = "", subsys_codenow = "B2B",web="";
	if (request.getParameter("subsys_code") != null) {
		subsys_codenow = request.getParameter("subsys_code");
	}
	if (top_session.getAttribute("SESSION_USER_NAME") != null) {
		user_name = top_session.getAttribute("SESSION_USER_NAME").toString();
		login_cust_id = top_session.getAttribute("SESSION_CUST_ID").toString();
	}
	String url=application.getRealPath("")+"/enterprise/customer/"+login_cust_id;
	if (FileIO.ExistFloder(url)) {
	  web="<a href=/zone_b2b/enterprise/customer/"+login_cust_id+"/ target=_blank>My WebSite</a>";
	}
%>
<html>
	<head>
		<title>top</title>
		<LINK href="images/member.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<TABLE width="100%" border="0" align="center" cellPadding="0" cellSpacing="0" class="topnav">
			<TBODY>
				<TR>
					<TD align="left" width="40%">
						<IMG height="74" src="images/logo.gif" width="297">
					</TD>
					<TD width="60%" valign="bottom">
						<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TBODY>
								<TR>
									<TD height="30">
										<img src="images/topb.gif" width="10" height="10" align="absmiddle" />
										<a href="/" target="_blank"><bean:message key="str2737"/></a> &nbsp;
										<a href="/zone_b2b/supply/" target="_blank"><bean:message key="str3599"/></a>&nbsp;
										<a href="/zone_b2b/stock/" target="_blank"><bean:message key="str2739"/></a> &nbsp;
										<a href="/zone_b2b/enterprise/" target="_blank"><bean:message key="str2740"/></a> &nbsp;
										<a href="/zone_b2b/news/" target="_blank"><bean:message key="str2741"/></a>
										 
										<a href="/enterpriseMgr/InterimPages.jsp?cust_id=<%=login_cust_id%>/" target="_blank"><bean:message key="str2497"/></a>
									    <%=web%>
									</TD>
									<td>
										<table>
											<tr>
												<%
													RightMenu sysright = new RightMenu();
													ArrayList syslist = sysright.genSysServByCust(login_cust_id, user_name);
													int i = 1;
													if (syslist != null) {
														for (Iterator it = syslist.iterator(); it.hasNext();) {
															HashMap sysInfo = (HashMap) it.next();
															String sysname = "";
															String syscode = "";
															if (sysInfo.get("para_code1") != null)
														        syscode = sysInfo.get("para_code1").toString();
															if (sysInfo.get("para_code2") != null)
														        sysname = sysInfo.get("para_code2").toString();
															if (!user_name.equals("admin") && !sysname.equals("¿ò¼ÜÏµÍ³")) {
												%>
												<td>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td>
																<a href="/mainMenu/left.jsp?subsys_code=<%=syscode%>" title="<%=sysname%>" target="_left"><img src="/images/<%=syscode%>.png" border="0" /> </a>
															</td>
														</tr>
														<tr>
															<td align="center">
																<a href="/mainMenu/left.jsp?subsys_code=<%=syscode%>" title="<%=sysname%>" target="_left"> <%
																 if (subsys_codenow.equals(syscode)) {
																 %> <font style="font-size:13px;color:#065706;font-weight:bold; "><%=sysname%> </font> <%
																 		}
																 		else {
																 %> <font style="font-size:13px"><%=sysname%> </font> <%
																 }
																 %> </a>
															</td>
														</tr>
													</table>
												</td>

												<%
															}
															else if (user_name.equals("admin")) {
												%>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td>
																<a href="/mainMenu/left.jsp?subsys_code=<%=syscode%>" title="<%=sysname%>" target="_left"><img src="/images/<%=syscode%>.png" border="0" /> </a>
															</td>
														</tr>
														<tr>
															<td align="center">
																<a href="/mainMenu/left.jsp?subsys_code=<%=syscode%>" title="<%=sysname%>" target="_left"> <%
																 if (subsys_codenow.equals(syscode)) {
																 %> <font style="font-size:13px;color:#065706;font-weight:bold; "><%=sysname%> </font> <%
																 		}
																 		else {
																 %> <font style="font-size:13px"><%=sysname%> </font> <%
																 }
																 %> </a>
															</td>
														</tr>
													</table>
												</td>
												<%
															}
															i = i + 1;
														}
														
													}
												%>
											</tr>
										</table>
									</td>
								</TR>
								<TR>
									<TD valign="bottom">
										&nbsp;
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE class="topmenu" cellSpacing="0" cellPadding="0" width="100%" border="0">
			<TBODY>
				<TR>
					<TD width="79%" align="left">
						&nbsp;&nbsp;&nbsp;
						<img src="images/member_ico.gif" width="14" height="15" align="absmiddle">
						<bean:message key="str2745"/>
						<%=user_name%>
						<font color="#FFFF00"> </font>  <bean:message key="str2746"/>
						<A target="_parent" href="/out.jsp"><font color="#FFFFFF"><bean:message key="str2747"/></font> </A> ] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
					<TD width="21%">
						<img src="images/ppc.gif" align="absmiddle">
						<bean:message key="str2749"/>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</body>
</html>
