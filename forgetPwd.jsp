<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<title><bean:message key="str334"/>(http://soft.xsaas.com)</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ParamethodMgr.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript">
		 function confirmsub(){
		     var user_name=$F("user_name");
		     if(user_name=="" || user_name==null){
		       Ext.MessageBox.alert("XSaaS Tips","Please fill in the correct account £¡")
		       return;
		     }
		     if($F("cust_name")=="" || $F("cust_name")==null){
		       Ext.MessageBox.alert("XSaaS Tips","Please fill in the correct name £¡")
		       return;
		     }
		     UserInfo.getUserInfByName(user_name,checkEmail);
		 }
		 function checkEmail(data){
		   var obj=$H(data);
		   var passwd_answer=obj.get("passwd_answer");
		   if(passwd_answer !="" && passwd_answer!=null){
		     $("hide0").style.display="block";
		     $("hide4").style.display="block";
		    var passwd_ques=obj.get('passwd_ques');
		     ParamethodMgr.getParamNameByValue("28",passwd_ques,function(name){
		       $("request").innerHTML=name+"£º";
		     });
		   }else{
		      if(obj.size()==0){
		         Ext.MessageBox.alert("XSaaS Tips","Account does not exist £¡<br>Please fill in the correct account £¡");
		      }else{
			       Ext.MessageBox.alert("XSaaS Tips","You do not have a password-protected application £¡<br>System will be sent to the E-mail password, please check£¡");
			       $("hide1").style.display="none";
			       $("hide2").style.display="block";
		       }
		   }
		 }
		 
		 //
		 function checkAnswer(value){
		     var user_name=$F("user_name");
		    UserInfo.getUserInfByName(user_name,function(data){
		       var obj=$H(data);
		       var passwd_answer=obj.get("passwd_answer");
		       if(passwd_answer == value){
		         $("hide3").style.display="block";
		         $("hide1").style.display="none";
		         $("hide2").style.display="block";
		       }else{
		         Ext.MessageBox.alert("XSaaS Tips","Wrong answer£¡Please fill in again£¡");
		       }
		    });
		 }
		 //
		 function check(){
		    var mail=$F("email");
		    var type=$("hide3").style.display;
		    if(type=="block"){
			 if (mail.charAt(0)=="." || mail.charAt(0)=="@"|| mail.indexOf('@', 0) == -1 || mail.indexOf('.', 0) == -1 || mail.lastIndexOf("@") ==mail.length-1 || mail.lastIndexOf(".")==mail.length-1)
			 {
				Ext.MessageBox.alert("XSaaS Tips","Email's not in the correct format£¡");;
				return false;
			 }
			}else{
			 return true;
			}
		 }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top: 25px">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=center width="100%" colspan="2">
									<bean:message key="str3045"/>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="25%">
									<bean:message key="str3046"/>
								</td>
								<td align=left bgcolor="#FFFFFF" width="75%">
									<div class="ping">
										<input type="text" name="user_name" id="user_name" size="25" maxlength="100">
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3227"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="cust_name" id="cust_name" size="25" type="text" maxlength="100">
									</div>
								</td>
							</tr>
							<tr id="hide0" style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=left colspan="2">
									<bean:message key="str3467"/>
								</td>
							</tr>
							<tr id="hide4" style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<div id="request"></div>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="passwd_answer" id="passwd_answer" size="15" type="text" maxlength="100" onblur="checkAnswer(this.value)">
									</div>
								</td>
							</tr>
							<tr id="hide3" style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str128"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="email" id="email" size="25" type="text" maxlength="100"><bean:message key="str3047"/>
									</div>
								</td>
							</tr>
							<tr id="hide1">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan="2">
									<input name="comit" type="button" value="" onclick="confirmsub()" style="background-image: url('/images/xyb.gif');width:70px;height: 26px;border:0;cursor:hand">
								</td>
							</tr>
							<input type="hidden" name="trade_type_code" value="1160">
							<tr id="hide2" style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan="2">
									<input name="commit" type="submit" value="" onclick=" return check()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand">
								</td>
							</tr>
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

