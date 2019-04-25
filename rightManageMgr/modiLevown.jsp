<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custrightsMgr.RightManage"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
	String cust_classs = bean.getSelectItems("14");
	String code = "";
	String cust_class="";
	
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	if (request.getParameter("cust_class") != null) {
		cust_class = request.getParameter("cust_class");
	}
	RightManage relation = new RightManage();
	ArrayList relationList = new ArrayList();
	out.println(cust_class);
	try {
		if (code == "0" || code.equals("0")) {
			relationList = relation.genAllrightsByClass(cust_class);
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>
<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
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
      document.getElementById("code").value="0";
      sumbimtData();
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
				<td height="26" align="left">
					<form name="relationForm" id="relationForm" action="model.jsp" method="post">
						<div style="margin-left: 12px; margin-top: 5px; margin-bottom: 5px">
							<bean:message key="str370"/>
							<select name="cust_class" id="cust_class" class="login_textarea" onclick="checkRaleType(this.value)">
								<option value="0">
									<bean:message key="str160"/>
								</option>
								<%=cust_classs%>
							</select>
						</div>
						<input type="hidden" name="code" id="code" value="0">
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str366"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
								<bean:message key="str367"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
								<bean:message key="str368"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str374"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str156"/>
							</td>
						</tr>
						<%
						if (relationList != null && relationList.size() > 0) {
						for (int i = 0; i < relationList.size(); i++) {
							HashMap map = (HashMap) relationList.get(i);
							String right_code = "",limit_type="",limit_value="",cust_li="";
							String cust_lili="",right_codes="",limit_types="";
							if (map.get("cust_class") != null) {
								cust_li = map.get("cust_class").toString();
								cust_lili  = cust_li;
							}
							if (cust_li=="1"||cust_li.equals("1")){cust_li="General(Not verified)";}
							else if(cust_li=="2"||cust_li.equals("2")){cust_li="General";}
							else if(cust_li=="3"||cust_li.equals("3")){cust_li="Bronze";}
							else if(cust_li=="4"||cust_li.equals("4")){cust_li="Silver";}
							else if(cust_li=="5"||cust_li.equals("5")){cust_li="Gold";}
							else if(cust_li=="6"||cust_li.equals("6")){cust_li="VIP";}
							
							if (map.get("right_code") != null) {
								right_code = map.get("right_code").toString();
								right_codes = right_code;
							}
							if (right_code=="SYS"||right_code.equals("SYS")){right_code="Framework";}
							else if(right_code=="B2B"||right_code.equals("B2B")){right_code="E-commerce";}
							else if(right_code=="COM"||right_code.equals("COM")){right_code="Management";}
							else if(right_code=="OA"||right_code.equals("OA")){right_code="Chief";}
							else if(right_code=="HRM"||right_code.equals("HRM")){right_code="Resources";}
							else if(right_code=="CRM"||right_code.equals("CRM")){right_code="Customer";}
							else if(right_code=="CTR"||right_code.equals("CTR")){right_code="Control panel";}
							else if(right_code=="INFO"||right_code.equals("INFO")){right_code="Intelligence";}
							else if(right_code=="HELP"||right_code.equals("HELP")){right_code="Assistant";}
							else if(right_code=="MRP"||right_code.equals("MRP")){right_code="Stock";}
							else if(right_code=="SALE"||right_code.equals("SALE")){right_code="Sales";}
							else if(right_code=="BUY"||right_code.equals("BUY")){right_code="Procurement";}
							else if(right_code=="PROJ"||right_code.equals("PROJ")){right_code="Plan";}
							else if(right_code=="FORM"||right_code.equals("FORM")){right_code="Orders";}
							else if(right_code=="PROD"||right_code.equals("PROD")){right_code="Products";}
							else if(right_code=="TRANSPOR"||right_code.equals("TRANSPOR")){right_code="Transport";}
							else if(right_code=="CONTRACT"||right_code.equals("CONTRACT")){right_code="Contract";}
							
							if (map.get("limit_type") != null) {
								limit_type = map.get("limit_type").toString();
								limit_types = limit_type;
							}

							if (limit_type=="1"||limit_type.equals("1")){limit_type="Information ";}
							else if(limit_type=="2"||limit_type.equals("2")){limit_type="Ad";}
							else if(limit_type=="3"||limit_type.equals("3")){limit_type="Sales";}
							else if(limit_type=="4"||limit_type.equals("4")){limit_type="Procurement";}
							else if(limit_type=="5"||limit_type.equals("5")){limit_type="Cooperation";}
							else if(limit_type=="6"||limit_type.equals("6")){limit_type="Recruitment";}
							
							if (map.get("limit_value") != null) {
								limit_value = map.get("limit_value").toString();
							}
						%>
						<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
							<td style="color: #000000; padding: 2px 5px;" align=center><%=cust_li%></td>
							<td style="color: #000000;" align=center><%=right_code%></td>
							<td style="color: #000000; padding: 2px 5px;" align=center><%=limit_type%></td>
							<td style="color: #000000;" align=center><%=limit_value%></td>
							<td style="color: #000000;" align=center>
								<a href="modifyOwn.jsp?cust_class=<%=cust_lili%>&right_code=<%=right_codes%>&limit_type=<%=limit_types%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="update"></a>
							</td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td height="13"></td>
			</tr>
		</table>
	</body>
</html>