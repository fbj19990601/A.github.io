<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="classBean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<%
String select = classBean.getSelectedByComm("5", "1");
%>
<%--
QQ��350617898
Email:vip0101103@gmail.com
Ԫ��˵����
   b:Ԫ��Ϊ��̬�������б�������
   level:Ԫ��Ϊ���༶��
   class_type:Ԫ��Ϊ��������
   group_id:����ѡ���ķ���ID��ƴ��
   group_name:����ѡ���ķ���NAME��ƴ��
   sort:��Ϊһ���м����
   
   ����ajaxTools.js��util.js,ajaxTools.jsΪjs�Ĺ��߰��������޸�!
   util.js���û�����д��js�����԰�������������صķ�����
--%>
<html>
	<head>
		<title><bean:message key="str2634"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script language="javascript" src="ajaxTools.js"></script>
		<script language="javascript" src="util.js"></script>
	</head>
	<body>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
			<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd" style="margin-top:10px;">
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" width="15%">
						<bean:message key="str2635"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;" width="85%">
						<div style="float: left;display:inline;">
							<b style="display:inline;white-space:nowrap"> <select name="sort1" id="sort1" size="10" onChange="createNextClass(this)" onclick="setClassInfo(this)">
									<%=select%>
								</select> </b>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" width="100%" colspan="2">
						id<input type="text" size="35" id="group_id" name="group_id">
						name<input type="text" size="35" id="group_name" name="group_name">
						<input type="text" size="5" value="1" id="class_level" name="class_level">
						<input type="hidden" size="5" value="5" id="class_type" name="class_type">
						<select id="sort" name="sort" style="display:none"></select>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

