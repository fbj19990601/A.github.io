<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.util.*"%>
<html>
	<head>
		<title><bean:message key="str4024"/></title>

		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="/js/prototype.js"></script>
		
		<script type="text/javascript">
		  function closeWind(){
		     window.opener=null;
		     window.close();
		  }
		  function confirmsub(){
		   if($F("field_name")==null || $F("field_name")==""){
		    Ext.Msg.alert("XSaaS Ã· æ","«ÎÃÓ–¥◊÷∂Œ√˚≥∆!");
		     return false;
		   }
		    return true;
		  }
		
		</script>
	</head>
	<%
	   String form_id="",field_id="",cust_id="",field_name="",
	   default_value="",field_no="",field_desc="",remark2="",field_type="";
	   HttpSession  logsession = request.getSession(); 
	   if (logsession.getAttribute("SESSION_CUST_ID") != null)
	   {
	        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	   }
	  if(request.getParameter("form_id")!=null){
	    form_id=request.getParameter("form_id");
	  }
	  if(request.getParameter("field_id")!=null){
	    field_id=request.getParameter("field_id");
	  } 
	  ArrayList list=formBean.getTemplateFormByField(cust_id,form_id,field_id);
	  if(list !=null && list.size()>0){
	    HashMap map=(HashMap)list.get(0);
	    if(map.get("field_name")!=null){field_name=map.get("field_name").toString();}
	    if(map.get("default_value")!=null){default_value=map.get("default_value").toString();}
	    if(map.get("field_no")!=null){field_no=map.get("field_no").toString();}
	    if(map.get("field_desc")!=null){field_desc=map.get("field_desc").toString();}
	    if(map.get("remark2")!=null){remark2=map.get("remark2").toString();}
	    if(map.get("field_type")!=null){
	     field_type=map.get("field_type").toString();
	     field_type=bean.getItemsBySelected("59",field_type);
	    }
	  }
	 %>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7" style="margin-top: 30px;">
				<tr>
					<td class="line1" colspan="3" style="background-color:#e2e2e2; color:#000000;font-weight:bolder;" height="25" width="150" align="center">
						<span style="font-size:18px;"><bean:message key="str4025"/></span>
					</td>
				</tr>

				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4012"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping">
							<select name="field_type" id="field_type">
							 <%=field_type%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4013"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping">
							<input type="text" name=field_name id="field_name" size="20" maxlength="50" value="<%=field_name%>">
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4014"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping1">
							<input type="text" name="default_value" id="default_value" size="20" maxlength="50" value="<%=default_value%>">
						</div>
					</td>
				</tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4015"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping1">
							<input name="field_no" type="text" id="field_no" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')" value="<%=field_no%>">
							<span style="margin-left: 5px"><bean:message key="str4026"/></span>
						</div>
					</td>
				</tr>

				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4017"/>
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping1">
							<textarea name="field_desc" id="field_desc" cols="50" rows="6"><%=field_desc%></textarea>
						</div>
					</td>
				</tr>
				<tr>
				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str164"/>
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping1">
							<input name="remark2" id="remark2" size="52" maxlength="50" value="<%=remark2%>">
						</div>
					</td>
				</tr>
				<input name="trade_type_code" type="hidden" value="1082">
				<input type="hidden" name="form_id" id="form_id" value="<%=form_id%>">
				<input type="hidden" name="field_id" id="field_id" value="<%=field_id%>">
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
