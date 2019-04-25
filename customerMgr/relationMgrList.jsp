<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "0";
	String meun_idx = "";
	String code = "0";
	String keyword = "", type_code = "";
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	if (request.getParameter("keyword") != null) {
		keyword = request.getParameter("keyword");
		keyword = new String(keyword.getBytes("ISO-8859-1"), "GBK");
	}
	if (request.getParameter("relation_type_code") != null) {
		type_code = request.getParameter("relation_type_code");
	}
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
	}
	RelationCcInfo relation = new RelationCcInfo();
	ArrayList relationList = new ArrayList();
	int counter = 0;
	try {
		if (code == "0" || code.equals("0")) {
			relationList = relation.getCustByRelationTypeCode(Integer.valueOf(iStart).intValue(), cust_id, "1");
			counter = relation.getCustByRelationTypeCode(cust_id, "1");
		} else if (code == "1" || code.equals("1")) {
			relationList = relation.getRelationByCustNameLike(Integer.valueOf(iStart).intValue(), cust_id, keyword,"1");
			counter = relation.getRelationByCustNameLike(cust_id,keyword,"1");
		} else if (code == "2" || code.equals("2")) {
			relationList = relation.getCustomerByRelaUpClass(cust_id,type_code);
			counter = relationList.size();
		}
	} catch (Exception ex) {
		out.print(ex.getMessage());
	}

	ParamethodMgr paramObj = new ParamethodMgr();
	ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(cust_id, "0");

	int pages = counter / 20 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage) {
		if (currenPage > 0) {
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
%>

<html>
	<head>
		<title><bean:message key="str1845"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/css/tablecss.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<style type="text/css">
	.chaxun{
		background:url(../images/chaxun.gif) left center no-repeat;
		width:70px;
	 	height:26px;
		border:0px; 
	 	cursor:hand;
	}
</style>
<script language="javascript">
  function chechIfo(obj_id)
  {
    var result=new Boolean(false);
	if(confirm('是否确认要执行本操作？')) 
	{
	    return true;
	}
	else
	{
		return false;
	}
  }
  function checkRaleType(type){
    if(type!="0"){
      document.getElementById("code").value="2";
      sumbimtData();
    }
  }
  function checkRelation(){
    if(document.getElementById("cust_name").value!=""){
       document.getElementById("code").value="1";
       sumbimtData();
    }else{
      alert('请输入正确的客户名称，否则会影响你的查询结果！');
      document.getElementById("cust_name").focus();
    }
  }
  function sumbimtData(){
    document.relationForm.submit();
  }
  
</script>
	</head>
	<body>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="23"></td>
			</tr>
		  <tr>
		    <td width="2"><img src="/images/kehu_list_03.gif" width="2" height="14" alt=""></td>
		    <td width="704" background="/images/kehu_list_04.gif" height="14"></td>
		    <td width="2"><img src="/images/kehu_list_06.gif" width="2" height="14" alt=""></td>
		  </tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td height="13" background="/images/kehu_list_17.gif" align="right">
								<form name="relationForm" id="relationForm" action="relaMgrIndex.jsp?menu_id=<%=meun_idx%>" method="post">
									<bean:message key="str290"/>&nbsp;
									<input type="text" maxlength="50" name="keyword" id="cust_name">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="chaxun" type="button" value="" onclick="checkRelation()" style="cursor: hand">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="hidden" name="code" id="code" value="1">
								</form>
							</td>
						</tr>
						
						<tr>
							<td>
								<table width=100% border=0 cellpadding=2 cellspacing=0 align=center bgcolor="#ffffff">
								<tr>
									<td height="23"></td>
								 </tr>
									<%
									if(relationList!=null && relationList.size()>0){
									  int ros=0,index=0;
									  if(relationList.size()%2==0){
									    ros=relationList.size()/2;
									  }else{
									     ros=relationList.size()/2+1;
									  }
									  for(int i=0;i<ros;i++){
									  out.print("<tr><td width=200></td>");
									    for(int j=0;j<2;j++){
									      if(relationList.size()>index){
									             HashMap map = (HashMap) relationList.get(index++);
												String obj_cust_id = map.get("obj_cust_id").toString();
												String cust_name = "",email="",company_address="";
												String relation_type_code = "";
												String group_contact_phone = "";
												String start_date = "", level_name = "";
												String remark = "";
												String cust_code = "";
												if (map.get("remark") != null){remark = map.get("remark").toString();}
												if (map.get("level_name") != null){level_name = map.get("level_name").toString();}
												if (map.get("company_address") != null){company_address = map.get("company_address").toString();}
												if (map.get("develope_man") != null){cust_code = map.get("develope_man").toString();}
												if (map.get("cust_name") != null){cust_name = map.get("cust_name").toString();}
												if (map.get("email") != null){email = map.get("email").toString();}
												if (map.get("group_contact_phone") != null){group_contact_phone = map.get("group_contact_phone").toString();}
												if (map.get("start_date") != null){
													start_date = map.get("start_date").toString();
													if (start_date.length() > 10) {start_date = start_date.substring(0, 10);}
												}
												
									%>
												
												<td width="300" height="167" align="center" background="/images/bg_list.gif">									    
													<table width="283" border="0" cellspacing="0" cellpadding="2">
														<tr>
															<td width="204" height="26" class="table_xian">
																<span class="time"><bean:message key="str4710"/><%=start_date %>
																</span>
															</td>
															<td width="71" class="table_xian">
																<span class="shanchu">
																	<a href="modifyCustomer.jsp?obj_cust_id= <%=obj_cust_id%>&level_name=<%=level_name%>&info_type=0"><bean:message key="str1769"/></a>
																	&nbsp;&nbsp;
																	<a href="/doTradeReg.do?user_id= <%=remark%>&trade_type_code=1048&obj_cust_id= <%=obj_cust_id%>&relation_type_code=1" target="_self"><bean:message key="str2677"/></a>
																</span>
															</td>
														</tr>
											
													</table>
													<table width="100%" border="0" cellspacing="0" cellpadding="4">
														<tr>
															<td width="37%" align="center">
																<img
																	style="BORDER-LEFT-COLOR: #333333; BORDER-BOTTOM-COLOR: #333333; BORDER-TOP-COLOR: #333333; BORDER-RIGHT-COLOR: #333333"
																	src="/images/kehu_list_11.gif" width="83" height="74" border=1>
															</td>
															<td width="63%">
																<bean:message key="str1076"/>
																<a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%></a>
																<br>
																<bean:message key="str0984"/><%=group_contact_phone %>
																
																<br>
																E-mail：<%=email %>
															</td>
														</tr>
													</table>
													<table width="94%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td>
																
																<bean:message key="str1089"/><%=company_address %>
															</td>
														</tr>
													</table>
												</td>
												<td height=25></td>
									<%
									      }
									    }
									   out.print("<td height=25></td></tr><tr><td height=15></td></tr>");
									  }
									%>
									
									
									<tr>
										<td background="/images/kehu_list_17.gif"  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
										<td background="/images/kehu_list_17.gif" align="right" colspan="3"  style=" padding:2px 5px;">
										<a href="relaMgrIndex.jsp?iStart=0"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
										<% 
											if(Integer.parseInt(iStart)>0){
										%>
											<a href="relaMgrIndex.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
										<%
											}
											if(Integer.parseInt(iStart)<pages-1){
										%>
											<a href="relaMgrIndex.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/> </a>&nbsp; 
										<%
											}
										%>
										<a  href="relaMgrIndex.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
			
							         </tr>

									<%
									}else{
									  	out.print("<tr><td height=15 colspan=2 align=center>无客户记录！</td></tr>");
									  }
									%>
								</table>
							</td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td width="64" height="5"><img src="/images/kehu_list_14.gif" width="64" height="5" alt=""></td>
		    <td background="/images/kehu_list_15.gif" colspan="5"></td>
		  </tr>
		  <tr>
			<td height="23"></td>
		  </tr>
		</table>
	</body>
</html>