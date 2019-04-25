<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.serverMgr.ServerInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.userMgr.UserDetailInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<html>
	<head>
		<title><bean:message key="str1075"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<style type="text/css">
.line6 {
	width: 72spx;
	width: 70spx !important;
	border: #ffcb99 1px solid;
	background-color: #fff8ee;
	text-align: left;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: #000000;
	margin-top: 13px;
	margin-bottom: 13px;
}  /*横栏样式6---- 头部提醒1*/
.line6 .img {
	width: 53px;
	height: 53px;
	float: left;
	margin-right: 20px;
}

.line6 .title {
	font-size: 14px;
	font-weight: bold;
	color: #ff5400;
}

.line1 {
	border-left: #ff7300 3px solid;
	background-color: #e2e2e2;
	color: #333333;
	text-align: left;
	font-size: 12px;
}  /*横栏样式1*/
h1 {
	float: left;
	padding-left: 8px;
	font-size: 15px;
	font-weight: bold;
	padding-top: 5px;
}

#td {
	width: 100px;
	text-align: right;
	margin-left: 5px;
	height: 30px;
	line-height: 30px;
}
</style>
		<script language="javascript">
	function checkInfo()
	{
		  if(confirm("确定要修改客户资料？"))
		  {
		  	return true;
		  }
		  else
		  {
		    return false;
		  }
	}
