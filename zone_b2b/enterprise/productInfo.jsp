<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*,com.saas.biz.commen.config,com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.productMgr.ProductInfo,com.saas.biz.infoClassMgr.InfoClassinfo"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
 
<%
  String product_id = "",cust_id="",cust_name="";
  String product_name = "";
	String product_class="",class_name="";
	String product_site = "";
	String publish_date = "";
	String pict_path = "";
	String validity = "";
	String product_abstract = "";
	String desc = "";
	String remark ="";
  if( request.getParameter("product_id") != null )
  {
  	   product_id = request.getParameter( "product_id" );
  }
  	if (request.getParameter("cust_id") != null) {
		cust_id = request.getParameter("cust_id");
	}
	cust_name = new Custinfo().getCustCompany( cust_id );
	config configFile = new config();
	configFile.init();
	String webtitle = configFile.getString("mysqlbase.webtitle");
	ProductInfo product = new ProductInfo();
	ArrayList prodList = product.getProInfo( cust_id, product_id);
	if (prodList != null && prodList.size() > 0) 
	{
		for (int i = 0; i < prodList.size(); i++) 
		{
			HashMap prodInfo = (HashMap) prodList.get(0);
			//product_id = prodInfo.get("product_id").toString();
			//cust_id = "";
			
			if (prodInfo.get("cust_id") != null) 
			{
				cust_id = prodInfo.get("cust_id").toString();
			}
			if (prodInfo.get("product_name") != null) 
			{
				product_name = prodInfo.get("product_name").toString();
			}
			
			if (prodInfo.get("product_site") != null) 
			{
				product_site = prodInfo.get("product_site").toString();
			}
			if (prodInfo.get("product_abstract") != null) 
			{
				product_abstract = prodInfo.get("product_abstract").toString();
			}
			if (prodInfo.get("product_desc") != null) 
			{
				desc = prodInfo.get("product_desc").toString();
			}
			if (prodInfo.get("remark") != null) 
			{
				remark = prodInfo.get("remark").toString();
			}
			if (prodInfo.get("publish_date") != null) 
			{
				publish_date = prodInfo.get("publish_date").toString();
				if (publish_date.length() > 10)
					publish_date = publish_date.substring(0, 10);
			}
			if (prodInfo.get("validity") != null) 
			{
				validity = prodInfo.get("validity").toString();
				if (validity.length() > 10)
					validity = validity.substring(0, 10);
			}
			if (prodInfo.get("product_class") != null) 
			{
				product_class = prodInfo.get("product_class").toString();
			}
			class_name = new InfoClassinfo().getProductTypeById( product_id );
			pict_path = product.getCustAttachPath(product_id, "0");
			if (pict_path == null) {
				pict_path = "/upload/default.gif";
			}
		}
	}
%>
<html>
<head> 
<title><%=webtitle%></title>
<link href="/zone_b2b/templates/enterprise/default/css/new-ym-layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
	   <div class="new-ym-header">
	      <div class="new-ym-header4">
	      	<a href="customer/<%=cust_id%>/index.htm"><bean:message key = "str2064"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/supply.htm"><bean:message key = "str2065"/></a>&nbsp;&nbsp;&nbsp;
	      	 
	      	<a href="customer/<%=cust_id%>/stock.htm"><bean:message key = "str2066"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/active.htm"><bean:message key = "str2067"/></a>&nbsp;&nbsp;&nbsp;
	      	
	      	<a href="customer/<%=cust_id%>/product.htm"  class="new-dh"><bean:message key = "str2070"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/resume.htm"><bean:message key = "str2071"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/leavel.htm"><bean:message key = "str2072"/></a>&nbsp;&nbsp;&nbsp;
	      </div> 
	   </div>
	   <div class="new-ym-header1">
	      <div class="new-ym-header2">
	       <%=cust_name%>
	      </div>
	   </div>
	   <div class="new-ym-header3">
	      <div class="new-ym-header5">
	      	<bean:message key = "str2218"/>
	      	<a href="/"><bean:message key = "str2737"/></a>&nbsp;-&gt;&nbsp;
	      	<a href="/zone_b2b/enterprise/customer/<%=cust_id%>/product.htm"><bean:message key = "str2070"/></a>
	      </div>
	   </div>
	</td>
  </tr>
