<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="java.util.*"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>

<%@ page import="com.saas.biz.commen.commMethodMgr"%>

<html>

	<head>

		<title><bean:message key="str4718"/></title>



		<link href="/style/layout.css" rel="stylesheet" type="text/css">

		<link href="/style/daohang.css" rel="stylesheet" type="text/css">

		<link href="/style/manager.css" rel="stylesheet" type="text/css">

		<script language="javascript" src="/js/Calendar_Ly.js"></script>

		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/interface/RelationUUInfo.js'></script>

		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/engine.js'></script>

		<script type='text/javascript'
			src='<%=request.getContextPath()%>/dwr/util.js'></script>



		<script type="text/javascript">

		function check()

		{

		    if(document.getElementById("title").value==""){

		      alert("请填写标题！");

              document.getElementById("title").focus();

		      return false;

		    }

			if(content.getText()=="")

			{

		          alert("请填写内容！");	

		          return false;

			}
			if(document.getElementById("info_date").value==""){
			
			
			        alert("时间不能为空！");
			        return false;
			}

			return true;

		}

    </script>

	</head>

	<%
		HttpSession logsession = request.getSession();
		String menu_id = "";
		String end_date = "";
		String cust_id = "";
		String obj_cust_id = "", factory = "";
		commMethodMgr commen = new commMethodMgr();
		String content = "", title = "";
		String entity_id = commen.GenTradeId();
		if (request.getParameter("obj_cust_id") != null) {
			obj_cust_id = request.getParameter("obj_cust_id");
		}
		if (request.getParameter("content") != null) {
			content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "GBK");
		}
		if (request.getParameter("factory") != null) {
			factory = new String(request.getParameter("factory").getBytes("ISO-8859-1"), "GBK");
		}
		if (request.getParameter("title") != null) {
			title = new String(request.getParameter("title").getBytes("ISO-8859-1"), "GBK");
		}
		if (request.getParameter("menu_id") != null) {
			menu_id = request.getParameter("menu_id");
		}
		if (logsession.getAttribute("SESSION_CUST_ID") != null)
		{
			cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
		}
		Calendar calend = Calendar.getInstance();
		end_date = new SimpleDateFormat("yyyy-MM-dd").format(calend.getTime());
	%>

	<body>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">

			<jsp:include page="/inc/top.jsp" />

			<tr>

				<!-- 中间 -->

				<td align="center">

					<div id="manager_body">

						<!--左边菜单-->

						<div id="manager_body_left">

							<jsp:include page="/inc/left.jsp" />

						</div>

						<div id="manager_body_right">

							<table width="100%" border="0" cellspacing="0" cellpadding="0">

								<tr>

									<td>

										<div id="righttop">

											<jsp:include page="/inc/menu.jsp">

												<jsp:param name="menu_id" value="<%=menu_id%>" />

											</jsp:include>

										</div>

									</td>

								</tr>

							</table>

							<table width="100%" border="0" cellspacing="0" cellpadding="0">

								<tr>

									<td align="center">





										<form name="departForm" id="departForm"
											action="/doCustomerWebTradeReg.do" method="post">



											<div class="bj1">

												<table width="100%" border="0" cellspacing="1"
													cellpadding="0">
													<tr>
														<td width="14%" bgcolor="#efefef">
															<div style="text-align:right; font-weight:bold;">
																<bean:message key="str1371"/>
															</div>

														</td>
														<td width="86%" align="left" bgcolor="#FFFFFF">
															<div class="ping">
																<%=factory %>
															</div>
														</td>
													</tr>
													<tr>
														<td width="14%" bgcolor="#efefef">
															<div style="text-align:right; font-weight:bold;">
																<bean:message key="str3811"/>
															</div>

														</td>
														<td width="86%" align="left" bgcolor="#FFFFFF">
															<div class="ping">
																<input type="text" id="title" name="title"
																	maxlength="70" size="76" value="<%=title %>">
															</div>
														</td>
													</tr>
													
													<tr>
														<td width="14%" bgcolor="#efefef">
															<div style="text-align:right; font-weight:bold;">
																<bean:message key="str3808"/>
															</div>
														</td>
														<td width="86%" align="left" bgcolor="#FFFFFF">
															<div class="ping">



																<textarea name="content" style="display:none"><%=content %></textarea>

																<iframe ID=content
																	src=/oa/webedit/ewebeditor.htm?id=content&style=coolblue&root_id=
																	<%=menu_id%> frameborder=0 scrolling=no width=550
																	HEIGHT=350></iframe>

															</div>

														</td>

													</tr>

													<tr>

														<td bgcolor="#efefef">

															<div style="text-align:right; font-weight:bold;">

																<bean:message key="str1953"/>

															</div>

														</td>

														<td align="left" bgcolor="#FFFFFF">

															<div class="ping">



																<input name="info_date" type="text" id="info_date"
																	onfocus="setday(this);" value="<%=end_date%>"
																	style="width:93px">

																(yyyy-mm-dd)

															</div>

														</td>

													</tr>

													<tr style="display:none">

														<td bgcolor="#efefef">

															<div style="text-align:right; font-weight:bold;">

																<bean:message key="str1952"/>

															</div>

														</td>

														<td align="left" bgcolor="#FFFFFF">

															<div class="ping1">

																<input name="attach_path" id="attach_path" type="hidden"
																	size=40 value="<%=entity_id%>">

																<iframe id="saveImag" name="saveImag"
																	style="margin-top:2px" frameborder="0" scrolling="no"
																	hspace="0" WIDTH="330" HEIGHT="25"
																	src="/inc/saveImage.jsp?root_id=<%=entity_id%>"></iframe>

															</div>

														</td>

													</tr>

													<tr>

														<td bgcolor="#efefef">

															<div style="text-align:right; font-weight:bold;">

																<bean:message key="str1010"/>

															</div>

														</td>

														<td align="left" bgcolor="#FFFFFF">

															<div class="ping1">

																<input type="text" id="remark" name="remark"
																	maxlength="50" size="30">

															</div>

														</td>

													</tr>
													<input type="hidden" name="trade_type_code" value="1053">
													<input type="hidden" name="entity_type" value="1">
													<input type="hidden" name="own_id" value="<%=obj_cust_id%>">
													<input type="hidden" name="cust_id" value="<%=cust_id%>">
													<input type="hidden" name="rela_id" value="">
													<input type="hidden" name="entity_id" value="<%=entity_id%>">
													<input type="hidden" name="up_info_id" value="">
													<input type="hidden" name="subject_tag" value="">
													<input type="hidden" name="rsrv_str10" value="<%=factory%>">
													<input type="hidden" name="info_state" value="0">
													<tr>
														<td height="40" colspan="2" bgcolor="#FFFFFF">
															<div align="center">
																<input class="tjan" type="submit" name="Submit" value="" onclick="return check()">
															</div>
													</tr>
												</table>
											</div>
										</form>
									</td>
								</tr>
							</table>
						</div>

					</div>

				</td>

			</tr>

			<tr>

				<td align="center">

					<div class="bottom_admin">

						<%@ include file="../../bottom.jsp"%>

					</div>

				</td>

			</tr>

		</table>

	</body>

</html>



