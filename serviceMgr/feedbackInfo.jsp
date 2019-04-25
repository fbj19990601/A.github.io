<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%@ page import="com.saas.biz.userMgr.UserDetailInfo"%>

<%
	commMethodMgr commen = new commMethodMgr();
  String trade_id = commen.GenTradeId();			
  String root_id="";
  if( request.getParameter( "root_id" ) != null && request.getParameter( "root_id" ) != "" )
  {
  		root_id = request.getParameter( "root_id" );
  } 
	else
	{
			root_id = "BO8SJKa0Iqg8iix";
	}
  HttpSession  logsession = request.getSession();     
  String cust_id="",user_id="",user_name="";
  if (logsession.getAttribute("SESSION_CUST_ID") != null)
  {
    cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
  }
  //out.print( cust_id );
	if (logsession.getAttribute("SESSION_USER_ID") != null)
  {
    user_id = logsession.getAttribute("SESSION_USER_ID").toString();
  }
  if (logsession.getAttribute("SESSION_USER_NAME") != null)
  {
    user_name = logsession.getAttribute("SESSION_USER_NAME").toString();
  }
  
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key="str116"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script>
		function formCheckout()
		{
		 if(document.getElementById("title").value.replace(/\s*/g,"")=="" || document.getElementById("title").value.replace(/\s*/g,"")==null)
		{
			alert("主题不能为空!!!");
			document.getElementById("title").focus();
			return false;
		}
		
			/* if(document.getElementById("title").value=="")
				{
				  alert("主题不能为空");
				  return false;	
					document.getElementById("title").focus();
				}*/
		 if(document.getElementById("content").value.replace(/\s*/g,"")=="" || document.getElementById("content").value.replace(/\s*/g,"")==null)
		{
			alert("内容不能为空!!!");
			document.getElementById("content").focus();
			return false;
		}
			/*	if(document.getElementById("content").value=="")
				{
						alert("内容不能为空");
						return false;	
						document.getElementById("content").focus();
				}*/
				return true;
			}
	
	function check(trustpass){
		if(trustpass.phone.value==""){
			alert("请输入联系电话!");
			trustpass.phone.focus();
			return false;
		}
		if(!checktel(trustpass.phone.value)){
			alert("您输入的联系电话不正确!");
			trustpass.phone.focus();
			return false;
		}
	}

	function checktel(phone){
		var str=phone;
		 //在JavaScript中，正则表达式只能使用"/"开头和结束，不能使用双引号
		var Expression=/(\d{3}-)?\d{8}|(\d{4}-)(\d{7})/; 
		var objExp=new RegExp(Expression);
		if(objExp.test(str)==true){
			return true;
		}
	
		else
		{
		  return false;
		}
	}	
 </script>
  </head>
	<body>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table width="600" height="300" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td> 
								<br/>
								 <font size="5" color="red">&nbsp;&nbsp;<bean:message key="str3789"/></font>
								<hr width="100%" size="1" color="#CCCCCC" />
								<br/>
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td class="mainwz">
											<table width="100%" border="0" cellspacing="0" cellpadding="2">
												<tr>
												  <td width="97%">&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str3790"/><br />
												  &nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str4616"/></td>
												</tr>
											</table>
										</td>
									</tr>
							  </table>
								<br/>
								<hr width="100%" size="1" color="#CCCCCC" />
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mainwz">
									<tr>
										<td height="20" class="weizhi">&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str3791"/></td>
									</tr>
									<tr>
										<td>
											<table style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="3" width="100%" bgcolor="#ffffff" border="0">
												<tbody>
										 			 <form method="post" name="trustpass" id="trustpass" action="/doTradeReg.do" onsubmit="return formCheckout();">
														 <tr bgcolor="#f7f7f7">
														   <td valign="bottom">
														   	<div align="right"><bean:message key="str3792"/></div>	
														   </td>
														    <td valign="bottom" nowrap="nowrap" height="26">
															   	<input language="javascript" type="radio" checked="checked" value="4" name="word_type" /> <bean:message key="str3793"/> 
																	<input language="javascript" type="radio" value="8" name="word_type" /> <bean:message key="str3794"/> 
																	<input language="javascript" type="radio" value="6" name="word_type" /> <bean:message key="str3795"/> 
																	<input language="javascript" type="radio" value="7" name="word_type" /> <bean:message key="str3796"/> 
																	<input language="javascript" type="radio" value="5" name="word_type" /> <bean:message key="str3797"/>
															 </td>
														</tr>
														<tr>
														  <td valign="bottom" bgcolor="#FFFFFF">
														  	<div align="right"><bean:message key="str3798"/></div>																			
														  </td>
														  <td valign="bottom" bgcolor="#FFFFFF">
														  	<input type="text" maxlength="200" size="48" name="title" id="title"/>
													      <span class="STYLE1">*</span>
													    </td>
														</tr>
														<tr>
														  <td valign="bottom" nowrap="nowrap" bgcolor="#f7f7f7"><div align="right"><bean:message key="str3799"/></div></td>
														  <td valign="bottom" bgcolor="#f7f7f7">
														  	<input type="text" maxlength="50" size="48" name="user_name" id="user_name" value="<%=user_name%>"/>
													      <span class="STYLE1">*</span>																			
													    </td>
														</tr>
														<tr>
														  <td valign="bottom"><div align="right"><font face="Verdana"><bean:message key="str3800"/></font></div> </td>
															<td valign="bottom">
																<input type="text" maxLength=15 size=18 name="phone" id="phone" onblur="check(trustpass)"/ >
																 <span class="STYLE1">*</span>
															</td>
														</tr>
														<tr bgcolor="#f7f7f7">
														  <td valign="bottom" bgcolor="#f7f7f7"><div align="right"><font face="Verdana">E-Mail：</font></div></td>
														  <td valign="bottom" bgcolor="#f7f7f7">
														    <div align="left">
														      <input type="text" maxlength="50" size="48" name="email" id="email" />
												         </div>
												      </td>
														</tr>
														<tr>
															<td valign="top" rowspan="2"><div align="right"><bean:message key="str3808"/></div>																			</td>
														  <td><textarea type="text" name="content" id="content" rows="5" cols="60"></textarea>
														    <span class="STYLE1">*</span>
														  </td>
														</tr>
														<input name="trade_id" type="hidden" value="<%=trade_id%>"/>
														<input name="root_id" type="hidden" value="<%=root_id%>"/>
														<input name="cust_id" type="hidden" value="<%=cust_id%>"/>
														<input name="user_id" type="hidden" value="<%=user_id%>"/>
														<input name="word_status" type="hidden" value="0">
														<input name="trade_type_code" type="hidden" value="1455">
														<tr>
															<td><input name="submit" type="submit" value=" 提 交 " /></td>
														</tr>
												  </form>
												 </body>
												 </table>
											  </td>
											 </tr>
										  </table>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td>&nbsp;</td>
												</tr>
											</table>
											</td>
										</tr>
							  </table>
							</td>
						</tr>
					</table>
    </body>
</html>
