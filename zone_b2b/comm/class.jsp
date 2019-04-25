<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="classInfo" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<%
  String type="",level="";
  if(request.getParameter("type")!=null){
    type=request.getParameter("type");
  }
  if(request.getParameter("level")!=null){
    level=request.getParameter("level");
  }
  String select=classInfo.getSelectedByComm(type,level);
%>
<td>
	<select name="x_class_id" id="x_class_id" style="width: 125px">
		<option value="0">
			<bean:message key = "str1180"/>
		</option>
		<%=select%>
	</select>
</td>
