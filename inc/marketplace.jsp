<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<select name="mp">
	<option value=0 selected> <bean:message key="str2516"/> </option>
<%
com.xsaas.util.DBConnection mpdbc = new com.xsaas.util.DBConnection(true);
com.xsaas.util.Charset mpcharset = new com.xsaas.util.Charset();
 dbc.getConnection();
java.sql.ResultSet mprs = dbc.getRS("select distinct marketplace from saasnews.agriprice");
while(mprs.next()){
 %>
 <option value='<%= charset.ISO_2_GBK(mprs.getString(1)) %>'><%= charset.ISO_2_GBK(mprs.getString(1)) %></option>
                <%
	}
	mprs=null;
mpdbc.close();
%>
</select>