</script>
	</head>
	<%
		HttpSession logsession = request.getSession();
		String s_cust_id = "";
		if (logsession.getAttribute("SESSION_CUST_ID") != null) {
			s_cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
		}
		
		String cust_id = "", cust_name = "", cust_aim = "", fax_nbr = "", group_contact_phone = "", company_address = "", juristic = "", post_addr = "", job = "", qq = "", home_addr = "", blog = "", post_code = "", local_native_code = "", eparchy_code = "", province = "", group_memo = "", scope = "", website = "", user_count = "", user_id = "";
		boolean modify = false;
		if (request.getParameter("user_id") != null) {
			user_id = request.getParameter("user_id");
		}
		if (request.getParameter("obj_cust_id") != null) {
			cust_id = request.getParameter("obj_cust_id");
			cust_id=cust_id.trim();
			ArrayList servList = new ServerInfo().getCustSerevicByCustId(cust_id);
			if (cust_id == s_cust_id || cust_id.equals(s_cust_id)) {
				modify = true;
			} else if (servList != null && servList.size() > 0) {
				modify = false;
			} else {
				modify = true;
			}
		}
		String folk_code = bean.genOption("folk_code");
		ParamethodMgr paramCom = new ParamethodMgr();
		ArrayList workList = paramCom.getCompareInfo("CRM", "work_name");
		ArrayList degreeList = paramCom.getCompareInfo("CRM", "degree");
		ArrayList userCountList = paramCom.getCompareInfoByAttr("53");
		AreaInfo arae = new AreaInfo();
		
		Map country_Map = new HashMap();
		country_Map = arae.getCountryAllByCode("cn");
		
		Custinfo a = new Custinfo();
		ArrayList custList = a.genSpecCustInfo(cust_id);

		if (custList != null && custList.size() > 0) {
			HashMap map = (HashMap) custList.get(0);
			if (map.get("cust_name") != null) {
				cust_name = map.get("cust_name").toString();
			}
			if (map.get("cust_aim") != null) {
				cust_aim = map.get("cust_aim").toString();
			}
			if (map.get("fax_nbr") != null) {
				fax_nbr = map.get("fax_nbr").toString();
			}
			if (map.get("group_contact_phone") != null) {
				group_contact_phone = map.get("group_contact_phone")
				.toString();
			}
			if (map.get("company_address") != null) {
				company_address = map.get("company_address").toString();
			}
			if (map.get("juristic") != null) {
				juristic = map.get("juristic").toString();
			}
			if (map.get("group_memo") != null) {
				group_memo = map.get("group_memo").toString();
			}
			if (map.get("scope") != null) {
				scope = map.get("scope").toString();
			}
			if (map.get("website") != null) {
				website = map.get("website").toString();
			}
			if (map.get("user_count") != null) {
				user_count = map.get("user_count").toString();
			}
			if (map.get("eparchy_code") != null) {
				eparchy_code = map.get("eparchy_code").toString();
			}
			if (map.get("province") != null) {
				province = map.get("province").toString();
			}
		}
		
		UserDetailInfo b = new UserDetailInfo();
		ArrayList userList = b.getUserDetailByUserId(user_id,cust_id);
		
		
		if (userList != null && userList.size() > 0) {
			HashMap u_Map = (HashMap) userList.get(0);
			if (u_Map.get("home_addr") != null) {
				home_addr = u_Map.get("home_addr").toString();
			}
			if (u_Map.get("qq") != null) {
				qq = u_Map.get("qq").toString();
			}
			if (u_Map.get("blog") != null) {
				blog = u_Map.get("blog").toString();
			}
			if (u_Map.get("cust_name") != null) {
				cust_name = u_Map.get("cust_name").toString();
			}
			if (u_Map.get("post_addr") != null) {
				post_addr = u_Map.get("post_addr").toString();
			}
			if (u_Map.get("post_code") != null) {
				post_code = u_Map.get("post_code").toString();
			}
			if (u_Map.get("job") != null) {
				job = u_Map.get("job").toString();
			}
		}
		
	%>
	<font color="#000000"></font>
	<body>
		<form name=form1 action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7" style="margin-top: 10px;">
				<tr>
					<td class="line1" colspan="3" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" width="150" align="center">
						<%
							  if (!modify) {
								out.print("该客户已订购过相关的服务，你不能修改客户资料！");
							} else {
								out.print("修改客户资料！");
							}
						%>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td width="18%" align="right" style="color: #000000; font-weight: bolder;">
					<bean:message key="str1076"/>
					</td>
					<td colspan="2" align="left" width="82%">
						<div class="ping1">
							<input type="text" name="cust_name" readonly="readonly" size="20" maxlength="100" value="<%=cust_name%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str1653"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="cust_aim" size="30" maxlength="30" value="<%=cust_aim%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
					<bean:message key="str1699"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<select name="user_count" id="user_count">
								<%
										if (userCountList != null && userCountList.size() > 0) {
										for (int i = 0; i < userCountList.size(); i++) {
											HashMap map = (HashMap) userCountList.get(i);
											String value = map.get("para_code1").toString();
											String name = map.get("para_code2").toString();
											if (value.equals(user_count)) {
								%>
								<option value="<%=value%>" selected><%=name%></option>
								<%
								} else {
								%>
								<option value="<%=value%>"><%=name%></option>
								<%
										}
										}
									}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str3129"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="group_contact_phone" size="15" maxlength="20" value="<%=group_contact_phone%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str1184"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="fax_nbr" size="15" maxlength="20" value="<%=fax_nbr%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str1243"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="company_address" size="52" maxlength="40" value="<%=company_address%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str1262"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="home_addr" size="52" maxlength="52" value="<%=home_addr%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str1642"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="website" size="30" maxlength="50" value="<%=website%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str3494"/>
					</td>
					<td colspan="2" align="left">
						<div class="ping1">
							<select name="work_name" maxlength="25" class="login_textarea">
								<%
										if (workList != null && workList.size() > 0) {
										for (int i = 0; i < workList.size(); i++) {
											HashMap map = (HashMap) workList.get(i);
											String value = map.get("para_code1").toString();
											String name = map.get("para_code2").toString();
								%>
								<option value="<%=value%>">
									<%=name%>
								</option>
								<%
									}
									}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str1047"/>
					</td>
					<td colspan="2" align="left">
						<input type="hidden" name="province" id="province" value="<%=province%>">
						<input type="hidden" name="eparchy_code" id="eparchy_code" value="<%=eparchy_code%>">
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str1061"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<select name="folk_code" style="width: 100px;">
								<%=folk_code%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str1069"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<select name="educate_degree_code" style="width: 100px">
								<%
										if (degreeList != null && degreeList.size() > 0) {
										for (int i = 0; i < degreeList.size(); i++) {
											HashMap map = (HashMap) degreeList.get(i);
											String value = map.get("para_code1").toString();
											String name = map.get("para_code2").toString();
								%>
								<option value="<%=value%>">
									<%=name%>
								</option>
								<%
									}
									}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str1194"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="post_addr" size="30" maxlength="40" value="<%=post_addr%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str1195"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="post_code" size="12" maxlength="8" value="<%=post_code%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						QQ：
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="qq" size="12" maxlength="12" value="<%=qq%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none">
					<td style="color: #000000; font-weight: bolder;" align="right">
						Blog：
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="blog" size="52" maxlength="52" value="<%=blog%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9; display: none;">
					<td style="color: #000000; font-weight: bolder; font-weight: bolder;" align="right">
						<bean:message key="str1196"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="job" size="12" maxlength="10" value="<%=job%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td style="color: #000000; font-weight: bolder;" align="right">
						<bean:message key="str1197"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<input type="text" name="juristic" size="12" maxlength="15" value="<%=juristic%>">
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
					<bean:message key="str1198"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<textarea name="scope" cols="50" rows="6"><%=scope%></textarea>
						</div>
					</td>
				</tr>
				<tr style="background-color: #f9f9f9;">
					<td align="right" style="color: #000000; font-weight: bolder;">
						<bean:message key="str1199"/>
					</td>
					<td style="color: #000000; background-color: #FFFFFF" colspan="2" align="left">
						<div class="ping1">
							<textarea name="group_memo" cols="50" rows="6"><%=group_memo%></textarea>
						</div>
					</td>
				</tr>
				<%
				if (modify) {
				%>
				<tr style="background-color: #f9f9f9;">
					<td align="right" id="td" style="color: #000000;">
						&nbsp;
						<input type="hidden" name="cust_id" value="<%=cust_id%>">
						<input type="hidden" name="user_id" value="<%=user_id%>">
						<input type="hidden" name="birthday" value="">
						<input type="hidden" name="pspt_end_date" value="">
						<input type="hidden" name="marriage" value="">
						<input type="hidden" name="local_native_code" value="">
						<input type="hidden" name="trade_type_code" value="1049">
					</td>
					<td style="color: #000000; background-color: #FFFFFF; text-align: left" id="td" colspan="2" align="left">
						<input class="xgan" style="margin-left: 10px;" type="submit" value="" onClick="return checkInfo()">
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</body>
</html>


