<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<jsp:useBean id="sale" class="com.saas.biz.productMgr.ProductInfo" scope="page" />
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
    String iStart = "1",class_id="";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("class_id") != null) {
		class_id = request.getParameter("class_id");
	}
	int counter = sale.getProductByClassId(class_id);
	ArrayList list=sale.getProductByClassId(Integer.parseInt(iStart),5,class_id);
	String pageTools = tools.getGoogleToolsBar(counter, "/zone_b2b/calalogList.jsp?type=2&class_id="+class_id+"&iStart=", Integer.parseInt(iStart),5);
	String defaultImg="/zone_b2b/images/cp.gif";
	int size=0;
%>
<table border=0 cellpadding=0 cellspacing=0 width="100%">
	<tr>
		<td width="134" height="32" align="center" background="/zone_b2b/images/sup_03.gif" class="bthong">
			&nbsp;&nbsp;<bean:message key="str5120"/>
		</td>
		<td align="right" background="/zone_b2b/images/sup_04.gif">
			<img src="/zone_b2b/images/sup_08.gif" align="middle">
			&nbsp;
		</td>
	</tr>
</table>
<table  width="100%" border="0" cellpadding="0" cellspacing="0" id="tbo0">
<tr>
	<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFC367">
			<tr>
				<td height="255" valign="top" bgcolor="FFFFFF">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="23%" height="30">
			                      <input type="hidden" name="idx" id="idx">
								  <img src="/zone_b2b/images/jiantou.gif" width="20" height="17">Images
							</td>
							<td width="35%" class="STYLE2">
								<bean:message key = "str5121"/>/<bean:message key="str4486"/>
							</td>
							<td width="16%" class="STYLE2">
								<bean:message key="str2477"/>
							</td>
							<td width="13%" class="STYLE2">
								<bean:message key="str4720"/>
							</td>
							<td width="13%" class="STYLE2">
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
					        String product_id="",cust_id="";
					        String cust_name="",audit_date="",product_abstract="",product_site="",product_name="",date="",cust_class="";
					        if(map.get("cust_id")!=null){cust_id=map.get("cust_id").toString();}
					        if(map.get("product_id")!=null){product_id=map.get("product_id").toString();}
					        if(map.get("cust_name")!=null){cust_name=map.get("cust_name").toString();}
					        if(map.get("product_name")!=null){product_name=map.get("product_name").toString();}
					        if(map.get("product_site")!=null){product_site=map.get("product_site").toString();}
					        if(map.get("cust_class")!=null){cust_class=map.get("cust_class").toString();
					         cust_class=param.getParamNameByValue("14",cust_class);
					        }
					        if(map.get("product_abstract") !=null)
						    {
						      product_abstract = map.get("product_abstract").toString();
						      product_abstract = product_abstract.replaceAll("<[^<>]+>","");
						      if(product_abstract.length()>20)
						      {
						        product_abstract=product_abstract.substring(0,20)+"...";
						      }
						    }
						    if(map.get("audit_date")!=null){
						      audit_date=map.get("audit_date").toString();
						      if(audit_date.length()>10){
						        audit_date=audit_date.substring(0,10);
						      }
						    }
						    String file_path="";
						     if(map.get("file_path")!=null){
						       file_path=map.get("file_path").toString();
						       //file_path=file_path.substring(23);
							}else{
							file_path=defaultImg;
							}
					    %>
					        <tr class="rencei_table_xian">
							<td width="4%" height="30" class="rencei_table_xian">
								<input type="checkbox" name="sale_<%=i%>" id="sale_<%=i%>" value="<%=product_id%>" style="display: none">
							</td>
							<td width="19%" height="130" class="rencei_table_xian">
								<a href="/zone_b2b/enterprise/productInfo.jsp?product_id=<%=product_id%>&cust_id=<%=cust_id%>" target=_blank><img src="<%=file_path%>" width="100" height="100" alt="" /></a>
							</td>
							<td width="35%" class="rencei_table_xian">
								<a href="/zone_b2b/enterprise/productInfo.jsp?product_id=<%=product_id%>&cust_id=<%=cust_id%>" target=_blank style="font-weight: bold;"><%=product_name%></a>
								&nbsp;<%=audit_date%><br>
								<%=product_abstract%>&nbsp;
							</td>
							<td width="16%" class="rencei_table_xian">
								<%=cust_name%>&nbsp;
							</td>
							<td width="13%" class="rencei_table_xian">
								<%=product_site%>&nbsp;
							</td>
							<td width="13%" class="rencei_table_xian">
							 	<a href="/zone_b2b/enterprise/productInfo.jsp?product_id=<%=product_id%>&cust_id=<%=cust_id%>" target=_blank><img src="/zone_b2b/images/zx.gif" width="75" height="21">
								</a>
							</td>
						</tr>
					     <%} 
					     }else{%>
					     <tr>
							<td height="1" class="xian"></td>
							<td class="xian"></td>
							<td class="xian"></td>
							<td class="xian"></td>
							<td class="xian"></td>
						</tr>
					     <%}%>
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