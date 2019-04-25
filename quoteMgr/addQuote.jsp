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
	HttpSession  logsession = request.getSession();
	String selectStr="",cust_id="",query_id="";
	if(request.getParameter("query_id")!=null){
    	query_id=request.getParameter("query_id");
    }
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    } 
    
	GoodsInfo goodsInfo = new GoodsInfo();
    String goodsSelect = goodsInfo.getGoodsName(cust_id);
	
	
	Calendar cal = Calendar.getInstance();
	String form_id=comm.GenTradeId();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String currency_code=bean.getSelectItems("62");
	String ship_type=bean.getSelectItems("63");
	String prep_id=comm.GenTradeId();
	
	
    selectStr=formBean.getTemplateSelect(cust_id,"3");
    String menu_id="";
    if(request.getParameter("menu_id")!=null){
    	menu_id=request.getParameter("menu_id");
    }
%>
<html>
	<head>
		<title><bean:message key="str4086"/></title>
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
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript"  src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="customer.js"></script>
		<script type="text/javascript" src="contact.js"></script>
		<script type="text/javascript" src="userGird.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		   if(document.getElementById("prep_name").value=="" ||document.getElementById("prep_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填写报价单名称！");
		     return false;
		   }
		   if(document.getElementById("obj_cust_name").value=="" ||document.getElementById("obj_cust_name").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择报价客户！");
		     return false;
		   }
		   if(document.getElementById("prep_obj_id").value=="" || document.getElementById("prep_obj_id").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请选择报价对象！");
		     return false;
		   }
		   if(document.getElementById("contact_man").value=="" ||document.getElementById("contact_man").value==null){
		     Ext.MessageBox.alert("XSaaS 提示","请填选择联系人！");
		     return false;
		   }
		  return true;
		}
		 Ext.onReady(function(){ 
		 Ext.QuickTips.init();
		});
		
		//生成自定义订单
		function selectForm(val){
		  if(val!="0"){
		   var prep_id=document.getElementById("prep_id").value;
		   window.open ("addSaleOrder.jsp?form_id="+val+"&quo_id="+prep_id);
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
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str790"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="prep_name" id="prep_name" size="25" maxlength="50">
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3187"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									    <input type="text" name="obj_cust_name" id="obj_cust_name" size="15" maxlength="50" readonly><input type="button" name="bnt" id="bnt" value="选择" onclick="showWindow()"><div id="grid3"></div>
										<input type="hidden" name="obj_cust_id" id="obj_cust_id" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3188"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="prep_obj_id" id="prep_obj_id">
											<option value=""><bean:message key="str160"/></option>
											<%=goodsSelect %>
										</select>
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str870"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="contact_man" id="contact_man" maxlength="50" size="15"><input type="button" name="cnt" value="选择" onclick="showContactWind()"><div id="grid4"></div>
										<input type="hidden" name="contact_id" id="contact_id">
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3190"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input type="text" name="give_addr" id="give_addr" maxlength="100" size="50">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3191"/>
								</td>
								<td align=left bgcolor="#FFFFFF"  width="35%">
									<div class="ping1">
										<input name="contact"  id="contact" maxlength="100" size="25">
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right  width="15%">
									<bean:message key="str3192"/>
								</td>
								<td align=left bgcolor="#FFFFFF"  width="35%">
									<div class="ping1">
										<input name="give_date" type="text" id="give_date" size=10 maxlength=15 value="<%=start_Date%>" onfocus="setday(this);">
										<span style="color:red">(yyyy-MM-dd)</span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3193"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="ship_type"  id="ship_type">
										 <%=ship_type%>
										</select>
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3194"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="currency_code"  id="currency_code">
										 <%=currency_code%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3195"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<select name="part_delivery_tag"  id="part_delivery_tag">
										 <option value="1"><bean:message key="str3196"/></option>
										 <option value="0"><bean:message key="str3197"/></option>
										</select>
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3198"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<input name="prep_count" id="prep_count" size="15" type="text"  value="" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3199"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="ship_fee"  id="ship_fee" size="10" maxlength=50 onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3200"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name=tax id="tax" type="text" maxlength=50 size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3201"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="off_rate" id="off_rate" type="text"size="10" onkeyup="if(isNaN(value))execCommand('undo')"><bean:message key="str3448"/>
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str815"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="off_count" id="off_count" type="text" size="10" maxlength=50 onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str825"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="all_fee" id="all_fee" type="text" size="10" maxlength=50 onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;" align="right">
									<bean:message key="str2315"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
                                     <select name="s_form" id="s_form" onchange="selectForm(this.value);">
                                      <option value="0"><bean:message key="str160"/></option>
                                       <%=selectStr%>
                                     </select>									
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2810"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark2" id="remark2" size="50" maxlength="50" >
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="2256">
							<input name="form_id" type="hidden" value="<%=form_id%>">
							<input name="query_id" type="hidden" value="<%=query_id%>">
							<input name="prep_id" type="hidden" value="<%=prep_id%>">
							<input name="in_date" type="hidden" value="<%=start_Date%>">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=4>
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand">
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

