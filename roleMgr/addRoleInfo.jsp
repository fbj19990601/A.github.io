<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />

<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%

	ArrayList list=bean.getCompareInfoByAttr("45");

	String role_code=comm.GenTradeId();

%>

<html>
	<head>
		<title><bean:message key="str348"/></title>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="role_wind.js"></script>
		<script language="JavaScript">
	    function Check_Value()
		{
		    if(document.getElementById("role_name").value==""){
		      alert("Character can not be empty!");
		      document.getElementById("role_name").focus();
		      return false;
		    }
	 	    return true;
		}
		
	    function check_none(current_obj)
	    {
	        if (current_obj.advshow.checked)
	        {
	      	    current_obj.submit1.disabled=false;        	     
	      	}
	      	else
	      	{
	      	    current_obj.submit1.disabled=true;
	      	}
	  	 }

    	function confirmsub(formobj)
    	{
    	    if(window.confirm('submit it?')) 
    	    {  	    	
    	        if (Check_Value())
    	        {
    	            formobj.submit();   	
    	        }
    	    }
    	    else
    	    {
    	        return;
    	    }
    	}
     </script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
									<bean:message key="str349"/>
								</td>
								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="role_name" type="text" id="role_name" size=30 maxlength=30><input type="button" name="show-btn" id="show-btn" value="Show role">
									</div>
								</td>
							</tr>
							<input name="role_code" id="role_code" type="hidden" value="<%=role_code%>">
							 <input name="enable_tag" id="enable_tag" type="hidden" value="0">
							<input name="role_type" id="role_type" type="hidden" value="0">
							 
							<div id="role_div"></div>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str181"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size=30 maxlength="500" />
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1029" />
							<tr>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" colspan=2 align="center">
									<INPUT name="advshow" type="checkbox" value="0" onclick="check_none(resumeForm)">
									<bean:message key="str354"/>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
									<input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

