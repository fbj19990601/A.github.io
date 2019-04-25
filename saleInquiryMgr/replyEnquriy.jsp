<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="enquiry" class="com.saas.biz.enquirydealMgr.EnquirydInfo" scope="page"/>
<%
String enquiry_id="";
if(request.getParameter("trade_id")!=null){
   enquiry_id=request.getParameter("trade_id");
}
HashMap map=enquiry.getEnquriyById(enquiry_id);
String deal_tag=map.get("deal_tag").toString();
String title="",user_name="",enquiry_content="",enquiry_date="";
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
		    alert("Please enter reply content！");
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
										<table width=725 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:left;" align="left" colspan="2">
												 <div class="ping"> 
												   <bean:message key="str404"/>
												 </div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str405"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
													<%=title%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str406"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=user_name%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str3384"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
													<%=enquiry_date%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str3385"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<%=enquiry_content%>
													</div>
												</td>
											</tr>
											<tr>
												<td class="l_td">
													<bean:message key="str3391"/>
												</td>
												<td align="left" class="r_td">
													<div class="ping1">
														<textarea name="content" id="content" cols="45" rows="6"></textarea><span style="color:red">*</span>
													</div>
													<input type="hidden" name="trade_type_code" value="1309">
													<input type="hidden" name="rsrv_str1" value="1">
													<input type="hidden" name="trade_id" value="<%=enquiry_id%>">
													<input type="hidden" name="deal_tag" value="<%=deal_tag%>">
													<input type="hidden" name="enquiry_id" value="<%=enquiry_id%>">
												</td>
											</tr>
											<tr>
												<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
													<input name="submit" type="submit" value="submit" onclick="return check_Value()">
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
