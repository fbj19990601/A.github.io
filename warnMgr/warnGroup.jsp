<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title><bean:message key="str4200"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript">
		  function setparamList(warn_type,iStart) {
		  if(warn_type =="" || warn_type ==null){
			alert("ÇëÑ¡ÔñÔ¤¾¯Ä£Ê½");
		  }else{
		    var user_id=$F('user_id');
		    var data = Math.round(Math.random() * 10000);
			var myAjax = new Ajax.Updater('param-div', 
					'paramList.jsp?iStart='+iStart+'&warn_type=' + warn_type + "&data=" + data+"&user_id="+user_id, 
					{
						method : 'get',
						evalScripts: true
					});
		  }
		}
		</script>
	</head>
	<%
	HttpSession logsession = request.getSession();
	String user_id = "";
	if (logsession.getAttribute("SESSION_USER_ID") != null) {
		user_id = logsession.getAttribute("SESSION_USER_ID").toString();
	}
	%>
	<body>
		<table width=900 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
			<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
					<bean:message key="str4203"/>
				</td>
				<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
					<div class="ping1">
						<select name="warn_type" id="warn_type" onchange="setparamList(this.value,'0')">
						   <option value="">
								<bean:message key="str4219"/>
							</option>
							<option value="0">
								E-mail
							</option>
							<option value="1">
								<bean:message key="str4220"/>
							</option>
							<option value="2">
								<bean:message key="str4221"/>
							</option>
						</select>
					</div>
				</td>
			</tr>
			<input type="hidden" name="user_id" id="user_id" value=<%=user_id%>>
			<tr>
			  <td colspan="2" style="background-color:#ffffff; color:#000000;  font-size:12px;">
			    <div id="param-div"></div>
			  </td>
			</tr>
		</table>
	</body>
</html>



