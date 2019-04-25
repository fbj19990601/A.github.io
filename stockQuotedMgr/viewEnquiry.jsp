<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="enquiry" class="com.saas.biz.enquirydealMgr.EnquirydInfo" scope="page"/>
<jsp:useBean id="dealBean" class="com.saas.biz.enquirydealMgr.Enquirydealinfo" scope="page"/>
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%
String enquiry_id="";
if(request.getParameter("trade_id")!=null){
   enquiry_id=request.getParameter("trade_id");
}
HashMap map=enquiry.getEnquriyById(enquiry_id);
String deal_tag=map.get("deal_tag").toString();
String title="",user_name="",enquiry_content="",enquiry_date="",sale_id="";
if(map.get("rsrv_str3")!=null){
  title=map.get("rsrv_str3").toString();
}
if(map.get("user_name")!=null){
  user_name=map.get("user_name").toString();
}
if(map.get("enquiry_content")!=null){
  enquiry_content=map.get("enquiry_content").toString();
}
if(map.get("enquiry_date")!=null){
  enquiry_date=map.get("enquiry_date").toString();
}
if(map.get("sale_id")!=null){
	  sale_id=map.get("sale_id").toString();
	}
	///////////////////////////////////////////////////
	String iStart="1",user_id="";
    HttpSession logsession = request.getSession();
    if (logsession.getAttribute("SESSION_USER_ID") != null) {
    	user_id = logsession.getAttribute("SESSION_USER_ID").toString();
	}
	if(request.getParameter("iStart")!=null){
	  iStart=request.getParameter("iStart");
	}
	ArrayList list=dealBean.getEnquriyDealById(Integer.parseInt(iStart),5,sale_id,user_id,"0");
	int counter=dealBean.getEnquriyDealCountById(sale_id,user_id,"0");
	String pageTools=tools.getPageTools(String.valueOf(counter),"5","viewEnquiry.jsp?trade_id="+enquiry_id+"&iStart=",Integer.parseInt(iStart));
%>
<html>
	<head>
		<title>Procurement Price Information </title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
	    <link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<style>
		 .l_td{background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;text-align:right;width: 15%}
		 .r_td{background-color:#ffffff; color:#000000;  font-size:12px;width: 85%}
		</style>
		<script type="text/javascript">
		 function check_Value(){
		   var content=$F("content");
		   content=delAllSpace(content);
		   if(content=="" || content==null){
		    alert("Please enter the  reply content！");
		    $("content").focus();
		     return false;
		   }
		   return true;
		 }
		 //删除所有空格
		 function delAllSpace(str) {
			return str.replace(/^\s+|\s+$/g, "")
		 }
		</script>
	</head>
	<body>
	<form name=resumeForm action=/doTradeReg.do method=post target="_self">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding: 10px">
			<tr>
				<!-- 中间 -->
				<td align="center" height="27px">
					<div id="manager_body">
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
												 <div class="ping"> 
												   My Procurement Price Information 
												 </div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													Title：
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
													<%=title%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													Man：
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=user_name%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													Date：
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
													<%=enquiry_date%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													Content：
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=enquiry_content%>
													</div>
												</td>
											</tr>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
												 Reply content
												</td>
											</tr>
											<% if(list!=null && list.size()>0){
											   for(int i=0;i<list.size();i++){
											     HashMap dealMap=(HashMap)list.get(i);
											     String deal_content="",id="";
											     if(dealMap.get("trade_id")!=null){id=dealMap.get("trade_id").toString();}
											     if(dealMap.get("deal_content")!=null){deal_content=dealMap.get("deal_content").toString();}
											%>
											<tr>
												<td class="l_td" style="display: inline;float: left;">
													delete reply<<%=i+1%>><a href="/doTradeReg.do?trade_type_code=1322&trade_id=<%=id%>" target="_self" onclick="return delete()"><img src=/img/delete.png width=16 height=16 border=0 alt="delete"></a>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=deal_content%>
													</div>
												</td>
											</tr>
											<%}
											}%>
											<tr>
											 <td colspan="2" align="center">
										        <table width=100% border=0 cellpadding=0 cellspacing=0 align=center class="r_td">
											     <%=pageTools%>
											    </table>
											   </td>
											</tr>
											<tr>
											   <td align="center" class="r_td"   colspan="2">
												   <a href="/zone_b2b/stock/sendInquiryInfo.jsp?stock_id=<%=sale_id%>"  target="_blank">continue</a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>
