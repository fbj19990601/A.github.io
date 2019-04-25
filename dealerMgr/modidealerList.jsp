<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<html>
	<head>
		<title><bean:message key="str1154"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>

		<script language="javascript">
  function chechIfo()
  {
		return true;
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
		<%
			HttpSession logsession = request.getSession();
			String cust_id = "";
			String iStart = "0";
			String meun_idx = "";
			String code = "";
			String keyword = "", type_code = "";
			if (request.getParameter("code") != null) {
				code = request.getParameter("code");
			}
			if (request.getParameter("cust_name") != null) {
				keyword = request.getParameter("cust_name");
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
					relationList = relation.getDealerByType(Integer.valueOf(iStart).intValue(), cust_id, "1");
				} else if (code == "1" || code.equals("1")) {
					relationList = relation.getRelaByNameLike(Integer.valueOf(iStart).intValue(), cust_id, keyword);
					counter = relationList.size();
				} else if (code == "2" || code.equals("2")) {
					relationList = relation.getCByRelaClass(cust_id,type_code);
					counter = relationList.size();
				}
			} catch (Exception ex) {
				out.print(ex.getMessage());
			}
			ParamethodMgr paramObj = new ParamethodMgr();
			ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(cust_id, "4");
			HashMap typeMap = paramObj.getCompareInfoByCode("CRM","relation_type_code");
			ArrayList custRelation = paramObj.getCompareInfo("CRM","relation_type_code");
			//int counter = relation.getPageSizeByType("1", cust_id);
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
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="13" align="left">
					<form name="relationForm" id="relationForm" action="modidealerIndex.jsp?menu_id=<%=meun_idx%>" method="post">
						<div style="margin-left: 12px; margin-top: 5px; margin-bottom: 5px">
							<bean:message key="str1155"/>&nbsp;
							<select name="relation_type_code" id="relation_type_code" class="login_textarea" onchange="checkRaleType(this.value)">
								<option value="0">
									<bean:message key="str1156"/>
								</option>
								<%
										if (custLevel != null && custLevel.size() > 0) {
										for (int i = 0; i < custLevel.size(); i++) {
											HashMap map = (HashMap) custLevel.get(i);
											String value = map.get("level_code").toString();
											String name = map.get("level_name").toString();
								%>
								<option value="<%=value%>">
									<%=name%>
								</option>
								<%
									}
									}
								%>
							</select>
							&nbsp;&nbsp;<bean:message key="str1157"/>&nbsp;
							<input type="text" maxlength="50" name="cust_name" id="cust_name">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="cxan" type="button" value="" onclick="checkRelation()" style="cursor: hand">
						</div>
						<input type="hidden" name="code" id="code" value="0">
						<input type="hidden" name="menu_id" id="menu_id" value="<%=meun_idx%>">
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="25%">
								<bean:message key="str1140"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
							<bean:message key="str1158"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str3290"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str1839"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
							<bean:message key="str1160"/>
							</td>
						</tr>
						<%
								if (relationList != null && relationList.size() > 0) {
								for (int i = 0; i < relationList.size(); i++) {
									HashMap map = (HashMap) relationList.get(i);
									String obj_cust_id = "";
									String cust_name = "";
									String group_contact_phone = "";
									String publish_date = "", level_name = "";
									if (map.get("obj_cust_id") != null) {
								obj_cust_id = map.get("obj_cust_id").toString();
									}
									if (map.get("cust_name") != null) {
								cust_name = map.get("cust_name").toString();
									}
									if (map.get("level_name") != null) {
								level_name = map.get("level_name").toString();
									}
									if (map.get("group_contact_phone") != null) {
								group_contact_phone = map.get("group_contact_phone")
										.toString();
									}
									if (map.get("publish_date") != null) {
								publish_date = map.get("publish_date").toString();
								if (publish_date.length() > 10) {
									publish_date = publish_date.substring(0, 10);
								}
									}
						%>

						<tr style="background-color: #f9f9f9;" id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
							<td style="color: #000000; padding: 2px 5px;" align=left>
								<a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" target="_blank"><%=cust_name%></a>
							</td>
							<td style="color: #000000; padding: 2px 5px;" align=left><%=level_name%></td>
							<td style="color: #000000; padding: 2px 5px;" align=left><%=group_contact_phone%></td>
							<td style="color: #000000;" align=center><%=publish_date%></td>
							<td style="color: #000000;" align=center>
								<a href="modiDealerRelation.jsp?obj_cust_id=<%=obj_cust_id%>&level_name=<%=level_name%>" target="_blank" onClick="return chechIfo()"><img src=/img/edit.gif width=16 height=16 border=0>
								</a>
							</td>
						</tr>

						<%
								}
								
						%>

						<tr>
							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
							<td align="right" colspan="3" style="padding: 2px 5px;">
								<a href="modidealerIndex.jsp?iStart=0&menu_id=<%=meun_idx%>&code=<%=code %>&relation_type_code=<%=type_code %>&cust_name=<%=keyword %>"> <bean:message key="str1030"/></a>&nbsp; &nbsp;
								<% 
								if(Integer.parseInt(iStart)>0){
								%>
								<a href="modidealerIndex.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>&code=<%=code %>&relation_type_code=<%=type_code %>&cust_name=<%=keyword %>"><bean:message key="str1031"/></a> &nbsp;
								<%
								}
								if(Integer.parseInt(iStart)<pages-1){
								%>
								<a href="modidealerIndex.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>&code=<%=code %>&relation_type_code=<%=type_code %>&cust_name=<%=keyword %>"><bean:message key="str1032"/>  </a>&nbsp;
								<%
								}
								%>
								<a href="modidealerIndex.jsp?iStart=<%=pages-1%>&menu_id=<%=meun_idx%>&code=<%=code %>&relation_type_code=<%=type_code %>&cust_name=<%=keyword %>"><bean:message key="str1033"/></a>
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
	</body>
</html>