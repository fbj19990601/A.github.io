<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%

	Calendar cal = Calendar.getInstance();
	String defaultIdx=comm.GenTradeId();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String currency_code=bean.getSelectItems("62");
	String ship_type=bean.getSelectItems("63");
	String quo_code=comm.GenTradeId();
	String quo_id=comm.GenTradeId();
	String selectStr="",cust_id="";
	HttpSession  logsession = request.getSession(); 
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    } 
    selectStr=formBean.getTemplateSelect(cust_id,"2");
%>
<html>
	<head>
		<title><bean:message key="str4085"/>(http://soft.xsaas.com)</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
		form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*������ʽ6---- ͷ������1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*������ʽ1*/
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
		   if(document.getElementById("quo_name").value=="" ||document.getElementById("quo_name").value==null){
		     alert("����д���۵����ƣ�");
		     return false;
		   }
		   if(document.getElementById("obj_cust_name").value=="" ||document.getElementById("obj_cust_name").value==null){
		     alert("����ѡ�����ۿͻ����ƣ�");
		     return false;
		   }
		   if(document.getElementById("sale_obj_name").value=="" || document.getElementById("sale_obj_name").value==null){
		     alert("������Ʒ���Ʋ���Ϊ�գ�");
		     return false;
		   }
		   if(document.getElementById("sale_user_name").value=="" || document.getElementById("sale_user_name").value==null){
		     alert("����ѡ��������Ա��");
		     return false;
		   }
		   if(document.getElementById("contact_man").value=="" ||document.getElementById("contact_man").value==null){
		     alert("����ѡ����ϵ�ˣ�");
		     return false;
		   }
		   if(document.getElementById("contact").value=="" ||document.getElementById("contact").value==null){
		     alert("����д��ϵ��ʽ��");
		     return false;
		   }
		  return true;
		}
		 Ext.onReady(function(){ 
		 Ext.QuickTips.init();
		});
		
		//ѡ��ͻ��б�
		function selectCustomer(){
		  window.open ("customerList.jsp");
		}
		
		//ѡ����ϵ���б�
		function selectContact(){
		 window.open ("contactList.jsp");
		}
		
		//ѡ��������Ա�б�
		function selectSales(){
		 window.open ("userList.jsp");
		}
		//�����Զ��嶩��
		function selectForm(val){
		  if(val!="0"){
		   var quo_id=document.getElementById("quo_id").value;
		   window.open ("addSaleOrder.jsp?form_id="+val+"&quo_id="+quo_id);
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
									<bean:message key="str3434"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="quo_name" id="quo_name" size="25" maxlength="100">
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3435"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									    <input type="text" name="obj_cust_name" id="obj_cust_name" size="15" maxlength="100" readonly><input type="button" name="bnt" id="bnt" value="ѡ��" onclick="showWindow()"><div id="grid3"></div>
										<input type="hidden" name="obj_cust_id" id="obj_cust_id" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3436"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									    <input type="text" name="sale_obj_name" id="sale_obj_name" maxlength="100" size="15">
										<input type="hidden" name="sale_obj_id" id="sale_obj_id" maxlength="100" size="15">
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3437"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
									    <input type="text" name="sale_user_name" id="sale_user_name" size="15" maxlength="100" readonly><input type="button" name="ubnt" value="ѡ��" onclick="showUserWind()"><div id="grid5"></div>
										<input type="hidden" name="sale_user_id" id="sale_user_id" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3438"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
									    <input type="text" name="own_user_name" id="own_user_name" size="15" maxlength="100">
										<input type="hidden" name="own_user_id" id="own_user_id" size="25" maxlength="100">
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3439"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="contact_man" id="contact_man" maxlength="100" size="15"><input type="button" name="cnt" value="ѡ��" onclick="showContactWind()"><div id="grid4"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3440"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping">
										<input type="text" name="contact" id="contact" maxlength="100" size="25">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3441"/>
								</td>
								<td align=left bgcolor="#FFFFFF"  width="35%">
									<div class="ping1">
										<input name="order_count"  id="order_count">
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right  width="15%">
									<bean:message key="str3442"/>
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
									<bean:message key="str3443"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="give_addr" type="text" id="give_addr" size=25 maxlength=100>
										
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3459"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<select name="part_delivery_tag"  id="part_delivery_tag">
										 <option value="0"><bean:message key="str3197"/></option>
										 <option value="1"><bean:message key="str2853"/></option>
										</select>
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3444"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="35%">
									<div class="ping1">
										<input name="delivery_num" id="delivery_num" size="15" type="text" value="0" onkeyup="if(isNaN(value))execCommand('undo')"><bean:message key="str2343"/>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2362"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="currency_code"  id="currency_code">
										 <%=currency_code%>
										</select>
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2363"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="ship_type"  id="ship_type">
										 <%=ship_type%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2364"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="ship_fee"  id="ship_fee" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2365"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name=tax id="tax" type="text" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str2366"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="off_rate" id="off_rate" type="text"size="5" onkeyup="if(isNaN(value))execCommand('undo')"><bean:message key="str3448"/>
									</div>
								</td>
							
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str815"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="off_count" id="off_count" type="text" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str816"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="all_fee" id="all_fee" type="text" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;" align="right">
									<bean:message key="str817"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
                                     <select name="s_form" id="s_form" onchange="selectForm(this.value);">
                                      <option value="0"><bean:message key="str1048"/></option>
                                       <%=selectStr%>
                                     </select>									
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1281"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50" >
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1093">
							<input name="form_id" type="hidden" value="<%=defaultIdx%>">
							<input name="quo_id" type="hidden" value="<%=quo_id%>">
							<input name="quo_code" type="hidden" value="<%=quo_code%>">
							<input name="state_code" type="hidden" value="0">
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

