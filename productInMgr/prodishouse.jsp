<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.wareHouseMgr.*"%>
<%@ page import="com.saas.biz.wareHousePosMgr.*"%>
<%@ page import="com.saas.biz.productdistributionMgr.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.appMgr.AppInfo"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<%@ page import="com.saas.biz.wareHousePosMgr.WareHousePosInfo"%>
<%@ page import="com.saas.biz.wareHouseMgr.wareHouseInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%
	String cust_id = "",app_id="";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("app_id") != null){
        app_id = request.getParameter("app_id");
    }
    GoodsInfo goodsInfo = new GoodsInfo();
    wareHouseInfo house = new wareHouseInfo();
    WareHousePosInfo housePos = new WareHousePosInfo();
    AppInfo appInfo = new AppInfo();
    HashMap appMap = appInfo.getOneApp(cust_id,app_id);
    String app_no="",goods_id="",resource_id="",aim_id="",obj_user_id="",obj_user_name="";
    String app_type1="",app_type2="",app_num="",unit="",app_date="",remark="",goods_name="";
    String house_id1="",pos_id1="",house_id2="",pos_id2="",house_id3="",pos_id3="",pos_id4="";
    if(appMap.get("app_no")!=null){app_no=appMap.get("app_no").toString();}
    if(appMap.get("goods_id")!=null){
    	goods_id=appMap.get("goods_id").toString();
    	HashMap map1 = goodsInfo.getOneGoods(cust_id,goods_id);  
    	if(map1.get("goods_name")!=null){
			goods_name = map1.get("goods_name").toString();
		}
    }
    
    if(appMap.get("obj_user_id")!=null){obj_user_id=appMap.get("obj_user_id").toString();}
    if(appMap.get("obj_user_name")!=null){obj_user_name=appMap.get("obj_user_name").toString();}
    if(appMap.get("app_type")!=null){
    	app_type1=appMap.get("app_type").toString();
    	app_type2=bean.getParaCode2ByParaCode1("79",app_type1);
    }
    String house_name1="",pos_name1="",house_name2="",pos_name2="",house_name3="",pos_name3="",pos_name4="";
    
	    if(appMap.get("resource_id")!=null){
	    	resource_id=appMap.get("resource_id").toString();
	    	StringTokenizer st = new StringTokenizer(resource_id,"|");
	    	while (st.hasMoreTokens()) {
	         	house_id1 = st.nextToken();
	         	pos_id1 = st.nextToken();
	         	house_name1 = house.getHouseNameById(cust_id,house_id1);
	         	pos_name1 = housePos.getPosNameById(cust_id,pos_id1);
	    	}
	    }
	    if(appMap.get("aim_id")!=null){
	    	aim_id=appMap.get("aim_id").toString();
	    	StringTokenizer st = new StringTokenizer(aim_id,"|");
	    	while (st.hasMoreTokens()) {
	         	house_id2 = st.nextToken();
	         	pos_id2 = st.nextToken();
	         	house_name2 = house.getHouseNameById(cust_id,house_id2);
	         	pos_name2 = housePos.getPosNameById(cust_id,pos_id2);
	    	}
	    }
	
    
    if(appMap.get("app_num")!=null){app_num=appMap.get("app_num").toString();}
    if(appMap.get("unit")!=null){unit=appMap.get("unit").toString();}
    if(appMap.get("app_date")!=null){app_date=appMap.get("app_date").toString();}
    
    String dis_id=comm.GenTradeId();
    ProductDistribution distribution = new ProductDistribution();
    ArrayList distList = distribution.getById(cust_id,goods_id);
    String store_vol="",my_lot1="",my_lot2="",my_lot3="",lot_no="",last_pos="";
    if(distList!=null&&distList.size()>0){
    	HashMap disMap = (HashMap)distList.get(0);
    	if(disMap.get("remark")!=null){remark=disMap.get("remark").toString();}
    	if(disMap.get("store_vol")!=null){store_vol=disMap.get("store_vol").toString();}
    	if(disMap.get("my_lot1")!=null){my_lot1=disMap.get("my_lot1").toString();}
    	if(disMap.get("my_lot2")!=null){my_lot2=disMap.get("my_lot2").toString();}
    	if(disMap.get("my_lot3")!=null){my_lot3=disMap.get("my_lot3").toString();}
    	if(disMap.get("lot_no")!=null){lot_no=disMap.get("lot_no").toString();}
    	if(disMap.get("last_pos")!=null){last_pos=disMap.get("last_pos").toString();}
    }
