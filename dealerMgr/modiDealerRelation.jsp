<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<html>
	<head>
		<title><bean:message key="str1200"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript">
	function checkInfo()
	{
		var val=document.getElementById("relation_type_code").value;
		if(val=="0" || val.equals("0"))
		{
			alert("请选择要修改的客户级别类型!");
			return false;
		}
		return true;
	}
	function setSize()
	{
		window.resizeTo(700,400);
	}
	function window.onresize()
	{
	  return false;
	}
</script>
	</head>
	<body onload="setSize()">
		<%
			String obj_cust_id = "", cust_id = "", level_name = "";
			HttpSession logsession = request.getSession();
			if (request.getParameter("level_name") != null) {
				level_name = request.getParameter("level_name");
			}
			if (request.getParameter("obj_cust_id") != null) {
				obj_cust_id = request.getParameter("obj_cust_id");
			}
			if (logsession.getAttribute("SESSION_CUST_ID") != null) {
				cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
			}
			RelationCcInfo relation = new RelationCcInfo();
			ArrayList relationList = new ArrayList();
			relationList = relation.getRelationByObjId(obj_cust_id);
			String cust_name = "", cust_phone = "", cust_addr = "", cust_relation = "", relation_time = "";
			if (relationList != null && relationList.size() > 0) {
				HashMap map = (HashMap) relationList.get(0);
				if (map.get("cust_name") != null) {
					cust_name = map.get("cust_name").toString();
				}
				if (map.get("group_contact_phone") != null) {
					cust_phone = map.get("group_contact_phone").toString();
				}
				if (map.get("company_address") != null) {
					cust_addr = map.get("company_address").toString();
				}
				if (map.get("relation_type_code") != null) {
					cust_relation = map.get("relation_type_code").toString();
				}
				if (map.get("start_date") != null) {
					relation_time = map.get("start_date").toString();
					if (relation_time.length() > 10) {
				relation_time = relation_time.substring(0, 10);
					}
				}
			}
			//客户关系
			ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(
					cust_id, "4");
			ParamethodMgr paramCom = new ParamethodMgr();
			HashMap custRelation = paramCom.getCompareInfoByCode("CRM",
					"relation_type_code");
			if (custRelation.get(cust_relation) != null) {
				cust_relation = custRelation.get(cust_relation).toString();
			}
		%>
		<form method="post" name="NewRegisterForm" id="NewRegisterForm" action=/doTradeReg.do>
			<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7" id="table">
				<tr>
					<td class="line1" style="background-color: #e2e2e2; color: #000000; line-height: 25px; font-weight: bold; font-size: 13px;" colspan="2">
					  <bean:message key="str1201"/>
					</td>
				</tr>
				<tr id="tr">
					<td align="right" bgcolor="#efefef" style="font-weight: bolder; font-size: 12px">
						  <bean:message key="str3227"/>
					</td>
					<td width="396" align="left" bgcolor="#FFFFFF">
						<div class="ping1" style="font-size: 12px"><%=cust_name%></div>
					</td>
				</tr>
				<tr id="tr">
					<td align="right" bgcolor="#efefef" style="font-weight: bolder; font-size: 12px">
					 <bean:message key="str3488"/>
					</td>
					<td align="left" bgcolor="#FFFFFF">
						<div class="ping1" style="font-size: 12px"><%=cust_phone%></div>
					</td>
				</tr>
				<tr id="tr">
					<td align="right" bgcolor="#efefef" style="font-weight: bolder; font-size: 12px">
					   <bean:message key="str1203"/>
					</td>
					<td align="left" bgcolor="#FFFFFF">
						<div class="ping1" style="font-size: 12px"><%=cust_addr%>
						</div>
					</td>
				</tr>
				<tr id="tr">
					<td align="right" bgcolor="#efefef" style="font-weight: bolder; font-size: 12px">
					<bean:message key="str1202"/>
					</td>
					<td align="left" bgcolor="#FFFFFF">
						<div class="ping1" style="font-size: 12px"><%=level_name%>
						</div>
					</td>
				</tr>
				<tr id="tr">
					<td align="right" bgcolor="#efefef" style="font-weight: bolder; font-size: 12px">
						 <bean:message key="str1204"/>
					</td>
					<td align="left" bgcolor="#FFFFFF">
						<div class="ping1" style="font-size: 12px"><%=relation_time%></div>
					</td>
				</tr>
				<tr id="tr">
					<td align="right" bgcolor="#efefef" style="font-weight: bolder; font-size: 12px">
					 <bean:message key="str1205"/>
					</td>
					<td align="left" bgcolor="#FFFFFF">
						<div class="ping" style="font-size: 12px">
							<select name="rela_class" id="rela_class" maxlength="25" class="login_textarea">
								<option value="0">
									 <bean:message key="str1206"/>
								</option>
								<%
								if (custLevel != null && custLevel.size() > 0) {
								for (int i = 0; i < custLevel.size(); i++) {
									HashMap map = (HashMap) custLevel.get(i);
									String value = map.get("level_code").toString();
									String name = map.get("level_name").toString();
								%>
								<option value="<%=value%>"><%=name%></option>
								<%
									}
									}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr id="tr">
					<td height="30" colspan="2" align="center" bgcolor="#FFFFFF">
						<input class="tjan" type="submit" value="" onclick="return checkInfo()">
						<input type="hidden" name="trade_type_code" value="0816">
						<input type="hidden" name="relation_type_code" value="3">
						<input type="hidden" name="obj_cust_id" value="<%=obj_cust_id%>">
						<input class="qxan" type="button" name="cancel" value="" onclick="javascript:window.close();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
