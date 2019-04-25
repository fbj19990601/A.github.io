<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<html>
	<head>
		<title><bean:message key="str1734"/></title>
		
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GroupInfo.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/RelationUUInfo.js'></script> 
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
      
        <script type="text/javascript">
		function check()
		{
			if(document.getElementById("cust_id").value=="")
			{
				alert("选择联系人！");
				return false;
			}
			if(document.getElementById("user_id").value=="")
			{
				alert("选择客户！");
				return false;
			}
			return true;
		}
		function setUsers(cust){
		  if(cust!="0"){
		    document.getElementById("con").style.display="block"; 
		    var own_id=document.getElementById("own_id").value;
		    RelationUUInfo.getContactUserByCustId(cust,own_id,setUserData);
		  }else{
		   document.getElementById("con").style.display="none";
		  }
		}
		function setUserData(data){
		       DWRUtil.removeAllOptions("user_id");
	           DWRUtil.addOptions("user_id",data);
		}
    </script>
	</head>
	<%
	HttpSession  logsession = request.getSession(); 
	String menu_id = "";
	String end_date="";
	String cust_id="",uesr_id="";
	if(request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        uesr_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }
    Calendar calend=Calendar.getInstance();
    calend.add(Calendar.YEAR,50);
    end_date=new SimpleDateFormat("yyyy-MM-dd").format(calend.getTime());
    ArrayList cust_list=new RelationCcInfo().getRelationByCustId(cust_id);
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
							<table width="740" border="0" cellspacing="0" cellpadding="0">
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
														action="/doTradeReg.do" method="post" target="_self">
														
															<div class="bj1">
																<table width="100%" border="0" cellspacing="1"
																	cellpadding="0">
																	<tr>
																		<td width="19%" bgcolor="#efefef">
																			<div style="text-align:right; font-weight:bold;">
																				<bean:message key="str1735"/>																			</div>																	  </td>
																		<td width="81%" align="left" bgcolor="#FFFFFF">
																			<div class="ping">
																			  <select id="cust_id" name="cust_id" maxlength="50" onclick="setUsers(this.value);">
																					<option value="0">
																						<bean:message key="str2655"/>																				</option>
																					<%
																					  if(cust_list !=null && cust_list.size()>0){
																					     for(int i=0;i<cust_list.size();i++){
																					       HashMap map=(HashMap)cust_list.get(i);
																					       String cust_idx="",cust_name="";
																					       cust_idx=map.get("obj_cust_id").toString();
																					       cust_name=map.get("cust_name").toString();
																					  %>
																					   <option value="<%=cust_idx%>"><%=cust_name%></option>
																					  <%    
																					     }
																					  }
																					%>
																			  </select>
																	  </div>																	  </td>
																	</tr>
																	<tr id="con" style="display: none">
																		<td width="19%" bgcolor="#efefef">
																			<div style="text-align:right; font-weight:bold;">
																				<bean:message key="str3189"/>																			</div>																	  </td>
																		<td width="81%" align="left" bgcolor="#FFFFFF">
																			<div class="ping">
																			  <select id="user_id" name="user_id" maxlength="50" size="5"></select>
																	  </div>																	  </td>
																	</tr>
																	<tr style="display: none">
																		<td bgcolor="#efefef">
																			<div style="text-align:right; font-weight:bold;">
																				<bean:message key="str1617"/>																			</div>																	  </td>
																		<td align="left" bgcolor="#FFFFFF">
																			<div class="ping">
																			  <input name="end_date" type="text" id="end_date"
																					onfocus="setday(this);" value="<%=end_date%>" size="15"
																	>
																	  (yyyy-mm-dd) </div>																	  </td>
																	</tr>
																	<input type="hidden" name="trade_type_code" value="1051">
																	<input type="hidden" name="relation_uu_code" value="0">
																	<input type="hidden" name="own_id" id="own_id" value="<%=uesr_id%>">
																	<tr>
																		<td height="30" colspan="2" bgcolor="#FFFFFF">
																			<div align="center">
																				<input class="tjan" type="submit" name="Submit" value="" onclick="return check()">
																	</div>																	</tr>
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


