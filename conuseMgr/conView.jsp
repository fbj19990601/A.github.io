<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "0";
	String code = "";
	String con_name = "", state_code1 = "", con_type1 = "", con_excut_way1 = "", con_class1 = "", sign_date = "";
	String con_object = "";
	String sign_date1 = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
	}

	if (request.getParameter("con_name") != null) {
		con_name = request.getParameter("con_name");
	}
	if (request.getParameter("state_code") != null) {
		state_code1 = request.getParameter("state_code");
	}
	if (request.getParameter("con_type") != null) {
		con_type1 = request.getParameter("con_type");
	}
	if (request.getParameter("con_excut_way") != null) {
		con_excut_way1 = request.getParameter("con_excut_way");
	}
	if (request.getParameter("con_class") != null) {
		con_class1 = request.getParameter("con_class");
	}
	if (request.getParameter("sign_date") != null) {
		sign_date = request.getParameter("sign_date");
	}
	if (request.getParameter("sign_date1") != null) {
		sign_date1 = request.getParameter("sign_date1");
	}
	if (request.getParameter("con_object") != null) {
		con_object = request.getParameter("con_object");
	}

	ConTractInfo conInfo = new ConTractInfo();
	ArrayList relationList = new ArrayList();
	con_name = new String(con_name.getBytes("ISO-8859-1"), "GBK");
	con_object = new String(con_object.getBytes("ISO-8859-1"), "GBK");
	int counter = 0;
	if (code == "5" || code.equals("5")) {
		relationList = conInfo.getContractByView(sign_date, sign_date1,
		cust_id, con_name, state_code1, con_type1,
		con_excut_way1, con_class1, con_object, Integer
				.valueOf(iStart).intValue());
		counter = conInfo.getContractByView(sign_date, sign_date1,
		cust_id, con_name, state_code1, con_type1,
		con_excut_way1, con_class1, con_object);
	}
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

	String state_code = bean.getSelectItems("94");
	String con_class = bean.getSelectItems("93");
	String con_type = bean.getSelectItems("95");
	String con_excut_way = bean.getSelectItems("96");
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal
			.getTime());
%>
<html>
	<head>
		<title><bean:message key="str1580"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript">
	function setCodeValue(val){
	  	if(document.getElementById('con_name').value==''&&document.getElementById('state_code').value==''&&document.getElementById('con_type').value==''&&document.getElementById('con_excut_way').value==''&&document.getElementById('con_class').value==''&&document.getElementById('sign_date').value==''&&document.getElementById('start_date').value==''&&document.getElementById('end_date').value==''&&document.getElementById('con_object').value==''){ 
	  		alert('请您至少选填一个查询条件！');
	  		return false;
	  	}else{
	    	document.getElementById("code").value=val;
	     	document.viewForm.submit();
	    }
  	}