%>
<html>
	<head>
		<title><bean:message key="str2389"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">

		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GoodsInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ProductDistribution.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WareHousePosInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/wareHouseInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		   if(document.getElementById("goods_name").value=="" ||document.getElementById("goods_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择物料名称！");
		     return false;
		   }
		   if(document.getElementById("house_name").value=="" ||document.getElementById("house_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择仓库！");
		     return false;
		   }
		   if(document.getElementById("pos_name").value=="" || document.getElementById("pos_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择仓位！");
		     return false;
		   }
		  document.getElementById('maker').value=document.getElementById('obj_cust').value;
		  return true;
		}
		 Ext.onReady(function(){ 
		 Ext.QuickTips.init();
		});
		
		
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
											<td width="150" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2384"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="2">
												<input type="text" value="<%=goods_name %>" name="goods_name" id="goods_name" maxlength="100" size="25" readonly="readonly">
												<input type="hidden" value="<%=goods_id %>" name="goods_id">
											</td>
										</tr>
										<tr bgcolor="#FFFFFF">
											<td width="150" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str900"/>
											</td>
											<td bgcolor="#FFFFFF" align=left>
												<table border=0 cellpadding=0 cellspacing=2>
													<tr>
														<td width="40" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
															<bean:message key="str2386"/>
														</td>
														<td width="40" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
															<input type="text" value="<%=house_name1 %>" name="house_name" id="house_name" maxlength="100" size="25" readonly="readonly">
															
														</td>
													</tr>
													<tr>
														<td width="40" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
															<bean:message key="str2387"/>
														</td>
														<td align=left bgcolor="#FFFFFF">
															<input type="text" value="<%=pos_name1 %>" name="pos_name" id="pos_name" maxlength="100" size="25" readonly="readonly">
														</td>
													</tr>
												</table>
											</td>
										</tr>

										<tr bgcolor="#FFFFFF" align=left>
											<td width="150" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2388"/>
											</td>
											<td bgcolor="#FFFFFF">
												<table border=0 cellpadding=0 cellspacing=2>
													<tr>
														<td width="40" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
															<bean:message key="str2386"/>
														</td>
														<td align=left bgcolor="#FFFFFF" colspan="1" width="80">
															<input type="text" value="<%=house_name2 %>" name="pos_name" id="pos_name" maxlength="100" size="25" readonly="readonly">
															<input type="hidden" value="<%=house_id2 %>" name="house_id" >
														</td>
													</tr>
													<tr>
														<td width="40" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
															<bean:message key="str2387"/>
														</td>
														<td align=left bgcolor="#FFFFFF">
															<input type="text" value="<%=pos_name2 %>" name="pos_name" id="pos_name" maxlength="100" size="25" readonly="readonly">
															<input type="hidden" value="<%=pos_id2 %>" name="pos_id" >
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<input name="remark" type="hidden" id="remark" value="" />
										<input name="store_vol" type="hidden" id="store_vol" value="<%=store_vol %>" />
										<input name="my_lot1" type="hidden" id="my_lot1" value="<%=my_lot1 %>" />
										<input name="my_lot2" type="hidden" id="my_lot1" value="<%=my_lot2 %>" />
										<input name="my_lot3" type="hidden" id="my_lot1" value="<%=my_lot3 %>" />
										<input name="lot_no" type="hidden" id="lot_no" value="<%=lot_no %>" />
										<input name="last_pos" type="hidden" id="last_pos" value="<%=last_pos %>" />
										<input name="trade_type_code" type="hidden" value="1164" />
										<input name="dis_id" type="hidden" value="<%=dis_id %>" />
										<input name="link_quo_id" type="hidden" value="" />
										<input name="state_code_date" type="hidden" value="" />
										<input name="publish_date" type="hidden" value="" />
										<input name="maker" type="hidden" value="">
										<input name="state_code" type="hidden" value="c" />
										
										
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px;" align="center" colspan=6>
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

