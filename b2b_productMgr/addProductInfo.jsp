<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="classBean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String product_id = "", cust_id = "";
	String sale_id = bean.GenTradeId();
	product_id = bean.GenTradeId();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String product_type = comm.getSelectItems("84");
	String unit = comm.getSelectItems("91");
	String select = classBean.getSelectedByComm("2", "1");
%>
<html>
	<head>
		<title><bean:message key="str784"/></title>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="supply.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductAttrInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
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
		<table width="727" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="26">
				</td>
			</tr>
			<tr>
				<td>
					<form name="newproductform" action="/doTradeReg.do" method="post" target="_self">
						<table width="90%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str942"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping">
										<input type=text name="product_name" id="product_name" size=20>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str943"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%"> 
									<div class="ping">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<div id="loading" style="display: none">
											<img src="/img/wait.gif" border="0">
											<bean:message key="str1003"/>
										</div>
										<div id="product-div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td height="30" align="right" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" valign="top">
									Product model
								</td>
								<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px;">
									<div class="ping">
										<table border="0" cellpadding="0" cellspacing="0" style="margin-left: 15px">
											<tr>
												<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
													<select name="sort1" id="sort1" size="10" style="width: 130px" onChange="setSecondClass(this.value);" onclick="setTypeName(this)">
														<%=select%>
													</select>
												</td>
												<td style="background-color:#ffffff; color:#000000; font-size:12px;">
													<select name="sort2" id="sort2" size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value);" onclick="setTypeName(this)">
														<option value="0">
															<bean:message key="str1079"/>
														</option>
													</select>
												</td>
												<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
													<select name="sort3" id="sort3" size="10" style="width: 130px; display: none" onclick="setTypeName(this)" onchange="cretateSelect('4',this.value)">
														<option value="0">
															<bean:message key="str1079"/>
														</option>
													</select>
												</td>
												<td>
													<div id="nextElement" style="display: none">
														<div id="4" style="width;100px; float:left;display:inline;white-space:nowrap"></div>
														<input type="hidden" name="index_s" id="index_s" value="4">
													</div>
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str2430"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<select name="product_type" id="product_type">
											<%=product_type%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str2431"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<textarea name="product_abstract" id="product_abstract" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str2432"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<textarea name="product_desc" id="product_desc" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str2433"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<input type=text name="product_site" id="product_site" size="50" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str2434"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<select name="product_unit" id="product_unit">
											<option value="">
												<bean:message key="str2655"/>
											</option>
											<%=unit%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str3282"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<input type=text name="validity" id="validity" onfocus="setday(this);">
										(yyyy-mm-dd)
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px;" align=right width="15%">
									<bean:message key="str164"/>
								</td>
								<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width="85%">
									<div class="ping1">
										<input type=text name="remark" id="remark" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<tr>
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" width="15%">
									<bean:message key="str385"/>
								</td>
								<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;" width="85%">
									<div style="padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
										<iframe src="/inc/uploadImg.jsp?root_id=<%=product_id%>" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px; padding-top: 10px; padding-bottom: 10px;" align=center colspan=2>
									<input class="tjan" name=submit1 type=submit value="" onclick="return Check_Value()">
								</td>
							</tr>
							<tr>
								<td>
									<input type=hidden name="trade_type_code" value="1226" />
									<input type=hidden name="cust_id" id="cust_id" value="<%=cust_id%>">
									<input type=hidden name="product_id" id="product_id" value="<%=product_id%>" />
									<input type=hidden name="product_class" id="product_class" value="" />
									<input type=hidden name="publish_user_id" id="publish_user_id" value="<%=cust_id%>" />
									<input type=hidden name="publish_date" id="publish_date" value="" />
									<input type=hidden name="audit_date" id="audit_date" value="" />
									<input type=hidden name="class_id" id="class_id" value="" />
									<input name="root_id" id="root_id" type="hidden" value="<%=product_id%>">
									<input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="46"></td>
			</tr>
		</table>
	</body>
</html>
