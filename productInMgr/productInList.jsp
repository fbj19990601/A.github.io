<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.productMgr.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%
	
	String form_id="",cust_id="",quo_id="",goods_id="",goods_name="";
	if(request.getParameter("product_id")!=null){
		goods_id=request.getParameter("product_id");
	}
	if(request.getParameter("form_id")!=null){
		form_id=request.getParameter("form_id");
	}
	HttpSession  logsession = request.getSession(); 
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    } 
    //goods_id=comm.GenTradeId();
    Calendar cal = Calendar.getInstance();
    String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String in_date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String ship_type=bean.getSelectItems("63");
	String goods_type=bean.getSelectItems("67");
	String src = bean.getSelectItems("69");
	String selectStr="";
	quo_id=comm.GenTradeId();
    
   // selectStr=formBean.getTemplateSelect(cust_id,"3");
    GoodsInfo goodsInfo = new GoodsInfo();
    String goodsSelect = goodsInfo.getGoodsName(cust_id);
    
    ProductInfo p=new ProductInfo();
    ArrayList tableList = p.getProInfo(cust_id,goods_id);
    if(tableList !=null && tableList.size()>0){
     HashMap map=(HashMap)tableList.get(0);
     if(map.get("product_name")!=null){goods_name=map.get("product_name").toString();}
    }
