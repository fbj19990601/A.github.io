<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.commen.config"%>
<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title><bean:message key="str3814"/></title>
<style type="text/css">
	.submit{
		background:url(../images/xg.gif) left center no-repeat;
		width:70px;
	 	height:26px;
		border:0px; 
	 	cursor:hand;
	}
</style>
</head>

<body>

<%
	config con = new config();
	ArrayList conList = con.getLogProperties();
	String logPath = con.getLogPath();
%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		    <td colspan="3" align="center">
		    	<font size="3" color="#0077cc"><b><bean:message key="str3815"/></b></font>
		    </td>
	 	</tr>
	 	<tr>
	 		<td height="5"></td>
	 	</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  		<tr>
		    <td width="2" background="/images/kehu_list_03.gif" height="8"></td>
		    <td width="704" background="/images/kehu_list_04.gif" height="8"></td>
		    <td width="2" background="/images/kehu_list_06.gif" height="8"></td>
  		</tr>
	</table>
	<form name="conForm" id="conForm" action="updateLogMgr.jsp" method="post" target="_self">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<input type="hidden" name="logPath" value="<%=logPath %>">
	  	    <input type="hidden" name="length" value="<%=conList.size() %>">
	  		<% 
	  			String name="",value="";
	  			if(conList!=null && conList.size()>0){
	  				for(int i = 0;i<conList.size();i++){
	  					HashMap conMap = (HashMap)conList.get(i);
	  					if(conMap.get("name")!=null){name = conMap.get("name").toString();}
	  					if(conMap.get("value")!=null){value = conMap.get("value").toString();}
	  		%>
	  			<tr>
		  			<td width="30%" bgcolor="#efefef" align="left">
						<div style="text-align:right; font-weight:bold;">
							<input type="text" id="name<%=i %>" name="name<%=i %>" value="<%=name %>" maxlength="100" size="30">
						</div>
		    		</td>
		    		<td width="3%"></td>
					<td width="67%" align="left" bgcolor="#FFFFFF" colspan="5">
						<div class="ping">
							<input type="text" id="value<%=i %>" name="value<%=i %>" value="<%=value %>" maxlength="100" size="50">
						</div>
				   </td>
				</tr>
	  		<%
	  				}
	  			}
	  		%>
	  		
	  		<tr>
			   <td height="13" colspan="3"></td>
			</tr>
	  
	</table>
	
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  		<tr>
		    <td width="2" background="/images/kehu_list_03.gif" height="8"></td>
		    <td width="704" background="/images/kehu_list_04.gif" height="8"></td>
		    <td width="2" background="/images/kehu_list_06.gif" height="8"></td>
  		</tr>
	</table>
	
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="13"></td>
		</tr>
  		<tr>
			<td align="center" colspan="3"> 
				<input class="submit" type="submit" name="Submit" value="" onclick="return check()">
			</td>
		</tr>
		<tr>
			<td height="30">
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>