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
			relationList = relation.getCustByRelationTypeCode(Integer.valueOf(iStart).intValue(), cust_id, "4");
			counter = relationList.size();
		} else if (code == "1" || code.equals("1")) {
			relationList = relation.getDealerByCustNameLike(Integer.valueOf(iStart).intValue(), cust_id, keyword);
			counter = relation.getDealerByCustNameLike(cust_id, keyword);
		} else if (code == "2" || code.equals("2")) {
			relationList = relation.getCustomerByRelaUpClass(cust_id,type_code);
			counter = relationList.size();
		}
	} catch (Exception ex) {
		out.print(ex.getMessage());
	}
	ParamethodMgr paramObj = new ParamethodMgr();
	ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(cust_id, "4");
	HashMap typeMap = paramObj.getCompareInfoByCode("CRM","relation_type_code");
	ArrayList custRelation = paramObj.getCompareInfo("CRM","relation_type_code");
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
		<title>经销商资料管理<bean:message key="str1151"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<style type="text/css">
.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid;
	background-color: #fff8ee;
	text-align: left;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #000000;
	margin-top: 13px;
}  /*横栏样式6---- 头部提醒1*/
.line6 .img {
	width: 53px;
	height: 53px;
	float: left;
	margin-right: 20px;
}

.line6 .title {
	font-size: 14px;
	font-weight: bold;
	color: #ff5400;
}

.line1 {
	border-left: #ff7300 3px solid;
	background-color: #e2e2e2;
	color: #333333;
	text-align: left;
	font-size: 12px;
} /*横栏样式1*/
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
      alert('请输入正确的经销商名称，否则会影响你的查询结果！');
      document.getElementById("cust_name").focus();
    }
  }
  function sumbimtData(){
    document.relationForm.submit();
  }
</script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="23"></td>
			</tr>
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td height="13" align="left">
								<form name="relationForm" id="relationForm" action="dealerMgrIndex.jsp?menu_id=<%=meun_idx%>" method="post">
									&nbsp;&nbsp;<bean:message key="str1152"/>&nbsp;
									<input type="text" maxlength="50" name="keyword" id="cust_name">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="cxan" type="button" value="" onclick="checkRelation()" style="cursor: hand">
									<input type="hidden" name="code" id="code" value="1">
								</form>
							</td>
						</tr>
						<tr>
							<td>
								<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
									<tr>
										<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="35%">
											<bean:message key="str1153"/>
										</td>
										<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
										<bean:message key="str1255"/>
										</td>
										<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
											<bean:message key="str1839"/>
										</td>
										<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
											<bean:message key="str156"/>
										</td>
										<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
											<bean:message key="str157"/>
										</td>
									</tr>
									<%
											if (relationList != null && relationList.size() > 0) {
											for (int i = 0; i < relationList.size(); i++) {
												HashMap map = (HashMap) relationList.get(i);
												String obj_cust_id = map.get("obj_cust_id").toString();
												String cust_name = "";
												String relation_type_code = "";
												String group_contact_phone = "";
												String start_date = "", level_name = "";
												String remark = "";
												String cust_code = "";
												if (map.get("remark") != null) {
													remark = map.get("remark").toString();
												}
												if (map.get("level_name") != null) {
													level_name = map.get("level_name").toString();
												}
												if (map.get("develope_man") != null) {
													cust_code = map.get("develope_man").toString();
												}
												if (map.get("cust_name") != null) {
													cust_name = map.get("cust_name").toString();
												}
												if (map.get("group_contact_phone") != null) {
													group_contact_phone = map.get("group_contact_phone")
													.toString();
												}
												if (map.get("start_date") != null) {
													start_date = map.get("start_date").toString();
												if (start_date.length() > 10) {
													start_date = start_date.substring(0, 10);
												}
												}
									%>

									<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
										<td style="color: #000000; padding: 2px 5px;" align=left>
											<a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" target="_blank"><%=cust_name%></a>
										</td>
										<td style="color: #000000; padding: 2px 5px;" align=left><%=group_contact_phone%></td>
										<td style="color: #000000;" align=center><%=start_date%></td>
										<td style="color: #000000;" align=center>
											<a href="modifydealerCustomer.jsp?obj_cust_id=<%=obj_cust_id%>&menu_id=<%=meun_idx%>&level_name=<%=level_name%>&info_type=0" onClick="return chechIfo();"><img src=/img/edit.gif width=16 height=16 border=0> </a>
										</td>
										<td style="color: #000000;" align=center>
											<a href="/doTradeReg.do?trade_type_code=0815&obj_cust_id=<%=obj_cust_id%>&relation_type_code=4" target="_self" onClick="return chechIfo();"><img src=/img/del.gif width=16 height=16 border=0> </a>
										</td>
									</tr>

									<%
									}
									%>

									<tr>
										<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
										<td  align="right" colspan="3"  style=" padding:2px 5px;">
											<a href="dealerMgrIndex.jsp?iStart=0&keyword=<%=keyword%>&code=<%=code%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
											<%if (Integer.parseInt(iStart)>0)
											{
											 %>
											<a href="dealerMgrIndex.jsp?iStart=<%=pageUp%>&keyword=<%=keyword%>&code=<%=code%>"><bean:message key="str1031"/></a> &nbsp;
											<% }
											if(Integer.parseInt(iStart)<pages-1){
											%>
											<a href="dealerMgrIndex.jsp?iStart=<%=pageDown%>&keyword=<%=keyword%>&code=<%=code%>"><bean:message key="str1032"/>  </a>&nbsp;
											<%
											}
											 %>
											<a href="dealerMgrIndex.jsp?iStart=<%=pages-1%>&keyword=<%=keyword%>&code=<%=code%>"><bean:message key="str1033"/></a>
										</td>
									</tr>

									<%
									}
									%>
								</table>
							</td>
						</tr>
						<tr>
							<td height="13"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>