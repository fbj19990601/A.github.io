
<jsp:directive.page import="com.saas.biz.templateFormMgr.TemplateOject" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="com.saas.biz.formStateMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="saleBean" class="com.saas.biz.saleOrderMgr.SaleOrderInfo" scope="page" />
<jsp:useBean id="tempBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%
	HttpSession logsession = request.getSession();
	String quo_id = "", form_id = "", cust_id = "",
	remark2="",area_id="",area_name="";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
		
	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	if (request.getParameter("quo_id") != null) {
		quo_id = request.getParameter("quo_id");
	}
	if (request.getParameter("area_id") != null) {
		area_id = request.getParameter("area_id");
	}
	ArrayList orderList =saleBean.getFieldByAreaId(cust_id,form_id,area_id,quo_id);
	HashMap orderMap=saleBean.getOrderById(cust_id, form_id,quo_id);
	if(orderMap.get("remark2")!=null){
	  remark2=orderMap.get("remark2").toString();
	}
	HashMap areaMap=tempBean.getTeplateAreaById(cust_id,form_id,area_id);
	if(areaMap.get("area_name")!=null){
	  area_name=areaMap.get("area_name").toString();
	}
	int index=0;
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
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.bnt{background-image: url('/images/zjtm.gif');width:100px;height: 26px;border:0;cursor:hand;margin-left: 5px;display:none;}
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript">
		 function confirmsub(){
		   var count=document.getElementById("index").value;
		   var resultText="";
		   for(var i=0;i<count;i++){
		     var obj="field"+i;
		     var value=document.getElementById(obj).value;
		     var name=document.getElementById(obj).name;
		     resultText=resultText+value+"@"+name+"|";
		   }
		   document.getElementById("field_name").value=resultText;
		   if(resultText.length>0){
		     return true;
		   }else{
		     Ext.Messagebox.alert('XSaaS 提示','数据不完整无法提交，请检查！');
		     return false;
		   }
		 }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="750" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;text-align:center;margin-top:20px" bgcolor="#dddddd" align="center">
				<tr>
					<td height="2" align="right" style="margin-right:15px;font-weight:bold;"><a href="javascritp:window.blur()">_</a> <a href="javascript:window.close();" title="关闭窗口">X</a>&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#FFFFFF">
							<tr height="25px">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:15px;text-align:center;" align="center" width=100%>
									<%=area_name%>
								</td>
							</tr>
							<tr>
								<td align=left bgcolor="#FFFFFF">
									<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#dddddd">
									<%
									if (orderList != null && orderList.size()>0) {
									     for(int i=0;i<orderList.size();i++){	
									        FormFieldEntity fieldEnity=(FormFieldEntity)orderList.get(i);
										    String field_name=fieldEnity.getField_name();
										    String field_type=fieldEnity.getField_type();
										    String field_id=fieldEnity.getField_id();
										    String field_value=fieldEnity.getFiled_value();
										    ArrayList itemList=fieldEnity.getList();
										    String item_id="";
										    ///////////////////////////////////////
										    //elemName:存放quo_id&field_id,item_id|
										    ///////////////////////////////////////
										    String elemName="";
										    String quo_idx="";
										    if(field_type =="0" || field_type.equals("0")){
										       if(itemList !=null && itemList.size()>0){
										        HashMap map=(HashMap)itemList.get(0);
										        if(map.get("field_value")!=null){
										          item_id=map.get("field_value").toString();
										        }
										        if(map.get("quo_id")!=null){
										          quo_idx=map.get("quo_id").toString();
										        }
										        if(map.get("remark2")!=null){
													remark2=map.get("remark2").toString();
												 }
										       }
										       elemName=quo_idx+"&"+field_id+","+item_id+"$"+field_type;;
										       String elemId="field"+index++;
										       String field_values=saleBean.getItemSelectedByFieldId(cust_id,form_id,field_id,item_id,elemName,elemId);
										      %>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align: right" width="20%">
													<div style="text-align:right;margin-right:2px;">
														<%=field_name%>:
													</div>
												</td>
												<td style="background-color:#FFFFFF; color:#000000; font-size:12px;margin-left: 15px" colspan="2" width="80%">
													<div style="margin-left: 2px;">
														<%=field_values%>
													</div>
												</td>
											</tr>
										    <%
										    }else  if(field_type =="1" || field_type.equals("1")){
										      String quo_id1="",field_id1="",item_id1="",item_value1=""; 
										      if(itemList !=null && itemList.size()>0){
										         HashMap map1=(HashMap)itemList.get(0);
										         if(map1.get("quo_id")!=null){
										           quo_id1=map1.get("quo_id").toString();
										         }
										         if(map1.get("field_id")!=null){
										           field_id1=map1.get("field_id").toString();
										         }
										         if(map1.get("item_id")!=null){
										           item_id1=map1.get("item_id").toString();
										         }
										          if(map1.get("item_id")!=null){
										           item_id1=map1.get("item_id").toString();
										         }
										         if(map1.get("field_value")!=null){
										           item_value1=map1.get("field_value").toString();
										         }
										         if(map1.get("remark2")!=null){
													remark2=map1.get("remark2").toString();
												 }
										      }
										      elemName=quo_id1+"&"+field_id1+","+item_id1+"$"+field_type;;
										      String elemId="field"+index++;
										     %>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align: right" width="20%">
													<div style="text-align:right;margin-right:2px;">
														<%=field_name%>:
													</div>
												</td>
												<td style="background-color:#FFFFFF; color:#000000; font-size:12px;margin-left: 15px" colspan="2" width="80%">
													<div style="margin-left: 2px;">
														<input type="text" name=<%=elemName%> id="<%=elemId%>" value=<%=item_value1%> size="30">
													</div>
												</td>
											</tr>
										    <%
										    }else  if(field_type =="2" || field_type.equals("2")){
										     %>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align: right" width="20%">
													<div style="text-align:right;margin-right:2px;">
														<%=field_name%>:
													</div>
												</td>
												<td style="background-color:#FFFFFF; color:#000000; font-size:12px;margin-left: 15px" colspan="" width="80%">
													<table width=100% border=0 cellpadding=1 cellspacing=1 align=center bgcolor="#dddddd">
													<%if(itemList !=null && itemList.size()>0){
													  for(int k=0;k<itemList.size();k++){
													    HashMap itemMap=(HashMap)itemList.get(k);
													   String item_Name="",item_value="";
													   if(itemMap.get("field_value")!=null){
													    item_Name=itemMap.get("field_value").toString();
													   }
													   if(itemMap.get("item_value")!=null){
													    item_value=itemMap.get("item_value").toString();
													   }
													   if(itemMap.get("quo_id")!=null){
													    quo_idx=itemMap.get("quo_id").toString();
													   }
													   if(itemMap.get("field_id")!=null){
													    field_id=itemMap.get("field_id").toString();
													   }
													   if(itemMap.get("item_id")!=null){
													    item_id=itemMap.get("item_id").toString();
													   }
													   if(itemMap.get("remark2")!=null){
													    remark2=itemMap.get("remark2").toString();
													   }
													    elemName=quo_idx+"&"+field_id+","+item_id+"$"+field_type;
													    String elemId="field"+index++;
										            %>
										             <tr>
														<td style="background-color:#FFFFFF; color:#000000; font-size:12px;margin-left: 15px" width="15%">
															<div style="margin-left: 2px;text-align: right;">
																<%=item_Name%>:
															</div>
														</td>
														<td style="background-color:#FFFFFF; color:#000000; font-size:12px;margin-left: 15px" width="65%" align="left">
																<div style="margin-left: 2px;text-align: left;">
																	<textarea name="<%=elemName%>" id="<%=elemId%>" cols="50" rows="3"><%=item_value%></textarea>
																</div>
														</td>
													</tr>
										            <%}
										            }%>
													</table>
												</td>
											</tr>
										    <%
										    }else  if(field_type =="3" || field_type.equals("3")){
										     %>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align: right" width="20%">
													<div style="text-align:right;margin-right:2px;">
														<%=field_name%>:
													</div>
												</td>
												<td style="background-color:#FFFFFF; color:#000000; font-size:12px;margin-left: 15px" colspan="2" width="80%">
													<div style="margin-left: 2px;">
														<%=field_value%>
													</div>
												</td>
											</tr>
										    <%
										    }
										}
										}%>
									</table>
								</td>
							</tr>
							<input type="hidden" name="index" id="index" value="<%=index++%>">
							<input type="hidden" name="form_id" id="form_id" value="<%=form_id%>">
							<input type="hidden" name="quo_id" id="quo_id" value="<%=quo_id%>">
							<input type="hidden" name="field_name" id="field_name" value="">
							<input type="hidden" name="trade_type_code" id="trade_type_code" value="1092">
							<tr height="25px">
								<td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align: right" width="100%">
								<table width=100% border=0 cellpadding=1 cellspacing=0 align=center bgcolor="#dddddd">
									 <tr>
										 <td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align: right" width="20%">
											<bean:message key="str164"/>
										 </td>
										 <td style="background-color:#f6f6f6; color:#000000; font-size:12px;text-align:left" width="80%" colspan="2">
										  <div style="display:inline;"><input type="text" id="remark2" name="remark2"  size="50" value=<%=remark2%>></div>
										 </td>
									 </tr>
									 <tr>
										 <td style="background-color:#f6f6f6; color:#000000; font-size:12px;margin-left: 15px;text-align:center;" width="100%" colspan="3">
										  	<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
										 </td>
									 </tr>
								</table>
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

