<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String channels_type=bean.getSelectItems("64");
%>
<html>

	<head>
		<title><bean:message key="str4655"/></title>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/NewAreaList.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="dealerchannal.js"></script>
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
		.addCust {
	      	background-image:url(/img/add.png) !important;
        }
        .delCust {
	      	background-image:url(/img/error.png) !important;
        }
      </style>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=728 border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%"> 
									<bean:message key="str4068"/> 
								</td>
								<td align=left bgcolor="#FFFFFF" width="85%">
									<div class="ping1">
										<select name="channels_type" id="channels_type">
											<%=channels_type%>
										</select> 
										&nbsp; <br></div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4656"/>
								</td>
								<td  align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td width="100%" align="left" bgcolor="#FFFFFF" colspan="2">
								<div class="ping">
								    <div id="loading" style="display: none">
								       	<img src="/img/wait.gif" border="0"><bean:message key="str443"/>
								    </div>
								<div id="dealer-area-div"></div>
							   </td>
            				</tr>
							<input type="hidden" name="channels_type" id="channels_type"  value="0"/>
							<input type="hidden" name="channels_id" id="channels_id" value=""/>
							<input type="hidden" name="channles_name" id="channles_name" value=""/>
							<input type="hidden" name="trade_type_code" id="trade_type_code" value=""/>
							<input type="hidden" name="channels_id_grp" id="channels_id_grp" value=""/>
							<input type="hidden" name="channels_name_grp" id="channels_name_grp" value=""/>
							<input type="hidden" name="rsrv_str1" id="rsrv_str1" value=""/>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

