
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
<%
	HttpSession logsession = request.getSession();
	String quo_id = "", form_id = "", cust_id = "", quo_name = "",
	remark2="";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
		
	if (request.getParameter("form_id") != null) {
		form_id = request.getParameter("form_id");
	}
	if (request.getParameter("quo_id") != null) {
		quo_id = request.getParameter("quo_id");
	}
	ArrayList orderList =saleBean.getOrderInfoById(cust_id, form_id,quo_id);
	HashMap orderMap=saleBean.getOrderById(cust_id, form_id,quo_id);
	if(orderMap.get("quo_name")!=null){
	  quo_name=orderMap.get("quo_name").toString();
	}
	if(orderMap.get("remark2")!=null){
	  remark2=orderMap.get("remark2").toString();
	}
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
		 function closeWind(){
		    window.open('','_top');
            window.top.close();
		 }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="750" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;text-align:center;margin-top:20px" bgcolor="#dddddd" align="center">
				<tr>
					<td height="2" align="right" style="margin-right:15px;font-weight:bold;"><a href="javascript:closeWind();" title="关闭窗口">X</a>&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#FFFFFF">
							<tr height="25px">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:15px;text-align:center;" align="center" width=100%>
									<%=quo_name%>
								</td>
							</tr>
							<tr>
								<td align=left bgcolor="#FFFFFF">
									<%
									if (orderList != null && orderList.size()>0) {
									 for(int i=0;i<orderList.size();i++){	
									  FormAreaEnity	areaEnity=(FormAreaEnity)orderList.get(i);
									  String area_nam=areaEnity.getArea_name();
									  ArrayList fieldList=areaEnity.getField();
									  String area_id=areaEnity.getArea_id();
									%>
									<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
											<td bgcolor="#FFFFFF" style="margin-left:5px;font-weight:bold;" colspan="2">
												<div class="ping1">
													<%=area_nam%>
												</div>
											</td>
											<td bgcolor="#FFFFFF" style="margin-right:5px;font-weight:bold;" align="center" width="15%">
												<div style="display:inline;"><a href="updateOrderItem.jsp?form_id=<%=form_id%>&quo_id=<%=quo_id%>&area_id=<%=area_id%>" target="_self">修改<bean:message key="str156"/><%=area_nam%></a></div>
											</td>
										</tr>
										<%if(fieldList !=null && fieldList.size()>0){
										   for(int j=0;j<fieldList.size();j++){
										    FormFieldEntity fieldEnity=(FormFieldEntity)fieldList.get(j);
										    String field_name="",field_type="",
										       field_id="",    field_value="";
									        field_name=fieldEnity.getField_name();
									        field_id=fieldEnity.getField_id();
									        field_type=fieldEnity.getField_type();
									        field_value=fieldEnity.getFiled_value();
									        if(field_type=="1" || field_type.equals("1")){
									         ArrayList itemList=fieldEnity.getList();
									         if(itemList !=null && itemList.size()>0){
									           for(int k=0;k<itemList.size();k++){
									             HashMap map=(HashMap)itemList.get(k);
									             if(map.get("field_value")!=null){field_value=map.get("field_value").toString();}
									           }
									         }
									        }else if(field_type=="2" || field_type.equals("2")){
									         ArrayList itemList=fieldEnity.getList();
									         if(itemList !=null && itemList.size()>0){
									           field_value="";
									           String idx="";
									           for(int k=0;k<itemList.size();k++){
									             HashMap map=(HashMap)itemList.get(k);
									             String tempValue="";
									             if(map.get("field_value")!=null){tempValue=map.get("field_value").toString();}
									             if(map.get("quo_id")!=null){idx=map.get("quo_id").toString();}
									             field_value=field_value+"<div style=color:red;margin-left:5px;display:inline;><"+(k+1)+"></div>"+tempValue+"<br>";
									           }
									           field_value=field_value+"『<a href=addOrderItme.jsp?form_id="+form_id+"&quo_id="+idx+"&field_id="+field_id+"  target=_blnak>增加条目</a>』";
									         }else{
									           field_value="";
									         }
									        }else if(field_type=="0" || field_type.equals("0")){
									         
									         ArrayList itemList=fieldEnity.getList();
									         if(itemList !=null && itemList.size()>0){
									             HashMap map=(HashMap)itemList.get(0);
									             if(map.get("item_name")!=null){field_value=map.get("item_name").toString();}
									         }
									        }
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
										<%}
										}%>
									</table>
									<%
										}
									}
									%>
								</td>
							</tr>
							<tr height="25px">
								<td style="background-color:#f6f6f6; color:#000000;text-align:left;" width=100%>
									<bean:message key="str164"/><div style="margin-left: 10px;display:inline;"><%=remark2%></div>
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

