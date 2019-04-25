<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.newsMgr.NewsInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%@ page import="com.saas.biz.productclassMgr.Productclass"%>
<%
	String news_id = "";
	String sale_id = "";
	String iStart = "1";
	String user_id = "";
	String cust_id = "";
	String news_type = "";
	
	HttpSession logsession = request.getSession();

	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("news_type") != null) {
		news_type = request.getParameter("news_type");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = (String) logsession.getAttribute("SESSION_CUST_ID");
		user_id = (String) logsession.getAttribute("SESSION_USER_ID");
	}
	if (request.getParameter("news_id") != null) {
		sale_id = request.getParameter("news_id");
		news_id = sale_id;
	}
	
	NewsInfo info = new NewsInfo();
	ArrayList List = info.getNewsById(news_id);
	if (List != null && List.size() > 0) {
		HashMap map = (HashMap) List.get(0);
		if (map.get("news_type") != null) {
			news_type = map.get("news_type").toString();
		}
	}
	ArrayList List1 = info.getNewCastById();
	Custinfo in = new Custinfo();
	ArrayList List2 = in.getCustById();
	EnquirydInfo ei = new EnquirydInfo();
	ArrayList List3 = ei.getEnquiryNewByList(Integer.parseInt(iStart),5, sale_id);

	String class_name = "";
	Productclass apple = new Productclass();
	ArrayList list5 = apple.genClassNameByClassId(news_type);
	if (list5 != null && list5.size() > 0) 
	{
		HashMap map = (HashMap) list5.get(0);
		if (map.get("class_name") != null) 
		{
			class_name = map.get("class_name").toString();
		}
	}
	
	ArrayList listing = info.getAboutByType(news_type);
 
