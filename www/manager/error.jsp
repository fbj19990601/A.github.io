<%@ page contentType="text/html;charset=GBK" %>
<%
	String BackStr="";
	String BackInfo="�����ɹ����Զ����أ�";
	if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("0"))
	{		 
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName=new String(request.getAttribute("BackItemName").toString().getBytes("ISO8859-1"), "utf-8");  
		String BackItemId=request.getAttribute("BackItemId").toString();
		String Backstaffid=request.getAttribute("Backstaffid").toString();
		BackItemName= new String(BackItemName.getBytes("ISO8859-1"), "utf-8"); 
		BackStr="./manage_it/"+BackPageName+"?OprUpItemId="+BackItemId;
		BackStr=BackStr+"&OprUpItemName="+BackItemName;
		BackStr=BackStr+"&OprStaffId="+Backstaffid;
	}
%>
<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="refresh" content="1;URL=<%=BackStr%>/">
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="80">&nbsp;</td>
  </tr>
  <tr>
    <td background="images/error_bg1.gif"> 
      <div align="center"><img src="web_it/images/error01.gif" width="656" height="342"></div>
    </td>
  </tr>
  <tr>
    <td>
      <div align="center">������ó ��Ȩ���� Copyright 2005 All rights reserved��<br>
        <font color="#FFFFFF">��������</font><a href="mailto:ahat@vip.sina.com.cn">ahqm@vip.sina.com.cn</a><font color="#FFFFFF">��</font> 
      </div>
    </td>
  </tr>
</table>
</body>
</html>
