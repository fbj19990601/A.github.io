<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%@page import="com.saas.biz.repositoryMgr.RepositoryInfo"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String trade_id = comm.GenTradeId();
	String session_cust_id = "", cust_id = "", session_user_id = "", user_id = "";
	HttpSession logs = request.getSession();
	if (logs.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logs.getAttribute("SESSION_CUST_ID").toString();
	}
	String user_name="";
	if (logs.getAttribute("SESSION_USER_NAME") != null) {
		user_name = logs.getAttribute("SESSION_USER_NAME").toString();
	}
	if (cust_id != null) {
		session_cust_id = cust_id;
	} else
		session_cust_id = "123456789";

	if (logs.getAttribute("SESSION_USER_ID") != null) {
		user_id = logs.getAttribute("SESSION_USER_ID").toString();
	}
	if (user_id != null) {
		session_user_id = user_id;
	} else
		session_user_id = "987654321";
	String iStart = "0";
	EnquirydInfo info = new EnquirydInfo();
	ArrayList list = info.getEnquiryByList(Integer.parseInt(iStart),10); 
	ArrayList list3 = info.getMax();
	
	RepositoryInfo re = new RepositoryInfo();
	ArrayList list1 = re.getRepositoryByType("4",Integer.parseInt(iStart),8);
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
		<title><bean:message key="str3604"/></title>
		<script type="text/javascript">
		if (document.reqForm.rsrv_str3.value == ""||document.reqForm.rsrv_str3.value == null)
		{
			alert("标题不可以为空！");
			document.reqForm.rsrv_str3.focus(); 
			return false;
		}
		if (document.reqForm.enquiry_content.value == ""||document.reqForm.enquiry_content.value == null)
		{
			alert("内容不可以为空！");
			document.reqForm.enquiry_content.focus(); 
			return false;
		}
		if (document.reqForm.rsrv_str5.value == ""||document.reqForm.rsrv_str5.value == null)
		{
			alert("提问人不可以为空！");
			document.reqForm.rsrv_str5.focus(); 
			return false;
		}
		 function checkRelation(){
		    if(document.getElementById("keyword").value!=""){
		      return true;
		    }else{
		      alert('请输入关键字，否则会影响你的查询结果！');
		      document.getElementById("keyword").focus();
		    }
		  }
		</script>
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
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/school/sch_top.jsp"/>
		<table width="980" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
			<tr>
				<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
					<bean:message key="str2239"/>
					<a href="/" class="lanse"><bean:message key="str1030"/></a> &gt;
					<a href="/zone_b2b/school" class="lanse"><bean:message key="str2030"/></a> &gt; 
					<bean:message key="str5080"/>
				</td>
			</tr>
		</table>
		<table width="980" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="235" valign="top">
					<table width="220" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="166" valign="top" bgcolor="F5FAFC">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xueyuan_11.gif" width="21" height="30" alt="">
										</td>
										<td width="80" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key = "str5064"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xueyuan_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xueyuan_15.gif">
											<a href="#" class="lanse"></a>&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0">
									<tr>
										<td>
											<form name="searchForm" id="searchForm" action="search_list.jsp" method="post">
												<input name="keyword" type="text" class="0" value="请输入你要查的关键字" size="22" onblur="chek()" onmousedown="javascript:this.value=''">
												<input type="submit" name="Submit2" value="搜 索" onclick="return checkRelation()">
											</form>
										</td>
									</tr>
									<tr>
										<td class="lanse_renceitop">
											<bean:message key="str5065"/>
											<br>
											<bean:message key="str5066"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="220" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="222" valign="top" bgcolor="F5FAFC">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xueyuan_11.gif" width="21" height="30" alt="">
										</td>
										<td width="80" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5032"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xueyuan_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xueyuan_15.gif">
											<a href="sch_knowlist.jsp?repository_type=4" class="lanse"><bean:message key="str2249"/></a>&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="209" border="0" align="center" cellpadding="0" cellspacing="0">
								<%
								if(list1 != null && list1.size() > 0) 
								{
									for(int i=0;i<list1.size();i++) 
									{
										HashMap map = (HashMap) list1.get(i);
										String repository_id="",title="";
										if(map.get("repository_id")!=null){repository_id=map.get("repository_id").toString();}
										if(map.get("title")!=null){title=map.get("title").toString();}
										if (title.length() > 15) {title = title.substring(0, 15);} 
								%>
									<tr>
										<td width="209" class="rencei_table_xian">
											·
											<A href="sch_knowlist_con.jsp?repository_id=<%=repository_id%>" target="_blank" class="lanse"><%=title%></A>
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
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="220" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="220" valign="top" bgcolor="F5FAFC">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xueyuan_11.gif" width="21" height="30" alt="">
										</td>
										<td width="80" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5067"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xueyuan_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xueyuan_15.gif">
											<a href="sch_list.jsp" target="_blank" class="lanse"><bean:message key="str2249"/>
											</a>&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="209" border="0" align="center" cellpadding="0" cellspacing="0">
								<%
								if(list3 != null && list3.size() > 0) 
								{
									for(int i=0;i<list3.size();i++) 
									{
										HashMap map = (HashMap) list3.get(i);
										String rsrv_str3="",trade_ids="";
										if(map.get("rsrv_str3")!=null){rsrv_str3=map.get("rsrv_str3").toString();}
										if (rsrv_str3.length() > 15) {rsrv_str3 = rsrv_str3.substring(0, 15);} 
										if(map.get("trade_id")!=null){trade_ids=map.get("trade_id").toString();}
								%>
									<tr>
										<td width="209" class="rencei_table_xian">
											·
											<A href="sch_list_content.jsp?trade_id=<%=trade_ids%>" target="_blank" class="lanse"><%=rsrv_str3%></A>
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
				</td>
				<td valign="top">
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="212" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xy_11.gif" width="21" height="30" alt="">
										</td>
										<td width="120" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5081"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xy_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xy_15.gif">
											&nbsp;
										</td>
									</tr>
								</table>
								<table width="96%" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<form name=reqForm action=/doTradeReg.do method=post target="_self">
									<table width="96%" border="0" align="center" cellpadding="2" cellspacing="0">
										<tr>
											<td width="20%" align="right" valign="top">
												<bean:message key="str5082"/>
											</td>
											<td width="80%" valign="top">
												<input name="rsrv_str3" id="rsrv_str3" type="text" class="0" size="20" maxlength="30">
											</td>
										</tr>
										<tr>
											<td width="20%" align="right" valign="top">
												<bean:message key="str2670"/>
											</td>
											<td width="80%" valign="top">
												<textarea name="content" id="content" cols="60" rows="8"></textarea>
											</td>
										</tr>
										<tr>
											<td align="right" valign="top">
												<bean:message key="str4687"/>：
											</td>
											<td valign="top">
												<input name="rsrv_str5" id="rsrv_str5" type="text" value="<%=user_name%>" class="0" size="20" maxlength="15">
												<span class="time"><bean:message key="str5073"/> </span>
											</td>
										</tr>
										<tr>
											<td align="right" valign="top">
												&nbsp;
												<input type="hidden" name="trade_type_code" id="trade_type_code" value="1308">
												<input type="hidden" name="trade_id" id="trade_id" value="<%=trade_id%>">
												<input type="hidden" name="cust_id" id="cust_id" value="<%=session_cust_id%>">
												<input type="hidden" name="user_id" id="user_id" value="<%=session_user_id%>">
												<input type="hidden" name="session_cust_id" id="session_cust_id" value="<%=session_cust_id%>">
												<input type="hidden" name="session_user_id" id="session_user_id" value="<%=session_user_id%>">
												<input type="hidden" name="deal_tag" id="deal_tag" value="3">
												<input type="hidden" name="sale_id" id="sale_id" value="sb250">
												<input type="hidden" name="rsrv_str1" id="rsrv_str1" value="0">
												<input type="hidden" name="rsrv_str4" id="rsrv_str4" value="0">
											</td>
											<td valign="top">
												<input type="submit" name="Submit3" value="提交问题" onclick="return check_Value()">
											</td>
										</tr>
									</table>
								</form>							
							</td>
						</tr>
					</table>
					<table width="96%" height="8" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="212" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xy_11.gif" width="21" height="30" alt="">
										</td>
										<td width="110" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5074"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xy_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xy_15.gif">
											&nbsp;
										</td>
									</tr>
								</table>
								<table width="96%" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="5" cellspacing="0">
									<tr>
										<td valign="top">
										<%
											if(list != null && list.size() > 0) {
												for(int i=0;i<list.size();i++) {
												HashMap map = (HashMap) list.get(i);
												String req_title="",trade_idx="",enquiry_date="";
												if(map.get("rsrv_str3")!=null){req_title=map.get("rsrv_str3").toString();}
												if(map.get("trade_id")!=null){trade_idx=map.get("trade_id").toString();}
												if(map.get("enquiry_date")!=null){enquiry_date=map.get("enquiry_date").toString();}	
												if (enquiry_date.length() > 10) {enquiry_date = enquiry_date.substring(0, 10);} 
										%>
											<div style="line-height: 200%">
												·
												<A href="sch_list_content.jsp?trade_id=<%=trade_idx%>" target=_blank class=lansed><%=req_title%> </A><span class=time><%=enquiry_date%> </span>
											</div>
										<%
											}
										 }
									    %>
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
	</body>
</html>
