<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.filingMgr.FilingInfo"%>
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%
	String cust_id = "", con_id = "",str1="";
	HttpSession logsession = request.getSession();
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("con_id") != null) {
		con_id = request.getParameter("con_id");
	}
	
	String media = bean.getSelectItems("99");
	
	FilingInfo filing = new FilingInfo();
	ArrayList filingList = filing.getValueById(cust_id);

	if (filingList != null && filingList.size() > 0) {
		for (int i = 0; i < filingList.size(); i++) {
			HashMap map = (HashMap) filingList.get(i);
			if (map.get("filing_name") != null) {
		String id = map.get("filing_id").toString();
		String name = map.get("filing_name").toString();
		str1 = str1 + "<option value=" + id + ">" + name
				+ "</option>";
			}
		}
	}
	
	String con_name="",con_no="";
	ConTractInfo hello = new ConTractInfo();
	ArrayList autoList = hello.getListByConId(cust_id,con_id);
	if (autoList != null && autoList.size() > 0) {
		HashMap map = (HashMap) autoList.get(0);
		if(map.get("con_name")!=null){con_name = map.get("con_name").toString();}
		if(map.get("con_no")!=null){con_no = map.get("con_no").toString();}
	}
%>
<html>
	<head>
		<title><bean:message key="str1580"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<style type="text/css" media="screen">
		.user-Img {
			background-image: url(/img/customer.png) !important;
		}
		
		.cust-Img {
			background-image: url(/img/home.png) !important;
		}
		</style>
		<script type="text/javascript">
	   //空值判断
	    function check_Value(){
	      if(!document.getElementById('check').checked){
	    	if(document.getElementById("filing_id").value=="" ||document.getElementById("filing_id").value==null){
		     alert("请选择档案名！");
		     document.autoForm.filing_id.focus();
		     return false;
		   }
		   if(document.getElementById("file_name").value=="" ||document.getElementById("file_name").value==null){
		     alert("请填写资料名！");
		     document.autoForm.file_name.focus();
		     return false;
		   }
		   if(document.getElementById("media").value=="" ||document.getElementById("media").value==null){
		     alert("请选择介质！");
		     document.autoForm.media.focus();
		     return false;
		   }
		  }
		   return true;
	    }
	    function test(){
	   		if(document.getElementById('check').checked){
		     	document.getElementById('s_div').style.display='block';
		     	document.getElementById('item').style.display='none';
		     	document.getElementById('div1').style.display='none';
		     	document.getElementById('div2').style.display='none';
		     	document.getElementById('div3').style.display='none';
		     	document.getElementById('div4').style.display='none';
		     	document.getElementById('trade_type_code').value='1264';
	   		}else{
	     		document.getElementById('s_div').style.display='none';
	     		document.getElementById('item').style.display='block';
	     		document.getElementById('div1').style.display='block';
		     	document.getElementById('div2').style.display='block';
		     	document.getElementById('div3').style.display='block';
		     	document.getElementById('div4').style.display='block';
	     		document.getElementById('trade_type_code').value='1268';
	   		}
	 	}
		</script>
	</head>
	<body>
		<form name=autoForm action=/doTradeReg.do method=post target="_self">
			<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width="15%">
						<bean:message key="str1588"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left colspan="3" width="85%">
						<div class="ping">
							<input name="con_name" type="text" id="con_name" size=30 maxlength=30 value="<%=con_name%>" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1589"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="con_no" type="text" id="con_no" size=30 maxlength=100 value="<%=con_no%>" readonly>
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div1">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1585"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<select id="filing_id" name="filing_id">
								<option><bean:message key="str2655"/></option>
								<%=str1%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div2">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right width=15%>
						<bean:message key="str1590"/>
					</td>
					<td style="background-color: #ffffff; color: #000000; font-size: 12px;" align=left width=35%>
						<div class="ping">
							<input name="file_name" type="text" id="file_name"  size="20" maxlength="20">
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div3">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str1591"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping">
							<select id="media" name="media">
								<option value=""><bean:message key="str2655"/></option>
								<%=media%>
							</select>
						</div>
					</td>
				</tr>
				<tr style="display:block" id="div4">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str1592"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<textarea id="file_desc" name="file_desc" rows="6" cols="50"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; text-align: right" align=right>
						<bean:message key="str2810"/>
					</td>
					<td align="left" bgcolor="#FFFFFF" colspan="3">
						<div class="ping1">
							<input name="remark" type="text" id="remark"  size="52" maxlength="50" >
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #f6f6f6; color: #000000; font-size: 12px;margin-left:25px" align=left colspan=4>
						<INPUT TYPE="checkbox" name="check" id="check" onclick="test()" style="margin-left:45px">
						<font color="red"><bean:message key="str1593"/></font> 
					</td>
				</tr>
				<tr style="display:none" id="s_div">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return check_Value()" style="background-image: url('/images/tj.gif'); width: 70px; height: 26px; border: 0; cursor: hand; text-align: center;">
					</td>
				</tr>
				<tr style="display:block" id="item">
					<td style="background-color: #f6f6f6; color: #000000; font-weight: bold; font-size: 12px; padding-top: 10px; padding-bottom: 10px; text-align: center;" align="center" colspan=4>
						<input name="comit" type="submit" value="" onclick="return check_Value()" style="background-image: url('/images/tjcx1.gif'); width: 100px; height: 26px; border: 0; cursor: hand; text-align: center;">
					</td>
				</tr>
				<tr>
					<td>
						<input name="trade_type_code" id="trade_type_code" type="hidden" value="1268">
						<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
						<input name="oper_date" id="oper_date" type="hidden" value="">
						<input name="user_id" id="user_id" type="hidden" value="">
						<input name="state_code" id="state_code" type="hidden" value="7">
						<input name="start_date" id="start_date" type="hidden" value="">
						<input name="end_date" id="end_date" type="hidden" value="2050-12-31">
						<input name="state_code_date" id="state_code_date" type="hidden" value="">
						<input name="state_resean" id="state_resean" type="hidden" value="已归档">
						<input name="con_id" id="con_id" type="hidden" value="<%=con_id%>">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>