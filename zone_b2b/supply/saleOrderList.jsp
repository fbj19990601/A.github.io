<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="sale" class="com.saas.biz.saleMgr.SupplyInfo" scope="page" />
<%
    String iStart = "1";
	if (request.getParameter("page") != null) {
		iStart = request.getParameter("page");
	}
	int counter = sale.getNewSaleInfoCount();
	ArrayList list=sale.getNewSaleInfoList(Integer.parseInt(iStart),5);
	String pageTools = tools.getGoogleToolsBar(counter, "supply_List.jsp?sys_code=1&page=", Integer.parseInt(iStart),5);
	String defaultImg="/zone_b2b/images/cp.gif";
	int size=0;
%>
<table border="0" cellpadding="0" cellspacing="0" id="tbo0" align="top" width="100%">
<tr>
	<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFC367">
			<tr>
				<td height="255" valign="top" bgcolor="FFFFFF">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="23%" height="30">
								<img src="/zone_b2b/images/jiantou.gif" width="20" height="17">
								<input type="submit" name="Submit2" value="对比产品" onclick="orderCompare()">
							</td>
							<td width="37%" class="STYLE2">
								<bean:message key="str2722"/>	/<bean:message key="str2477"/>
							</td>
							<td width="11%" class="STYLE2">
							<bean:message key="str2150"/>
							</td>
							<td width="13%" class="STYLE2">
								<bean:message key="str2151"/>
							</td>
							<td width="16%" class="STYLE2">
								<bean:message key="str2152"/>
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
					     if(list !=null && list.size()>0){
					      size=list.size();
					      for(int i=0;i<list.size();i++){
					        HashMap map=(HashMap)list.get(i);
					        String sale_id=map.get("sale_id").toString();
					        String title="",pub_date="",content="",addr="",price="",date="";
					        if(map.get("title")!=null){title=map.get("title").toString();}
					        if(map.get("sale_price")!=null){price=map.get("sale_price").toString();}
					        if(map.get("sale_addr")!=null){addr=map.get("sale_addr").toString();}
					        if(map.get("content") !=null)
						    {
						      content=map.get("content").toString();
						      content=content.replaceAll("<[^<>]+>","");
						      if(content.length()>40)
						      {
						        content=content.substring(0,40)+"...";
						      }
						    }
						    if(map.get("publish_date")!=null){
						      pub_date=map.get("publish_date").toString();
						      if(pub_date.length()>10){
						        pub_date=pub_date.substring(0,10);
						      }
						    }
						    String file_path="";
						     if(map.get("file_path")!=null){
						       file_path=map.get("file_path").toString();
						    
							}else{
							file_path=defaultImg;
							}
					    %>
					        <tr>
							<td width="4%" height="30">
								<input type="checkbox" name="sale_n<%=i%>" id="sale_n<%=i%>" value="<%=sale_id%>">
							</td>
							<td width="19%" height="130">
								<img name="" src="<%=file_path%>" width="100" height="100" alt="" />
							</td>
							<td width="37%">
								<a href="saleInquiry.jsp?sale_id=<%=sale_id%>" target="_blank" class="cpbt"><%=title%></a> <%=pub_date%>
								<br>
								<%=content%>
							</td>
							<td width="11%">
								<%=price%>
							</td>
							<td width="13%">
								<%=addr%>
							</td>
							<td width="16%">
								<a href="saleInquiry.jsp?sale_id=<%=sale_id%>"><img src="/zone_b2b/images/zx.gif" border="0" width="75" height="21" alt="点击询价"></a>
								<img src="/zone_b2b/images/msn.gif" width="16" height="16">
							</td>
						</tr>
					     <%} 
					     }%>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="10">
				<input type="hidden" name="n_size" id="n_size" value=<%=size%>>
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