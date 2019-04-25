<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<% 
	String cust_id = "";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	String price_type = bean.getSelectItems("3");
	String trade_id = comm.GenTradeId();
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal
			.getTime());
	cal.add(Calendar.MONTH, 3);
	String end_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal
			.getTime());
	GoodsInfo p = new GoodsInfo();
	ArrayList tableList = p.getById(cust_id);
%>
<html>
	<head>
		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
form {
	padding: 0px;
	margin: 0px;
}

.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid; . line6 .img { width : 53px;
	height: 53px;
	float: left;
	margin-right: 20px;
}

.line6 .title {
	font-size: 14px;
	font-weight: bold;
	color: #ff5400;
}

.line1 {
	border-left: #ff7300 3px solid;
	background-color: #e2e2e2;
	color: #333333;
	text-align: left;
	font-size: 12px;
}  /*横栏样式1*/
.user-Img {
	background-image: url(/img/customer.png) !important;
}

.cust-Img {
	background-image: url(/img/home.png) !important;
}
</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GoodsInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="JavaScript">
		function checkThis(val){
			var size = document.getElementById('size').value;
			var all = '';
			for(var i=0;i<size;i++){
				var obj = 'goods_name'+i;
				if(document.getElementById(obj).checked){
					all = all+document.getElementById(obj).value+'|';
				}
				document.getElementById('allValue').value=all;
			}
		}
		function checkAllGoods(){	
		    var all = '';
			var size = document.getElementById('size').value;
			if(document.getElementById('checkAll').checked){
				for(var i=0;i<size;i++){
					var obj = 'goods_name'+i;
					document.getElementById(obj).checked = true;
					all = all+document.getElementById(obj).value+'|';
				}
				document.getElementById('allValue').value=all;
			}else{
			   for(var i=0;i<size;i++){
					var obj = 'goods_name'+i;
					document.getElementById(obj).checked = false;
				}
				document.getElementById('allValue').value="";
			}
		}
		function confirmsub(){
			if(document.getElementById("price_code").value=="" ||document.getElementById("price_code").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写报价单！");
		     return false;
		   }
		   if(document.getElementById("product_id").value=="" ||document.getElementById("product_id").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择产品！");
		     return false;
		   }
		   if(document.getElementById("price_type").value=="" ||document.getElementById("price_type").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择产品类型！");
		     return false;
		   }
		   if(document.getElementById("price").value=="" ||document.getElementById("price").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写价格！");
		     return false;
		   }
		   
		}
		
		
        </script>
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
	            WinLIKE.definewindows=mydefss;
	            function mydefss() {
	            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
	            	j.Vis=false;
	            	j.Nam='appwin';
	            	WinLIKE.addwindow(j);
	            };
	    </SCRIPT>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td colspan="4">
									<table width="100%">
										<tr>
											<td width="15%" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1275"/>
											</td>
											<td align=left bgcolor="#FFFFFF" width="85%">
												<div class="ping">
													<input type="text" name="price_code" id="price_code" maxlength="20" size="25" onkeyup="if(isNaN(value))execCommand('undo')">
													<font color="red" size="2px"><bean:message key="str1287"/></font>
												</div>
											</td>
										</tr>
										<tr>
											<td width="15%" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2428"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3" width="85%">
												<div class="ping">
													<ul style="width: 100%">
														<input type="checkbox" id="checkAll" name="checkAll" value="" onclick="checkAllGoods()"><bean:message key="str1288"/>
														<hr>
														<%
															int size = tableList.size();
															if (tableList != null && tableList.size() > 0) {
																for (int a = 0; a < tableList.size(); a++) {
																	HashMap tableMap = (HashMap) tableList.get(a);
																	String goods_id = tableMap.get("goods_id").toString();
																	String goods_name = tableMap.get("goods_name").toString();
														%>

														<li style="width: 30%; float: left">
															<input type="checkbox" id="goods_name<%=a%>" name="goods_name<%=a%>" value="<%=goods_id%>" onclick="checkThis(this.value)"><%=goods_name%><br>
														</li>

														<%
															}
															}
														%>

													</ul>
													<input type="hidden" value="<%=size%>" id="size" name="size">
												</div>
												<input type="hidden" size="50" name="product_id" id="allValue" value="">
											</td>
										</tr>
										<tr>
											<td width="15%" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1289"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3" width="85%">
												<div class="ping" id="goods_type_aa" style="display: block">
													<select name="price_type" id="price_type">
														<option value="">
															<bean:message key="str1180"/>
														</option>
														<%=price_type%>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td width="15%" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1277"/>
											</td>
											<td align=left bgcolor="#FFFFFF" width="85%">
												<div class="ping">
													<input type="text" name="price" id="price" maxlength="100" size="25" onkeyup="if(isNaN(value))execCommand('undo')">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1278"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="start_date" id="start_date" maxlength="100" size="25" value="<%=start_Date%>" onfocus="setday(this);">
													<span style="color: red">(yyyy-MM-dd)</span>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1279"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="ent_date" id="ent_date" maxlength="100" size="25" value="<%=end_Date%>" onfocus="setday(this);">
													<span style="color: red">(yyyy-MM-dd)</span>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1280"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<textarea name="price_desc" id="price_desc" rows="6" cols="50"></textarea>
												</div>
											</td>
										</tr>

										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str1281"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping1">
													<input name="remark" id="remark" size="52" maxlength="50">
												</div>
											</td>
										</tr>
										<input name="fix_type" type="hidden" value="1" />
										<input name="sale_obj_id" type="hidden" value="" />
										<input name="trade_id" type="hidden" value="<%=trade_id%>" />
										<input name="trade_type_code" type="hidden" value="1234" />
										<input name="in_date" type="hidden" value="<%=start_Date%>" />
										<input name="cust_id" type="hidden" id="cust_id" value="<%=cust_id%>" />
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px;" align="center" colspan=4>
												<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="13"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

