<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="com.saas.biz.newsMgr.NewsInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.productMgr.ProductInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.ProcessMgr.ProcessInfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%
	String iStart ="0";
 
	ProcessInfo proinfo = new ProcessInfo();
	ArrayList List = proinfo.getProcessByType(Integer.parseInt(iStart),40);
	int counter=proinfo.getCountsBycategory_type();
	
	NewsInfo info = new NewsInfo();
	ArrayList List1 = info.getNewCastById();
 
	Custinfo in = new Custinfo();
	ArrayList List2 = in.getCustById();
	ProductInfo pro = new ProductInfo();
	ArrayList List3 = null; // = pro.getProductInfo();
	
	String pageTools = tools.getGoogleToolsBar(counter, "message_list.jsp?page=", Integer.parseInt(iStart),40);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key="str5051"/></title>
<style type="text/css">

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="680" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
									<tr>
										<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
											<bean:message key="str2239"/>
											<a href="/" class="lanse"><bean:message key="str2737"/></a> &gt;
										 <bean:message key="str5051"/>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="5"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="1">
								<img src="/zone_b2b/images/zixun_17.gif" width="1" height="24">
							</td>
							<td width="10" background="/zone_b2b/images/zixun_12.gif">
								&nbsp;
							</td>
							<td width="726" background="/zone_b2b/images/zixun_12.gif">
								<table width="100" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="3" height="24">
											<img src="/zone_b2b/images/ba_127.gif" width="3" height="24" alt="" />
										</td>
										<td align="center" background="/zone_b2b/images/ba_128.gif">
											<table width="96%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="85%" align="center" class="btlanse">
														<bean:message key="str5051"/>
													</td>
												</tr>
											</table>
										</td>
										<td width="2">
											<img src="/zone_b2b/images/ba_130.gif" width="2" height="24" alt="" />
										</td>
									</tr>
								</table>
							</td>
							<td width="1">
								<img src="/zone_b2b/images/zixun_17.gif" width="1" height="24">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="923" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="5">
								<%
								if(List != null && List.size() > 0) 
								{
									for(int i=0;i<List.size();i++) 
									{
										HashMap map = (HashMap) List.get(i);
										String category_id="",category_title="",publish_date="",category_type="",categoryType="";
										if(map.get("category_id")!=null)
										{ 
											category_id=map.get("category_id").toString(); 
										}
										if(map.get("category_title")!=null)
										{ 
											category_title=map.get("category_title").toString(); 
										}
										if(map.get("category_type")!=null)
										{ 
											category_type=map.get("category_type").toString(); 
										}
										if(map.get("publish_date")!=null)
										{ 
											publish_date=map.get("publish_date").toString(); 
										}	
										if (publish_date.length() > 10) 
										{ 
											publish_date = publish_date.substring(0, 10); 
										}
										categoryType = new ParamethodMgr().getParamNameByValue( "105", category_type );
								%>
									<tr>
										<td valign="top">
											<!--/重复-->
											<div style="line-height: 180%">
												[<span class=\"zi\"><%=categoryType%></span>]
												<A href="proxyInfo.jsp?category_type=<%=category_type%>&category_id=<%=category_id%>" target=_blank class=lansed><%=category_title%> </A>
												<span class=time><%=publish_date%> </span>
											</div>
											<!--重复/-->
										</td>
									</tr>
								<%
									}
								}
								%>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr style="text-align: center;font-weight: bold;">
									<%=pageTools%>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
					&nbsp;
				</td>
				<td width="290" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
							</td>
							<td background="/zone_b2b/images/zixun_09.gif">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td class="btlanse">
											<bean:message key="str5028"/>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
						<tr>
							<td height="220" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<%
								if(List1 != null && List1.size() > 0) 
								{
									for(int i=0;i<List1.size();i++) 
									{
										HashMap map = (HashMap) List1.get(i);
										String news_id="",title="",publish_date="";
										if(map.get("news_id")!=null){news_id=map.get("news_id").toString();}
										if(map.get("title")!=null){title=map.get("title").toString();}
										if(map.get("publish_date")!=null){publish_date=map.get("publish_date").toString();}	
										if (publish_date.length() > 10) {publish_date = publish_date.substring(0, 10);}
								%>
									<tr>
										<td>
											·
											<a href="zixun_list_content.jsp?news_id=<%=news_id%>" class="lanse"><%=title%></a>
										</td>
									</tr>
								<%
									}
								}
								%>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" style="display:none">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
							</td>
							<td background="/zone_b2b/images/zixun_09.gif">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td width="95%" class="btlanse">
											<bean:message key="str5029"/>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD" style="display:none">
						<tr>
							<td height="260" valign="top" bgcolor="#FFFFFF">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="48%" align="center">
											<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0>
											</a>
										</td>
										<td>
											&nbsp;
										</td>
										<td width="48%" align="center">
											<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<A href="#" target=_blank class="lanse"><bean:message key="str5030"/></A>
										</td>
										<td align="center">
											&nbsp;
										</td>
										<td align="center">
											<A href="#" target=_blank class="lanse"><bean:message key="str5031"/></A>
										</td>
									</tr>
								</table>
								<TABLE class=xian cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
										<TR>
											<TD height=10>s</TD>
										</TR>
									</TBODY>
								</TABLE>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<!--/重复-->
											<div style="font-size: 12px; line-height: 180%">
												[<bean:message key="str5032"/>]
												<a href="#" target=_blank class="lanse"><bean:message key="str5033"/> </a>
											</div>
											<!--重复/-->
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
							</td>
							<td background="/zone_b2b/images/zixun_09.gif">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td width="95%" class="btlanse">
											<bean:message key="str5034"/>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
						<tr>
							<td height="160" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<%
								if(List2 != null && List2.size() > 0) 
								{
									for(int i=0;i<List2.size();i++) 
									{
										HashMap map = (HashMap) List2.get(i);
										String cust_name="",cust_id="",level_name="";
										if(map.get("cust_id")!=null){cust_id=map.get("cust_id").toString();}
										if(map.get("cust_name")!=null){cust_name=map.get("cust_name").toString();}
										if(map.get("para_code2")!=null){level_name=map.get("para_code2").toString();}	
								%>
									<!--/重复-->
									<tr>
										<td>
											·
											<a href="/zone_b2b/enterprise/customer/<%=cust_id%>/" class="lanse"><%=cust_name%></a>
										</td>
										<td>
											 <%=level_name%> 
										</td>
									</tr>
									<!--重复/-->
								<%
									}
								}
								%>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" style="display:none">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
							</td>
							<td background="/zone_b2b/images/zixun_09.gif">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td width="95%" class="btlanse">
											<bean:message key="str5035"/>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
						<tr>
							<td height="220" valign="top" bgcolor="#FFFFFF">
								<table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
									<!--/重复-->
									<%
									if(List3!=null && List3.size()>0){
									 int col=3,rols=2,index=0;
									 for(int i=0;i<rols;i++){
									  out.print("<tr>");
									  for(int j=0;j<col;j++){
									   if(List3.size()>index){
									    HashMap map=(HashMap)List3.get(index++);
									    String product_id="",product_name="",file_path="/zone_b2b/images/cp0.gif";
									    if(map.get("product_id")!=null){product_id=map.get("product_id").toString();}
									    if(map.get("product_name")!=null){product_name=map.get("product_name").toString();}
									    if(map.get("file_path")!=null){
									      file_path=map.get("file_path").toString();
									      file_path=file_path.substring(23);
									    }
									%>
										<td width="33%" align="center">
											<a href="/zone_b2b/product/product.jsp?product_id=<%=product_id%>"><IMG height=75 src="<%=file_path%>" width=76 border=0>
											 <br><A href="/zone_b2b/product/product.jsp?product_id=<%=product_id%>" target=_blank class="lanse"><%=product_name%></A>
											</a>
										</td>
									<%}
									}
									out.print("</tr>");
									}
									}
									%>
									<!--重复/-->
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	  <jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>