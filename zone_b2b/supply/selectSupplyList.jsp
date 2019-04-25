<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.saleMgr.SupplyInfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="areaBean" class="com.saas.biz.AreaInfoMgr.AreaInfo" scope="page" />
<%
	String prov = "", city = "", part = "", key = "";
	String defaultImg="/zone_b2b/images/cp.gif";
	String iStart = "0";
	int counter = 0;
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("prov") != null) {
		prov = request.getParameter("prov");
	}
	if (request.getParameter("city") != null) {
		city = request.getParameter("city");
	}
	if (request.getParameter("part") != null) {
		part = request.getParameter("part");
	}
	if (request.getParameter("key") != null) {
		key = request.getParameter("key");
	}
	
	SupplyInfo supplyInfo = new SupplyInfo();
	ArrayList supplyList = new ArrayList();

	if( city.equals("") || city == null ){
		if(key.equals("") || key == null){
			supplyList = supplyInfo.getSelectProductByOne(Integer.valueOf(iStart).intValue(),prov,part);
			counter = supplyInfo.getSelectProductByOne(prov,part);
		}else{
			supplyList = supplyInfo.getSelectProductByTwo(Integer.valueOf(iStart).intValue(),key,prov,part);
			counter = supplyInfo.getSelectProductByTwo(key,prov,part);
		}
	}
	else {
		if(key.equals("") || key == null){
			supplyList = supplyInfo.getSelectProductByThree(Integer.valueOf(iStart).intValue(),prov,city,part);
			counter = supplyInfo.getSelectProductByThree(prov,city,part);
		}else{
			supplyList = supplyInfo.getSelectProductNoFour(Integer.valueOf(iStart).intValue(),key,prov,city,part);
			counter = supplyInfo.getSelectProductNoFour(key,prov,city,part);
		}
	}
	
	
	String pageTools = tools.getGoogleToolsBar(counter, "selectSupplyList.jsp?counter="+counter+"&iStart=", Integer.parseInt(iStart),10);
    int size=0;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title><bean:message key="str5099"/></title>
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
					&nbsp;&nbsp;<bean:message key="str2253"/>
					<a href="/zone_b2b"><bean:message key="str1147"/></a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<a href="/zone_b2b/supply"><bean:message key="str2722"/></a>
					<img src="/zone_b2b/images/lujian.gif" border="0">
					<bean:message key="str5116"/>
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
								<bean:message key="str5113"/>
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
							<bean:message key="str2722"/>	/<bean:message key="str2477"/>							</td>
							<td width="11%" class="STYLE2">
								<bean:message key="str2150"/>							</td>
							<td width="13%" class="STYLE2">
								<bean:message key="str2151"/>							</td>
							<td width="16%" class="STYLE2">
								<bean:message key="str2152"/>							</td>
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
									            if(supplyList != null && supplyList.size()>0){
									               	size=supplyList.size();
								              	 	for (int i=0;i<supplyList.size();i++){
												        HashMap map = (HashMap) supplyList.get(i);
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
												        String file_path="";
													     if(map.get("file_path")!=null){
													       file_path=map.get("file_path").toString();
													     
														}else{
														file_path=defaultImg;
														}
												        if(map.get("sale_addr") != null){sale_addr=map.get("sale_addr").toString();}
											%>
												<tr>
													<td width="4%" height="30">
														<input type="checkbox" name="sale_<%=i%>" id="sale_<%=i%>" value="<%=sale_id%>">
													</td>
													<td width="19%" height="130">
														<a href="saleInquiry.jsp?sale_id=<%=sale_id%>"><img  src="<%=file_path%>" width="100" height="100" alt="" /></a>
													</td>
													<td width="37%">
														<a href="saleInquiry.jsp?sale_id=<%=sale_id%>" class="cpbt"><%=title%></a>
														<%=start_date%>
														<br><%=content%>
													</td>
													<td width="11%">
														￥<%=sale_price%>
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