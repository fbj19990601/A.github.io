<%@ page contentType="text/html;charset=GBK" %><%@ include file="/manage_it/fuction/include.jsp"%>
<%@ page import="com.ahbay.commenMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">

		<title>Struts Form for paradateForm</title>
		<script src="/oa/manage_it/fuction/calendarnew.js" type="text/javascript"></script>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认注销本条记录？')) 
	{
		return true;
	}
	else
	{
		return false;
	}
}

</script>
<%
CommParaMgr commPara = new CommParaMgr();
commMethodMgr comm=  new commMethodMgr();
String staffId = request.getParameter("staffId");
%>
<body> 
    <h5>新增权限[<%=comm.ConvertCodeToName("staffname",staffId)%>]</h5>
<html:form action="/addright">   
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
 
   
  <tr>    
 
    <td class="grayEF" align="left" width="10%">权限模块：</td>
    <td class="grayEF" align="left" colspan=2>
	    <html:select property="menu_id" size="1">
	        <%=commPara.GenRightOption(staffId)%>
	    </html:select>        
    </td>
    <td class="grayEF" align="left">
	权限属性：<html:text property="right_attr" size="1" readonly="true"  value="0" /> [系统权限]    
    </td>
  </tr>
  <tr>    
    <td class="grayEF" align="left" width="10%">开始时间：</td>
    <td class="grayEF" align="left" > 
	    <html:text property="start_date" size="15" readonly="true"/>
	        	       <A onclick=event.cancelBubble=true;href="javascript:showCalendar('imageCalendar1',false,'start_date',null);"><IMG 
                        id=imageCalendar1 height=21 
                        src="/oa/img/button.gif" width=34 
                        align=absMiddle border=0></A> 
	    <html:errors property="start_date"/>
    </td>
    <td class="grayEF" align="left" width="10%">结束时间：</td>
    <td class="grayEF" align="left" >
	    <html:text property="end_date" size="15" readonly="true"/>
	        	        <A onclick=event.cancelBubble=true;href="javascript:showCalendar('imageCalendar2',false,'end_date',null);"><IMG 
                        id=imageCalendar2 height=21 
                        src="/oa/img/button.gif" width=34 
                        align=absMiddle border=0></A> 
	   <html:errors property="end_date"/>
	    
    </td>
  </tr>
 
<input type=hidden name=staff_id value=<%=staffId%>> 
    <tr>
    <td class="grayEF" align="right" colspan=4>
    	<input type="submit" name="Submit1" value="确定增加">
    </td>
    </tr>
</table>
 </html:form>
<body>
</html>
