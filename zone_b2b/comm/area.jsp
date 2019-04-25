<%@ page contentType="text/html;charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="areaInfo" class="com.saas.biz.AreaInfoMgr.AreaInfo" scope="page" />
<%
 String  province = areaInfo.getCountrySelect("5J2mc0X0G85BH");
%>
<td>
	<select name="x_province" id="x_province" style="width: 125px" onclick="setXcityInfo(this.value)">
		<option value="0">
			<bean:message key = "str2046"/>
		</option>
		<%=province%>
	</select>
	<select name="x_city" id="x_city" style="width: 125px">
		<option value="0">
			<bean:message key = "str2046"/>
		</option>
		<%=province%>
	</select>
</td>