</table>
	 
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
	</table>
	<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		  <td width="712" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="top">
			  
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="2"><img src="/zone_b2b/images/product_03.gif" width="2" height="28"></td>
                    <td background="/zone_b2b/images/product_04.gif">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="4%" align="center"><img src="/zone_b2b/images/toubiao0.gif" width="15" height="15"></td>
                          <td class="btlanse"><bean:message key = "str1276"/></td>
                        </tr>
                     </table>
                    </td>
                    <td width="2"><img src="/zone_b2b/images/product_06.gif" width="2" height="28"></td>
                  </tr>
                </table>
				
                  <table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="DBECF4">
                    <tr>
                      <td height="255" valign="top" bgcolor="FFFFFF"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="1">
                          <tr>
                            <td width="42%"><table width="84%" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                  <td align="center"><img src=<%=pict_path%> width="270" height="246"></td>
                                </tr>
                                <tr>
                                  <td align="center"><!--img src="/zone_b2b/images/Content_11.gif" width="91" height="15"-->&nbsp;&nbsp;<!--img src="/zone_b2b/images/Content_13.gif" width="80" height="15"--></td>
                                </tr>
                            </table></td>
                            <td width="58%">
                            	<table width="100%" border="0" cellspacing="0" cellpadding="4">
                                <tr>
                                  <td width="27%"><bean:message key = "str1276"/></td>
                                  <td width="73%"><%=product_name%></td>
                                </tr>
                                <tr>
                                  <td> <bean:message key = "str2224"/><span class="zi"> </span></td>
                                  <td><%=class_name%></td>
                                </tr>

                                <tr>
                                  <td><bean:message key = "str2225"/></td>
                                  <td><%=product_site%></td>
                                </tr>
                                <tr>
                                  <td><bean:message key = "str2226"/></td>
                                  <td><%=publish_date%></td>
                                </tr>
                                <tr>
                                  <td><bean:message key = "str2227"/></td>
                                  <td><%=validity%></td>
                                </tr>
                                 
                              </table>
                                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                                  <tr>
                                    <td height="1" class="xian"></td>
                                  </tr>
                                  <tr>
                                    <td height="30">
                                    	<table width="86%" border="0" cellpadding="5" cellspacing="1" bgcolor="FFC367">
                                      <tr style="display:none">
                                        <td bgcolor="FFF8EE"><div><a href="#"><img src="/zone_b2b/images/Mouse.gif" width="118" height="34" border="0"></a> <a href="#"><img src="/zone_b2b/images/qq.gif" width="60" height="16" border="0" align="absmiddle"></a></div></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td height="1" class="xian"></td>
                                  </tr>
                                  <tr style="display:none">
                                    <td height="30"><bean:message key = "str2228"/><span class="zi">100</span><bean:message key = "str2229"/> <a href="#" class="lanse"><bean:message key = "str2228"/><span class="zi">100</span><bean:message key = "str1148"/></a> <a href="#" class="lanse">9</a> <a href="#" class="lanse">10</a> <a href="#" class="zhong">11</a> 12 13 14 <a href="#" class="lanse"><bean:message key = "str2228"/><span class="zi">100</span><bean:message key = "str1149"/></a> </td>
                                  </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                          <table width="100%" border="0" cellspacing="1" cellpadding="0">
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table>
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td height="26" class="leftbt14"><img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle"> <bean:message key = "str1229"/></td>
                            </tr>
                            <tr>
                              <td height="3" class="xian"></td>
                            </tr>
                          </table>
                        <table width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#E1E1E1">
                            <TR>
                              <TD width="16%" align="right" bgColor="#f7f7f7"><bean:message key = "str1276"/></TD>
                              <TD width="84%" vAlign="top" bgColor="#FFFFFF"><%=product_name%></TD>
                            </TR>
                            <TR>
                              <TD align="right" bgColor="#f7f7f7"><bean:message key = "str2230"/></TD>
                              <TD vAlign="top" bgColor="#FFFFFF"><%=product_abstract%></TD>
                            </TR>
                            <TR>
                              <TD align="right" bgColor="#f7f7f7"><bean:message key = "str2231"/></TD>
                              <TD vAlign="top" bgColor="#FFFFFF"><%=desc%></TD>
                            </TR>
                            <TR>
                              <TD align="right" bgColor="#f7f7f7"><bean:message key = "str2810"/></TD>
                              <TD vAlign="top" bgColor="#FFFFFF"><%=remark%></TD>
                            </TR>
                        </table>
                       </td>
                    </tr>
                </table></td>
            </tr>
          </table></td>
		  <td width="10" valign="top">&nbsp;		  </td>
			<td width="228" valign="top">
				<jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp"/>
		  </td>
		</tr>
</table>
	<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
</body>
</html>
