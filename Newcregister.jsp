<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<jsp:useBean id="classBean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
	<style type="text/css">
		<!--
		body {
		 
			background-image:url(/zone_b2b/images/bgt.jpg);
			background-attachment: scroll;
			background-repeat: no-repeat;
			background-position: center top;
		}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
			-->
		</style>
<%
	String work_depart = bean.genOption("work_depart");
	String calling_type_code = bean.genOption("calling_type_code");
	String folk_code = bean.genOption("folk_code");
	String fbtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String code = "";
	String codeedit = "true";
	String user_name = "";
	String cust_name = "";
	String email = "";
	String contact_phone = "";
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
		codeedit = "false";
	}
	if (request.getParameter("user_name") != null)
		user_name = request.getParameter("user_name");
	if (request.getParameter("cust_name") != null) {
		cust_name = request.getParameter("cust_name");
		try {
			cust_name = new String(cust_name.getBytes("ISO8859_1"), "GBK");
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	String class_level = "1";
	
	if (request.getParameter("email") != null)
		email = request.getParameter("email");
	if (request.getParameter("contact_phone") != null)
		contact_phone = request.getParameter("contact_phone");
	
	
	//密码提示问题
	String passReqList = param.getSelectItems("28");
	//工作单位
	String workList =  param.getSelectItems("20");
	//教育程度
	String degreeList = param.getSelectItems("39");
	AreaInfo arae = new AreaInfo();
	Map country_Map = new HashMap();
	country_Map = arae.getAreaByParent("5J2mc0X0G85BH");
	String select=classBean.getSelectedByComm("3","1");
%>
<html>
	<head>
		<title>Registration</title>
		<link href="/style/login.css" rel="stylesheet" type="text/css">
		<link href="/css/layout.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
        .green {float:left;
        border-color: #485E00;
        border-style: solid;
        background-color: #F7FFDD;
        border-width: 1px;
        font-size: 12px;
        color: #485E00;
        font-family: 宋体;
        padding: 3px 3px;
        
        }
        .orange {float:left;
        border-color: #FF7300;
        border-style: solid;
        background-color: #FFF5D8;
        border-width: 1px;
        font-size: 12px;
        color: #000000;
        font-family: 宋体;
        padding: 3px 3px;
        
        }
    </style>
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/newcregister.js" language="jscript" type="text/jscript"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/zone_b2b/js/newRreg.js"></script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<center>
			<div id="login-body">
				<div id="lg_content">

					<form method="post" name="NewRegisterForm" id="NewRegisterForm" action=/register.do onsubmit="return Check_Value() ">
						<div id="lg_text">
							<div id="lg_title">
								<label>
									<input type="checkbox" checked disabled="disabled">
								</label>
								Basic information&nbsp;&nbsp;
								<label>
									<input type="checkbox" onclick="ContactVisabled(this.checked);">
									Select information
								</label>
								&nbsp;
								<input type="checkbox" name="checkbox22" onclick="CompanyVisabled(this.checked)")>
								Company information
							</div>
							<div id="lg_reg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="20%" height="30" align="right">
											Account：
										</td>
										<td width="32%">
											<input name="user_name" type="text" onfocus="user_name_focus(true);" onblur="user_name_focus(false);" maxlength="20" class="login_textarea" value="<%=user_name%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2">
											<div id="divUsername">
												Up to 20 characters, only English lowercase letters and numbers
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											Password：
										</td>
										<td>
											<input type="password" name="passwd" maxlength="20" onfocus="password_focus(true, 0);" onblur="password_focus(false, 0);" class="login_textarea">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" id="tdPassword">
											<div id="divPassword1">
												Password from 6-20 in English letters  or numbers 
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											Confirm Password：
										</td>
										<td>
											<input type="password" name="passwd" maxlength="20" onfocus="password_focus(true, 1);" onblur="password_focus(false, 1);" class="login_textarea">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" id="tdRePassword">
											<div id="divPassword2">
												Please enter again。
											</div>
										</td>
									</tr>
									<input type="hidden" name="relation_type_code" value="1">
									<input type="hidden" name="pspt_type_code" value="0">
									<input type="hidden" name="user_type" value="0">
									<input type="hidden" name="rsrv_str1" value="0">
									<input type="hidden" name="exist" value="0">
									<input type="hidden" name="passwd_answer" value="0">
									<tr>
										<td height="30" align="right">
											Customer Name：
										</td>
										<td>
											<input type="text" name="cust_name" maxlength="20" onfocus="CustName_focus(true, 1);" onblur="CustName_focus(false, 1);" class="login_textarea" value="<%=cust_name%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" align="left">
											<div id="divCustName">
												Please enter the full name of Chinese enterprises 
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											Email：
										</td>
										<td>
											<input type="text" name="email" size="50" maxlength="100" class="login_textarea" value="<%=email%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2">
											<div id="divQues">
												Please write the e-mail carefully, the system will be activated e-mail sent to the mailbox 
											</div>
											<input type="hidden" name="pspt_id" maxlength="20" value="0000">
										</td>
									</tr>

									<tr>
										<td height="30" align="right">
											Phone ：
										</td>
										<td colspan="4">
											<input name="group_contact_phone" type="text" size="25" maxlength="25" class="login_textarea" value="<%=contact_phone%>">
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											Sex：
										</td>
										<td>
											<input name="sex" type="radio" value="0" checked>
											Man
											<input type="radio" name="sex" value="1">
											Woman
										</td>
										<td colspan="2" align="right">&nbsp;
											
										</td>
									</tr>
									<tr style="display:none">
										<td height="30" align="right">
											Authorization code：
										</td>
										<td>
											<input name="develope_channel" type="input" maxlength="10" size="10" value="<%=code%>" readonly="true">
										</td>
										<td colspan="2" align="right">&nbsp;
											
										</td>
									</tr>
									<tr id="trContact1" style="display:none">
										<td height="30" colspan="4" align="left">
											<div id="lg_title">
												Select information
											</div>
										</td>
									</tr>

									<tr id="trContact2" style="display:none">
										<td height="30" align="right" valign="middle">
											Security question ：
										</td>
										<td>
											<select name="passwd_ques" maxlength="25" class="login_textarea">
												<%=passReqList%>
											</select>
										</td>
										<td width="15%" align="right" id="tdQues">
											Security question ：
										</td>
										<td width="33%" id="tdQues">
											<input type="text" name="passwd_answer2" maxlength="25" class="login_textarea" onchange="passwd_ques_focus(true);" onblur="passwd_ques_focus(false);">
										</td>
									</tr>
									<tr id="trContact3" style="display:none">
										<td height="30" align="right" valign="middle">
											QQ ：
											<font color="#ff0000"> </font>
										</td>
										<td>
											<input type="text" name="qq" class="login_textarea">
										</td>
										<td align="right">
											Address：
										</td>
										<td align="left">
											<input type="text" name="home_addr" maxlength="40" class="login_textarea">
										</td>
									</tr>
									<tr id="trContact4" style="display:none">
										<td height="30" align="right" valign="middle">
											Departments ：
										</td>
										<td>
											<select name="work_depart" class="login_textarea">
												<%=work_depart%>
											</select>
										</td>
										<td align="right" id="trContact5">
											Education level：
										</td>
										<td id="trContact5">
											<select name="educate_degree_code" style="width:100px">
												<%=degreeList%>
											</select>
										</td>
									</tr>
									<tr id="trContact6" style="display:none">
										<td height="30" align="right" valign="middle">
											National：
										</td>
										<td>
											<select name="folk_code" style="width:100px;">
												<%=folk_code%>
											</select>
										</td>
										<td align="right">
											Birthday：
										</td>
										<td>
											<input name="birthday" type="text" id="birthday" onfocus="setday(this);" value="<%=fbtime%>" style="width:93px">
											(yyyy-mm-dd)
										</td>
									</tr>
									<tr id="trContact7" style="display:none">
										<td height="30" align="right" valign="middle">
											Documents address：
										</td>
										<td>
											<input name="pspt_addr" type="text" maxlength="40" class="login_textarea">
										</td>
										<td align=right>
											Province：
										</td>
										<td>
											<select name="province" id="province" onclick="setCitys(this.value)">
												<option value="0">
													Please select..
												</option>
												<%
														if (country_Map != null && country_Map.size() > 0) {
														Iterator it = country_Map.entrySet().iterator();
														while (it.hasNext()) {
															Map.Entry entry = (Map.Entry) it.next();
															Object key = entry.getKey();
															Object value = entry.getValue();
												%>
												<option value=<%=key%>>
													<%=value%>
												</option>
												<%
													}
													}
												%>
											</select>
										</td>
									</tr>
									<tr id="trContact8" style="display:none">
										<td height="30" align="right" valign="middle">
											city：
										</td>
										<td>
											<select name="eparchy_code" id="eparchy_code" style="display:inline" onclick="setAreas(this.value)">
												<option value="0">
													Please select..
												</option>
											</select>
										</td>
										<td align="right">
											county：
										</td>
										<td>
											<select name="city" id="city" style="display:inline">
												<option value="0">
													Please select ..
												</option>
											</select>
										</td>
									</tr>
									<tr id="trContact8" style="display:none">
										<td height="30" align="right" valign="middle">
											Communication Address：
										</td>
										<td>
											<input type="text" name="post_addr" maxlength="40" class="login_textarea">
										</td>
									</tr>
									<tr id="trContact13" style="display:none">
										<td align="right" valign="middle">
											blog ：
										</td>
										<td>
											<input type="text" name="blog" class="login_textarea">
										</td>
										<td align="right">
											Work units ：
										</td>
										<td>
											<select name="work_name" maxlength="25" class="login_textarea">
												<%=workList%>
											</select>
										</td>
									</tr>
									<tr id="trContact17" style="display:none">
										<td align="right" valign="middle">
											Posts：
										</td>
										<td>
											<input type="text" name="job" maxlength="25" class="login_textarea">
										</td>
										<td align="right">
											Marital status ：
										</td>
										<td>
											<input type="radio" name="marriage" value="1">
											Yes
											<input name="marriage" type="radio" value="0" checked>
											No
										</td>
									</tr>
									<tr>
										<td colspan="4" valign="top">
											<div id="lg_title">
												<span id="spnCompany" style="display: none">&nbsp; Basic Company Infomation </span>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="4" valign="top">
											<table id="tabCompany" width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none">
												<tr>
													<td width="19%" height="30" align="right">
														Company Name：
													</td>
													<td width="33%">
														<input name="cust_aim" type="text" maxlength="40" class="login_textarea">
													</td>
													<td width="14%" align="right">
														Address：
													</td>
													<td width="34%">
														<input name="company_address" type="text" maxlength="40" size="40" class="login_textarea">
													</td>
												</tr>

												<tr>
													<td height="30" align="right">
														Corporate Site：
													</td>
													<td>
														<input name="website" type="text" size="25" maxlength="25" class="login_textarea">
													</td>
													<td align="right">
														Number of employees：
													</td>
													<td>
														<select name="user_count" class="login_textarea">
															<option value="1">
																10-20 
															</option>
															<option value="2">
																20-50 
															</option>
															<option value="3">
																50-60 
															</option>
														</select>
													</td>
												</tr>
												<tr>
													<td height="30" align="right">
														Fax ：
													</td>
													<td>
														<input name="fax_nbr" type="text" size="15" maxlength="15" class="login_textarea">
													</td>
													<td align="right">
														Sectors：
													</td>
													<td>
														<select name="calling_type_code" style="width:100px">
															<%=calling_type_code%>
														</select>
													</td>
												</tr>

												<tr>
													<td height="30" align="right">
														Legal representative：
													</td>
													<td colspan="3">
														<input type="text" name="juristic" maxlength="15" class="login_textarea">
													</td>
												</tr>
												<tr>
													<td height="30" align="right">
														Main Industry ：
													</td>
													<td colspan="3">
														<table>
															<tr>
						                                                                 <td style="background-color:#ffffff; color:#000000;  font-size:12px;">
																<select name="sort1" size="10" style="width: 130px" onChange="setSecondClass(this.value);" onclick="setTypeName(this)">
																	<%=select%>
																</select>
															</td>
															<td style="background-color:#ffffff; color:#000000; font-size:12px;">
																<select name="sort2" size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value);" onclick="setTypeName(this)">
																	<option value="0">
																		Please select...
																	</option>
																</select>
															</td>
															<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
																<select name="sort3" size="10" style="width: 130px; display: none" onclick="setTypeName(this)" onchange="cretateSelect('4',this.value)">
																	<option value="0">
																		Please select...
																	</option>
																</select>
															</td>
															<td>
																<div id="nextElement" style="display: none">
																	<div id="4" style="width;100px; float:left;display:inline;white-space:nowrap"></div>
																	<input type="hidden" name="index_s" id="index_s" value="4">
																</div>
															</td>
															</tr>
														</table>
													</td>
												</tr>


												<tr>
													<td height="30" align="right">
														Business ：
													</td>
													<td colspan="3">
														<textarea name="group_memo" cols="50" rows="6"></textarea>
													</td>
												</tr>
												<!--tr>
					                                <td height="30" align="right">Strategic objectives 　</td>
					                                <td>　
					                                    <textarea name="cust_aim" cols="45" rows="6"></textarea>
					                                    <font color="#ff0000">*</font> 
					                                </td>
					                            </tr-->
												<input type="hidden" name="cust_aim" value="">
												<tr>
													<td height="90" align="right">
														Company Profile：
													</td>
													<td height="90" colspan="3">
														<textarea name="scope" cols="50" rows="6"></textarea>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div id="lg_text">
							<div id="lg_title1">
								<br>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
								<input type="image" name="imageField2" src="/images/tong.gif">
								<input type="hidden" name="trade_type_code" value="0810">
								<input type="hidden" name="class_id" id="class_id" value="">
								<input type="hidden" name="class_level" value="<%=class_level%>">
								<input type="hidden" name="cust_class" value="<%=class_level%>">
								<input name="id" type="hidden" value="">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="login_bottom"></div>
			<table>
				<tr>
					<td align="center">
						<div class="bottom_admin">
							<div class="containertow">
								<div class="footer">
									<div class="footer3" style="margin-top:6px">
										<div class="cpy width margin">
											<div class="about">
												<p align="center">
													<a target="_blank" href="http://www.21oil.com/html/XSaaSxinwen/20080519/18.html">Contact us </a> |
													<a target="_blank" href="http://www.21oil.com/html/XSaaSxinwen/20080519/22.html">Disclaimer </a> |
													<a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.21-oil.com') != -1){this.setHomePage('https://www.21-oil.com')}else{this.setHomePage('http://www.21-oil.com')};">Homepage </a>
													<br>
													 <title>Copyright ? 1998-2008. Orient Overseas Container Line Limited. All rights reserved. 
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
