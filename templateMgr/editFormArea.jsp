<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.util.*"%>
<html>
	<head>
		<title><bean:message key="str4030"/></title>
		<link href="/crm/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="/js/prototype.js"></script>
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		h1 {float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
		#td{
		width:100px;
		text-align:right;
		margin-left:5px;
		height:30px;
		line-height:30px;
		}
		</style>
		<script type="text/javascript">
		  function closeWind(){
		     window.opener=null;
		     window.close();
		  }
		  function confirmsub(){
		   if($F("area_name")==null || $F("area_name")==""){
		     Ext.MessageBox("XSaaS 提示","请填写区域名称!");
		     return false;
		   }
		    return true;
		  }
		</script>
	</head>
	<%
	   String form_id="",area_name="", area_id="",cust_id="",area_no="1";
	    HttpSession  logsession = request.getSession(); 
	   if (logsession.getAttribute("SESSION_CUST_ID") != null)
	    {
	        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	    }
	  if(request.getParameter("form_id")!=null){
	    form_id=request.getParameter("form_id");
	  }
	  if(request.getParameter("area_id")!=null){
	    area_id=request.getParameter("area_id");
	  } 
	  HashMap map=formBean.getTeplateAreaById(cust_id,form_id,area_id);
	  if(map.get("area_name")!=null){
	    area_name=map.get("area_name").toString();
	  }
	  if(map.get("area_no")!=null){
	    area_no=map.get("area_no").toString();
	  }
	 %>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7" style="margin-top: 30px;">
				<tr>
					<td class="line1" colspan="3" style="background-color:#e2e2e2; color:#000000;font-weight:bolder;" height="25" width="150" align="center">
						<span style="font-size:18px;"><bean:message key="str4031"/></span>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4032"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping">
							<input type="text" name=area_name id="area_name" size="20" maxlength="50" value="<%=area_name%>">
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4033"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping1">
							<input name="area_no" type="text" id="area_no" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')" value="<%=area_no%>">
							<span style="margin-left: 5px"><bean:message key="str4026"/></span>
						</div>
					</td>
				</tr>
				<input name="trade_type_code" type="hidden" value="1083">
				<input type="hidden" name="form_id" id="form_id" value="<%=form_id%>">
				<input type="hidden" name="area_id" id="area_id" value="<%=area_id%>">
				<tr style="background-color:#f9f9f9; ">
					<td height="40" colspan="3" style="color:#000000;text-align: center;">
						<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
						<input name="close" type="button" value="" onclick="return closeWind()" style="background-image: url('/images/gb.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
