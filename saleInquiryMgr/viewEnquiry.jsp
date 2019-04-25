<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
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
	String title="",rsrv_str4="",enquiry_content="",enquiry_date="",rsrv_str5="",sale_id="";
	if(map.get("rsrv_str3")!=null){
	  title=map.get("rsrv_str3").toString();
	}
	if(map.get("rsrv_str4")!=null){
	  rsrv_str4=map.get("rsrv_str4").toString();
	}
	if(map.get("rsrv_str5")!=null){
	  rsrv_str5=map.get("rsrv_str5").toString();
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
	ArrayList list=dealBean.getEnquriyDealById(Integer.parseInt(iStart),5,sale_id,user_id,"1");
	int counter=dealBean.getEnquriyDealCountById(sale_id,user_id,"1");
	String pageTools=tools.getPageTools(String.valueOf(counter),"5","viewEnquiry.jsp?trade_id="+enquiry_id+"&iStart=",Integer.parseInt(iStart));
%>
<html>
	<head>
		<title><bean:message key="str393"/></title>
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
		    alert("Please enter reply content");
		    $("content").focus();
		     return false;
		   }
		   return true;
		 }
		 //删除所有空格
		 function delAllSpace(str) {
			return str.replace(/^\s+|\s+$/g, "")
		 }
		 function delete(){
		   if(window.confirm("Are you sure to delete the message？")){
		     return true;
		   }else{
		     return false;
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
												   <bean:message key="str394"/>
												 </div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str395"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
													<%=title%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str396"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=rsrv_str4%> <bean:message key="str397"/>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str398"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=rsrv_str4%> <bean:message key="str399"/>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str400"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
													<%=enquiry_date%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str401"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=enquiry_content%>
													</div>
												</td>
											</tr>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
												 <bean:message key="str402"/>
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
													<bean:message key="str4727"/><<%=i+1%>><a href="/doTradeReg.do?trade_type_code=1322&trade_id=<%=id%>" target="_self" onclick="return delete()"><img src=/img/delete.png width=16 height=16 border=0 alt="删除留言"></a>
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
												   <a href="/zone_b2b/supply/sendInquiryInfo.jsp?sale_id=<%=sale_id%>"  target="_blank"><bean:message key="str4734"/></a>
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
