<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.organizeMgr.OrganizeInfo"%>
<%@ page import="com.saas.biz.enquirytrackMgr.EnquirytrackInfo"%>
<%@ page import="com.saas.biz.leavewordsMgr.LeavewordsInfo"%>
<%@ page import="com.saas.biz.saleMgr.SaleInfo"%>
<%@ page import="com.saas.biz.stockorderMgr.Stockorderinfo"%>
<jsp:useBean id="property" class="com.saas.biz.propertyuMgr.PropertyuInfo" scope="page" />
<%
	String user_id = "" ,cust_id = "";
	HttpSession index_session = request.getSession();
	if (index_session.getAttribute("SESSION_USER_NAME") != null) {
		cust_id = index_session.getAttribute("SESSION_CUST_ID").toString();
		user_id=index_session.getAttribute("SESSION_USER_ID").toString();
	}
	//取用户名称
	OrganizeInfo organ = new OrganizeInfo();
	String cust_name = organ.getCustNameById(cust_id);
	
	//取用户财富
	String money=property.getUserPropertyValue(user_id,"0");
	
	//取用户财富等级
	int moneys = Integer.parseInt(money);
	
	//取留言
	EnquirytrackInfo enquiryObj=new EnquirytrackInfo();
	int counter1=enquiryObj.getStockNumberByUser(user_id);
	LeavewordsInfo enquiryObjs=new LeavewordsInfo();
	int counter2=enquiryObjs.getLeaveNumberBySend(user_id);
	int counter3=enquiryObj.getSaleNumberByUser(user_id);
	
	//取发布的供应信息
	SaleInfo processObj=new SaleInfo();
	int pro_counter1=processObj.getSaleListNum(cust_id);
	int pro_counter2=processObj.getOffSaleListNum(cust_id);
	
	//取发布的采购信息
	Stockorderinfo stockObj = new Stockorderinfo();
	int st_counter1 = stockObj.getStockListNumber(cust_id);
	int st_counter2 = stockObj.getOffStockListNumber(cust_id);
	
	//取出所有最新的采购信息
	ArrayList lists = stockObj.getStockListBy();
%>
<HTML>
	<HEAD>
		<TITLE><bean:message key="str2705"/></TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=gb2312">
		<LINK href="images/member.css" type="text/css" rel="stylesheet">
		<link href="css/vip.css" rel="stylesheet" type="text/css">
		<link href="images/member.css" type="text/css" rel="stylesheet">
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

A {
	text-decoration: underline;
}

