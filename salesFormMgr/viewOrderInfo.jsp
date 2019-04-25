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
<jsp:useBean id="orderBean" class="com.saas.biz.salesOrderFormMgr.SalesOrderFormInfo" scope="page" />
<%

	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String cust_id="",quo_id="",menu_idx="";
	HttpSession  logsession = request.getSession(); 
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        menu_idx = request.getParameter("menu_id");
    }
    if (request.getParameter("quo_id") != null)
    {
        quo_id = request.getParameter("quo_id");
    }
    HashMap map=orderBean.getSaleOrderById(cust_id,quo_id);
    String currency_code="",ship_type="",quo_code="",form_id="",
    quo_name="",obj_cust_name="",obj_cust_id="",sale_obj_id="",sale_obj_name="",
    sale_user_id="",sale_user_name="",own_user_name="",own_user_id="",contact_man="",
    order_count="",contact="",give_addr="",delivery_num="",ship_fee="",tax="",remark2="",
    part_delivery_tag="",
    all_fee="",off_count="",off_rate="";
    if(map !=null && map.size()>0){
         if(map.get("currency_code")!=null){
          currency_code=map.get("currency_code").toString();
          currency_code=bean.getParamNameByValue("62",currency_code);
         }
         if(map.get("ship_type")!=null){
          ship_type=map.get("ship_type").toString();
          ship_type=bean.getParamNameByValue("63",ship_type);
         }
         if(map.get("quo_code")!=null){quo_code=map.get("quo_code").toString();}
         if(map.get("form_id")!=null){form_id=map.get("form_id").toString();}
         if(map.get("quo_name")!=null){quo_name=map.get("quo_name").toString();}
         if(map.get("obj_cust_id")!=null){obj_cust_id=map.get("obj_cust_id").toString();}
         if(map.get("rsrv_str3")!=null){obj_cust_name=map.get("rsrv_str3").toString();}
         if(map.get("rsrv_str4")!=null){sale_obj_name=map.get("rsrv_str4").toString();}
         if(map.get("rsrv_str5")!=null){sale_user_name=map.get("rsrv_str5").toString();}
         if(map.get("sale_obj_id")!=null){sale_obj_id=map.get("sale_obj_id").toString();}
         if(map.get("sale_user_id")!=null){sale_user_id=map.get("sale_user_id").toString();}
         if(map.get("own_user_id")!=null){own_user_id=map.get("own_user_id").toString();}
         if(map.get("rsrv_str6")!=null){own_user_name=map.get("rsrv_str6").toString();}
         if(map.get("contact_man")!=null){contact_man=map.get("contact_man").toString();}
         if(map.get("order_count")!=null){order_count=map.get("order_count").toString();}
         if(map.get("contact")!=null){contact=map.get("contact").toString();}
         if(map.get("give_date")!=null){start_Date=map.get("give_date").toString();
           if(start_Date.length()>10){start_Date=start_Date.substring(0,10);}
         }
         if(map.get("give_addr")!=null){give_addr=map.get("give_addr").toString();}
         if(map.get("delivery_num")!=null){delivery_num=map.get("delivery_num").toString();}
         if(map.get("ship_fee")!=null){ship_fee=map.get("ship_fee").toString();}
         if(map.get("tax")!=null){tax=map.get("tax").toString();}
         if(map.get("remark2")!=null){remark2=map.get("remark2").toString();}
         if(map.get("all_fee")!=null){all_fee=map.get("all_fee").toString();}
         if(map.get("off_count")!=null){off_count=map.get("off_count").toString();}
         if(map.get("off_rate")!=null){off_rate=map.get("off_rate").toString();}
         if(map.get("part_delivery_tag")!=null){
          part_delivery_tag=map.get("part_delivery_tag").toString();
          if(part_delivery_tag=="0" || part_delivery_tag.equals("0")){
               part_delivery_tag="��";
          }else{
               part_delivery_tag="��";   
          }
         }
    }
%>
<html>
	<head>
		<title><bean:message key="str3458"/></title>
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
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		   window.open('','_top');
           window.top.close();
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
        </script>
	</head>
	<body>
			<table width="727" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
									<bean:message key="str3434"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="85">
									<div class="ping1">
										<%=quo_name%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3435"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
									    <%=obj_cust_name%>
										<input type="hidden" name="obj_cust_id" id="obj_cust_id" size="25" maxlength="100" value="<%=obj_cust_id%>">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3436"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
									    <%=sale_obj_name%>
										<input type="hidden" name="sale_obj_id" id="sale_obj_id" maxlength="100" size="15"  value="<%=sale_obj_id%>">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3437"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
									    <%=sale_user_name%>
										<input type="hidden" name="sale_user_id" id="sale_user_id" size="25" value="<%=sale_user_id%>" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3438"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
									    <%=own_user_name%>
										<input type="hidden" name="own_user_id" id="own_user_id" size="25" value="<%=own_user_id%>" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3439"/>
								</td>
								<td align=left bgcolor="#FFFFFF" >
									<div class="ping1">
										<%=contact_man%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3440"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=contact%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3441"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=order_count%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3442"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=start_Date%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3443"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=give_addr%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3459"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=part_delivery_tag%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3460"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=delivery_num%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3461"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										 <%=currency_code%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3462"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										 <%=ship_type%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str812"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=ship_fee%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str813"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=tax%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str814"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=off_rate%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str815"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=off_count%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str816"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=all_fee%>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1026"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=remark2%>
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1095">
							<input name="form_id" type="hidden" value="<%=form_id%>">
							<input name="quo_id" type="hidden" value="<%=quo_id%>">
							<input name="quo_code" type="hidden" value="<%=quo_code%>">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
							      &nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
	</body>
</html>

