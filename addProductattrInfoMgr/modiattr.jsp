<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.addproductattrMgr.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	//String class_type=bean.getSelectItems("64");
	String class_id=comm.GenTradeId();
	HttpSession httpSess=request.getSession();
	String cust_id=(String)httpSess.getAttribute("SESSION_CUST_ID");
	String attr_id="";
	if(request.getParameter("attr_id")!=null){
		attr_id = request.getParameter("attr_id");
	}
	AddProductAttrInfo addInfo = new AddProductAttrInfo();
	HashMap map = addInfo.getattrById(cust_id,attr_id);
	String attr_name = "",attr_no = "",default_value = "",attr_desc = "",remark="";
	if(map.get("attr_name")!=null){attr_name=map.get("attr_name").toString();}
	if(map.get("attr_no")!=null){attr_no=map.get("attr_no").toString();}
	if(map.get("default_value")!=null){default_value=map.get("default_value").toString();}
	if(map.get("attr_desc")!=null){attr_desc=map.get("attr_desc").toString();}
	if(map.get("remark")!=null){remark=map.get("remark").toString();}
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="modichannal.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductInfo.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
	</head>
	<script language="javascript">
	function Check_Value()
	{
		  if(document.getElementById("attr_name").value.replace(/\s*/g,"") == "" )
		  {
		  	alert( "Attribute name can not be empty!" );
			  document.getElementById("attr_name").focus();
			  return false;
		  }
		  if(document.getElementById("attr_no").value.replace(/\s*/g,"") == "" )
		  {
		  	alert( "Show that the order can not be empty!" );
			  document.getElementById("attr_no").focus();
			  return false;
		  }
		  return true;
	}
    </script>
	<body>
		<form name=productForm method=post action=/doTradeReg.do target="_self">
			<table width="100%" border="0" cellspacing="1" cellpadding="5"
				style="margin-top: 13px; margin-bottom: 13px;" bgcolor="#dddddd">
				<tr>
					<td align="right" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;"> 
						<bean:message key="str439"/> 
					</td>
					<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping">
							<input name="attr_name" type="text" id="attr_name" size=30 maxlength=50 value="<%=attr_name%>">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
						<bean:message key="str1000"/>
					</td>
					<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping">
							<input name="attr_no" type="text" id="attr_no" value="<%=attr_no%>" onkeyup="if(isNaN(value))execCommand('undo')"><bean:message key="str441"/>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
						<bean:message key="str4014"/>
					</td>
					<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping1">
							<input name="default_value" type="text" id="default_value" value="<%=default_value%>">
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" align="right" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
							<bean:message key="str430"/>
				   </td>
					<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping1">
						  <textarea name="attr_desc" cols="50" rows="6" id="attr_desc"><%=attr_desc%></textarea>
						</div>
				  </td>
				</tr>
				<tr>
					<td height="30" align="right" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
							<bean:message key="str1010"/>
				    </td>
					<td align="left" style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping1">
						  <input type="text" name="remark" id="remark" size="50" value="<%=remark%>"/>
						</div>
				  </td>
				</tr>
				<input type="hidden" name="trade_type_code" value="1224"/>
				<input name="attr_id" id="attr_id" type="hidden" value="<%=attr_id%>"/>
				<tr>
					<td height="30" align="center" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" colspan="2">
						<input name="comit" type="submit" value="" onclick="return Check_Value()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



