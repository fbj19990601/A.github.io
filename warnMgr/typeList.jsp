<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.warntypeMgr.WarnTypeInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String meun_idx = "",iStart ="0";
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
	}
	if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	HashMap paraMap=bean.getCompareInfoByCode("CRM","mod_type");
	HashMap warn_Map=bean.getCompareInfoByCode("CRM","warn_circle");
	ArrayList list = comm.getWarnTypeByCust(Integer.parseInt(iStart),cust_id);
	int counter=comm.getWarnTypeByCustSize(cust_id);
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
%>
<html>
	<head>
		<title><bean:message key="str4191"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		#tr{
		 background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;
		}
		#tr1{
		 background-color:#f6f6f6; color:#000000; font-size:12px;
		}
		#tr2{
		 background-color:#ffffff; color:#000000; font-size:12px;
		}
		</style>
		<script type="text/javascript">
		  function deleteDefine(){
			 if(window.confirm("确定要删除所选择记录？")){
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
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<jsp:include page="/inc/top.jsp" />
				<tr>
					<td align="center">
						<div id="manager_body">
							<div id="manager_body_left">
								<jsp:include page="/inc/left.jsp" />
							</div>
							<div id="manager_body_right">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="2"></td>
												</tr>
												<tr>
													<td valign="top">
														<table width=100% border=0 cellpadding=1 cellspacing=1 align=center bgcolor="#dddddd">
															<tr id="tr">
																<td  align="center" width="25%"><bean:message key="str4192"/></td>
																<td  align="center" width="15%"><bean:message key="str4193"/></td>
																<td  align="center" width="15%"><bean:message key="str4194"/></td>
																<td  align="center" width="10%"><bean:message key="str4195"/></td>
																<td  align="center" width="15%"><bean:message key="str4196"/></td>
																<td  align="center" width="10%"><bean:message key="str2677"/></td>
															</tr>
															<%
															 if(list !=null && list.size()>0){
															  for(int i=0;i<list.size();i++){
															   HashMap map=(HashMap)list.get(i);
															   String mod_id=map.get("mod_id").toString();
															   String mod_name=map.get("mod_name").toString();
															   String mod_type="",warn_type="",exec_date="",warn_circle="",w_type="";
															   if(map.get("mod_type")!=null){
															    mod_type=map.get("mod_type").toString();
															    w_type=mod_type;
															    if(paraMap.get(mod_type)!=null){
															       mod_type=paraMap.get(mod_type).toString();
															    }
															   }
															   if(map.get("warn_circle")!=null){
															    warn_circle=map.get("warn_circle").toString();
															    if(warn_Map.get(warn_circle)!=null){
															      warn_circle=warn_Map.get(warn_circle).toString();
															    }
															   }
															   if(map.get("warn_type")!=null){
															   warn_type=map.get("warn_type").toString();
															   if(warn_type=="0" || warn_type.equals("0")){warn_type="E-mail";}
															    else if(warn_type=="1" || warn_type.equals("1")){warn_type="底部通知";}
															    else if(warn_type=="2" || warn_type.equals("2")){warn_type="手工查询";}
															   }
															   if(map.get("exec_date")!=null){
															    exec_date=map.get("exec_date").toString();
															    if(exec_date.length()>10){
															      exec_date=exec_date.substring(0,10);
															    }
															   }
															   if(i%2==0){
															    %><tr id="tr2"><%
															   }else{
															    %><tr id="tr1"><%
															   }
															%>
																<td  align="left" width="25%"><a href="viewWarnType.jsp?mod_id=<%=mod_id%>" TARGET=appwin onclick="mydefss()"><%=mod_name%></a></td>
																<td  align="left" width="15%"><%=mod_type%></td>
																<td  align="left" width="15%"><%=warn_type%></td>
																<td  align="left" width="10%"><%=warn_circle%></td>
																<td  align="left" width="15%"><%=exec_date%></td>
																<td  align="center" width="10%"><a href="/doTradeReg.do?trade_type_code=1174&mod_id=<%=mod_id%>" target="_self" onclick="return deleteDefine()"><img src=/img/del.gif width=16 height=16 border=0 alt="删除"></a></td>
																</tr>
															<%}
															}%>
															<tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;">
																		<bean:message key="str1143"/><%=counter%>
																		<bean:message key="str1144"/> &nbsp;
																		<bean:message key="str1145"/><%=Integer.parseInt(iStart)+1 %>
																		<bean:message key="str1146"/>&nbsp;&nbsp;
																		<bean:message key="str1143"/><%=pages%>
																		<bean:message key="str1146"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="typeList.jsp?iStart=0">
																		<bean:message key="str1147"/> </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="typeList.jsp?iStart=<%=pageUp%>">
																			<bean:message key="str1148"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="typeList.jsp?iStart=<%=pageDown%>">
																			<bean:message key="str1149"/> </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="typeList.jsp?iStart=<%=pages-1%>">
																		<bean:message key="str1150"/></a></td>
											
															         </tr>

														</table>
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
