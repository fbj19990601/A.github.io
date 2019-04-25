<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str1955"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css"/>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script type="text/javascript">
	function setCodeValue(){
	  	if(document.getElementById('factory').value==''&&document.getElementById('xcontury').value==''&&document.getElementById('keyword').value==''){ 
	  		alert('请您至少选填一个查询条件！');
	  		return false;
	  	}else{
	     	document.viewForm.submit();
	    }
  	}
</script>
<style type="text/css"> 　　
	.line{
		 BORDER-TOP: medium none; 
		 BORDER-LEFT: medium none;
		 border-right: medium none;
		 border-bottom: 1px solid #000000;
	}
</style>
</head>
<%       
    String url = request.getRequestURL().substring(0,25); 
%>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
	     
	    </td>
	  </tr>
	  <tr>
	    <td>
	     <form action="http://aaa.xsaas.com/searchIndex.jsp" method="post" name="viewForm">
	     	<input type="hidden" name="url" value="<%=url %>">
		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		      <tr>
                    <td colspan="2" width="100%" align="left" valign="top" style="border-left:2px solid #FF6600;border-top:2px solid #fff; border-bottom:1px solid #fff; padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; ">搜索潜在客户<bean:message key="str4721"/></td>
              </tr>
		     <tr>
					<td width="15%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str2477"/>
					</td>
					<td width="85%"  align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="factory" id="factory" type="text" value="" size="50" maxlength="50">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
					
	  		</tr>
	  		<tr>
					<td width="15%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
					<bean:message key="str1956"/>
					</td>
					<td width="85%" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="keyword" id="keyword" type="text" value="" size="25" maxlength="25">
						</div>
					</td>
					
	  		</tr>
	  		<tr>
					<td width="15%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str4720"/>
					</td>
					<td width="85%" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="xcontury" id="xcontury" type="text" value="" size="25" maxlength="25">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
					
	  		</tr>
	  		<tr>
					<td align="center" bgcolor="#FFFFFF" colspan="4">
							<input class="cxan" type="button" value="" style="cursor: hand" onclick="setCodeValue()">
					</td>
	  		</tr>
		    </table>
		    </form>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>