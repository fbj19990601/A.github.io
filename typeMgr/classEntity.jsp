<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr"
	scope="page" /><html>
	<head>
		<title><bean:message key="str626"/></title>
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/classInfo.js" language="jscript" type="text/jscript"></script>
		<script language="javascript">
function checkInfo()
{
	if (document.classForm.product_name.value == ""||document.classForm.product_name.value == null)
	{
		alert("产品名称不可以为空！");
		document.classForm.product_name.focus(); 
		return false;
	}
	if (document.classForm.sort1.value == "")
	{
		alert("请选择商品分类！");
		document.classForm.sort1.focus(); 
		return false;
	} 
	document.classForm.submit();;
}
function check_none()
{
    if (document.classForm.advshow.checked)
    {
	    document.classForm.submit1.disabled=false;        	     
	}
	else
	{
	    document.classForm.submit1.disabled=true;
	}
}
</script>
	</head>
	<body>
		<form name="classForm" method="post" action="addProduct.jsp"
			target="_blank">
			<table width="100%" border="0" cellspacing="1" cellpadding="5"
				style="margin-top: 13px; margin-bottom: 13px;" bgcolor="#dddddd">
				<tr>
					<td align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
						<bean:message key="str942"/>
					</td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<input name="product_name" type="text" maxlength="50" size="50">
					</td>
				</tr>
				<tr>
					<td height="30" align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
						<bean:message key="str4711"/>
					</td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<table>
							<tr>
								<td
									style="background-color: #ffffff; color: #000000; font-size: 12px;">
									<select name="bigsort" style="display: none">
										<option selected value="0">
											<bean:message key="str160"/>
										</option>
									</select>
								</td>
								<td
									style="background-color: #ffffff; color: #000000; font-size: 12px;">
									<select name="sort1" size="10"
										onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)">
										<option selected value="0">
											<bean:message key="str160"/>
										</option>
									</select>
								</td>
								<td
									style="background-color: #ffffff; color: #000000; font-size: 12px;">
									<select name="sort2" size="10"
										onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)">
										<option value="0">
											<bean:message key="str160"/>
										</option>
									</select>
								</td>
								<td
									style="background-color: #ffffff; color: #000000; font-size: 12px;">
									<select name="sort3" size="10">
										<option value="0">
											<bean:message key="str160"/>
										</option>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;"
						colspan=2>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="advshow" type="checkbox" value="0"
							onclick="check_none()">
						<bean:message key="str354"/>
					</td>
				</tr>
				<tr>
					<td align="center"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 13px; padding-top: 10px; padding-bottom: 10px;"
						colspan=2>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="xyban" type="button" name="submit1" value=""
							disabled="true" onClick=" return checkInfo()">
					</td>
				</tr>
			</table>
		</form>
		<script language="jscript" type="text/jscript">
	getSubitems(document.classForm.bigsort, "", "请选择...", "");
	getSubitems(document.classForm.sort1, "");
</script>
	</body>
</html>