</script>
	</head>
	<body>
		<form action="conView.jsp" method="post" name="viewForm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="13" align="left">
					</td>
				</tr>
				<tr>
					<td>
						<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
							<tr>
								<td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1716"/>
								</td>
								<td width="35%" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<input type="hidden" name="code" id="code" value="0">
										<input name="con_name" id="con_name" type="text" value="" size="25" maxlength="25">
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
								<td width="15%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1825"/>
								</td>
								<td width="35%" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<select name="state_code" id="state_code">
											<option value="">
												<bean:message key="str1180"/>
											</option>
											<%=state_code%>
										</select>
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
							</tr>
							<tr>
								<td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1717"/>
								</td>
								<td width="35%" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<select name="con_type" id="con_type">
											<option value="">
												<bean:message key="str1180"/>
											</option>
											<%=con_type%>
										</select>
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
								<td width="15%" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1718"/>
								</td>
								<td width="35%" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<select name="con_excut_way" id="con_excut_way">
											<option value="">
												<bean:message key="str1180"/>
											</option>
											<%=con_excut_way%>
										</select>
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1719"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<select name="con_class" id="con_class">
											<option value="">
												<bean:message key="str1180"/>
											</option>
											<%=con_class%>
										</select>
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
								<td align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1720"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<input name="sign_date" type="text" id="sign_date" size=10 maxlength=15 value="" onfocus="setday(this);">
										<bean:message key="str1721"/>
										<input name="sign_date1" type="text" id="sign_date1" size=10 maxlength=15 value="" onfocus="setday(this);">
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right" bgcolor="#f5f5f5" style="font-weight: bolder;">
									<bean:message key="str1722"/>
								</td>
								<td colspan="3" align="left" bgcolor="#FFFFFF">
									<div class="ping" style="display: inline;">
										<input name="con_object" id="con_object" type="text" value="" size="25" maxlength="25">
									</div>
									<div class="ping1" style="display: inline"></div>
								</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f5f5f5" colspan="4">
									<input class="cxan" type="button" value="" style="cursor: hand" onclick="setCodeValue('5')">
								</td>
							</tr>
							<tr>
								<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
									<bean:message key="str1594"/>
								</td>
								<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
									<bean:message key="str1597"/>
								</td>
								<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
									<bean:message key="str1723"/>
								</td>
								<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="30%">
									<bean:message key="str1595"/>
								</td>
							</tr>
							<%
									if (relationList != null && relationList.size() > 0) {
									for (int i = 0; i < relationList.size(); i++) {
										HashMap map = (HashMap) relationList.get(i);
										String con_id = "", con_name2 = "", state_code2 = "", con_class2 = "", sign_date2 = "";
										if (map.get("con_name") != null) {
									con_name2 = map.get("con_name").toString();
										}
										if (map.get("con_id") != null) {
									con_id = map.get("con_id").toString();
										}
										if (map.get("state_code") != null) {
									String state_code3 = map.get("state_code").toString();
									state_code2 = bean.getParamNameByValue("94",
											state_code3);
										}
										if (map.get("con_class") != null) {
									String con_class3 = map.get("con_class").toString();
									con_class2 = bean.getParamNameByValue("93", con_class3);
										}
										if (map.get("sign_date") != null) {
									sign_date2 = map.get("sign_date").toString();
										}
							%>
							<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
								<td style="color: #000000; padding: 2px 5px;" align=left>
									<a href="/contractMgr/disConTract.jsp?con_id=<%=con_id%>" TARGET=appwin onclick="mydefss()"><%=con_name2%></a>
								</td>
								<td style="color: #000000;" align=center><%=state_code2%></td>
								<td style="color: #000000; padding: 2px 5px;" align=left><%=con_class2%></td>
								<td style="color: #000000;" align=left><%=sign_date2.substring(0, 10)%></td>
							</tr>
							<%
							}
							%>
							<tr>
								<td align="left" colspan="2">
									共<bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/>
								</td>
								<td align="right" colspan="2">
									<a href="conView.jsp?iStart=0&con_name=<%=con_name%>&state_code=<%=state_code1%>&con_type=<%=con_type1%>&con_excut_way=<%=con_excut_way1%>&con_class=<%=con_class1%>&sign_date=<%=sign_date%>&con_object=<%=con_object%>&code=<%=code%>"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
									<%
									if (Integer.parseInt(iStart) > 0) {
									%>
									<a href="conView.jsp?iStart=<%=pageUp%>&con_name=<%=con_name%>&state_code=<%=state_code1%>&con_type=<%=con_type1%>&con_excut_way=<%=con_excut_way1%>&con_class=<%=con_class1%>&sign_date=<%=sign_date%>&con_object=<%=con_object%>&code=<%=code%>"><bean:message key="str1031"/></a> &nbsp;
									<%
											}
											if (Integer.parseInt(iStart) < pages - 1) {
									%>
									<a href="conView.jsp?iStart=<%=pageDown%>&con_name=<%=con_name%>&state_code=<%=state_code1%>&con_type=<%=con_type1%>&con_excut_way=<%=con_excut_way1%>&con_class=<%=con_class1%>&sign_date=<%=sign_date%>&con_object=<%=con_object%>&code=<%=code%>"><bean:message key="str1032"/> </a>&nbsp;
									<%
									}
									%>
									<a href="conView.jsp?iStart=<%=pages - 1%>&con_name=<%=con_name%>&state_code=<%=state_code1%>&con_type=<%=con_type1%>&con_excut_way=<%=con_excut_way1%>&con_class=<%=con_class1%>&sign_date=<%=sign_date%>&con_object=<%=con_object%>&code=<%=code%>"><bean:message key="str1033"/></a>
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
		</form>
	</body>
</html>