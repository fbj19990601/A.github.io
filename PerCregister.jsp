<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<jsp:useBean id="classBean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
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
	String post_addr = "";
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
	String class_level = "7";
	String cust_id=bean.GenTradeId();
	String root_id = bean.GenTradeId();
	String user_id = bean.GenTradeId();
	
	if (request.getParameter("email") != null)
		email = request.getParameter("email");
	if (request.getParameter("contact_phone") != null)
		contact_phone = request.getParameter("contact_phone");
	if (request.getParameter("post_addr") != null)
		post_addr = request.getParameter("post_addr");
	
	
	//������ʾ����
	String passReqList = param.getSelectItems("28");
	//������λ
	String workList =  param.getSelectItems("20");
	//�����̶�
	String degreeList = param.getSelectItems("39");
	AreaInfo arae = new AreaInfo();
	Map country_Map = new HashMap();
	country_Map = arae.getAreaByParent("5J2mc0X0G85BH");
	String select=classBean.getSelectedByComm("3","1");
%>
<html>
	<head>
		<title><bean:message key="str4482"/></title>
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
        font-family: ����;
        padding: 3px 3px;
        
        }
        .orange {float:left;
        border-color: #FF7300;
        border-style: solid;
        background-color: #FFF5D8;
        border-width: 1px;
        font-size: 12px;
        color: #000000;
        font-family: ����;
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
								<bean:message key="str3125"/>&nbsp;&nbsp;
								<label>
									<input type="checkbox" onclick="ContactVisabled(this.checked);">
								<bean:message key="str3126"/>
								</label> 
								&nbsp;&nbsp; 
							</div>
							<div id="lg_reg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="20%" height="30" align="right">
											<bean:message key="str3046"/>
										</td>
										<td width="32%">
											<input name="user_name" type="text" onfocus="user_name_focus(true);" onblur="user_name_focus(false);" maxlength="20" class="login_textarea" value="<%=user_name%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2">
											<div id="divUsername">
												<bean:message key="str1798"/>
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str1620"/>
										</td>
										<td>
											<input type="password" name="passwd" maxlength="20" onfocus="password_focus(true, 0);" onblur="password_focus(false, 0);" class="login_textarea">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" id="tdPassword">
											<div id="divPassword1">
												<bean:message key="str3127"/>
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str1039"/>
										</td>
										<td>
											<input type="password" name="passwd" maxlength="20" onfocus="password_focus(true, 1);" onblur="password_focus(false, 1);" class="login_textarea">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" id="tdRePassword">
											<div id="divPassword2">
												<bean:message key="str1168"/>
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
											<bean:message key="str5002"/>
										</td>
										<td>
											<input type="hidden" name="contact_name" value="<%=cust_name%>">
											<input type="text" name="cust_name" maxlength="20" onfocus="CCCName_focus(true, 1);" onblur="CCCName_focus(false, 1);" class="login_textarea" value="<%=cust_name%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" align="left">
											<div id="divCCCName">
												<bean:message key="str4621"/>
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str1626"/>
										</td>
										<td>
											<input type="text" name="email" size="50" maxlength="50" class="login_textarea" value="<%=email%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2">
											<div id="divQues">
												<bean:message key="str3128"/>
											</div>
											<input type="hidden" name="pspt_id" maxlength="20" value="0000">
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str3129"/>
										</td>
										<td colspan="4">
											<input name="group_contact_phone" type="text" size="25" maxlength="25" class="login_textarea" value="<%=contact_phone%>">
											<input name="phone" type="hidden" value="<%=contact_phone%>">
											<input name="contact_phone" type="hidden" value="<%=contact_phone%>">
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str1450"/>
										</td>
										<td>
											<input name="post_addr" type="text" size="21" maxlength="50" class="post_addr" value="<%=post_addr%>">
											<font color="#ff0000">*</font>
										</td>
										<td colspan="2" align="left">
											<div>
												<bean:message key="str3130"/>
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" align="right">
											<bean:message key="str3131"/>
										</td>
										<td>
											<input name="sex" type="radio" value="0" checked>
											   <bean:message key="str1057"/>
											<input type="radio" name="sex" value="1">
											<bean:message key="str1058"/>
										</td>
										<td colspan="2" align="right">
											&nbsp;
										</td>
									</tr>
									<tr style="display:none">
										<td height="30" align="right">
											<bean:message key="str3132"/>
										</td>
										<td>
											<input name="develope_channel" type="input" maxlength="10" size="10" value="<%=code%>" readonly="true">
										</td>
										<td colspan="2" align="right">
											&nbsp;
										</td>
									</tr>
									<tr id="trContact1" style="display:none">
										<td height="30" colspan="4" align="left">
											<div id="lg_title">
												<bean:message key="str3126"/>
											</div>
										</td>
									</tr>
									<tr id="trContact2" style="display:none">
										<td height="30" align="right" valign="middle">
											<bean:message key="str3467"/>
										</td>
										<td>
											<select name="passwd_ques" maxlength="25" class="login_textarea">
												<%=passReqList%>
											</select>
										</td>
										<td width="15%" align="right" id="tdQues">
											<bean:message key="str3467"/>
										</td>
										<td width="33%" id="tdQues">
											<input type="text" name="passwd_answer2" maxlength="25" class="login_textarea" onchange="passwd_ques_focus(true);" onblur="passwd_ques_focus(false);">
										</td>
									</tr>
									<tr id="trContact3" style="display:none">
										<td height="30" align="right" valign="middle">
											<bean:message key="str3133"/>
											<font color="#ff0000"> </font>
										</td>
										<td>
											<input type="text" name="qq" class="login_textarea">
										</td>
										<td align="right">
											<bean:message key="str3485"/>
										</td>
										<td align="left">
											<input name="birthday" type="text" id="birthday" onfocus="setday(this);" value="<%=fbtime%>" style="width:93px">
											(yyyy-mm-dd)
											<input type="hidden" name="home_addr" maxlength="40" class="login_textarea" value="">
										</td>
									</tr>
									<tr id="trContact4" style="display:none">
										<td height="30" align="right" valign="middle">
											<bean:message key="str3494"/>
										</td>
										<td>
											<input type="hidden" name="work_depart" maxlength="40" value="" class="login_textarea">
											<input type="text" name="work_name" maxlength="40" class="login_textarea">
										</td>
										<td align="right" id="trContact5">
											<bean:message key="str3497"/>
										</td>
										<td id="trContact5">
											<select name="educate_degree_code" style="width:100px">
												<%=degreeList%>
											</select>
										</td>
									</tr>
									<tr id="trContact6" style="display:none">
										<td height="30" align="right" valign="middle">
											<bean:message key="str1061"/>
										</td>
										<td>
											<select name="folk_code" style="width:100px;">
												<%=folk_code%>
											</select>
										</td>
										<td align="right">
											<bean:message key="str3134"/>
										</td>
										<td>
											<input type="text" name="blog" class="login_textarea">
										</td>
									</tr>
									<tr id="trContact7" style="display:none">
										<td height="30" align="right" valign="middle">
											<bean:message key="str3475"/>
										</td>
										<td>
											<select name="province" id="province" onclick="setCitys(this.value)">
												<option value="0">
													<bean:message key="str160"/>
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
											<input name="pspt_addr" type="hidden" maxlength="40" class="login_textarea" value="">
										</td>
										<td align=right>
											<bean:message key="str1049"/>
										</td>
										<td>
											<input type="hidden" name="local_native_code" value="">
											<select name="eparchy_code" id="eparchy_code" style="display:inline" onclick="setAreas(this.value)">
												<option value="0">
												  <bean:message key="str1050"/>
												</option>
											</select>
										</td>
									</tr>
									<tr id="trContact8" style="display:none">
										<td height="30" align="right" valign="middle">
										    <bean:message key="str1051"/>
										</td>
										<td>
											<select name="city" id="city" style="display:inline">
												<option value="0">
													  <bean:message key="str1079"/>
												</option>
											</select>
										</td>
										<td align="right">
											<bean:message key="str3494"/>
										</td>
										<td>
											<input type="text" name="work_name" maxlength="25" class="login_textarea" value="">
										</td>
									</tr>
									<tr id="trContact8" style="display:none">
										<td height="30" align="right" valign="middle">
											ͨ�ŵ�ַ��<bean:message key="str116"/>
										</td>
										<td>
											<input type="text" name="post_addr" maxlength="40" class="login_textarea">
										</td>
									</tr>
									<tr id="trContact17" style="display:none">
										<td>
											<input type="hidden" name="job" maxlength="25" value="">
											<input type="hidden" name="job_type_code" maxlength="25" value="1">
											<input name="marriage" type="hidden" value="0">
											<input name="community_id" type="hidden" value="">
											<input name="remark" type="hidden" value="�������˻�Ա">
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
								<input type="hidden" name="trade_type_code" value="1114">
								<input type="hidden" name="class_id" id="class_id" value="">
								<input type="hidden" name="class_level" value="<%=class_level%>">
								<input type="hidden" name="cust_class" value="<%=class_level%>">
								<input name="id" type="hidden" value="">
								<input type="hidden" name="scope" id="scope" value="">
								<input type="hidden" name="cust_aim" value="">
								<input type="hidden" name="group_memo" value="">
								<input type="hidden" name="calling_type_code" value="">
								<input type="hidden" name="company_address" value="">
								<input type="hidden" name="fax_nbr" value="">
								<input type="hidden" name="juristic" value="">
								<input type="hidden" name="user_count" value="1">
								<input type="hidden" name="website" value="">
								<input type="hidden" name="pspt_end_date" value="">
								<input type="hidden" name="population" value="">
								<input type="hidden" name="post_code" value="">
								<input type="hidden" name="fax" value="">
								<input type="hidden" name="property_type" value="0">
								<input type="hidden" name="property_value" value="0.00">
								<input type="hidden" name="cust_id" value="<%=cust_id%>">
								<input type="hidden" name="root_id" value="<%=root_id%>">
								<input type="hidden" name="session_cust_id" value="<%=cust_id%>">
								<input type="hidden" name="user_id" value="<%=user_id%>">
								<input type="hidden" name="session_user_id" value="<%=user_id%>">
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
													<a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/18.html"><bean:message key="str3597"/></a> |
													<a target="_blank" href="http://www.xsaas.com/html/XSaaSxinwen/20080519/22.html"><bean:message key="str4407"/></a> |
													<a href="javascript:void(0);" onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';if(window.location.href.toLowerCase().indexOf('www.xsaas.com') != -1){this.setHomePage('https://www.xsaas.com')}else{this.setHomePage('http://www.xsaas.com')};"><bean:message key="str2629"/></a>
													<br>
													            <bean:message key="str4483"/>
													<a href="http://www.miibeian.gov.cn/">B2-20060012</a><bean:message key="str2483"/>
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