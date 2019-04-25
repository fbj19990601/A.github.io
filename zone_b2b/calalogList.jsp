<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="classInfo" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<%
	String class_id = "", class_type = "", paran = "", info_msg = "", includePage = "", iStart = "1", infoClass = "";
	//class_type=0 Enterprise Category class_type=4 Procurement Category  class_type=5 Category sales  
	if (request.getParameter("type") != null) {
		class_type = request.getParameter("type").toString();
	}
	if(class_type == "2" || class_type.equals("2")){
		paran = "List of Products";
		infoClass = "Product Categories";
		info_msg = "&class_id=";
		includePage = "/zone_b2b/includeProduct.jsp";
	
	}else if (class_type == "3" || class_type.equals("3")) {
		paran = "List of Enterprise Information";
		infoClass = "Enterprise Category";
		info_msg = "&enterprise=1&class_id=";
		includePage = "/zone_b2b/includeEnterprise.jsp";
	}
	else if (class_type == "4" || class_type.equals("4")) {
		paran = "List of procurement";
		infoClass = "Buying Category";
		info_msg = "&stock=1&class_id=";
		includePage = "/zone_b2b/includeStockList.jsp";
	}
	else if (class_type == "5" || class_type.equals("5")) {
		paran = "Sales Information List";
		infoClass = "Category sales";
		info_msg = "&supply=1&class_id=";
		includePage = "/zone_b2b/includeSaleList.jsp";
	}
	else {
		includePage = "/inc/left.jsp";
	}
	if (request.getParameter("class_id") != null) {
		class_id = request.getParameter("class_id").toString();
	}
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart").toString();
	}
	
	String calalogInfo = classInfo.getCalalogInfo(class_type, class_id, "/zone_b2b/calalogList.jsp?type=" + class_type + info_msg);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title> <bean:message key="str316"/>--<%=paran%>
		</title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		#login{
	     position: relative;
	     display: none;
	         top: 20px;
	         left: 30px;
	         background-color: #ffffff;
	         text-align: center;
	         border: solid 1px;
	         padding: 10px;
	         z-index: 1;
	   }
		-->
	</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		  function saleCompare() {
			var compara = "";
			var size = $F("s_size");
			if (size > 0) {
				for (var i = 0; i < size; i++) {
					var obj = "sale_" + i;
					var product = $(obj);
					if (product.checked) {
						compara = compara + $F(obj) + "|";
					}
				}
				if (compara == null || compara == "") {
					alert("Check to compare the information!");
					return false;
				}else{
					$("idx").value=compara
					$("commpara").submit();
				}
			} else {
				alert("No comparative information!");
				return false;
			}
		}
		</script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.html" />
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="DCDCDC">
			<tr>
				<td height="29" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF" style="font-size: 15px;font-weight: bold;">
					&nbsp;&nbsp;<bean:message key= "str2253" />
					<a href="/" style="font-size: 15px;font-weight: bold;"><img src="/zone_b2b/images/lujian.gif" border="0">
					 <bean:message key="str2481"/></a>
					<img src=/zone_b2b/images/lujian.gif border=0>
					<a href="/zone_b2b/calalogList.jsp?type=<%=class_type%><%=info_msg%>000000000000000"><%=infoClass%> </a>
					<img src=/zone_b2b/images/lujian.gif border=0>
					<%=calalogInfo%>
				</td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="740" valign="top">
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr>
							<td width="200" height="32" align="center" background="/zone_b2b/images/sup_06.gif" class="bthong">
								&nbsp;&nbsp;
								<%=infoClass%>
							</td>
							<td align="right" background="/zone_b2b/images/sup_04.gif">
								<img src="/zone_b2b/images/sup_08.gif" align="absmiddle">
								&nbsp;
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="FFC367">
						<tr>
							<td bgcolor="FFFFFF">&nbsp; 
								<jsp:include flush="true" page="/zone_b2b/catalogInclude.jsp">
									<jsp:param name="id" value="<%=class_id%>" />
								</jsp:include>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="10" cellspacing="1">
						<tr>
							<td height="5">
							</td>
							</tr>
							</table>
					<div style="width:740px;">
						<jsp:include flush="true" page="<%=includePage%>">
							<jsp:param name="iStart" value="<%=iStart%>" />
							<jsp:param name="class_id" value="<%=class_id%>" />
						</jsp:include>
					</div>
				</td>
				<td valign="top">&nbsp;
					
				</td>
				<td width="228" valign="top">
					<jsp:include flush="true" page="/zone_b2b/supply/sale_right.jsp" />
				<br></td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>