A:hover {
	COLOR: orange;
	text-decoration: none;
}
</style>
	</HEAD>
	<body>
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td class="mtitle">
						<bean:message key="str2706"/>
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
									
									<TABLE cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#ffbe84" border="0">
										<TBODY>
											<TR>
												<TD width="15%" height="24" noWrap bgColor="#ffffff">
													&nbsp;&nbsp;
													<IMG height="8" alt="" src="/images/icon_01.gif" width="4" align="middle">
													&nbsp;
													<a href="/mainMenu/index.jsp?menu_id=7m60kG2U43yH15a&subsys_code=B2B"><bean:message key="str2717"/></a>
												</TD>
												<TD align="left" width="63%" bgColor="#ffffff" colspan="2">
													&nbsp;&nbsp; <bean:message key="str2718"/>
													<A href="/leaveMgr/receivStockIndex.jsp" target=_blank><FONT color="#ff6600"><B> <%=counter1%> </B> </FONT><bean:message key="str2719"/></A>
													<A href="/leaveMgr/receiveNewsIndex.jsp" target=_blank><FONT color="#ff6600"><B> <%=counter2%> </B> </FONT><bean:message key="str2720"/></A>
													<A href="/leaveMgr/receivSaleIndex.jsp" target=_blank><FONT color="#ff6600"><B> <%=counter3%> </B> </FONT><bean:message key="str2721"/></A>
												</TD>
											</TR>
											<TR>
												<TD noWrap bgColor="#ffffff" height="24">
													&nbsp;&nbsp;
													<IMG height="8" alt="" src="/images/icon_01.gif" width="4" align="Middle">
													&nbsp;
													<a href="/saleMgr/modifyIndex.jsp"><bean:message key="str2722"/></a>
												</TD>
												<TD align="left" width="63%" bgColor="#ffffff">
													&nbsp;&nbsp; <bean:message key="str2723"/>
													<FONT color="#ff6600"><B> <%=pro_counter1%> </B> </FONT><bean:message key="str2724"/>
													<FONT color="#ff6600"><B> <%=pro_counter2%> </B> </FONT><bean:message key="str2725"/>
												</TD>
												<TD class="t14line" align="center" width="22%" bgColor="#ffffff">
													<A class="f" href="/saleMgr/addSale.jsp"><bean:message key="str2726"/></A>
												</TD>
											</TR>
											<TR>
												<TD noWrap bgColor="#ffffff" height="24">
													&nbsp;&nbsp;
													<IMG height="8" alt="" src="/images/icon_01.gif" width="4" align="Middle">
													&nbsp;
													<a href="/stockMgr/modifyIndex.jsp"><bean:message key="str2727"/></a>
												</TD>
												<TD class="t14line" align="left" width="63%" bgColor="#ffffff">
													&nbsp;&nbsp; <bean:message key="str2723"/>
													<FONT color="#ff6600"> <B> <%=st_counter1%> </B> </FONT><bean:message key="str2729"/>
													<FONT color="#ff6600"><B> <%=st_counter2%> </B> </FONT><bean:message key="str2725"/>
												</TD>
												<TD class="t14line" align="center" width="22%" bgColor="#ffffff">
													<A class="f" href="/stockMgr/addStock.jsp"><bean:message key="str2731"/></A>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<TD class="blue_mtitle">
												<bean:message key="str2732"/>
											</TD>
											<td width=110px align=right class="blue_mtitle1">
												<div align="center"></div>
											</td>
										</TR>
									</TABLE>
									<TABLE cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#A8CCF2" border="0">
									<%
											if ( lists != null && lists.size() > 0 ){
												for ( int i = 0 ; i < lists.size()&& i< 5 ; i++ ){
													HashMap map = (HashMap)lists.get(i);
													String stock_id ="",title ="",content ="",stock_addr ="",publish_date ="";
													if(map.get("stock_id")!=null){stock_id = map.get("stock_id").toString();}
													if(map.get("title")!=null){title = map.get("title").toString();}
													if(map.get("content")!=null){content = map.get("content").toString();
														if(content.length()>28)content = content.substring(0,28)+"..";
														content=content.replaceAll("<[^<>]+>","");
													}
													if(map.get("stock_addr")!=null){stock_addr = map.get("stock_addr").toString();}
													if(map.get("publish_date")!=null){publish_date = map.get("publish_date").toString();
														if(publish_date.length()>10)publish_date=publish_date.substring(0,10);}
												
									%>
										<TR>
											<TD width="25%" height="24" noWrap bgColor="#FFFFFF">
												<a class="M" target="_blank" href="/zone_b2b/stock/stockInquiry.jsp?stock_id=<%=stock_id%>"><%=title%> </a>
											</TD>
											<TD align="left" width="40%" bgColor="#FFFFFF">
												<%=content%>
											</TD>
											<TD class="t14line" align="center" width="10%" bgColor="#FFFFFF">
												<%=stock_addr%>
											</TD>
											<TD class="t14line" align="center" width="10%" bgColor="#FFFFFF">
												<%=publish_date%>
											</TD>
										</TR>
										<%
											}
											}
										%>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TBODY>
											<TR>
												<TD vAlign="top" bgcolor="#ffffff">
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="300">
																
																 
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
																								·&nbsp;																							</TD>
																							<TD class="eng" width="97%" height="18">
																								<bean:message key="str2733"/>
																								<img src="images/ppc.gif">																							</TD>
																						</TR>
																						<TR>
																							<TD align="right" width="3%" height="20">
																								·&nbsp;																							</TD>
																							<TD class="t12line" height="18">
																								<bean:message key="str2734"/>
																								<A href="mailto:sales@xsaas.com">sales@xsaas.com</A>																							</TD>
																						</TR>
																						<TR>
																							<TD align="right" height="20">
																								·&nbsp;																							</TD>
																						  <TD class="eng" height="18">
																							<bean:message key="str2735"/>
																							<a   href=javascript:MSG_SEND(%22cery@hotmail.com%22);><img border="0" src="/mainMenu/images/msn.gif"/></a></TD>
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
								</td>
							</tr>
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</body>
</HTML>