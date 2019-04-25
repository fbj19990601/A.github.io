<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.organizeMgr.OrganizeInfo"%>
<%@ page import="com.saas.biz.conUseMgr.ConUseInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="userInfo" class="com.saas.biz.userMgr.UserInfo" scope="page" />
<jsp:useBean id="deptInfo" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />
<%
	HttpSession  logsession = request.getSession(); 
	String cust_id = "",con_id="";
	con_id=comm.GenTradeId();
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if(request.getParameter("con_id")!=null){
    	con_id = request.getParameter("con_id");
    }
    OrganizeInfo orgInfo = new OrganizeInfo();
    String selectOrg = orgInfo.getSelectOrg(cust_id);
    
    ConUseInfo conuseInfo = new ConUseInfo();
    ArrayList conuseList = conuseInfo.getOneConuse(cust_id,con_id);
    String con_no="",obj_cust_id="",con_date="",con_class="",reason="",con_dept="",remark="";
    String user_name="",con_class_name="",con_dept_name="";
    if(conuseList!=null && conuseList.size()>0){
    	HashMap conuseMap = (HashMap)conuseList.get(0);
    	if(conuseMap.get("con_no")!=null){con_no = conuseMap.get("con_no").toString();}
    	if(conuseMap.get("obj_cust_id")!=null){
    		obj_cust_id = conuseMap.get("obj_cust_id").toString();
    		user_name = userInfo.getUserNameById(obj_cust_id);
    	}
    	if(conuseMap.get("con_date")!=null){con_date = conuseMap.get("con_date").toString().substring(0,10);}
    	if(conuseMap.get("con_class")!=null){
    		con_class = conuseMap.get("con_class").toString();
    		if(con_class!="" && !con_class.equals("")){
    			con_class_name = bean.getParaCode2ByParaCode1("93",con_class);
    		}
    	}
    	if(conuseMap.get("reason")!=null){reason = conuseMap.get("reason").toString();}
    	if(conuseMap.get("con_dept")!=null){
    		con_dept = conuseMap.get("con_dept").toString();
    		con_dept_name = deptInfo.getOrgnaizeById(con_dept);
    	}
    	if(conuseMap.get("remark")!=null){remark = conuseMap.get("remark").toString();}
    }
%>
<html>
	<head>
		<title>合同领用单信息<bean:message key="str1570"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<center>
			<table width="727" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td width="20%" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str1571"/>
								</td>
								<td width="80%" align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=user_name %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1572"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=con_no %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
							<bean:message key="str1573"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=con_date %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1574"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										   <%=con_class_name %>
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1575"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=con_dept_name %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1576"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=reason %>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str2810"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<%=remark %>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</center>
	</body>
</html>

