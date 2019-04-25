<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.*" %> 
<%
	String BackStr="";
	String BackInfo="";
	BackInfo="操作成功，自动返回！";
	 
	if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("0"))
	{		 
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName=request.getAttribute("BackItemName").toString();
		String BackItemId=request.getAttribute("BackItemId").toString();
		String Backstaffid=request.getAttribute("Backstaffid").toString();		
		BackStr="./manage_it/"+BackPageName+"?OprUpItemId="+BackItemId;
		BackStr=BackStr+"&OprUpItemName="+BackItemName;
		BackStr=BackStr+"&OprStaffId="+Backstaffid;
	} 
	if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("1"))
	{		 
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName=request.getAttribute("BackItemName").toString();
		String BackItemId=request.getAttribute("BackItemId").toString();
		String BackItemLevel=request.getAttribute("BackItemLevel").toString();
		String Backstaffid=request.getAttribute("Backstaffid").toString();		
		BackStr="./manage_it/"+BackPageName+"?ThisItemId="+BackItemId;
		BackStr=BackStr+"&ThisItemName="+BackItemName;
		BackStr=BackStr+"&ThisItemLevel="+BackItemLevel;
		BackStr=BackStr+"&StaffId="+Backstaffid;
	}
	
	if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("2"))
	{		 
		/*
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName="11";
		String BackItemId=request.getAttribute("BackItemId").toString();
		String BackItemLevel=request.getAttribute("BackItemLevel").toString();
		String Backstaffid=request.getAttribute("Backstaffid").toString();		
		BackStr="./manage_it/"+BackPageName+"?ThisItemId="+BackItemId;
		BackStr=BackStr+"&ThisItemName="+BackItemName;
		BackStr=BackStr+"&ThisItemLevel="+BackItemLevel;
		BackStr=BackStr+"&StaffId="+Backstaffid;
		BackStr=BackStr+"&Modify_Tag=0";
		*/
		BackStr="./manage_it/main.jsp";
		BackInfo="操作成功！请返回！";
		
	}
 	if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("3"))
	{		 
		/*
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName="11";
		String BackItemId=request.getAttribute("BackItemId").toString();
		String BackItemLevel=request.getAttribute("BackItemLevel").toString();
		String Backstaffid=request.getAttribute("Backstaffid").toString();		
		BackStr="./manage_it/"+BackPageName+"?ThisItemId="+BackItemId;
		BackStr=BackStr+"&ThisItemName="+BackItemName;
		BackStr=BackStr+"&ThisItemLevel="+BackItemLevel;
		BackStr=BackStr+"&StaffId="+Backstaffid;
		BackStr=BackStr+"&Modify_Tag=0";
		*/
		 
		BackInfo="操作成功！请返回！";
		
	}
	if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("4"))
	{		 
		 
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName=request.getAttribute("BackItemName").toString();
		String BackItemId=request.getAttribute("BackItemId").toString();		
		String Backstaffid=request.getAttribute("Backstaffid").toString();		
		BackStr="./manage_it/"+BackPageName+"?OprUpItemId="+BackItemId;
		BackStr=BackStr+"&OprUpItemName="+BackItemName;
		BackStr=BackStr+"&search_wcheck=0";
		BackStr=BackStr+"&StaffId="+Backstaffid;
		BackStr=BackStr+"&OpeType=0";

	}
		if (request.getAttribute("Back_Tag").toString().equalsIgnoreCase("5"))
	{		 
		 
		String BackPageName=request.getAttribute("BackPageName").toString();
		String BackItemName=request.getAttribute("BackItemName").toString();
		String BackItemId=request.getAttribute("BackItemId").toString();		
		String Backstaffid=request.getAttribute("Backstaffid").toString();		
		BackStr="./manage_it/"+BackPageName+"?OprUpItemId="+BackItemId;
		BackStr=BackStr+"&OprUpItemName="+BackItemName;
		BackStr=BackStr+"&search_wcheck=0";
		BackStr=BackStr+"&StaffId="+Backstaffid;
		BackStr=BackStr+"&OpeType=0";

	}
	
%>
<html>
<head>
<title>操作成功！</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%
	if ((!request.getAttribute("Back_Tag").toString().equalsIgnoreCase("2")) && (!request.getAttribute("Back_Tag").toString().equalsIgnoreCase("3")))
	{
%>
<meta http-equiv="refresh" content="1;URL=<%=BackStr%>/">
<% }%>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="80">&nbsp;</td>
  </tr>
  <tr>
    <td background="images/error_bg1.gif"> 
		<%=BackInfo%> 
	
      <!--div align="center"><img src="web_it/images/error01.gif" width="656" height="342"></div-->
    </td>
  </tr>
   
</table>
</center>
</body>
</html>
