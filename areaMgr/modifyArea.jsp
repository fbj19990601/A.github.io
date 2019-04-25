<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String channels_type=bean.getSelectItems("64");
	//String channels_id=comm.GenTradeId();
	HttpSession httpSess=request.getSession();
	String cust_id=(String)httpSess.getAttribute("SESSION_CUST_ID");
%>
<html>

	<head>
		<title><bean:message key="str4658"/></title>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/NewAreaList.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="eidtchannal.js"></script>
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
      </style>
	</head>
	<script language="javascript">
	function Check_Value()
	{
		  if(confirm("ȷ��Ҫ�޸ľ��������ϣ�"))
		  {
		     var name=document.getElementById("channels_name").value;
			    if(name=="" || name==null){
			      alert("Ƭ�����Ʋ���Ϊ�գ�");
			      return false;
			    }
		  	return true;
		  }
		  else
		  {
		    return false;
		  }
	}
    </script>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right> 
									<bean:message key="str4068"/> 
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="channels_type" id="channels_type">
											<%=channels_type%>
										</select> 
										&nbsp; <br></div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4651"/>
								</td>
								<td  align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>
									<bean:message key="str4652"/>
								</td>
								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="channels_name" type="text" id="channels_name" size=30 maxlength=50>
									</div>
								</td>
							</tr>
							<input name="up_channels_id" id="up_channels_id" type="hidden" value="">
							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
							<input name="channels_level" id="channels_level" type="hidden" value="0">
							<input name="channels_id" id="channels_id" type="hidden">

							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str446"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<textarea name="channels_desc" id="channels_desc" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1307"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="enable_tag" id="enable_tag">
											<option value="0">
												<bean:message key="str1308"/>
											</option>
											<option value="1">
												<bean:message key="str1309"/>
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000; font-weight:bold; font-size:12px;text-align: right">
									<bean:message key="str1569"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size=52 maxlength="50" />
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1099" />
							<tr>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" colspan=2 align="center">
										<input name="comit" type="submit" value="" onclick="return Check_Value()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
								</td>
							</tr>
							<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id %>">
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

