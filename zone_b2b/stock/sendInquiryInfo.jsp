<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="stock" class="com.saas.biz.stockorderMgr.StockInfo" scope="page" />
<jsp:useBean id="cust" class="com.saas.biz.custMgr.Custinfo" scope="page" />
<jsp:useBean id="level" class="com.saas.biz.custMgr.CustClass" scope="page" />
<%
  String stock_id="",cust_name="",sale_price="",title="",addr="",content="",commodity_price="",
  publish_date="",end_date="",publish_user_id="";
  if(request.getParameter("stock_id")!=null){
    stock_id=request.getParameter("stock_id");
  }
  HashMap map=stock.getStockInfoById(stock_id);
  HttpSession  logsession = request.getSession(); 
   if(map.get("cust_id")!=null){
    String sale_unit=map.get("cust_id").toString();
    ArrayList list=cust.genSpecCustInfo(sale_unit);
    if(list!=null && list.size()>0){
      HashMap customer=(HashMap)list.get(0);
      if(customer.get("cust_name")!=null){
        cust_name=customer.get("cust_name").toString();
      }
    }
   }
  if(map.get("title")!=null){title=map.get("title").toString();}
  if(map.get("publish_user_id")!=null){publish_user_id=map.get("publish_user_id").toString();}
  if(map.get("sale_price")!=null){sale_price=map.get("sale_price").toString();}
  if(map.get("stock_addr")!=null){addr=map.get("stock_addr").toString();}
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
       //file_path=file_path.substring(23);
	}else{
	file_path="/zone_b2b/images/cp.gif";;
	}
    String sale_unit="",cust_class="";
	if(map.get("sale_unit")!=null){
	     sale_unit=map.get("sale_unit").toString();
	     cust_class=level.cust_Class_Name(sale_unit);
	}
	String enq_Tile="I am interested in ��"+title+"��what you publish��";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<title><bean:message key="str5090"/></title>
	<script type="text/javascript" src="/js/prototype.js"></script>
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
	<script type="text/javascript">
	 function sendStockMsg(){
	   var rsrv_str3=$F("rsrv_str3");
	   rsrv_str3=delAllSpace(rsrv_str3);
	   if(rsrv_str3=="" || rsrv_str3==null){
	    alert("Enter Price title!");
	    $("rsrv_str3").focus();
	    return false;
	   }
	   var content=$F("content");
	   content=delAllSpace(content);
	   if(content=="" || content==null){
	    alert("Enter Price additional information!");
	    $("content").focus();
	     return false;
	   }
	   return true;
	 }
	
	function delAllSpace(str) {
		return str.replace(/^\s+|\s+$/g, "")
	}
	</script>
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
				&nbsp;&nbsp;<bean:message key="str2253"/>
				 <a href="/zone_b2b/">
				<bean:message key="str1147"/></a> <img src="/zone_b2b/images/lujian.gif" border="0"> 
				<a href="/zone_b2b/stock/"><bean:message key="str5091"/></a> 
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
							<bean:message key="str5091"/>
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
									<td width="47%" align="left">
										<table width="100%" border="0" cellspacing="0" cellpadding="5">
											<tr>
												<td align="left">
													<img src="<%=file_path%>" width="130px" height="130px" border="0">
												</td>
											</tr>
										</table>
									</td>
									<td width="53%">
										<table width="100%" border="0" cellspacing="0" cellpadding="2">
											<tr>
												<td width="20%">
													<bean:message key="str1653"/>
												</td>
												<td width="80%">
													<%=cust_name%>
												</td>
											</tr>
											<tr>
												<td width="20%">
													<bean:message key="str5092"/>
												</td>
												<td width="80%">
													<%=title%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="str2225"/>
												</td>
												<td>
													<%=addr%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="str2226"/>
												</td>
												<td>
													<%=publish_date%>
												</td>
											</tr>
											<tr>
												<td>
													<bean:message key="str2227"/>
												</td>
												<td>
													<%=end_date%>
												</td>
											</tr>
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
							<form action="/doTradeReg.do" name="stockEnquiry" id="stockEnquiry" method="post" target="_self">
							<table width="95%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="E1E1E1">
								<tr>
									<td width="19%" bgcolor="F2F2F2">
										<span class="STYLE1"><strong><bean:message key="str5093"/></strong>
										</span>
										<br>
										<br>
									</td>
									<td width="81%" align="right" bgcolor="F2F2F2">
									&nbsp;
									</td>
								</tr>
								<tr>
									<td align="right" bgcolor="F2F2F2">
										<strong><bean:message key="str5094"/>��</strong>
									</td>
									<td bgcolor="#FFFFFF">
										<input type="text" name="rsrv_str3" id="rsrv_str3" maxlength="100" size="35" value=<%=enq_Tile%>><span style="color:red">*</span>
									</td>
								</tr>
								<tr style="display: none">
									<td align="right" bgcolor="F2F2F2">
										<strong><bean:message key="str3380"/></strong>
									</td>
									<td bgcolor="#FFFFFF">
										<input type="text" name="rsrv_str4" id="rsrv_str4" size="5" maxlength="10" onkeyup="if(isNaN(this.value))this.value=''"> 
										<bean:message key="str3381"/>
									</td>
								</tr>
								<tr style="display: none">
									<td align="right" bgcolor="F2F2F2">
										<strong><bean:message key="str3382"/></strong>
									</td>
									<td bgcolor="#FFFFFF">
										<input type="text" name="rsrv_str5" id="rsrv_str5" size="5" maxlength="10" onkeyup="if(isNaN(this.value))this.value=''"> Yuan / pieces (price)
									</td>
								</tr>
								<tr>
									<td align="right" bgcolor="F2F2F2">
										<strong>Additional information��</strong>
									</td>
									<td bgcolor="#FFFFFF">
									<textarea name="content" id="content" cols="45" rows="6"></textarea><span style="color:red">*</span>
									</td>
								</tr>
								<tr>
									<td align="center" bgcolor="F2F2F2" colspan="2">
									   <input type="hidden" name="cust_id" name="cust_id" value="<%=sale_unit%>">
									   <input type="hidden" name="user_id" name="user_id" value="<%=publish_user_id%>">
									   <input type="hidden" name="sale_id" name="sale_id" value="<%=stock_id%>">
									   <input type="hidden" name="deal_tag" name="deal_tag" value="0">
									   <input type="hidden" name="trade_type_code" name="trade_type_code" value="1308">
									   <input type="submit" name="stockenq" id="stockenq" value="Send Price confirmed" onclick=" return sendStockMsg()">
									</td>
								</tr>
							</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				&nbsp;
			</td>
			<td width="228" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
					<tr>
						<td height="120" align="center" valign="top" bgcolor="#FFFFFF">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="240" align="center">
										<table width="94%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td valign="top">
													��
												</td>
												<td valign="top">
													<bean:message key="str2220"/>
												</td>
											</tr>
										</table>
										<table width="82%" border="0" cellpadding="5" cellspacing="0">
											<tr>
												<td>
													<a href="/Newcregister.jsp"><img src="/zone_b2b/images/an_03.gif"  width="119" height="27" border="0">
													</a>
												</td>
											</tr>
										</table>
										<table width="96%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="20" class="xian"></td>
											</tr>
										</table>
										<table width="94%" border="0" cellpadding="2" cellspacing="0">
											<tr>
												<td valign="top">
													��
												</td>
												<td valign="top">
													<bean:message key="str2221"/>
												</td>
											</tr>
											<tr>
												<td valign="top">
													��
												</td>
												<td valign="top">
													<bean:message key="str2222"/>
													<strong>0551-5322449</strong>
												</td>
											</tr>
										</table>
										<table width="82%" border="0" cellpadding="5" cellspacing="0">
											<tr>
												<td>
													&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
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
