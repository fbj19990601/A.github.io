<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%
	HttpSession  logsession = request.getSession(); 
	String menu_id = "";
	String end_date="";
	String cust_id="",user_id="";
	if(request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
	if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }
    Calendar calend=Calendar.getInstance();
    calend.add(Calendar.YEAR,50);
    end_date=new SimpleDateFormat("yyyy-MM-dd").format(calend.getTime());
    //
    RelationCcInfo relationC=new RelationCcInfo();
    ArrayList list=relationC.getRelationByCustId(cust_id);
  %>
<html>
	<head>
		<title><bean:message key="str1611"/></title>

		<link href="/style/layout.css" rel="stylesheet" type="text/css">

		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GroupInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OrganizeInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/EntityClassInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="grid-table.js"></script>
		<style type="text/css">
		.Tree-Img {
        background-image:url(/img/resume.png) !important;
        }
	    .root-Img {
	    background-image:url(/img/customer.png) !important;
        }
		.delCust {
          background-image:url(/img/error.png) !important;
        }
	    .addCust {
	      background-image:url(/img/add.png) !important;
        }
        .refresh {
	      background-image:url(/img/refresh.png) !important;
        }
		</style>
	</head>
	<body onload="createTree()">
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
									
										
													<form name="departForm" id="departForm" action="/doTradeReg.do" method="post" target="_self">
														
															<div class="bj1">
																<table width="100%" border="0" cellspacing="1" cellpadding="0">
																	<tr>
																		<td width="14%" bgcolor="#efefef">
																			<div style="text-align:right; font-weight:bold;">
																				<bean:message key="str1612"/>
																			</div>
																	  </td>
																		<td width="86%" align="left" bgcolor="#FFFFFF">
																			<div class="ping">
																			
																			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                  <td><div id="tree-div" style="display:inline;float:left;"></div>
                                                                                </tr>
                                                                              </table>
																		  </div>
																	  </td>
																	</tr>
																	<tr>
																		<td width="100%" align="left" bgcolor="#FFFFFF" colspan="2"><div class="ping">
																		    <div id="loading" style="display: none">
																		     <img src="/img/wait.gif" border="0"><bean:message key="str1613"/>
																		    </div>
																			<div id="custListDiv"></div>
																	  </td>
																	</tr>
																	<input type="hidden" name="trade_type_code" value="">
																	<input type="hidden" name="relation_uu_code" value="0">
																	<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
																	<input name="class_id" id="class_id" type="hidden" value="">
																	<input name="user_id" id="user_id" type="hidden" value="">
																	<input name="class_name" id="class_name" type="hidden" value="">
																	<input name="group_type" id="group_type" type="hidden" value="1">
																	<input name="entity_type" id="entity_type" type="hidden" value="0">
																	<input name="entity_id" id="entity_id" type="hidden" value="">
																	<input name="subject_tag" id="subject_tag" type="hidden" value="">
																	<input name="own_id" id="own_id" type="hidden" value="<%=user_id%>">
																	<input name="rela_id" id="rela_id" type="hidden" value="">
																	<input name="remark" id="remark" type="hidden" value="客户分类">
																	
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
