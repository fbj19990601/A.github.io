<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="msgBean" class="com.saas.biz.infoMsg.InfoMsg" scope="page" />
<%
	String sys_code = "";
	int limit = 6;
	if (request.getParameter("subsys_code") != null) {
		sys_code = request.getParameter("subsys_code");
	}
	String cust_id = "", user_id = "", depart = "", user_name = "";
	HttpSession htps = request.getSession();
	if (htps.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = htps.getAttribute("SESSION_CUST_ID").toString();
	}
	if (htps.getAttribute("SESSION_USER_ID") != null) {
		user_id = htps.getAttribute("SESSION_USER_ID").toString();
	}
	if (htps.getAttribute("DEPART_CODE") != null) {
		depart = htps.getAttribute("DEPART_CODE").toString();
	}
	if (htps.getAttribute("SESSION_USER_NAME") != null) {
		user_name = htps.getAttribute("SESSION_USER_NAME").toString();
	}
	String itianary = "", notice = "", letters = "", study = "";
	String careStr="",newsStr="",stockStr="",saleStr="";
	if (sys_code == "OA" || sys_code.equalsIgnoreCase("oa") || sys_code.equalsIgnoreCase("HELP")) {
	itianary = msgBean.getItineraryByUser(user_name, limit);
	notice = msgBean.getNoticeByPart(depart, limit,cust_id);
	letters = msgBean.getLetterBy(user_name, limit);
	study = msgBean.getStudyInfoByPartOrUser(user_name, depart, limit);
	}else if(sys_code == "CRM" || sys_code.equalsIgnoreCase("crm")) {
	careStr=msgBean.getCareByCust(cust_id,limit);
	newsStr=msgBean.getNewsByCust(cust_id,limit);
	stockStr=msgBean.getStockListByCust(cust_id,limit);
	saleStr=msgBean.getSaleInfoByCust(cust_id,limit);
	}
%>
<html>
	<head>
		<title><bean:message key="str3100"/></title>
		<style type="text/css">
		a:link {
		      font-size:9pt;color:#000000; text-decoration:none
		}
		a:visited {
		      font-size:9pt; color:#000000; text-decoration:none
		}
		a:active {
		      font-size:9pt; color:#000000; text-decoration:none
		}
		a:hover {
		      font-size:9pt; color:#0099ff; text-decoration:none
		}
     </style>
	</head>
	<body>
		<%
		if (sys_code == "OA" || sys_code.equalsIgnoreCase("oa") || sys_code.equalsIgnoreCase("HELP")) {
		%>
		<table width="670" border="0" cellspacing="0 valign="top"">
			<tr>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								<bean:message key="str3066"/>
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=itianary%>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								<bean:message key="str3067"/>
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=notice%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								<bean:message key="str3068"/>
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=letters%>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								<bean:message key="str3069"/>
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=study%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%
			}
			else if (sys_code == "CRM" || sys_code.equalsIgnoreCase("crm")) {
		%>
		<table width="670" border="0" cellspacing="0">
			<tr>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								<bean:message key="str3070"/>
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=careStr%>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								<bean:message key="str3071"/>
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=newsStr%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		<!-- 	<tr>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								农产品求购
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=stockStr%>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table width="330" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; margin-bottom:5px; height:35px">
						<tr style="margin-bottom: 1px;margin-top: 1px;">
							<td width="30%" align="center" class="line1">
								农产品供应
							</td>
						</tr>
						<tr>
							<td width="70%" style="margin-left: 5px;height: 115px;" align="left">
								<%=saleStr%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			 -->
		</table>
		<%
		}
	else
	    {
		%>
		  
		<font style="font-size:12">
    		 
            &nbsp;&nbsp;&nbsp;&nbsp;
            <bean:message key="str4572"/>
<br>&nbsp;&nbsp;&nbsp;&nbsp;
            <bean:message key="str4573"/> 
         </font>
		<%}%>
		
	</body>
</html>
