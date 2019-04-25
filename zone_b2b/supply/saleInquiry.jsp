<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="sale" class="com.saas.biz.saleMgr.SupplyInfo" scope="page" />
<jsp:useBean id="cust" class="com.saas.biz.custMgr.Custinfo" scope="page" />
<jsp:useBean id="level" class="com.saas.biz.custMgr.CustClass" scope="page" />
<%
  String sale_id="",cust_name="",sale_price="",title="",addr="",content="",commodity_price="",
  publish_date="",end_date="",login="0",s_id="";
  if(request.getParameter("sale_id")!=null){
    sale_id=request.getParameter("sale_id");
  }
  HashMap map=sale.getSaleInfoById(sale_id);
  HttpSession  logsession = request.getSession(); 
   if(map.get("sale_unit")!=null){
    String sale_unit=map.get("sale_unit").toString();
    ArrayList list=cust.genSpecCustInfo(sale_unit);
    if(list!=null && list.size()>0){
      HashMap customer=(HashMap)list.get(0);
      if(customer.get("cust_name")!=null){
        cust_name=customer.get("cust_name").toString();
      }
    }
   }
   if(logsession.getAttribute("SESSION_USER_ID")==null){
      cust_name="Login visible";
   }else{
      s_id=(String)logsession.getAttribute("SESSION_USER_ID");
      login="1";
   }
  if(map.get("title")!=null){title=map.get("title").toString();}
  if(map.get("sale_price")!=null){sale_price=map.get("sale_price").toString();}
  if(map.get("sale_addr")!=null){addr=map.get("sale_addr").toString();}
  if(map.get("content") !=null){content=map.get("content").toString();}
  if(map.get("commodity_price") !=null){commodity_price=map.get("commodity_price").toString();}
  if(map.get("publish_date")!=null){
      publish_date=map.get("publish_date").toString();
      if(publish_date.length()>10){
        publish_date=publish_date.substring(0,10);
      }
    }
  if(map.get("end_date")!=null){
      end_date=map.get("end_date").toString();
      if(end_date.length()>10){
        end_date=end_date.substring(0,10);
      }
    }
    String file_path="";
     if(map.get("file_path")!=null){
       file_path=map.get("file_path").toString();
 
	}else{
	file_path="/zone_b2b/images/cp.gif";;
	}
    String sale_unit="",cust_class="";
	if(map.get("sale_unit")!=null){
	     sale_unit=map.get("sale_unit").toString();
	     cust_class=level.cust_Class_Name(sale_unit);
	}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<title><%=title%></title>
	<script type="text/javascript" src="/js/prototype.js"></script>
	<script type="text/javascript" src="inquiry.js"></script>
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	#login{
     position: relative;
     display: none;
         top: 20px;
         left: 30px;
         background-color: #ffffff;
         text-align: center;
         border: solid 1px;
         padding: 10px;
         z-index: 1;
   }
	-->
	</style>
	<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <jsp:include flush="true" page="/zone_b2b/top.jsp" />
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="980" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="DCDCDC">
		<tr>
			<td height="29" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
				&nbsp;&nbsp;<bean:message key="str2253"/><img src="/zone_b2b/images/lujian.gif" border="0"> 
				<a href="/zone_b2b/"><bean:message key = "str2737"/></a> <img src="/zone_b2b/images/lujian.gif" border="0">
				 <a href="/zone_b2b/supply/supply_List.jsp?sys_code=1"><bean:message key="str2722"/></a>
			</td>
		</tr>
	</table>
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="740" valign="top">

				<table border=0 cellpadding=0 cellspacing=0 width="100%">
					<tr>
						<td width="134" height="32" align="center" background="/zone_b2b/images/sup_03.gif" class="bthong">
							<bean:message key="str2722"/>
						</td>
						<td align="right" background="/zone_b2b/images/sup_04.gif">
							<img src="/zone_b2b/images/sup_08.gif" align="absmiddle">
							&nbsp;
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="10" cellspacing="1" bgcolor="FFC367">
					<tr>
						<td height="255" valign="top" bgcolor="FFFFFF">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1">
								<tr>
									<td width="47%" align="center">
										<table width="100%" border="0" cellspacing="0" cellpadding="5">
											<tr>
												<td align="center">
													<img src="<%=file_path%>" width="270" height="246" border="0">
												</td>
											</tr>
											<tr>
												<td align="center">
												</td>
											</tr>
										</table>
									</td>
									<td width="53%" valign="top">
										<table width="100%" border="0" cellspacing="0" cellpadding="2">
											<tr>
												<td width="20%">
													<bean:message key = "str5046"/>
												</td>
												<td width="80%">
													<%=cust_name%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key = "str5038"/>
													<span class="zi"> </span>
												</td>
												<td>
													<span class="zi"><%=sale_price%></span>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key = "str5039"/>
												</td>
												<td>
													<bean:message key = "str5040"/>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<table width="86%" border="0" cellpadding="5" cellspacing="1" bgcolor="FFC367">
														<tr>
															<td bgcolor="FFF8EE">
																<div style=" height:30;">
																	<img src="/zone_b2b/images/jingao.gif" width="10" height="13">
																	<%if(s_id!=null && !s_id.equals("")){
																	 out.print("The information released by "+cust_class+" !");
																	}else{%>
																	<bean:message key = "str5041"/> <%=cust_class%> <bean:message key = "str5042"/> 
																	<a href="javascript:openWindow();">
																	<bean:message key = "str2511"/></a>
																	 <bean:message key = "str5043"/>
																	<%}%>
																</div>
																<div>
																<%
																  if(s_id!=null && !s_id.equals("")){
																%>
																	<a href="sendInquiryInfo.jsp?sale_id=<%=sale_id%>" target="_self"><img src="/zone_b2b/images/Mouse.gif" width="118" height="34" border="0"></a>
																<%}else{%>
																 <a href="javascript:openWindow();"><img src="/zone_b2b/images/Mouse.gif" width="118" height="34" border="0"></a>
																<%}%>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key = "str2225"/>
												</td>
												<td>
													<%=addr%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key = "str2226"/>
												</td>
												<td>
													<%=publish_date%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key = "str2227"/>
												</td>
												<td>
													<%=end_date%>
												</td>
											</tr>
											<form action="/doTradeReg.do" name="loginForm" method="post" target="_self">
												<div id="login">
												  <span><bean:message key = "str1975"/></span>
												   <div id="panel">
													   <bean:message key = "str1678"/><input type="text" name="user_name"  id="user_name" size="20" />
													   <br> &nbsp;&nbsp;<bean:message key = "str5010"/><input type="password" name="passwd" id="passwd" size="20">
												  &nbsp;&nbsp; </div>
												   <input type="hidden" name="trade_type_code" id="trade_type_code" value="1304">
												   <input type="submit" value="Login" onclick=" return checkLogin()" />
												   <a href="javascript:close();" style="color:red"><bean:message key ="str1978"/></a>  
												</div>
											</form>
										</table>
										<table width="100%" border="0" cellspacing="1" cellpadding="0">
											<tr>
												<td height="1" class="xian"></td>
											</tr>
											<tr>
												<td height="30">
													
												</td>
											</tr>
											<tr>
												<td height="1" class="xian"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
							<table width="95%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="E1E1E1">
								<tr>
									<td width="19%" bgcolor="F2F2F2">
										<span class="STYLE1"><strong><bean:message key = "str1229"/></strong>
										</span>
										<br>
										<br>
									</td>
									<td width="81%" align="right" bgcolor="F2F2F2">
									<%
									  if(s_id!=null && !s_id.equals("")){
									%>
										<a href="sendInquiryInfo.jsp?sale_id=<%=sale_id%>" target="_self"><img src="/zone_b2b/images/zx.gif" width="75" height="21" border="0">
										</a>&nbsp;
									<%}else{ %>
									<a href="javascript:openWindow();"><img src="/zone_b2b/images/zx.gif" width="75" height="21" border="0">
										</a>&nbsp;
									<%}%>
									</td>
								</tr>
								<tr>
									<td align="right" bgcolor="F2F2F2">
										<strong><bean:message key = "str5044"/></strong>
									</td>
									<td bgcolor="#FFFFFF">
										<%=title%>
									</td>
								</tr>
								<tr>
									<td align="right" bgcolor="F2F2F2">
										<strong><bean:message key = "str2231"/></strong>
									</td>
									<td bgcolor="#FFFFFF">
										<%=content%>
									</td>
								</tr>
								<tr>
									<td align="right" bgcolor="F2F2F2">
										<strong><bean:message key = "str5045"/></strong>
									</td>
									<td bgcolor="#FFFFFF">
										<%=commodity_price%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				&nbsp;
			</td>
			<td width="228" valign="top">
				<jsp:include flush="true" page="sale_right.jsp"/>
			</td>
		</tr>
	</table>
	<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	<script language="javascript">
	function ResizeImages()
	{
	   var myimg,oldwidth;
	   var maxwidth=600;
	   for(i=0;i<document.images.length;i++){
	     myimg = document.images[i];
	     if(myimg.width > maxwidth)
	     {
	        oldwidth = myimg.width;
	        myimg.style.width = maxwidth;
	        myimg.style.height = "auto";
	     }
	   }
	}
	ResizeImages();
  </script> 
</body>
</html>
