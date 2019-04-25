<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.wareHouseMgr.*"%>
<%@ page import="com.saas.biz.wareHousePosMgr.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String dis_id="",form_id = "", cust_id = "", goods_id = "", goods_name = "", house_name = "", pos_name = "", house_id = "", pos_id = "";
	if (request.getParameter("product_id") != null) {
		goods_id = request.getParameter("product_id");
	}
	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	dis_id=comm.GenTradeId();
	String str1 = "", str2 = "", str3 = "";
	GoodsInfo p = new GoodsInfo();
	ArrayList tableList = p.getById(cust_id);
	if (tableList != null && tableList.size() > 0) {
		for (int i = 0; i < tableList.size(); i++) {
			HashMap map1 = (HashMap) tableList.get(i);
			if (map1.get("goods_name") != null) {
		goods_id = map1.get("goods_id").toString();
		goods_name = map1.get("goods_name").toString();
		str1 = str1 + "<option value=" + goods_id + ">"
				+ goods_name + "</option>";
			}
		}
	}

	wareHouseInfo q = new wareHouseInfo();
	ArrayList tableList1 = q.getWareHouseById(cust_id);
	if (tableList1 != null && tableList1.size() > 0) {
		for (int i = 0; i < tableList1.size(); i++) {
			HashMap map2 = (HashMap) tableList1.get(i);
			if (map2.get("house_name") != null) {
		house_id = map2.get("house_id").toString();
		house_name = map2.get("house_name").toString();
		str2 = str2 + "<option value=" + house_id + ">"
				+ house_name + "</option>";
			}
		}
	}

	WareHousePosInfo w = new WareHousePosInfo();
	ArrayList tableList2 = w.getWareHousePosById(cust_id);
	if (tableList2 != null && tableList2.size() > 0) {
		for (int i = 0; i < tableList2.size(); i++) {
			HashMap map3 = (HashMap) tableList2.get(i);
			if (map3.get("pos_name") != null) {
		pos_id = map3.get("pos_id").toString();
		pos_name = map3.get("pos_name").toString();
		str3 = str3 + "<option value=" + pos_id + ">"
				+ pos_name + "</option>";
			}
		}
	}
%>
<html>
	<head>
		<title><bean:message key="str889"/></title>
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
	border: #ffcb99 1px solid;
	background-color: #fff8ee;
	text-align: left;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #000000;
	margin-top: 13px;
	margin-bottom: 13px;
}  /*横栏样式6---- 头部提醒1*/
.line6 .img {
	width: 53px;
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
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WareHousePosInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/wareHouseInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="JavaScript">
		function checkValueS(){
		
		   var re = /^[A-Za-z0-9]+$/;
		   if(document.getElementById("goods_name").value=="" ||document.getElementById("goods_name").value==null){
		     alert("请选择物料名称！");
		     return false;
		   }
		   if(document.getElementById("house_id").value=="" ||document.getElementById("house_id").value==null){
		     alert("请选择仓库！");
		     return false;
		   }
		    if(document.getElementById("pos_id").value=="请选择.."){
		     alert("请选择仓位！");
		     return false;
		   }
		   
		   if(document.getElementById("last_pos").value=="" ||document.getElementById("last_pos").value==null){
		     alert("请填写条形码！");
		     return false;
		   }
  			if(re.test(document.getElementById("last_pos").value)){   
			}else{   
				alert("条形码 格式不正确！"); 
				document.getElementById("last_pos").value='';
				document.getElementById("last_pos").focus();
				return false;
			} 
			if(document.getElementById("lot_no").value=="" ||document.getElementById("lot_no").value==null){
		     alert("请填写自定义批号！");
		     return false;
		   }
  			if(re.test(document.getElementById("lot_no").value)){   
			}else{   
				alert("自定义批号 格式不正确！"); 
				document.getElementById("lot_no").value='';
				document.getElementById("lot_no").focus();
				return false;
			} 
		  document.getElementById('maker').value=document.getElementById('obj_cust').value;
		  return true;
		}
		 Ext.onReady(function(){ 
		 Ext.QuickTips.init();
		});
		
		function selectPos(val){
				var fectureArray=new Array();
				fectureArray=['请选择..'];
				var house_id=val;
				var cust_id=document.getElementById('cust_id').value;
				WareHousePosInfo.getOnePosByHouseId(cust_id,house_id,function(data){
					DWRUtil.removeAllOptions("pos_id");
					DWRUtil.addOptions("pos_id",fectureArray);
					DWRUtil.addOptions("pos_id",data);
				})
				document.getElementById('aim_id').value='';
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
											<td width="108" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str899"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping">
													<select name="goods_name" id="goods_name">
														<option value="">
															<bean:message key="str1048"/>
														</option>
														<%=str1%>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td width="108" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2376"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping">
													<select name="house_id" id="house_id" onchange="selectPos(this.value)">
														<option value="">
															<bean:message key="str1048"/>
														</option>
														<%=str2%>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td width="108" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str4206"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping">
													<select name="pos_id" id="pos_id">
														<option value="">
															<bean:message key="str1048"/>
														</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str892"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping">
													<input type="text" name="last_pos" id="last_pos" maxlength="20" size="25">
													<font color="red"><bean:message key="str2378"/></font>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2379"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping">
													<input type="text" name="lot_no" id="lot_no" maxlength="20" size="25">
													<font color="red"><bean:message key="str2378"/></font>
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2380"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="my_lot1" id="my_lot1" maxlength="100" size="25">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2381"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="my_lot2" id="my_lot2" maxlength="100" size="25">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2382"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="my_lot3" id="my_lot3" maxlength="100" size="25">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2383"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="store_vol" id="store_vol" maxlength="100" size="25">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2810"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping1">
													<input name="remark" id="remark" size="52" maxlength="50">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<input name="trade_type_code" type="hidden" value="1159" />
												<input name="dis_id" type="hidden" value="<%=dis_id%>" />
												<input name="form_id" type="hidden" value="<%=form_id%>" />
												<input name="link_quo_id" type="hidden" value="<%=goods_id%>" />
												<input name="in_date" type="hidden" value="" />
												<input name="state_code_date" type="hidden" value="" />
												<input name="goods_id" type="hidden" value="<%=goods_id%>" />
												<input name="publish_date" type="hidden" value="" />
												<input name="maker" type="hidden" value="">
												<input name="cust_id" type="hidden" id="cust_id" value="<%=cust_id%>" />
												<input name="store_type" type="hidden" value="0" />
												<input name="goods_type" type="hidden" value="0" />
												<input name="state_code" type="hidden" value="c" />
												<input name="user_id" type="hidden" id="user_id" value="<%=cust_id%>" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px;" align="center" colspan=4>
												<input name="comit" type="submit" value="" onclick="return checkValueS()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand">
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