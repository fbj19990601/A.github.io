<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.saleMgr.SupplyInfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="areaBean" class="com.saas.biz.AreaInfoMgr.AreaInfo" scope="page" />
<%
	String country = areaBean.getCountrySelect("5J2mc0X0G85BH");
	String product_name = "", pro = "", city = "", date_scope = "", param = "";
	String iStart = "0";
	int counter = 0;
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("product_name") != null) {
		product_name = request.getParameter("product_name");
	}
	if (request.getParameter("pro") != null) {
		pro = request.getParameter("pro");
	}
	if (request.getParameter("city") != null) {
		city = request.getParameter("city");
	}
	if (request.getParameter("date") != null) {
		date_scope = request.getParameter("date");
	}
	if (request.getParameter("param") != null) {
		param = request.getParameter("param");
	}
	
	SupplyInfo supplyInfo = new SupplyInfo();
	ArrayList saleList = new ArrayList();

	if (param.equals("1") || param == "1") {
		saleList = supplyInfo.getProductByLike(Integer.valueOf(iStart).intValue(), product_name, pro, city, date_scope);
		counter = supplyInfo.getProductByLike(product_name, pro, city,date_scope);
	} else {
		saleList = supplyInfo.getProductByEqual(Integer.valueOf(iStart).intValue(), product_name, pro, city, date_scope);
		counter = supplyInfo.getProductByEqual(product_name, pro, city,date_scope);
	}
	String pageTools = tools.getGoogleToolsBar(counter, "searchSupplyList.jsp?counter="+counter+"&iStart=", Integer.parseInt(iStart),10);
    int size=0;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title>供应详细信息</title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="quoted.js"></script>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="supply.js"></script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="DCDCDC">
			<tr>
				<td height="29" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
					&nbsp;&nbsp;您当前位置：
					<a href="/zone_b2b">首页</a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<a href="/zone_b2b/supply">供应信息</a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					查看供应信息
				</td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" height="433">
			<tr>
				<td width="740" valign="top"><br>
					<table border=0 cellpadding=0 cellspacing=0 width="740" height="34">
						<tr align=middle>
							<td width="134" height="32" align="center" background="/zone_b2b/images/sup_05.gif">
								供应列表
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								<img src="/zone_b2b/images/sup_08.gif" align="middle">
							</td>
						</tr>
					</table>
					<!--供应列表-->
					<table border="0" cellpadding="0" cellspacing="0" valign="top" width="736" height="323">
						<tr>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFC367">
									<tr>
										<td height="200" valign="top" bgcolor="FFFFFF">
											<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="23%" height="30">
													<img src="/zone_b2b/images/jiantou.gif" width="20" height="17">
													<input type="submit" name="Submit2" value="Compare Products" onClick="saleCompare()"></td>
													<td width="37%" class="STYLE2">
														供应信息/公司													</td>
													<td width="11%" class="STYLE2">
														价格(元)													</td>
													<td width="13%" class="STYLE2">
														所在地													</td>
													<td width="16%" class="STYLE2">
														留言/联系													</td>
												</tr>
												<tr>
													<td height="1" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
											</table>
											<table width="726" border="0" align="center" cellpadding="0" cellspacing="0" height="130">
											<%
									            if(saleList != null && saleList.size()>0){
									               size=saleList.size();
								              	 	for (int i=0;i<saleList.size();i++){
												        HashMap map = (HashMap) saleList.get(i);
												        String sale_id="",title="",content="",sale_price="",start_date="",end_date="",sale_addr="";
												        if(map.get("sale_id") != null){sale_id=map.get("sale_id").toString();}
												        if(map.get("title") != null){title=map.get("title").toString();}
												        if(map.get("content") != null){content=map.get("content").toString();}
												        if(map.get("sale_price") != null){sale_price=map.get("sale_price").toString();}
												        if(map.get("start_date") != null){
												          start_date=map.get("start_date").toString();
												          if(start_date.length()>10){
												            start_date=start_date.substring(0,10);
												          }
												        }
												        if(map.get("end_date") != null){
												          end_date=map.get("end_date").toString();
												          if(end_date.length()>10){
												            end_date=end_date.substring(0,10);
												          }
												        }
												        if(map.get("sale_addr") != null){sale_addr=map.get("sale_addr").toString();}
											%>
												<tr>
													<td width="4%" height="30">
														<input type="checkbox" name="sale_<%=i%>" id="sale_<%=i%>" value="<%=sale_id%>">
													</td>
													<td width="19%" height="130">
														<img name="" src="/zone_b2b/images/cp.gif" width="100" height="100" alt="" />
													</td>
													<td width="37%">
														<a href="saleInquiry.jsp?sale_id=<%=sale_id%>" class="cpbt"><%=title%></a>
														<%=start_date%>
														<br><%=content%>
													</td>
													<td width="11%">
														￥<%=sale_price%>/套
													</td>
													<td width="13%"><%=sale_addr%></td>
													<td width="16%">
														<a href="saleInquiry.jsp?sale_id=<%=sale_id%>"><img src="/zone_b2b/images/zx.gif" width="75" height="21"></a>
													</td>
												</tr>
												<tr>
													<td height="1" colspan="2" class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
													<td class="xian"></td>
												</tr>
												<%
											       }
											  }
											 %>
											</table>
										</td>
									</tr>
								</table>
								<table width="732" border="0" cellpadding="0" cellspacing="0" 0 height="1">
									<tr>
										<td height="10"></td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="E3E3E3">
									<tr>
										<td height="32" align="center" background="/zone_b2b/images/btt1.gif">
											<%=pageTools%>
											<input type="hidden" name="s_size" id="s_size" value="<%=size%>">
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0"0>
									<tr>
										<td height="10"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<!--选项结束-->
					<br>
				</td>
				<td valign="top">&nbsp;
					
				</td>
				<form action="supplyComparam.jsp" method="post" name="commpara" id="commpara" target="_blank">
			      <input type="hidden" name="idx" id="idx">
		       </form>
				<td valign="top"><br></td><td width="228" valign="top">
					<jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp" />
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>