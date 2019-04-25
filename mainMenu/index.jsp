<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.menuguideMgr.MenuguideInfo"%>
<%@ page import="com.saas.biz.rightMgr.RightMenu"%>
<%
	String user_name = "", up_menu_id = "", user_class = "", 
	role_code = "", user_type = "", cust_id = "", subsys_code = "";
	HttpSession index_session = request.getSession();
	if (index_session.getAttribute("SESSION_USER_NAME") != null) {
		user_name = index_session.getAttribute("SESSION_USER_NAME").toString();
		user_class = index_session.getAttribute("SESSION_CUST_CLASS").toString();
		role_code = index_session.getAttribute("SESSION_ROLE_CODE").toString();
		user_type = index_session.getAttribute("SESSION_USER_TYPE").toString();
		cust_id = index_session.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null) {
		up_menu_id = request.getParameter("menu_id");
	}
	if (request.getParameter("subsys_code") != null) {
		subsys_code = request.getParameter("subsys_code");
	}
	
	RightMenu menu = new RightMenu();
	String menu_name = menu.getMenuNameById(up_menu_id);
%>
<HTML>
	<HEAD>
		<TITLE><bean:message key="str2705"/></TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=gb2312">
		<LINK href="images/member.css" type="text/css" rel="stylesheet">
		<link href="css/vip.css" rel="stylesheet" type="text/css">
		<link href="/style/new_layout.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/images/favicon.ico" />
		<link rel="Bookmark" href="/images/favicon.ico" />
		<script type="text/JavaScript">
		<!--
		function MM_preloadImages() { //v3.0
		  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		}
		//-->
		</script>
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/msn.js"></SCRIPT>
		<SCRIPT>
		            WinLIKE.definewindows=mydefss;
		            function mydefss() {
		                
		            	var j=new WinLIKE.window('', 200, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
		            	j.Vis=false;
		            	j.Nam='appwin';
		            	WinLIKE.addwindow(j);
		            };
        </SCRIPT>
		<style type="text/css">
BODY {
	MARGIN: 20px 10px 10px 20px
}
</style>
	</HEAD>
	<body>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td class="mtitle">
						<%=menu_name%>
					</td>
				</tr>
				<tr>
					<td>
						<%
							ArrayList thirdMenuList = new ArrayList();
							thirdMenuList = new RightMenu().genchildRightMenuList(user_name,"3", up_menu_id, user_class, role_code, user_type);

							if (thirdMenuList != null && thirdMenuList.size() > 0) {
								for (Iterator thit = thirdMenuList.iterator(); thit.hasNext();) {
									HashMap thmenuInfo = (HashMap) thit.next();
									String thmenuId = "";
									String thmenuName = "";
									String thmenudesc = "";
									String rsrv_str1 = "";
									if (thmenuInfo.get("menu_id") != null)
										thmenuId = thmenuInfo.get("menu_id").toString();
									if (thmenuInfo.get("menu_name") != null)
										thmenuName = thmenuInfo.get("menu_name").toString();
									if (thmenuInfo.get("rsrv_str4") != null)
										thmenudesc = thmenuInfo.get("rsrv_str4").toString();
									if (thmenuInfo.get("rsrv_str1") != null)
										rsrv_str1 = thmenuInfo.get("rsrv_str1").toString();
									ArrayList guideList = new MenuguideInfo().getLevelListByCustEntity(cust_id, subsys_code,thmenuId);
									String note_name = "", note_desc = "", link_url = "", obj_cust_id = "", param_code = "";
									if (guideList != null && guideList.size() > 0) {
								HashMap guideMap = (HashMap) guideList.get(0);
								if (guideMap.get("note_name") != null) {
									note_name = guideMap.get("note_name").toString();
								}
								if (guideMap.get("note_desc") != null) {
									note_desc = guideMap.get("note_desc").toString();
								}
								if (guideMap.get("link_url") != null) {
									link_url = guideMap.get("link_url").toString();
								}
								if (guideMap.get("obj_cust_id") != null) {
									obj_cust_id = guideMap.get("obj_cust_id")
									.toString();
								}
								if (guideMap.get("param_code") != null) {
									param_code = guideMap.get("param_code").toString();
								}
									}
									if (guideList == null) {
						%>
						<div class="mid-nrone1">
							<div class="mid-nrone2" onMouseOver="this.style.backgroundColor='#FFCC66'" onMouseOut="this.style.backgroundColor='#FFFFFF'">
								<div class="mid-nrone4">
									<img src="/images/mid-06.gif" width="51" height="55" />
								</div>
								<div class="mid-nrone5">
									<div class="mid-nrone6">
										<%
										if (rsrv_str1 == "0" || rsrv_str1.equals("0")) {
										%>
										<a href="/gettradeinterface.do?menu_id=<%=thmenuId%>&trade_type_code=0120" target="_blank"><%=thmenuName%> </a>
										<%
										} else {
										%>
										<a href="/gettradeinterface.do?menu_id=<%=thmenuId%>&trade_type_code=0120" TARGET=appwin onClick="mydefss()"><%=thmenuName%> </a>
										<%
										}
										%>
									</div>
									<div class="mid-nrone7">
										<%=thmenudesc%>
									</div>
								</div>
							</div>
						</div>
						<%
								} else {
								if (obj_cust_id == "" || obj_cust_id.equals("")) {
						%>
						<div class="mid-nrone1">
							<div class="mid-nrone2" onMouseOver="this.style.backgroundColor='#FFCC66'" onMouseOut="this.style.backgroundColor='#FFFFFF'">
								<div class="mid-nrone4">
									<img src="images/mid-06.gif" width="51" height="55" />
								</div>
								<div class="mid-nrone5">
									<div class="mid-nrone6">
										<font color="#a9a9a9"><%=param_code%> </font>
									</div>
									<div class="mid-nrone7">
										<a href="<%=link_url%>" TARGET=appwin onClick="mydefss()"><font color="red"><b><%=note_name%> </b> </font> </a>
										<br />
										<%=note_desc%>
									</div>
								</div>
							</div>
						</div>
						<%
						} else {
						%>
						<div class="mid-nrone1">
							<div class="mid-nrone2" onMouseOver="this.style.backgroundColor='#FFCC66'" onMouseOut="this.style.backgroundColor='#FFFFFF'">
								<div class="mid-nrone4">
									<img src="images/mid-06.gif" width="51" height="55" />
								</div>
								<div class="mid-nrone5">
									<div class="mid-nrone6">
										<%
										if (rsrv_str1 == "0" || rsrv_str1.equals("0")) {
										%>
										<a href="/gettradeinterface.do?menu_id=<%=thmenuId%>&trade_type_code=0120" TARGET=appwin onClick="mydefss()"><%=thmenuName%> </a>
										<%
										} else {
										%>
										<a href="/gettradeinterface.do?menu_id=<%=thmenuId%>&trade_type_code=0120" TARGET=appwin onClick="mydefss()"><%=thmenuName%> </a>
										<%
										}
										%>
									</div>
									<div class="mid-nrone7">
										<%=thmenudesc%>
									</div>
								</div>
							</div>
						</div>
						<%
									}
									}
								}
							}
						%>
					</td>
				</tr>
			</tbody>
		</table>
		<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
			<TBODY>
				<TR>
					<TD vAlign="top" bgcolor="#ffffff">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="500">
									<table cellspacing="0" cellpadding="0" width="100%" border="0">
										<tbody>
											<tr>
												<td class="mtitle">
													<bean:message key="str3541"/>
												</td>
											</tr>
										</tbody>
									</table>
									 
									<br>
									<table cellspacing="0" cellpadding="0" width="100%" border="0">
										<tbody>
											<tr>
												<td class="mtitle">
													<bean:message key="str3597"/>
												</td>
											</tr>
										</tbody>
									</table>
									<TABLE style="BORDER-RIGHT: #fdc185 1px solid; BORDER-TOP: #fdc185 1px solid; BORDER-LEFT: #fdc185 1px solid; BORDER-BOTTOM: #fdc185 1px solid" cellSpacing="0" cellPadding="8" width="100%" align="center" border="0">
										<TBODY>
											<TR>
												<TD class="t14" noWrap bgColor="#ffffff" height="24">
													<TABLE cellSpacing="0" cellPadding="0" width="98%" align="center" border="0">
														<TBODY>
															<TR>
																<TD align="right" width="3%" height="20">
																	��&nbsp;
																</TD>
																<TD class="eng" width="97%" height="18">
																	<bean:message key="str2733"/>
																	<img src="images/ppc.gif">
																</TD>
															</TR>
															<TR>
																<TD align="right" width="3%" height="20">
																	��&nbsp;
																</TD>
																<TD class="t12line" height="18">
																	<bean:message key="str2734"/>
																	<A href="mailto:sales@xsaas.com">sales@xsaas.com</A>
																</TD>
															</TR>
															<TR>
																<TD align="right" height="20">
																	��&nbsp;
																</TD>
																<TD class="eng" height="18">
																	<bean:message key="str2735"/>
																	<a   href=javascript:MSG_SEND(%22cery@hotmail.com%22);><img border="0" src="/mainMenu/images/msn.gif"/> </a>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</td>
							</tr>
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<!-- 
		<span id='img' style='position:absolute;' onmouseover='mystop()' onmouseout='start()'><a href='/zone_b2b/school/' target='_blank'><img src='images/LogoMaker.gif' width='88' height='31' border='0'> </a> </span>
		<script language='JavaScript'>
			var xPos = 0;var yPos = 0; var step = 1;var delay = 10;var height = 0; var Hoffset = 0;var Woffset = 0; var yon = 0;var xon = 0; var xon = 0; var interval;
			var img = document.getElementById('img');
			img.style.top = 0;
			function changePos(){
			width = document.body.clientWidth;
			height = document.body.clientHeight;
			Hoffset = img.offsetHeight;
			Woffset = img.offsetWidth;
			img.style.left = xPos + document.body.scrollLeft;
			img.style.top = yPos + document.body.scrollTop;
			if (yon) {
			yPos = yPos + step;
			
			}else {
			yPos = yPos - step;
			}
			if (yPos < 0) {
			yon = 1;
			yPos = 0;
			}
			if (yPos >= (height - Hoffset)) {
			yon = 0;
			yPos = (height - Hoffset);
			}
			if (xon) {
			xPos = xPos + step;
			}
			else {
			xPos = xPos - step;
			}
			if (xPos < 0) {
			xon = 1;
			xPos = 0;
			}
			if (xPos >= (width - Woffset)) {
			xon = 0;
			xPos = (width - Woffset);
			}
			}
			function start() {
			img.visibility = 'visible';
			interval = setInterval('changePos()', delay);
			}
			function mystop()
			{
			clearInterval(interval)
			}
			 start()
		</script> -->
	</body>
</HTML>
