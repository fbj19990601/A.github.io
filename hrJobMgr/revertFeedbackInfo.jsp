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
  if( request.getParameter( "resume_id" ) != null && request.getParameter( "resume_id" ) != "" )
  {
      root_id = request.getParameter( "resume_id" );
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
				if(document.getElementById("title").value=="")
				{
						alert("标题不能为空");
						return false;	
						document.getElementById("title").focus();
				}
				if(document.getElementById("content").value=="")
				{
						alert("内容不能为空");
						return false;	
						document.getElementById("content").focus();
				}
				return true;
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
								 <font size="5" color="red">&nbsp;&nbsp;<bean:message key="str1388"/></font>
								<hr width="100%" size="1" color="#CCCCCC" />
								<br/>
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td class="mainwz">
											<table width="100%" border="0" cellspacing="0" cellpadding="2">
												<tr>
												  <td width="97%">&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str1389"/><br />
												  </td>
												</tr>
											</table>
										</td>
									</tr>
							  </table>
								<br/>
								<hr width="100%" size="1" color="#CCCCCC" />
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mainwz">
									
									<tr>
										<td>
											<table style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="3" width="100%" bgcolor="#ffffff" border="0">
												<tbody>
										 			 <form method="post" name="trustpass" id="trustpass" action="/doTradeReg.do" onsubmit="return formCheckout();">
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
															<td valign="top" rowspan="2"><div align="right"><bean:message key="str3808"/></div>																			</td>
														  <td><textarea type="text" name="content" id="content" rows="5" cols="60"></textarea>
														    <span class="STYLE1">*</span>
														  </td>
														</tr>
														<input name="trade_id" type="hidden" value="<%=trade_id%>"/>
														<input name="root_id" type="hidden" value="<%=root_id%>"/>
														<input name="cust_id" type="hidden" value="<%=cust_id%>"/>
														<input name="user_id" type="hidden" value="<%=user_id%>"/>
														<input name="user_name" type="hidden" value="<%=user_name%>"/>
														<input name="phone" type="hidden" value="">
														<input name="email" type="hidden" value="">
														<input name="word_type" type="hidden" value="0">
														<input name="word_status" type="hidden" value="0">
														<input name="trade_type_code" type="hidden" value="1455">
														<tr>
															<td><input name="submit" type="submit" value=" 提 交 " /></td>
														</tr>
												  </form>
												 </tbody>
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
