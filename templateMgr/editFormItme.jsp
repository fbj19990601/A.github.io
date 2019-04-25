<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="itemBean" class="com.saas.biz.templateItemMgr.TemplateFormItem" scope="page" />
<%@ page import="java.util.*"%>
<html>
	<head>
		<title><bean:message key="str4040"/></title>
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
		   if($F("item_name")==null || $F("item_name")==""){
		     Ext.MessageBox("XSaaS 提示","请填写条目名称!");
		     return false;
		   }
		    return true;
		  }
		</script>
	</head>
	<%
	   String form_id="",item_id="",cust_id="",item_name="",
	   default_value="",item_no="",item_desc="",remark2="";
	   HttpSession  logsession = request.getSession(); 
	   if (logsession.getAttribute("SESSION_CUST_ID") != null)
	   {
	        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	   }
	  if(request.getParameter("form_id")!=null){
	    form_id=request.getParameter("form_id");
	  }
	  if(request.getParameter("item_id")!=null){
	    item_id=request.getParameter("item_id");
	  } 
	  ArrayList list=itemBean.getTemplateItemById(cust_id,form_id,item_id);
	  if(list !=null && list.size()>0){
	    HashMap map=(HashMap)list.get(0);
	    if(map.get("item_name")!=null){item_name=map.get("item_name").toString();}
	    if(map.get("default_value")!=null){default_value=map.get("default_value").toString();}
	    if(map.get("item_no")!=null){item_no=map.get("item_no").toString();}
	    if(map.get("item_desc")!=null){item_desc=map.get("item_desc").toString();}
	    if(map.get("remark2")!=null){remark2=map.get("remark2").toString();}
	  }
	 %>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7" style="margin-top: 30px;">
				<tr>
					<td class="line1" colspan="3" style="background-color:#e2e2e2; color:#000000;font-weight:bolder;" height="25" width="150" align="center">
						<span style="font-size:18px;"><bean:message key="str4041"/></span>
					</td>
				</tr>

				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str3411"/>
					</td>
					<td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
						<div class="ping">
							<input type="text" name="item_name" id="item_name" size="20" maxlength="50" value="<%=item_name%>">
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
							<input name="item_no" type="text" id="item_no" value="1" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')" value="<%=item_no%>">
							<span style="margin-left: 5px"> <bean:message key="str4026"/></span>
						</div>
					</td>
				</tr>

				<tr style="background-color:#f9f9f9; ">
					<td width="18%" align="right" style=" color:#000000; font-weight:bolder;">
						<bean:message key="str4029"/>
					</td>
					<td align=left bgcolor="#FFFFFF">
						<div class="ping1">
							<textarea name="item_desc" id="item_desc" cols="50" rows="6"><%=item_desc%></textarea>
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
				<input name="trade_type_code" type="hidden" value="1081">
				<input type="hidden" name="form_id" id="form_id" value="<%=form_id%>">
				<input type="hidden" name="item_id" id="item_id" value="<%=item_id%>">
				<tr style="background-color:#f9f9f9; ">
					<td height="40" colspan="3" style="color:#000000;text-align: center;">
						<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/xg.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
						<input name="close" type="button" value="" onclick="return closeWind()" style="background-image: url('/images/gb.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
