<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.productMgr.*"%>
<%@ page import="com.saas.biz.newproductattrMgr.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String product_id = "", cust_id = "";
	product_id = bean.GenTradeId();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("product_id") != null) {
		product_id = request.getParameter("product_id");
	}
	NewProductAttrInfo group = new NewProductAttrInfo();
	ArrayList tableList = group.getProductById(product_id);

	ProductInfo groups = new ProductInfo();
	ArrayList list = groups.getById(cust_id, product_id);

	String product_type = comm.getSelectItems("84");
	HashMap maps = (HashMap) list.get(0);
	int size = 0;
	String product_name = "", product_abstract = "", product_desc = "", product_site = "", product_unit = "", validity = "", remark = "";
	if (maps.get("product_name") != null) {
		product_name = maps.get("product_name").toString();
	}
	if (product_type != null) {
		product_type = maps.get("product_type").toString();
	}
	product_type = comm.getItemsBySelected("84", product_type);
	if (maps.get("product_abstract") != null) {
		product_abstract = maps.get("product_abstract").toString();
	}
	if (maps.get("product_desc") != null) {
		product_desc = maps.get("product_desc").toString();
	}
	if (maps.get("product_site") != null) {
		product_site = maps.get("product_site").toString();
	}
	if (maps.get("product_unit") != null) {
		product_unit = maps.get("product_unit").toString();
	}
	product_unit = comm.getItemsBySelected("91",product_unit);
	if (maps.get("validity") != null) {
		validity = maps.get("validity").toString();
	}
	if (maps.get("remark") != null) {
		remark = maps.get("remark").toString();
	}
%>
<html>
	<head>
		<title>B2B EC-platform</title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript" src="/www/fuction/public.js"></script>
		<script src="/www/fuction/calendar.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="modi_productInfo.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductAttrInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<style type="text/css">
.Tree-Img {
	background-image: url(/img/org.png) !important;
}

.root-Img {
	background-image: url(/img/home.png) !important;
}
</style>
	</head>
	<body>
		<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="26" background="/img/bg-1.gif">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td background="/img/bg-2.gif">
					<form name="newproductform" action="/doTradeReg.do" method="post" target="_self">
						<table width="90%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str942"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
										<input type=text name="product_name" id="product_name" value="<%=product_name%>">
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str944"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<select name="product_type" id="product_type">
										<option value="">
											<bean:message key="str1048"/>
										</option>
											<%=product_type%>
									</select> 
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2230"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<textarea name="product_abstract" id="product_abstract" cols="50" rows="6"><%=product_abstract%></textarea>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2432"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<textarea name="product_desc" id="product_desc" cols="50" rows="6"><%=product_desc%></textarea>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2433"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="product_site" id="product_site" value="<%=product_site%>">
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2434"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
										<select name="product_unit" id="product_unit">
											<option value="">
												<bean:message key="str2655"/>
											</option>
											<%=product_unit%>
										</select>
									</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2435"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="validity" id="validity" onfocus="setday(this);" value="<%=validity%>">
									(yyyy-mm-dd)
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right>
									<bean:message key="str2810"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left>
									<input type=text name="remark" id="remark" value="<%=remark%>">
								</td>
							</tr>
							<tr>
								<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
									<bean:message key="str4250"/>
								</td>
								<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=left width="85%">
									<bean:message key="str964"/>
								</td>
							</tr>
							<%
									if (tableList != null && tableList.size() > 0) {
									size = tableList.size();
									for (int i = 0; i < tableList.size(); i++) {
										HashMap map = (HashMap) tableList.get(i);
										String attr_name = "", attr_id = "", attr_value = "";
										if (map.get("attr_id") != null) {
									attr_id = map.get("attr_id").toString();
										}
										if (map.get("attr_name") != null) {
									attr_name = map.get("attr_name").toString();
										}
										if (map.get("attr_value") != null) {
									attr_value = map.get("attr_value").toString();
										}
							%>
							<tr style="background-color: #f9f9f9;">
								<td style="color: #000000;" align="center"><%=attr_name%></td>
								<tdstyle ="background-color: #ffffff; color: #000000; font-size: 12px;"	align=left>
								<td>
									<input type=text name="<%=attr_name%>&<%=attr_id%>" id="attr_value<%=i%>" value="<%=attr_value%>">
								</td>
							</tr>
							<%
							}
							%>
							<%
							}
							%>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px; padding-top: 10px; padding-bottom: 10px;" align=center colspan=2>
									<input class="tjan" name=submit1 type=submit value="" onclick="return Check_Value()">
								</td>
							</tr>
							<input type="hidden" name="trade_type_code" value="1228" />
							<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id%>">
							<input type="hidden" name="product_id" id="product_id" value="<%=product_id%>" />
							<input type="hidden" name="rsrv_str1" id="rsrv_str1" value="" />
							<input type="hidden" id="size" name="size" value="<%=size%>">
							<input type="hidden" id="audit_date" name="audit_date" value="" />
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="46" background="/img/bg-3.gif"></td>
			</tr>
		</table>
	</body>
</html>
<script language="javascript">
function Check_Value()
 { 
	    var size=document.getElementById("size").value;
	    var values="";
	    for(var i=0;i<size;i++){
	      var obj="attr_value"+i;
	      values=values+document.getElementById(obj).name+"#"+document.getElementById(obj).value+"|";
	    }
	    document.getElementById("rsrv_str1").value=values;
 	    return true;
}
</script>