%>
<%
		if (List != null && List.size() > 0) {
		HashMap map = (HashMap) List.get(0);
		String title = "", publish_date = "", content = "";
		if (map.get("title") != null) {
			title = map.get("title").toString();
		}
		if (map.get("content") != null) {
			content = map.get("content").toString();
		}
		if (map.get("publish_date") != null) {
			publish_date = map.get("publish_date").toString();
			if (publish_date.length() > 10) {
			publish_date = publish_date.substring(0, 10);
		    }
		}
%>
<html>
	<head>
		<!--文字大小控制-->
		<SCRIPT>
<!--
function doZoom(size){
  document.getElementById('zoom').style.fontSize=size+'px';
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</SCRIPT>
		<SCRIPT language=JavaScript> 
document.oncontextmenu=new Function("event.returnValue=false;"); //禁止右键功能,单击右键将无任何反应 
document.onselectstart=new Function("event.returnValue=false;"); //禁止先择,也就是无法复制 
				</SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><%=title%></title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		  function checkContent(){
		     var content=document.getElementById("content").value;
		     var rsrv_str5=document.getElementById("rsrv_str5").value;
		     if(content==null || content==""){
		        alert("请填写你的评论,本站欢迎发表你的评论！");
		        return false;
		     }else if(content.length>250){
		       alert("评论内容不能太长！可以多次发表你的评论！");
		       return false;
		     }
		    
		    return true;
		  }
		
		</script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="680" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
									<tr>
										<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
											<bean:message key = "str2239"/>
											<a href="/" class="lanse"><bean:message key = "str2737"/></a> &gt;
											<a href="/zone_b2b/news" class="lanse"><bean:message key = "str2028"/></a> &gt;
											<a href="/zone_b2b/news/zixun_list.jsp?news_type=<%=news_type%>" class="lanse"><%=class_name%></a> &gt;
											 <bean:message key = "str2094"/>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="5"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="20" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="923" valign="top" bgcolor="#FFFFFF">
								
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td align="center">
											<H1>
												<%=title%>
											</H1>
										</td>
									</tr>
								</table>
								<TABLE width="95%" border=0 align="center" cellPadding=0 cellSpacing=0 class=xian>
									<TBODY>
										<TR>
											<TD height=10></TD>
										</TR>
									</TBODY>
								</TABLE>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="32" align="center">
											<%=publish_date%>&nbsp;&nbsp; <bean:message key="str5012"/>
											<A href="javascript:doZoom(16)"> <bean:message key="str5013"/></A>
											<A href="javascript:doZoom(14)"> <bean:message key="str5014"/></A>
											<A href="javascript:doZoom(12)"> <bean:message key="str5015"/></A>
										</td>
									</tr>
								</table>
								<br>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr><bean:define id="adver" value="<%=content%>"/>
										<td valign="top" class=wz20 id=zoom>
											[<bean:message key="str5016"/>]&nbsp;
											<%=content%>
											
											<BR>
										</td>
									</tr>
								</table>
								<%
									}
								%>
								<TABLE width="95%" border=0 align="center" cellPadding=0 cellSpacing=0 class=xian>
									<TBODY>
										<TR>
											<TD height=10></TD>
										</TR>
									</TBODY>
								</TABLE>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<DIV align=right>
											  【
												<A onclick=copyToClipBoard() href="javascript:" class="lanse"><bean:message key="str5017"/></A>】
												<SCRIPT type=text/javascript>
												this.URL=window.location.href;
												function copyToClipBoard(){
												var clipBoardContent='';//初始清空
												clipBoardContent+='';//写入Title
												clipBoardContent+='\r\n';
												clipBoardContent+=thisURL;//换行，写入URL
												window.clipboardData.setData('Text',clipBoardContent);//写入ClipBoard
												alert("成功复制标题及链接,现在可以粘贴到QQ/MSN发给好友了!");
												}</SCRIPT>
												【
												<A href="javascript: window.print();" class="lanse"><bean:message key="str5018"/></A>】
											</DIV>
										</td>
									</tr>
								</table>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<%
											if (List3 != null && List3.size() > 0) {
											for (int i = 0; i < List3.size(); i++){
												HashMap map = (HashMap) List3.get(i);
												String rsrv_str5 = "", enquiry_date = "", enquiry_content = "";
												if (map.get("rsrv_str5") != null) {rsrv_str5 = map.get("rsrv_str5").toString();}
												 else {rsrv_str5 = "游客";}
												if (map.get("enquiry_content") != null) {enquiry_content = map.get("enquiry_content").toString();}
												if (map.get("enquiry_date") != null) {
												 enquiry_date = map.get("enquiry_date").toString();
												 if (enquiry_date.length() > 10) {enquiry_date = enquiry_date.substring(0, 10);}
												}
									%>
									<tr>
										<td>
											<span class="leftbt14"><%=rsrv_str5%></span>
											<%=enquiry_date%>
											<BR>
											<span style="padding-left: 10px; font-style: inherit"><%=enquiry_content%></span>
										</td>
									</tr>
									<%
										}
										}
									%>
									<tr>
										<td style="color: red;">
											<bean:message key="str5019"/>:
											<span style="font-weight: bold;"><bean:message key="str5020"/></span>
										</td>
									</tr>
									<tr>
										<td>
											<bean:message key="str5021"/>:
											<INPUT name="rsrv_str5" id="rsrv_str5" size="23" maxLength="50">
										</td>
									</tr>
									<tr>
										<td>
											<TEXTAREA id="content" name="content" rows="6" cols="75"></TEXTAREA>
										</td>
									</tr>
									<tr>
										<td>
											<input type="hidden" name="cust_id" name="cust_id" value="<%=cust_id%>">
											<input type="hidden" name="user_id" name="user_id" value="<%=user_id%>">
											<input type="hidden" name="session_user_id" name="session_user_id" value="<%=user_id%>">
											<input type="hidden" name="sale_id" name="sale_id" value="<%=news_id%>">
											<input type="hidden" name="deal_tag" name="deal_tag" value="4">
											<input type="hidden" name="rsrv_str3" name="rsrv_str3" value="">
											<input type="hidden" name="rsrv_str4" name="rsrv_str4" value="">
											<input type="hidden" id="trade_type_code" name="trade_type_code" value="1308">
										</td>
									</tr>
									<tr>
										<td>
											<label>
												<input type="submit" name="Submit2" value="确认发送评论" onclick=" return checkContent()">
											</label>
										</td>
									</tr>
									<tr>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="time">
											<bean:message key="str5022"/>
											<BR><bean:message key="str5023"/>
											
											<BR><bean:message key="str5024"/>
											
											<BR><bean:message key="str5025"/>
											
											<BR><bean:message key="str5026"/>
										
										</td>
									</tr>
								</table>
								<TABLE width="95%" border=0 align="center" cellPadding=0 cellSpacing=0 class=xian>
									<TBODY>
										<TR>
											<TD height=36></TD>
										</TR>
									</TBODY>
								</TABLE>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="4%">
											<img src="/zone_b2b/images/ba_123.gif" alt="" width="15" height="15" align="absmiddle" />
										</td>
										<td width="88%" class="leftbt14">
											<bean:message key="str5027"/>
										</td>
										<td width="8%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
											<a href="zixun_list.jsp?news_type=<%=news_type%>" class="lansed"><bean:message key="str2074"/></a>
										</td>
									</tr>
								</table>
								<table width="95%" border="0" align="center" cellpadding="5" cellspacing="0">
									<tr>
										<td valign="top">
											<!--//重复-->
											<% 
												if(listing!=null && listing.size()>0){
													for(int i=0;i<listing.size()&& i<6;i++) {
													HashMap map = (HashMap) listing.get(i);
													String title ="" ,news_idx="",publish_date="";
													if(map.get("title")!=null){title=map.get("title").toString();}	
													if(map.get("news_id")!=null){news_idx=map.get("news_id").toString();}
													if(map.get("publish_date")!=null){
													     publish_date=map.get("publish_date").toString();
														if (publish_date.length() > 10) {publish_date = publish_date.substring(0, 10);}
													}				
											%>
											<div style="line-height: 180%">
												·
												<A href="zixun_list_content.jsp?news_id=<%=news_idx%>" class=lanse><%=title%> </A><span class=time><%=publish_date%> </span>
											</div>
											<%
											}
												}
											%>
											<!--重复//-->
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
				<td width="290" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2">
								<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
							</td>
							<td background="/zone_b2b/images/zixun_09.gif">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="5%">
											<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
										</td>
										<td class="btlanse">
											<bean:message key="str5028"/>
										</td>
									</tr>
								</table>
							</td>
							<td width="2">
								<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
						<tr>
							<td height="220" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<%
											if (List1 != null && List1.size() > 0) {
											for (int i = 0; i < List1.size(); i++) {
												HashMap map = (HashMap) List1.get(i);
												String title = "", news_idx = "";
												if (map.get("news_id") != null) {
													news_idx = map.get("news_id").toString();
												}
												if (map.get("title") != null) {
													title = map.get("title").toString();
													if(title.length()>20)title=title.substring(0,20)+"..";
												}
									%>
									<tr>
										<td>
											·
											<a href="zixun_list_content.jsp?news_id=<%=news_idx%>" class="lanse"><%=title%></a>
										</td>
									</tr>
									<%
										}
										}
									%>
								</table>
							</td>
						</tr>
					</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none">
					<tr>
						<td width="2">
							<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
						</td>
						<td background="/zone_b2b/images/zixun_09.gif">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td width="5%">
										<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
									</td>
									<td width="95%" class="btlanse">
										<bean:message key="str5029"/>
									</td>
								</tr>
							</table>
						</td>
						<td width="2">
							<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD" style="display: none">
					<tr>
						<td height="260" valign="top" bgcolor="#FFFFFF">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td width="48%" align="center">
										<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0> </a>
									</td>
									<td>
										&nbsp;
									</td>
									<td width="48%" align="center">
										<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0> </a>
									</td>
								</tr>
								<tr>
									<td align="center">
										<A href="#" target=_blank class="lanse"><bean:message key="str5030"/></A>
									</td>
									<td align="center">
										&nbsp;
									</td>
									<td align="center">
										<A href="#" target=_blank class="lanse"><bean:message key="str5031"/></A>
									</td>
								</tr>
							</table>
							<TABLE class=xian cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
									<TR>
										<TD height=10></TD>
									</TR>
								</TBODY>
							</TABLE>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
									
										<div style="font-size: 12px; line-height: 180%">
											[<bean:message key="str5032"/>]
											<a href="#" target=_blank class="lanse"><bean:message key="str5033"/> </a>
										</div>
										
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="2">
							<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
						</td>
						<td background="/zone_b2b/images/zixun_09.gif">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td width="5%">
										<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
									</td>
									<td width="95%" class="btlanse">
										<bean:message key="str5034"/>
									</td>
								</tr>
							</table>
						</td>
						<td width="2">
							<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
					<tr>
						<td height="160" valign="top" bgcolor="#FFFFFF">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<%
										if (List2 != null && List2.size() > 0) {
										for (int i = 0; i < List2.size(); i++) {
											HashMap map = (HashMap) List2.get(i);
											String cust_name = "", news_cust_id = "", level_name = "";
											if (map.get("cust_id") != null) {
												news_cust_id = map.get("cust_id").toString();
											}
											if (map.get("cust_name") != null) {
												cust_name = map.get("cust_name").toString();
											}if(cust_name.length()>13){cust_name=cust_name.substring(0,13);}
											if (map.get("para_code2") != null) {
												level_name = map.get("para_code2").toString();
											}
								%>
								<!--/重复-->
								<tr>
									<td>
										·
										<a href="/zone_b2b/enterprise/customer/<%=news_cust_id%>/" target=_blank class="lanse"><%=cust_name%></a>
									</td>
									<td>
										<%=level_name%>
									</td>
								</tr>
								<!--重复/-->
								<%
									}
									}
								%>
							</table>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none">
					<tr>
						<td width="2">
							<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
						</td>
						<td background="/zone_b2b/images/zixun_09.gif">
							<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td width="5%">
										<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
									</td>
									<td width="95%" class="btlanse">
										<bean:message key="str5035"/>
									</td>
								</tr>
							</table>
						</td>
						<td width="2">
							<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD" style="display: none">
					<tr>
						<td height="220" valign="top" bgcolor="#FFFFFF">
							<table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
								<!--//重复-->
								<tr>
									<td width="33%" align="center">
										<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0> </a>
									</td>
									<td width="33%" align="center">
										<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0> </a>
									</td>
									<td width="33%" align="center">
										<a href="#"><IMG height=75 src="/zone_b2b/images/cp0.gif" width=76 border=0> </a>
									</td>
								</tr>
								<tr>
									<td align="center">
										<A href="#" target="_blank" class="lanse"><bean:message key="str5036"/></A>
									</td>
									<td align="center">
										<A href="#" target="_blank" class="lanse"><bean:message key="str5036"/></A>
									</td>
									<td align="center">
										<A href="#" target="_blank" class="lanse"><bean:message key="str5037"/></A>
									</td>
								</tr>
								<!--重复//-->
							</table>
						</td>
					</tr>
				</table>
				<td>
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
		</form>
	</body>
</html>