%>
<html>
	<head>
		<title><bean:message key="str2394"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
		form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.user-Img {
		    background-image:url(/img/customer.png) !important;
		}
		.cust-Img {
		    background-image:url(/img/home.png) !important;
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
		function confirmsub(){
		   if(document.getElementById("quo_name").value=="" ||document.getElementById("quo_name").value==null){
		     alert("请填写入库单名称！");
		     return false;
		   }
		   if(document.getElementById("quo_no").value=="" ||document.getElementById("quo_no").value==null){
		     alert("请填写入库单编号！");
		     return false;
		   }
		    var re = /^[A-Za-z0-9]+$/;   
  			if(re.test(document.getElementById("quo_no").value)){   
 
			}else{   
				 alert("入库单编号格式不正确！"); 
				document.getElementById("quo_no").value='';
				document.getElementById("quo_no").focus();
				return false;
			}  
		   if(document.getElementById("quo_num").value=="" || document.getElementById("quo_num").value==null){
		     alert("请填写入库单数量！");
		     return false;
		   }
		   
		   if(document.getElementById("goods_no").value=="" ||document.getElementById("goods_no").value==null){
		     alert("请填写物料编码！");
		     return false;
		   }
		    if(re.test(document.getElementById("goods_no").value)){   
 
			}else{   
				 alert("物料编码格式不正确！"); 
				document.getElementById("goods_no").value='';
				document.getElementById("goods_no").focus();
				return false;
			}  
			if(document.getElementById("store_no").value=="" ||document.getElementById("store_no").value==null){
		     alert("请填写仓储编码！");
		     return false;
		   }
		   if(re.test(document.getElementById("store_no").value)){   
 
			}else{   
				alert("仓储编码格式不正确！"); 
				document.getElementById("store_no").value='';
				document.getElementById("store_no").focus();
				return false;
			}  
		  document.getElementById('maker').value=document.getElementById('obj_cust').value;
		  return true;
		}
		 Ext.onReady(function(){ 
		 Ext.QuickTips.init();
		});
		
		//生成自定义订单
		function selectForm(val){
		  if(val!="0"){
		   var link_quo_id=document.getElementById("link_quo_id").value;
		   window.open ("addSaleOrder.jsp?form_id="+val+"&quo_id="+link_quo_id);
		  }
		}
		function selectGoods(val){
		   if(val!="0"){
		  	document.getElementById('goods_id').value=val;
		   	var cust_id = document.getElementById('cust_id').value;
		   	GoodsInfo.getOneGoods(cust_id,val,setData);
		  }else{
		  	document.getElementById("goods_name").value='';
		  }
		}
		function setData(Map){
		   	var goods_name=Map['goods_name'];
		    var goods_no=Map['goods_no'];
		    var store_no=Map['store_no'];
		    var goods_type=Map['goods_type'];
		    var fix_tag=Map['fix_tag'];
		    var maker=Map['maker'];
		     var src=Map['src'];
		    var start_date=Map['start_date'];
		    var end_date=Map['end_date'];
		    var goods_desc=Map['goods_desc'];
		    document.getElementById("goods_name").value=goods_name;
		    document.getElementById("goods_name").readOnly=true;
		    document.getElementById("goods_no").value=goods_no;
		    document.getElementById("store_no").value=store_no;
		    document.getElementById("goods_type").value=goods_type;
		    document.getElementById("fix_tag").value=fix_tag;
		    document.getElementById("maker").value=maker;
		    document.getElementById("src").value=src;
		    document.getElementById("start_date").value=start_date;
		    document.getElementById("end_date").value=end_date;
		    document.getElementById("goods_desc").value=goods_desc;
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
	<br>
	<font color="red"><bean:message key="str2395"/></font>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center
							bgcolor="#dddddd">
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2396"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="quo_name" id="quo_name" size="25"
											maxlength="50">
									</div>
								</td>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2397"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="quo_no" id="quo_no" size="25"
											maxlength="50">
									</div>
								</td>
							</tr>

							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2398"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping">
										<input type="text" name="quo_num" id="quo_num" maxlength="50"
											size="25" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
						
							</tr>
							
							<tr>
								<td colspan="4">
									<table width="100%">
										<tr>
											<td width="108"
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str2399"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping">
													<input type="text" name="goods_name" id="goods_name"  maxlength="100" size="25"
													value="<%=goods_name%>">
												</div>
											</td>
											
										</tr>
										<tr>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str2400"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping">
													<input type="text" name="goods_no" id="goods_no"
														maxlength="100" size="25">
												</div>
											</td>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str2401"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping">
													<input type="text" name="store_no" id="store_no"
														maxlength="100" size="25">
												</div>
											</td>
											
										</tr>
													<input value="0" type="hidden" name="in_reason"  id="in_reason">
													<input value="2" type="hidden" name="store_type" id="store_type">
										<tr>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str2402"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<select name="goods_type" id="goods_type">
													<option value=""><bean:message key="str2655"/></option>
														<%=goods_type%>
													</select>
												</div>
											</td>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str2851"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<select name="fix_tag" id="fix_tag">
														<option value="0">
															<bean:message key="str809"/>
														</option>
														<option value="1">
															<bean:message key="str810"/>
														</option>
													</select>
												</div>
											</td>
											
										</tr>
										<tr>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str918"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="obj_cust" id="obj_cust"
														maxlength="100" size="25">
												</div>
											</td>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str919"/>
											</td>
											<td align=left bgcolor="#FFFFFF" colspan="3">
												<div class="ping1">
													<select name="src" id="src">
													<option value=""><bean:message key="str2655"/></option>
														<%=src%>
													</select>
												</div>
											</td>
											
										</tr>
										<tr>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str920"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input name="start_date" type="text" id="start_date"
														size=10 maxlength=15 value="<%=start_Date%>"
														onfocus="setday(this);">
												</div>
											</td>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str921"/>
											</td>
											<td align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input name="end_date" type="text" id="end_date" size=10
														maxlength=15 value="<%=start_Date%>"
														onfocus="setday(this);">
													<span style="color:red">(yyyy-MM-dd)</span>
												</div>
											</td>
										</tr>
										<tr>
											<td
												style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
												align=right>
												<bean:message key="str922"/>
											</td>
											<td colspan="3" align=left bgcolor="#FFFFFF">
												<div class="ping1">
													<input type="text" name="goods_desc" id="goods_desc"
														maxlength="100" size="50">
												</div>
											</td>
										</tr>
									</table>
								</td>

							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str923"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="meas_unit" type="text" id="meas_unit" size=15
											maxlength=15>
									</div>
								</td>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str924"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="per_unit_num" type="text" id="per_unit_num" size=15
											maxlength=15>
									</div>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str925"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="pack_unit" type="text" id="pack_unit" size=15
											maxlength=15>

									</div>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right width="15%">
									<bean:message key="str926"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<input name="lenght" id="lenght" size="15" maxlength="15"
											type="text">
									</div>
								</td>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right width="15%">
									<bean:message key="str927"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<input name="width" id="width" size="15" maxlength="10"
											type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str928"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="height" id="height" size="15" maxlength="10"
											type="text">
									</div>
								</td>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str929"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="volume" id="volume" size="15" maxlength="10"
											type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str930"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="weight" id="weight" size="15" maxlength=10>
									</div>
								</td>

								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str931"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="capacity" id="capacity" type="text" maxlength=50 size="15">
									</div>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str932"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="ship_type" id="ship_type">
										<option value=""><bean:message key="str2655"/></option>
											<%=ship_type %>
										</select>
									</div>
								</td>

								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str933"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="ship_date" type="text" id="ship_date" size=10
														maxlength=15 value="<%=start_Date%>"
														onfocus="setday(this);">
													<span style="color:red">(yyyy-MM-dd)</span>
									</div>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str1026"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<input name="goods_type" type="hidden" value="0" />
							<input value="0" type="hidden" name="in_reason"  id="in_reason">
							<input value="0" type="hidden" name="store_type" id="store_type">
							<input name="trade_type_code" type="hidden" value="1229">
							<input name="form_id" type="hidden" value="<%=form_id%>">
							<input name="quo_id" type="hidden" value="<%=quo_id%>">
							<input name="give_date" type="hidden" value="">
							<input name="link_quo_id" type="hidden" value="<%=goods_id%>">
							<input name="in_date" type="hidden" value="<%=in_date%>">
							<input name="goods_id" type="hidden" value="<%=goods_id%>">
							<input name="publish_date" type="hidden" value="<%=in_date%>">
							<input name="maker" type="hidden" value="">
							<input name="cust_id" type="hidden" value="<%=cust_id%>">
							<input name="state_code" type="hidden" value="c">
							<input name="trade" type="hidden" value="产品入库">
							<input name="stock_type" type="hidden" value="0">
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;"
									align="center" colspan=4>
									<input name="comit" type="submit" value=""
										onclick="return confirmsub()"
										style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

