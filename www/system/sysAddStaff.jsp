<%@ page contentType="text/html;charset=GBK" %><%@ include file="/manage_it/fuction/include.jsp"%>
<%@ page import="com.ahbay.commenMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">

		<title>Struts Form for paradateForm</title>
		<script src="/oa/manage_it/fuction/calendar.js" type="text/javascript"></script>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<%CommParaMgr commPara = new CommParaMgr();%>
<body> 
    <h5>����Ա��</h5>
<html:form action="/addstaff">   
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="grayEF" align="left" width="10%">���ţ�</td>
    <td class="grayEF" align="left" > 
	    <html:text property="staff_id" maxlength="8" size="8"/>
	    <html:errors property="staff_id"/>
    </td>
    <td class="grayEF" align="left" width="10%">������</td>
    <td class="grayEF" align="left" >
	    <html:text property="staff_name" maxlength="20" size="20"/>
	    <html:errors property="staff_name"/>
    </td>
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">�������ţ�</td>
    <td class="grayEF" align="left" > 
	    <html:select property="depart_id" size="1">
	        <%=commPara.GenDepartOption("itemowndepart")%>
	    </html:select>
    </td>
    <td class="grayEF" align="left" width="10%">���룺</td>
    <td class="grayEF" align="left" >
	    <html:password property="passwd" maxlength="20" size="20"/>
	    <html:errors property="passwd"/>
    </td>
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">�Ա�</td>
    <td class="grayEF" align="left" > 
	    <html:select property="sex" size="1">
	        <html:option value="0" >0��----����---</html:option>
  			<html:option value= "1">1��----Ů��---</html:option>
	    </html:select>
	    <html:errors property="sex"/>
    </td>
    <td class="grayEF" align="left" width="10%">ְ��˵����</td>
    <td class="grayEF" align="left" >
	    <html:text property="job_info" maxlength="50" size="50"/>
	    <html:errors property="job_info"/>
    </td>
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">��ϵ�绰��</td>
    <td class="grayEF" align="left" > 
	    <html:text property="serial_number" maxlength="30" size="30"/>
	    <html:errors property="serial_number"/>
    </td>
    <td class="grayEF" align="left" width="10%">�������ڣ�</td>
    <td class="grayEF" align="left" >
	    <html:text property="birthday" size="10" readonly="true"/>	       
	        <A onclick=event.cancelBubble=true;href="javascript:showCalendar('imageCalendar1',false,'birthday',null);"><IMG 
                        id=imageCalendar1 height=21 
                        src="../../img/button.gif" width=34 
                        align=absMiddle border=0></A> 
	    <html:errors property="birthday"/>
    </td>
  </tr>

    <tr>
    <td class="grayEF" align="right" colspan=4>
    	<input type="submit" name="Submit1" value="ȷ������">
    </td>
    </tr>
</table>
 </html:form>
<body>
</html>
