<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.notifyMgr.NotifyInfo"%>
<%
	ArrayList notList = new ArrayList();
	HttpSession Hts = request.getSession();
	String menu_id = "";
	int iStart = 1;

	if (request.getParameter("menu_id") != null) {

		menu_id = request.getParameter("menu_id");

	}
	if (request.getParameter("iStart") != null) {

		iStart =Integer.valueOf(request.getParameter("iStart")).intValue(); 

	}

	String departCode = "";

	if (Hts.getAttribute("DEPART_CODE") != null) {

		departCode = (String) Hts.getAttribute("DEPART_CODE");

		notList = new NotifyInfo().getNotifyByPart(iStart, departCode);

	}

	int counter = new NotifyInfo().getNotifyByPartCT(departCode);
	int pages = 0;
	if(counter>0){
	   pages=counter/ 20 + 1;
    }
	int pageUp = 0, pageDown = 0;

	int currenPage = Integer.valueOf(iStart).intValue();

	if (pages > currenPage) {

		if (currenPage > 0) {

			pageUp = currenPage - 1;

		}

		pageDown = currenPage + 1;

	}

	else if (pages == currenPage) {

		pageUp = currenPage - 1;

		pageDown = currenPage;

	}

%>

<html>

	<head>

		<title><bean:message key="str2559"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
	</head>

	<body> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- 中间 -->
				<td align="center">
					<div id="manager_body">
						<!--左边菜单-->
						<div id="manager_body_left">
							<jsp:include page="/info/menu.jsp" />
						</div>
						<div id="manager_body_right">							 
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<th scope="col">
									<div class="containertwo">
										<div class="content">
											<div class="contentone">
												 

												<div class="contentone2">

													<div class="contentone3">

														<table width="100%" border="0" cellspacing="1"

															cellpadding="0">

															<tr>

																<td width="50%" bgcolor="FFF9F3">

																	<div style="color:#03428b; text-align: center"

																		class="notice">

																		<bean:message key="str2575"/>

																	</div>

															  </td>

																<td width="30%" bgcolor="FFF9F3">

																	<div

																		style="color:#03428b; text-align: center; margin-left:10px"

																		class="notice">

																		<bean:message key="str2576"/>

																	</div>

															  </td>

																<td width="20%" bgcolor="FFF9F3">

																	<div

																		style="color:#03428b; text-align: center; margin-left:10px"

																		class="notice">

																		<bean:message key="str2577"/>

																	</div>

															  </td>

															</tr>

															<%

																	if (notList != null && notList.size() > 0) {

																	for (int i = 0; i < notList.size(); i++) {

																		HashMap map = (HashMap) notList.get(i);

																		String id = map.get("id").toString();

																		String title = map.get("title").toString();

																		String user_name = map.get("user").toString();

																		String pubdate = map.get("pubtime").toString();

																		if (pubdate.length() > 10) {

																	      pubdate = pubdate.substring(0, 10);

																		}
																		if (title.length() > 28) {

																	      title = title.substring(0, 28);

																		}

															%>

															<tr>

																<td bgcolor="FFF9F3">

																	<div

																		style="text-align:left;  margin-left:10px; font-weight:100;">

																		<img src="/image/01.01.gif" width="14" height="7">

																		<a

																			href="viewNotifyIndex.jsp?id=<%=id%>&menu_id=<%=menu_id%>"><%=title%>

																		</a>

																	</div>

															  </td>

																<td bgcolor="FFF9F3">

																	<div

																		style="margin-left:10px; text-align:center; font-weight:100;">

																		<%=pubdate%>

																	</div>

															  </td>

																<td bgcolor="FFF9F3">

																	<div

																		style="margin-left:10px; text-align:center; font-weight:100;">

																		<%=user_name%>

																	</div>

															  </td>

															</tr>

															<%

																}

																}

															%>

															<tr>

																<td align="left" style="font-weight:normal;">

																	<bean:message key="str3988"/>

																	<%=counter%>

																	<bean:message key="str611"/> &nbsp;<bean:message key="str1027"/>

																	<%=pages%>

																	<bean:message key="str1029"/>

																</td>

																<td align="center" colspan="2"

																	style="font-weight:normal;">

																	<a

																		href="viewindex.jsp?iStart=1&menu_id=<%=menu_id%>&trade_type_code=0120"><bean:message key="str1030"/>

																	</a>&nbsp; &nbsp;

																	<a

																		href="viewindex.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_id%>&trade_type_code=0120"><bean:message key="str1031"/></a>

																	&nbsp;

																	<a

																		href="viewindex.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_id%>"><bean:message key="str1032"/>

																	</a>&nbsp;

																	<a

																		href="viewindex.jsp?iStart=<%=pages%>&menu_id=<%=menu_id%>"><bean:message key="str1033"/></a>

																</td>

															</tr>

													  </table>

													</div>

												</div>

											</div>

										</div>

									</div>

							</table>

						</div>

						<!--右边 主体部分结束  -->

					</div>

				</td>

				<!-- 中间 结束 -->

			</tr>

			<tr>

				<!-- 底部 -->

				<td align="center">

					<jsp:include page="/bottom.jsp"/>

				</td>

			</tr>

			<!-- 底部结束 -->

		</table>

	</body>

</html>

