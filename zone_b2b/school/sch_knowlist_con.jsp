<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%@page import="com.saas.biz.repositoryMgr.RepositoryInfo"%>
<%
	String repository_id="",iStart = "1";
	if (request.getParameter("repository_id") != null) {
		repository_id = request.getParameter("repository_id");
	}
	RepositoryInfo info = new RepositoryInfo();
	ArrayList list = info.SchrepoitoryById(repository_id);
	
	ArrayList list1 = info.getRepositoryByType("4",Integer.parseInt(iStart),8);
	
	EnquirydInfo in = new EnquirydInfo();
	ArrayList list3 = in.getMax();
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
		<script language="javascript">
		  function checkRelation(){
		    if(document.getElementById("keyword").value!=""){
		      return true;
		    }else{
		      alert('请输入关键字，否则会影响你的查询结果！');
		      document.getElementById("keyword").focus();
		    }
		  }
		</script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/school/sch_top.jsp"/>
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
											<span class="btlanse"><bean:message key="str5064"/></span>
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
										String repository_idx="",title="";
										if(map.get("repository_id")!=null){repository_idx=map.get("repository_id").toString();}
										if(map.get("title")!=null){title=map.get("title").toString();}
										if (title.length() > 15) {title = title.substring(0, 15);} 
								%>
									<tr>
										<td width="209" class="rencei_table_xian">
											·
											<A href="sch_knowlist_con.jsp?repository_id=<%=repository_idx%>" class="lanse"><%=title%></A>
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
											<a href="sch_list.jsp" target="_blank" class="lanse"><bean:message key = "str2249"/></a>&nbsp;
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
										String rsrv_str3="",trade_id="";
										if(map.get("rsrv_str3")!=null){rsrv_str3=map.get("rsrv_str3").toString();}
										if (rsrv_str3.length() > 15) {rsrv_str3 = rsrv_str3.substring(0, 15);} 
										if(map.get("trade_id")!=null){trade_id=map.get("trade_id").toString();}
								%>
									<tr>
										<td width="209" class="rencei_table_xian">
											·
											<A href="sch_list_content.jsp?trade_id=<%=trade_id%>" target="_blank" class="lanse"><%=rsrv_str3%></A>
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
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
								<bean:message key="str2239"/>
								<a href="/zone_b2b/" class="lanse"><bean:message key="str2737"/></a> &gt;
								<a href="/zone_b2b/school/" class="lanse"><bean:message key="str2743"/></a> &gt;
								<a href="/zone_b2b/school/sch_knowlist.jsp?repository_type=4" class="lanse"><bean:message key="str5032"/></a> &gt; 
								<bean:message key="str2094"/>
							</td>
						</tr>
					</table>
					<table width="96%" height="10" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="212" valign="top" bgcolor="#FFFFFF">
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
								<%
								if(list != null && list.size() > 0) {
									HashMap map = (HashMap) list.get(0);
									String content="",title="",publish_date="";
									if(map.get("content")!=null){content=map.get("content").toString();}
									if(map.get("title")!=null){title=map.get("title").toString();}
									if(map.get("publish_date")!=null){publish_date=map.get("publish_date").toString();}	
									if (publish_date.length() > 10) {publish_date = publish_date.substring(0, 10);}
								%>
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
											<%=publish_date%>&nbsp;&nbsp; <bean:message key="str5012"/>：
											<A href="javascript:doZoom(16)"> <bean:message key="str5013"/></A>
											<A href="javascript:doZoom(14)"> <bean:message key="str5014"/></A>
											<A href="javascript:doZoom(12)"> <bean:message key="str5015"/></A>
										</td>
									</tr>
								</table>
								<br>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<bean:define id="adver" value="<%=content%>"/>
										<td valign="top" class=wz20 id=zoom>
											<bean:write name="adver" filter="false"/>
											<BR>
										</td>
									</tr>
								<%
									}
								%>
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
										<td height="50px">
											<DIV align=right>
												【
												<A href="javascript:window.close();" class="lanse"><bean:message key="str3428"/></A>】 【
												<A href="javascript: window.print();" class="lanse"><bean:message key="str5018"/></A>】
											</DIV>
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
