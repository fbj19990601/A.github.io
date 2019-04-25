<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.custMgr.Custinfo" scope="page" />
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String iStart = "1", province="",city="",name="",group="",parameter="";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("province") != null) {
		province = request.getParameter("province");
	}
	if (request.getParameter("city") != null) {
		city = request.getParameter("city");
	}
	if (request.getParameter("cust_name") != null) {
		name = request.getParameter("cust_name");
	}
	if (request.getParameter("group") != null) {
		group = request.getParameter("group");
	}
	parameter="province="+province+"&city="+city+"&cust_name="+name+"&group="+group;
	int counter = bean.getSearchCustomerCount(province,  city,  name,  group);
	ArrayList list = bean.getSearchCustomerInfo(Integer.parseInt(iStart), 5,  province,  city,  name,  group);
	String pageTools = tools.getGoogleToolsBar(counter, "/zone_b2b/searchEnterprise.jsp?&enterprise=1&" + parameter+"" + "&iStart=", Integer.parseInt(iStart), 5);
	String defaultImg = "/zone_b2b/images/cp.gif";
	int size = 0;
%>
<html>
	<head>
		<title>Supply</title>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="supply.js"></script>
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
		</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.html" />
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="5"></td>
			</tr>
			<tr>
				<td>
					<img src="/zone_b2b/images/en/en-oocl_06.gif" border="0" height="62"  width="980"/>
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="740" valign="top">
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr>
							<td width="200" height="32" align="center" background="/zone_b2b/images/sup_06.gif" class="bthong">
								&nbsp;&nbsp; Enterprise Information
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								<img src="/zone_b2b/images/sup_08.gif" align="absmiddle">
								&nbsp;
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" id="tbo0">
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFC367">
									<tr>
										<td height="255" valign="top" bgcolor="FFFFFF">
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="23%" height="30">
														<input type="hidden" name="idx" id="idx">
														<img src="/zone_b2b/images/jiantou.gif" width="20" height="17">
														Company logo
													</td>
													<td width="37%" class="STYLE2">
														Main business
													</td>
													<td width="11%" class="STYLE2">
														LinkMan
													</td>
													<td width="13%" class="STYLE2">
														Address
													</td>
													<td width="16%" class="STYLE2">
														Member Rating 
													</td>
												</tr>
												<tr>
													<td height="1" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
											</table>
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
												<%
														if (list != null && list.size() > 0) {
														     size = list.size();
														for (int i = 0; i < list.size(); i++) {
															HashMap map = (HashMap) list.get(i);
															String cust_id = map.get("cust_id").toString();
															String cust_name = "", pub_date = "", scope = "", addr = "", juristic = "", date = "", cust_class = "";
															if (map.get("cust_name") != null) {
														        cust_name = map.get("cust_name").toString();
															}
															if (map.get("sale_price") != null) {
														        juristic = map.get("sale_price").toString();
															}
															if (map.get("company_address") != null) {
														        addr = map.get("company_address").toString();
														 	}
															if (map.get("cust_class") != null) {
																cust_class = map.get("cust_class").toString();
																cust_class = param.getParamNameByValue("14", cust_class);
															}
															if (map.get("scope") != null) {
																scope = map.get("scope").toString();
																scope = scope.replaceAll("<[^<>]+>", "");
																if (scope.length() > 40) {
																	scope = scope.substring(0, 40) + "...";
																}
															}
															if (map.get("publish_date") != null) {
																pub_date = map.get("publish_date").toString();
																if (pub_date.length() > 10) {
																	pub_date = pub_date.substring(0, 10);
																}
															}
															String file_path = "";
															if (map.get("file_path") != null) {
																file_path = map.get("file_path").toString();
																file_path = file_path.substring(23);
															}
															else {
														        file_path = defaultImg;
															}
														%>
															<tr class="rencei_table_xian">
																<td width="4%" height="30" class="rencei_table_xian">
																	<input type="checkbox" name="sale_<%=i%>" id="sale_<%=i%>" value="<%=cust_id%>" style="display: none">
																</td>
																<td width="19%" height="130" class="rencei_table_xian">
																	<a href="/zone_b2b/enterprise/customer/<%=cust_id%>"><img src="<%=file_path%>" width="100" height="100" alt="" /> </a>
																</td>
																<td width="37%" class="rencei_table_xian">
																	<a href="/zone_b2b/enterprise/customer/<%=cust_id%>" style="font-weight: bold;"><%=cust_name%> </a>
																	<br>
																	<%=scope%>
																	&nbsp;
																</td>
																<td width="11%" class="rencei_table_xian">
																	<%=juristic%>
																	&nbsp;
																</td>
																<td width="13%" class="rencei_table_xian">
																	<%=addr%>
																	&nbsp;
																</td>
																<td width="16%" class="rencei_table_xian">
																	<%=cust_class%>
																</td>
															</tr>
														<%
													}
													}
													else {
												%>
												<tr>
													<td height="1" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
												<%
												}
												%>
											</table>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="10">
											<input type="hidden" name="s_size" id="s_size" value="<%=size%>">
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="E3E3E3">
									<tr>
										<td height="32" align="center" background="/zone_b2b/images/btt1.gif">
											<%=pageTools%>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="10"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">&nbsp;
					
				</td>
				<td width="228" valign="top">
					<jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp" />
				</td>
		</table>
		<form action="supplyComparam.jsp" method="post" name="commpara" id="commpara" target="_blank">
			<input type="hidden" name="idx" id="idx">
		</form>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>
