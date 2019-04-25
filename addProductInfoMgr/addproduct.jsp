<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	//String class_type=bean.getSelectItems("64");
	String class_id=comm.GenTradeId();
	HttpSession httpSess=request.getSession();
	String cust_id=(String)httpSess.getAttribute("SESSION_CUST_ID");
%>
<html>
	<head>
		<title><bean:message key="str427"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="channal.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductInfo.js'></script> 
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
      </style>
	</head>
	<body>
		<form name=productForm method=post action=/doTradeReg.do target="_self">
			<table width="100%" border="0" cellspacing="1" cellpadding="5"
				style="margin-top: 13px; margin-bottom: 13px;" bgcolor="#dddddd">
				<tr>
					<td align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
						<bean:message key="str428"/>
					</td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping">
							<input name="class_name" type="text" id="class_name" size=30 maxlength=50>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
						<bean:message key="str429"/>
					</td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping">
							<div id="tree-div"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
							<bean:message key="str351"/>
				    </td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping1">
						  <select id="enable_tag" name="enable_tag">
						    <option value="0"><bean:message key="str352"/></option>
						    <option value="1"><bean:message key="str353"/></option>
						  </select>
						</div>
				    </td>
				</tr>
				<tr>
					<td height="30" align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
							<bean:message key="str446"/>
				   </td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping1">
						  <textarea name="class_desc" cols="50" rows="6"></textarea>
						</div>
				  </td>
				</tr>
				<tr>
					<td height="30" align="right"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;">
							<bean:message key="str164"/>
				    </td>
					<td align="left"
						style="background-color: #ffffff; color: #000000; font-size: 12px; padding: 3px 5px;">
						<div class="ping1">
						  <input type="text" name="remark" id="remark" size="50"/>
						</div>
				  </td>
				</tr>
				<input type="hidden" name="trade_type_code" value="1220"/>
				<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="class_id" id="class_id" type="hidden" value="<%=class_id%>">
				<input name="class_name" id="class_name" type="hidden" value="0">
				<input name="up_class_id" id="up_class_id" type="hidden" value="000000000000000">
				<input name="class_level" id="class_level" type="hidden" value="0">
				<input name="class_type" id="class_type" type="hidden" value="0">
				<input name="class_desc" id="class_desc" type="hidden" value="0">
				<input name="enable_tag" id="enable_tag" type="hidden" value="0">
				<input name="remark" id="remark" type="hidden" value="0">
				
				<tr>
					<td height="30" align="center"
						style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;"
						colspan=2>
						<input name="comit" type="submit" value="" onclick="return Check_Value()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



