<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%
	String link_quo_id = "", form_id = "", cust_id = "", quo_id = "", goods_id = "", trade_id = "";
	if (request.getParameter("quo_id") != null) {
		link_quo_id = request.getParameter("quo_id");
	}
	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	quo_id = comm.GenTradeId();
	goods_id = comm.GenTradeId();
	trade_id = comm.GenTradeId();
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal
			.getTime());
	String in_date = new SimpleDateFormat("yyyy-MM-dd").format(cal
			.getTime());
	String ship_type = bean.getSelectItems("63");
	String goods_type = bean.getSelectItems("67");
	String src = bean.getSelectItems("69");
	String selectStr = "";
	selectStr = formBean.getTemplateSelect(cust_id, "3");
	GoodsInfo goodsInfo = new GoodsInfo();
	String goodsSelect = goodsInfo.getGoodsByType(cust_id, "3");
%>
<html>
	<head>
		<title><bean:message key="str2841"/></title>
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
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ParamethodMgr.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ProductDistribution.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GoodsInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/StoreformInInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		
		 document.getElementById('give_date').value=document.getElementById('in_date').value;
		   if(document.getElementById("quo_name").value=="" ||document.getElementById("quo_name").value==null){
		     alert("请填写出库单名称！");
		     return false;
		   }
		   if(document.getElementById("quo_no").value=="" ||document.getElementById("quo_no").value==null){
		     alert("请填写出库单编号！");
		     return false;
		   }
		   if(document.getElementById("quo_num").value=="" || document.getElementById("quo_num").value==null){
		     alert("请填写出库单数量！");
		     return false;
		   }
		   if(document.getElementById("goods_name").value=="" || document.getElementById("goods_name").value==null){
		     alert("请填写或选择物料名称！");
		     return false;
		   }
		   if(document.getElementById("goods_no").value=="" ||document.getElementById("goods_no").value==null){
		     alert("请填写物料编码！");
		     return false;
		   }
		  document.getElementById('maker').value=document.getElementById('obj_cust').value;
		  document.getElementById('quo_num').value='-'+document.getElementById('quo_num').value;
		  return true;
		}
		 Ext.onReady(function(){ 
		 Ext.QuickTips.init();
		});
		
		//生成自定义订单
		function selectForm(val){
		  if(val!="0"){
		   var link_quo_id=document.getElementById("link_quo_id").value;
		   document.getElementById('quo_id').value=val;
		   window.open ("addSaleOrder.jsp?form_id="+val+"&quo_id="+link_quo_id);
		  }
		}
		function selectGoods(val){
		   if(val!="0"){
		  	document.getElementById('goods_id').value=val;
		   	var cust_id = document.getElementById('cust_id').value;
		   	GoodsInfo.getOneGoods(cust_id,val,setData);
		   	StoreformInInfo.getOneStoreformIn(cust_id,val,setStoreData);
		   	ProductDistribution.getHousePos(cust_id,val,setHousePosData);
		  }else{
		  	document.getElementById("quo_name").readOnly=false;    
			document.getElementById("quo_no").readOnly=false;    
			document.getElementById("quo_num").readOnly=false;    
			document.getElementById("meas_unit").readOnly=false;    
			document.getElementById("per_unit_num").readOnly=false;    
			document.getElementById("pack_unit").readOnly=false;    
			document.getElementById("lenght").readOnly=false;    
			document.getElementById("width").readOnly=false;    
			document.getElementById("height").readOnly=false;    
			document.getElementById("volume").readOnly=false;    
			document.getElementById("weight").readOnly=false;    
			document.getElementById("capacity").readOnly=false;    
			document.getElementById("ship_type1").readOnly=false;    
			document.getElementById("ship_date1").readOnly=false;    
			document.getElementById("remark2").readOnly=false;
		  	document.getElementById("goods_name").readOnly=false;                                                  
			document.getElementById("goods_no").readOnly=false;                                                  
			document.getElementById("store_no").readOnly=false;                                                  
			document.getElementById("goods_type1").readOnly=false;                                                  
			document.getElementById("fix_tag1").readOnly=false;                                                  
			document.getElementById("obj_cust").readOnly=false;                                                  
			document.getElementById("src1").readOnly=false;                                                  
			document.getElementById("start_date1").readOnly=false;                                                  
			document.getElementById("end_date1").readOnly=false;                                                  
			document.getElementById("goods_desc").readOnly=false;
			document.getElementById("house_name").readOnly=false;                                                  
			document.getElementById("pos_name").readOnly=false;
		  	document.getElementById("goods_name").value='';                                            
			document.getElementById("goods_no").value='';                                                
			document.getElementById("store_no").value='';
			//物料类型的操作                                            
			document.getElementById("goods_type_aa").style.display='block';
			document.getElementById("goods_type_bb").style.display='none'; 
			document.getElementById("fix_tag_aa").style.display='block';
			document.getElementById("fix_tag_bb").style.display='none';                                                                                             
			document.getElementById("maker").value='';                                                   
			document.getElementById("src_aa").style.display='block';
			document.getElementById("src_bb").style.display='none';   
			document.getElementById("start_date_aa").style.display='block';
			document.getElementById("start_date_bb").style.display='none';  
			document.getElementById("end_date_aa").style.display='block';
			document.getElementById("end_date_bb").style.display='none';                                                                                                
			document.getElementById("goods_desc").value='';                                              
			document.getElementById("quo_name").value='';                                                
			document.getElementById("quo_no").value='';                                                  
			document.getElementById("quo_num").value='';                                                 
			document.getElementById("meas_unit").value='';                                               
			document.getElementById("per_unit_num").value='';                                            
			document.getElementById("pack_unit").value='';                                               
			document.getElementById("lenght").value='';                                                  
			document.getElementById("width").value='';                                                   
			document.getElementById("height").value='';  
			
			document.getElementById("house_name").value='';                                               
			document.getElementById("house_id").value='';                                                  
			document.getElementById("pos_name").value='';                                                   
			document.getElementById("pos_id").value=''; 
			                                               
			document.getElementById("volume").value='';                                                  
			document.getElementById("weight").value='';                                                  
			document.getElementById("capacity").value='';
			document.getElementById("ship_type_aa").style.display='block';
			document.getElementById("ship_type_bb").style.display='none';                                                                                                
			document.getElementById("ship_date_aa").style.display='block';
			document.getElementById("ship_date_bb").style.display='none'; 
			document.getElementById("remark2").value=''; 
		  }
		}
		function setData(Map){
		   	var goods_name=Map['goods_name'];
		    var goods_no=Map['goods_no'];
		    var store_no=Map['store_no'];
		    var goods_type=Map['goods_type'];
		    if(goods_type!=''){
		    	ParamethodMgr.getParamNameByValue('67',goods_type,setGoodsType);
		    }else{
		    	document.getElementById('goods_type_aa').style.display='none';
		    	document.getElementById('goods_type_bb').style.display='block';
		    	document.getElementById("goods_type1").value='';
		    }
		    //固定资产操作
		    var fix_tag=Map['fix_tag'];
		    document.getElementById('fix_tag_aa').style.display='none';
		    document.getElementById('fix_tag_bb').style.display='block';
		    if(fix_tag=='0'){
		    	document.getElementById('fix_tag1').value='否';
		    }else{
		    	document.getElementById('fix_tag1').value='是';
		    }
		    var maker=Map['maker'];
		    var src=Map['src'];
		    if(src!=''){
		    	ParamethodMgr.getParamNameByValue('69',src,setGoodsSrc);
		    }else{
		    	document.getElementById('src_aa').style.display='none';
		    	document.getElementById('src_bb').style.display='block';
		    	document.getElementById("src1").value='';
		    }
		    //开始日期操作
		    var start_date1=Map['start_date'];
		    var date1=start_date1.getYear()+"-"+(start_date1.getMonth()+1);
		    var dateStr=date1+"-"+start_date1.getDate();
		    var start_date=dateStr;    
		    document.getElementById('start_date_aa').style.display='none';
		    document.getElementById('start_date_bb').style.display='block';
		    document.getElementById('start_date1').value=start_date;
		    
		    //结束日期操作
		    var end_date1=Map['end_date'];
		    var date1=end_date1.getYear()+"-"+(end_date1.getMonth()+1);
		    var dateStr=date1+"-"+end_date1.getDate();
		    var end_date=dateStr; 
		    document.getElementById('end_date_aa').style.display='none';
		    document.getElementById('end_date_bb').style.display='block';
		    document.getElementById('end_date1').value=end_date;
		    
		    var goods_desc=Map['goods_desc'];
		    document.getElementById("goods_name").value=goods_name;
		    document.getElementById("goods_no").value=goods_no;
		    document.getElementById("store_no").value=store_no;
		    document.getElementById("fix_tag").value=fix_tag;
		    document.getElementById("maker").value=maker;
		    document.getElementById("src").value=src;
		    document.getElementById("start_date").value=start_date;
		    document.getElementById("end_date").value=end_date;
		    document.getElementById("goods_desc").value=goods_desc;
		    //所有取出的数据设为只读
		    document.getElementById("goods_name").readOnly=true;                                                  
			document.getElementById("goods_no").readOnly=true;                                                  
			document.getElementById("store_no").readOnly=true;                                                  
			document.getElementById("goods_type1").readOnly=true;                                                  
			document.getElementById("fix_tag1").readOnly=true;                                                  
			document.getElementById("obj_cust").readOnly=true;                                                  
			document.getElementById("src1").readOnly=true;                                                  
			document.getElementById("start_date1").readOnly=true;                                                  
			document.getElementById("end_date1").readOnly=true;                                                  
			document.getElementById("goods_desc").readOnly=true;
		}
		function setHousePosData(Map){
			//物料类型的操作
			var house_name=Map['house_name'];
			var house_id=Map['house_id'];
			var pos_name=Map['pos_name'];
			var pos_id=Map['pos_id'];
		    document.getElementById('house_name').readOnly=true;
		    document.getElementById('pos_name').readOnlu=true;
		    if(house_name!=undefined && pos_name!=undefined){
		    	document.getElementById("house_name").value=house_name;
		    	document.getElementById("pos_name").value=pos_name;
		    	document.getElementById("house_id").value=house_id;
		    	document.getElementById("pos_id").value=pos_id;
		    }else{
		    	document.getElementById("house_name").value='';
		    	document.getElementById("pos_name").value='';
		    	document.getElementById("house_id").value='';
		    	document.getElementById("pos_id").value='';
		    }
		}
		function setGoodsType(Map){
			//物料类型的操作
			var goods_type2=Map;
		    document.getElementById('goods_type_aa').style.display='none';
		    document.getElementById('goods_type_bb').style.display='block';
		    document.getElementById("goods_type1").value=goods_type2;
		}
		function setGoodsSrc(Map){
			//物料类型的操作
			var src2=Map;
		    document.getElementById('src_aa').style.display='none';
		    document.getElementById('src_bb').style.display='block';
		    document.getElementById("src1").value=src2;
		}
		function setStoreData(Map){
		   	var quo_name=Map['quo_name'];
		    var quo_no=Map['quo_no'];
		    var quo_num=Map['quo_num'];
		    var meas_unit=Map['meas_unit'];
		    var per_unit_num=Map['per_unit_num'];
		    var pack_unit=Map['pack_unit'];
		    var lenght=Map['lenght'];
		    var width=Map['width'];
		    var height=Map['height'];
		    var volume=Map['volume'];
		    var weight=Map['weight'];
		    var capacity=Map['capacity'];
		    var ship_type=Map['ship_type'];
		    if(ship_type!=''){
		    	ParamethodMgr.getParamNameByValue('63',ship_type,setShipType);
		    }else{
		    	document.getElementById('ship_type_aa').style.display='none';
		    	document.getElementById('ship_type_bb').style.display='block';
		    	document.getElementById("ship_type1").value='';
		    }
		    var ship_date1=Map['ship_date'];
		    var date1=ship_date1.getYear()+"-"+(ship_date1.getMonth()+1);
		    var dateStr=date1+"-"+ship_date1.getDate();
		    var ship_date=dateStr;  
		    document.getElementById('ship_date_aa').style.display='none';
		    document.getElementById('ship_date_bb').style.display='block';
		    document.getElementById('ship_date1').value=ship_date;
		    var remark2=Map['remark2'];
		    document.getElementById("quo_name").value=quo_name;
		    document.getElementById("quo_no").value=quo_no;
		    document.getElementById("quo_num").value=quo_num;
		    document.getElementById("meas_unit").value=meas_unit;
		    document.getElementById("per_unit_num").value=per_unit_num;
		    document.getElementById("pack_unit").value=pack_unit;
		    document.getElementById("lenght").value=lenght;
		    document.getElementById("width").value=width;
		    document.getElementById("height").value=height;
		    document.getElementById("volume").value=volume;
		    document.getElementById("weight").value=weight;
		    document.getElementById("capacity").value=capacity;
		    document.getElementById("ship_type").value=ship_type;
		    document.getElementById("ship_date").value=ship_date;
		    document.getElementById("remark2").value=remark2;
		    //所有取出的数据设为只读
		    document.getElementById("quo_name").readOnly=true;    
			document.getElementById("quo_no").readOnly=true;    
			document.getElementById("quo_num").readOnly=false;    
			document.getElementById("meas_unit").readOnly=true;    
			document.getElementById("per_unit_num").readOnly=true;    
			document.getElementById("pack_unit").readOnly=true;    
			document.getElementById("lenght").readOnly=true;    
			document.getElementById("width").readOnly=true;    
			document.getElementById("height").readOnly=true;    
			document.getElementById("volume").readOnly=true;    
			document.getElementById("weight").readOnly=true;    
			document.getElementById("capacity").readOnly=true;    
			document.getElementById("ship_type1").readOnly=true;    
			document.getElementById("ship_date1").readOnly=true;    
			document.getElementById("remark2").readOnly=true; 
			document.getElementById('quo_num').focus();
		}
		function setShipType(Map){
			//物料类型的操作
			var ship_type2=Map;
		    document.getElementById('ship_type_aa').style.display='none';
		    document.getElementById('ship_type_bb').style.display='block';
		    document.getElementById("ship_type1").value=ship_type2;
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
	<center>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">

			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
					<font color="red"><bean:message key="str2842"/></font>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2843"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="quo_name" id="quo_name" size="25" maxlength="50" >
									</div>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2844"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="quo_no" id="quo_no" size="25" maxlength="50" onkeyup="value=value.replace(/[^a-zA-Z0-9]/g,'')">
									</div>
								</td>
							</tr>

							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2845"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping">
										<input type="text" name="quo_num" id="quo_num" maxlength="50" size="25" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>

							</tr>

							<tr>
								<td colspan="4">
									<table width="100%" cellpadding="0" cellspacing="1">
										<tr>
											<td width="108" style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2846"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping">
													<input type="text" name="goods_name" id="goods_name" maxlength="100" size="25">
													<select name="s_goods" id="s_goods" onchange="selectGoods(this.value)">
														<option value="0">
															<bean:message key="str1048"/>
														</option>
														<%=goodsSelect%>
													</select>
													<font color="red"><bean:message key="str2847"/></font>
												</div>
											</td>

										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2848"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping">
													<input type="text" name="goods_no" id="goods_no" maxlength="100" size="25" onkeyup="value=value.replace(/[^a-zA-Z0-9]/g,'')">
												</div>
											</td>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2849"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="store_no" id="store_no" maxlength="100" size="25" onkeyup="value=value.replace(/[^a-zA-Z0-9]/g,'')">
												</div>
											</td>

										</tr>
										<input value="0" type="hidden" name="in_reason" id="in_reason">
										<input value="2" type="hidden" name="store_type" id="store_type">
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2850"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1" id="goods_type_aa" style="display: block">
													<select name="goods_type" id="goods_type">

														<%=goods_type%>
													</select>
												</div>
												<div id="goods_type_bb" style="display: none;">
													<input type="text" name="goods_type1" id="goods_type1" value="">
												</div>
											</td>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2851"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1" id="fix_tag_aa" style="display: block;">
													<select name="fix_tag" id="fix_tag">
														<option value="0">
															<bean:message key="str2853"/>
														</option>
														<option value="1">
															<bean:message key="str2852"/>
														</option>
													</select>
												</div>
												<div id="fix_tag_bb" style="display: none;">
													<input id="fix_tag1" name="fix_tag1" type="text" value="">
												</div>
											</td>

										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2854"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="obj_cust" id="obj_cust" maxlength="100" size="25">
												</div>
											</td>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2855"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1" id="src_aa" style="display: block;">
													<select name="src" id="src">
														<%=src%>
													</select>
												</div>
												<div id="src_bb" style="display: none;">
													<input id="src1" type="text" value="">
												</div>
											</td>

										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2856"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1" id="start_date_aa" style="display: block;">
													<input name="start_date" type="text" id="start_date" size=10 maxlength=15 value="<%=start_Date%>" onfocus="setday(this);">
												</div>
												<div id="start_date_bb" style="display: none;">
													<input type="text" name="start_date1" id="start_date1" value="">
												</div>
											</td>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2857"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1" id="end_date_aa" style="display: block;">
													<input name="end_date" type="text" id="end_date" size=10 maxlength=15 value="<%=start_Date%>" onfocus="setday(this);">
													<span style="color: red">(yyyy-MM-dd)</span>
												</div>
												<div id="end_date_bb" style="display: none;">
													<input type="text" name="end_date1" id="end_date1" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2858"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input name="house_name" type="text" id="house_name" size=10 maxlength=50 value="">
													<input name="house_id" type="hidden" id="house_id" value="">
												</div>

											</td>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2859"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input name="pos_name" type="text" id="pos_name" size=10 maxlength=50 value="">
													<input name="pos_id" type="hidden" id="pos_id" value="">
												</div>
											</td>
										</tr>
										<tr>
											<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
												<bean:message key="str2860"/>
											</td>
											<td colspan="3" align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="goods_desc" id="goods_desc" maxlength="100" size="50">
												</div>
											</td>
										</tr>
									</table>
								</td>

							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2861"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="meas_unit" type="text" id="meas_unit" size=15 maxlength=15>
									</div>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2862"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="per_unit_num" type="text" id="per_unit_num" size=15 maxlength=15>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2863"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="pack_unit" type="text" id="pack_unit" size=15 maxlength=15>

									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right width="15%">
									<bean:message key="str2864"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<input name="lenght" id="lenght" size="15" maxlength="15" type="text">
									</div>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right width="15%">
									<bean:message key="str2865"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<input name="width" id="width" size="15" maxlength="10" type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2866"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="height" id="height" size="15" maxlength="10" type="text">
									</div>
								</td>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2867"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="volume" id="volume" size="15" maxlength="10" type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2868"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="weight" id="weight" size="15" maxlength=10>
									</div>
								</td>

								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2869"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="capacity" id="capacity" type="text" maxlength=50 size="15">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2870"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1" id="ship_type_aa" style="display: block;">
										<select name="ship_type" id="ship_type">
											<%=ship_type%>
										</select>
									</div>
									<div id="ship_type_bb" style="display: none;">
										<input name="ship_type1" id="ship_type1" value="">
									</div>
								</td>

								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str2871"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1" id="ship_date_aa" style="display: block;">
										<input name="ship_date" type="text" id="ship_date" size=10 maxlength=15 value="<%=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime())%>" onfocus="setday(this);">
										<span style="color: red">(yyyy-MM-dd)</span>
									</div>
									<div id="ship_date_bb" style="display: none;">
										<input name="ship_date1" id="ship_date1" value="">
									</div>
								</td>
							</tr>
							<!-- 
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;"
									align="right">
									选择自定义订单：
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<select name="s_form" id="s_form"
											onchange="selectForm(this.value);">
											<option value="0">
												请选择..<bean:message key="str1048"/>
											</option>
											<%=selectStr%>
										</select>
									</div>
								</td>
								<td>
								</td><td></td>
							</tr>
							 -->
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<input value="0" type="hidden" name="in_reason" id="in_reason">
							<input value="2" type="hidden" name="store_type" id="store_type">
							<input name="trade_type_code" type="hidden" value="2159">
							<input name="form_id" type="hidden" value="<%=form_id%>">
							<input name="quo_id" type="hidden" value="<%=quo_id%>">
							<input name="give_date" type="hidden" value="">
							<input name="link_quo_id" type="hidden" value="<%=link_quo_id%>" id="link_quo_id">
							<input name="in_date" type="hidden" value="<%=in_date%>">
							<input name="goods_id" type="hidden" value="<%=goods_id%>">
							<input name="publish_date" type="hidden" value="<%=in_date%>">
							<input name="maker" type="hidden" value="">
							<input name="cust_id" type="hidden" value="<%=cust_id%>">
							<input name="state_code" type="hidden" value="f">
							<input name="stock_type" type="hidden" value="0">
							<input name="trade" type="hidden" value="赠品等出库管理">
							<input name="trade_id" type="hidden" value="<%=trade_id%>">
							<tr>
								<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px;" align="center" colspan=4>
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand">
								</td>
							</tr>
						</table>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
		</center>
	</body>
</html>

