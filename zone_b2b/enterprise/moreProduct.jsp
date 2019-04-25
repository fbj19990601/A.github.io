<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*,com.saas.biz.custMgr.Custinfo"%>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ page import="com.saas.biz.productMgr.ProductInfo,com.saas.biz.commen.config"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    String iStart = "1",cust_id="",cust_name="";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("cust_id") != null) {
		cust_id = request.getParameter("cust_id");
	}
	cust_name = new Custinfo().getCustCompany( cust_id );
	ProductInfo product = new ProductInfo();
	int counter = product.getProductList( cust_id );
	ArrayList prodList = product.getAllProductList(Integer.parseInt(iStart), cust_id);
	 
	String pageTools = tools.getGoogleToolsBar(counter, "/zone_b2b/enterprise/moreProduct.jsp?cust_id="+cust_id+"&iStart=", Integer.parseInt(iStart),10);
	String defaultImg="/zone_b2b/images/cp.gif";
	int size=0;
	config configFile = new config();
	configFile.init();
	String webtitle = configFile.getString("mysqlbase.webtitle");
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
	      	<a href="customer/<%=cust_id%>/credit.htm"><bean:message key = "str2092"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/stock.htm"><bean:message key = "str2066"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/active.htm"><bean:message key = "str2067"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/bidding.htm"><bean:message key = "str2068"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/techo.htm"><bean:message key = "str2069"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/product.htm"  class="new-dh"><bean:message key = "str2070"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/resume.htm"><bean:message key = "str2071"/></a>&nbsp;&nbsp;&nbsp;
	      	<a href="customer/<%=cust_id%>/leavel.htm"><bean:message key = "str2072"/></a>&nbsp;&nbsp;&nbsp;
	      </div> 
	   </div>
	   <div class="new-ym-header1">
	      <div class="new-ym-header2"><%=cust_name%></div>
	   </div>
	</td>
  </tr>
</table>
<table  width="950" border="0" cellpadding="0" cellspacing="1" bgcolor="#A3BCDA" align="center">
<tr><td height="25" bgcolor="FFFFFF">&nbsp;<bean:message key = "str2218"/>
<a href="/"><bean:message key = "str2737"/></a>&nbsp;-&gt;&nbsp;
<a href="/zone_b2b/enterprise/customer/<%=cust_id%>/product.htm"><bean:message key = "str2070"/></a></td></tr></table>
<table  width="950"align="center" border="0" cellpadding="0" cellspacing="0" >
<tr><td height="6"></td></tr></table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="740" valign="top">
    	<table  width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td><table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="#A3BCDA">
            <tr>
              <td height="255" valign="top" bgcolor="FFFFFF">
              	<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#E6E6E6">
                  <tr>
                    <td width="30%" align="center" bgcolor="#F0F0F0" class="STYLE2"> <bean:message key = "str1276"/></td>
                    <td width="30%" align="center" bgcolor="#F0F0F0"  class="STYLE2"> <bean:message key = "str3923"/> </td>
                    <td width="35%" align="center" bgcolor="#F0F0F0" class="STYLE2"> <bean:message key = "str3452"/> </td>
                  </tr>
                  <tr>
                    <td height="1" class="xian"></td>
                    <td class="xian"></td>
                    <td class="xian"></td>
                  </tr>
                </table>
                <table align="center" width="100%" height="10">
                    <tr>
                      <td height="10"></td>
                    </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#E6E6E6">
                    <%
															    
						      if (prodList != null && prodList.size() > 0) 
									{
										for (int i = 0; i < prodList.size(); i++) 
										{
											HashMap prodInfo = (HashMap) prodList.get(i);
											String product_id = prodInfo.get("product_id").toString();
											cust_id = "";
											String product_name = "";
											String product_site = "";
											String publish_date = "";
											if (prodInfo.get("cust_id") != null) 
											{
												cust_id = prodInfo.get("cust_id").toString();
											}
											if (prodInfo.get("product_site") != null) 
											{
												product_site = prodInfo.get("product_site").toString();
											}
											if (prodInfo.get("product_name") != null) 
											{
												product_name = prodInfo.get("product_name").toString();
											}
											if (prodInfo.get("publish_date") != null) 
											{
												publish_date = prodInfo.get("publish_date").toString();
												if (publish_date.length() > 10)
													publish_date = publish_date.substring(0, 10);
											}
											String pict_path = product.getCustAttachPath(product_id, "0");
											if (pict_path == null) {
												pict_path = "/upload/default.gif";
											}
						    %>
                    <tr>
                      <td  width="30%" bgcolor="#FFFFFF" ><a href="productInfo.jsp?product_id=<%=product_id%>&cust_id=<%=cust_id%>"><%=product_name%></a></td>
                      <td  width="30%" bgcolor="#FFFFFF" ><%=publish_date%> </td>
                      <td  width="35%" bgcolor="#FFFFFF" ><%=product_site%> </td>
                    </tr>
                    <%} 
						     }%>
                </table></td>
            </tr>
          </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="10"><input type="hidden" name="s_size" id="s_size" value="<%=size%>">
                </td>
              </tr>
            </table>
          <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="E3E3E3">
              <tr>
                <td height="32" align="center" background="/zone_b2b/images/btt1.gif"><%=pageTools%></td>
              </tr>
            </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="10"></td>
              </tr>
          </table></td>
      </tr>
    </table></td>
    <td width="10" valign="top">&nbsp;</td>
    <td width="200" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFC367">
      <tr>
        <td height="180" align="center" bgcolor="#FFFFFF"><table width="94%" border="0" cellpadding="2" cellspacing="0">
            <tr>
              <td valign="top">¡¤</td>
              <td valign="top"><bean:message key = "str2220"/></td>
            </tr>
          </table>
            <table width="82%" border="0" cellpadding="2" cellspacing="0">
              <tr>
                <td><a href="/Newcregister.jsp?class_level=4"><img src="/zone_b2b/images/an_03.gif" width="119" height="27"  border="0" ></a></td>
              </tr>
            </table>
          <table width="96%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20"class="xian"></td>
              </tr>
            </table>
          <table width="94%" border="0" cellpadding="2" cellspacing="0">
              <tr>
                <td valign="top">¡¤</td>
                <td valign="top"><bean:message key = "str2221"/></td>
              </tr>
              <tr>
                <td valign="top">¡¤</td>
                <td valign="top"><bean:message key = "str2222"/><strong>0550-8*******</strong></td>
              </tr>
            </table>
          <table width="82%" border="0" cellpadding="2" cellspacing="0">
              <tr>
                <td>&nbsp;<!--img src="/zone_b2b/images/an_06.gif" width="122" height="27"--></td>
              </tr>
          </table></td>
      </tr>
    </table><table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
        <tr>
          <td height="120" align="center" bgcolor="#FFFFFF"><bean:message key = "str2223"/> </td>
        </tr>
      </table></td>
  </tr>
</table>
<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
</body>
</html>
