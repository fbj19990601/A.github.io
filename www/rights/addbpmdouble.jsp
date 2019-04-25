<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><bean:message key="str2930"/></title>
</head>
<%
request.setCharacterEncoding("gb2312");
String bpm_id=request.getParameter("bpm_id");
String VTRADE_TYPE_CODE=request.getParameter("trade_type_code");
%>
<body>
<center>
<hr>
<form name="form2"  method="get" action="selectcodebpm.jsp">
  <bean:message key="str2931"/>
    <input type="text" name="trade_type_code">
    <input type="submit" name="Submit" value="查询">
</form>
<hr><bean:message key="str2932"/>
<form name="form1" method="post" action="insertbpmdouble.jsp">
  <table width="445" border="1">
    <tr>
      <td width="173"><bean:message key="str2933"/>(trade_type_code)</td>
      <td width="256"><input type="text" name="trade_type_code" value="<%=VTRADE_TYPE_CODE%>"></td>
    </tr>
    <tr>
      <td><bean:message key="str2934"/>(node_type)</td>
      <td><select name="node_type" size="1">
        <option value="0" selected><bean:message key="str2935"/>(0)</option>
        <option value="1"><bean:message key="str2936"/>(1)</option>
      </select></td>
    </tr>
    <tr>
      <td><bean:message key="str2937"/>(node_sequence)<br></td>
      <td><input type="text" name="node_sequence"></td>
    </tr>
    <tr>
      <td><bean:message key="str2938"/>(node_class)<br></td>
      <td><input type="text" name="node_class"></td>
    </tr>
    <tr>
      <td><bean:message key="str2939"/>(node_method)<br></td>
      <td><input type="text" name="node_method"></td>
    </tr>
    <tr>
      <td><bean:message key="str2940"/>(out_query)</td>
      <td><input type="text" name="out_query"></td>
    </tr>
    <tr>
      <td><bean:message key="str2941"/>(out_buffer)</td>
      <td><input type="text" name="out_buffer"></td>
    </tr>
    <tr>
      <td><bean:message key="str2942"/>(undo_tag)</td>
      <td><select name="undo_tag" size="1">
        <option value="0" selected><bean:message key="str2943"/>(0)</option>
        <option value="1"><bean:message key="str2944"/>(1)</option>
        <option value="2"><bean:message key="str2945"/>(2)</option>
      </select></td>
    </tr>
    <tr>
      <td><bean:message key="str2946"/>(unde_class)</td>
      <td><input type="text" name="unde_class"></td>
    </tr>
    <tr>
      <td><bean:message key="str2947"/>(undo_method)<br></td>
      <td><input type="text" name="undo_method"></td>
    </tr>
    <tr>
      <td><bean:message key="str2948"/>(undo_out_query)</td>
      <td><input type="text" name="undo_out_query"></td>
    </tr>
    <tr>
      <td><bean:message key="str2949"/>(undo_out_buffer)<br></td>
      <td><input type="text" name="undo_out_buffer"></td>
    </tr>
    <tr>
      <td>rsrv_str1</td>
      <td><input type="text" name="rsrv_str1"></td>
    </tr>
    <tr>
      <td>rsrv_str2</td>
      <td><input type="text" name="rsrv_str2"></td>
    </tr>
    <tr>
      <td>rsrv_str3</td>
      <td><input type="text" name="rsrv_str3"></td>
    </tr>
    <tr>
      <td>rsrv_str4</td>
      <td><input type="text" name="rsrv_str4"></td>
    </tr>
    <tr>
      <td>rsrv_str5</td>
      <td><input type="text" name="rsrv_str5"></td>
    </tr>
    <tr>
      <td>rsrv_str6</td>
      <td><input type="text" name="rsrv_str6"></td>
    </tr>
    <tr>
      <td>rsrv_str7</td>
      <td><input type="text" name="rsrv_str7"></td>
    </tr>
    <tr>
      <td>rsrv_str8</td>
      <td><input type="text" name="rsrv_str8"></td>
    </tr>
    <tr>
      <td>rsrv_str9</td>
      <td><input type="text" name="rsrv_str9"></td>
    </tr>
    <tr>
      <td>rsrv_str0</td>
      <td><input type="text" name="rsrv_str0"></td>
    </tr>
    <tr>
      <td>in_date</td>
      <td><input type="text" name="in_date"></td>
    </tr>
    <tr>
      <td>remark</td>
      <td><input type="text" name="remark"></td>
    </tr>
	 <tr>
      <td><input type="hidden" name="bpm_id" value="<%=bpm_id%>"></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Submit" value="提交">
      </div></td>
    </tr>
	
  </table>
</form>
</center>

</body>
</html>
