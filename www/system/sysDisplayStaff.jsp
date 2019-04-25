<%@ page contentType="text/html;charset=GBK" %><%@ include file="../fuction/include.jsp"%>
<%@ page import="com.ahbay.UserMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">

		<title>员工信息</title>
		<script src="/oa/manage_it/fuction/calendar.js" type="text/javascript"></script>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<%
	commMethodMgr comm = new commMethodMgr();
	StaffMgr staff = new StaffMgr();
	staff.setStaff_id(request.getParameter("staffId"));
	staff = staff.GetUserInfo("SEL_BY_ID");
%>
<body> 
    <h5>新增员工</h5>
<html:form action="/addstaff">   
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayEF" align="left" width="10%">工号：</td>
    <td class="grayEF" align="left" > 
		<%=staff.getStaff_id()%>
    </td>
    <td class="grayEF" align="left" width="10%">姓名：</td>
    <td class="grayEF" align="left" >
	    <%=staff.getStaff_name()%>
    </td>
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">归属部门：</td>
    <td class="grayEF" align="left" colspan=3> 
	    <%=comm.ConvertCodeToName("itemowndepart",staff.getDepart_id())%>
    </td>
     
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">性别：</td>
    <td class="grayEF" align="left" > 
	    <%=comm.ConvertCodeToName("sex",staff.getSex())%>
    </td>
    <td class="grayEF" align="left" width="10%">职务说明：</td>
    <td class="grayEF" align="left" >
	     <%=staff.getJob_info()%>
    </td>
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">联系电话：</td>
    <td class="grayEF" align="left" > 
	     <%=staff.getSerial_number()%>
    </td>
    <td class="grayEF" align="left" width="10%">出生日期：</td>
    <td class="grayEF" align="left" >
	     <%=staff.getBirthday()%>
    </td>
  </tr>
 
</table>
 </html:form>
<body>
</html>
