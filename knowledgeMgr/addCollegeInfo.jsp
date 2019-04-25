<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="java.util.Date"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="com.saas.biz.advertiseMgr.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />

<%@ page import="com.saas.biz.commen.commMethodMgr"%>

<%
	String repository_id = bean.GenTradeId();
	String fbtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	ParamethodMgr paramCom = new ParamethodMgr();
	String repository_type = paramCom.getSelectItems("77");
	commMethodMgr commen = new commMethodMgr();
	String idx = commen.GenTradeId();
%>



<html>

	<head>

		<title><bean:message key="str116"/></title>

		<link href="/style/css.css" rel="stylesheet" type="text/css">

		<style type="text/css">

.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/

.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}

.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}

.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/

</style>

		<script src="/www/fuction/calendar.js" type="text/javascript"></script>

		<script language="JavaScript" src="/www/fuction/public.js"></script>

		<script language="JavaScript">

  function Check_Value()
	{
			  if(document.getElementById("title").value.replace(/\s*/g,"")=="" || document.getElementById("title").value.replace(/\s*/g,"")==null)
				{
					alert("标题不可以为空!!!");
					document.getElementById("title").focus();
					return false;
				}
	                                                                                  

		var str=content.getHTML();
		str=str.replace(/\s*/g,""); 
		if(str == ""  )
		{
			alert("知识内容不可以为空!!!");
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
    	        if (!Check_Value())
    	        {
    	             return;
    	        }
    	         formobj.submit();   	         
    	}
</script>
	</head>
	<body>
		<table width="727" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="3"></td>
			</tr>
			<tr>
				<td>
					<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<form name=reposForm action=/doTradeReg.do method=post target="_self">
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str2665"/>
								<input name="trade_type_code" type="hidden" value="0421">
							</td>
							<td align=left bgcolor="#FFFFFF">
								<div class="ping1">
									<select name=repository_type>
										<%=repository_type%>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str2666"/>
							</td>
							<td align=left bgcolor="#FFFFFF">
								<div class="ping">
									<input name="title" type="text" size=30 maxlength=70>
								</div>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right valign=top>
								<bean:message key="str2667"/>
							</td>
							<td align=left bgcolor="#FFFFFF">
								<div class="ping">
									<textarea name="content" style="display:none"></textarea>
									<iframe ID=content src=/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=repository_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
								</div>
							</td>
						</tr>
						<input type="hidden" name="idx" value="<%=idx%>">
						<input name="repository_id" type="hidden" value=<%=repository_id%>>
						<input name="repository_class" type="hidden" value=0>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" colspan=2 align=center>
								<input class="tjan" name="submit" type="submit" value="" onclick="confirmsub(reposForm)">
							</td>
						</tr>
						</form>
					</table>
				</td>
			</tr>
			<tr>
				<td height="13"></td>
			</tr>
		</table>
	</body>
</html>

