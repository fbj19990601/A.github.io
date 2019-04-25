<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html;charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<title><bean:message key="str664"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		  function setDatas(type){
		    document.getElementById("createType").value=type;
		  }
		</script>
	</head>
	<body>
		<br><br><br>
		<form name="creatform" method="post" id="creatform" action="build.jsp" target="_blank">
			<table width="500" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
				<tr>
					<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" width="60%" align="center">
						<bean:message key="str665"/>
					</td>
					<!--td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  width="150" align="center">生成数量</td-->
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" width="40%" align="center">
						<bean:message key="str666"/>
					</td>
				</tr>
				<!---生成说明   createType为生成类型: 0:首页 1:供应信息 2:求购信息  3：企业库  4:资讯 5:人才库 6:学院 7:企业管理---->
				<!---0:首页---->
				<tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str667"/><input name="createType" type="hidden" id="createType" value="0">
					</td>
					<!--input name="num" type="hidden" id="num" value="0"-->
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('0')">
					</td>
				</tr>
				<!---1:供应信息---->
				<tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str668"/>
					</td>
					
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('1')">
					</td>
				</tr>

				<!---2:求购信息---->

				<tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str669"/>
					</td>
					
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('2')">
					</td>
				</tr>
				<!---3:企业库---->
				<tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str670"/>
					</td>
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('3')">
					</td>
				</tr>

				<!---4:资讯---->

				<tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str671"/>
					</td>
					
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('4')">
					</td>
				</tr>
				<!---5:人才库---->
				<!--tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str672"/>
					</td>
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('5')">
					</td>
				</tr-->
				<!---6:学院---->
				<!--tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						<bean:message key="str673"/>
					</td>
					
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('6')">
					</td>
				</tr-->
				<!---7:企业管理--及相关页面数量
				<tr style="background-color:#f9f9f9;">
					<td style=" color:#000000;">
						企业管理
					</td>
					<td style=" color:#000000;">
						<input type="submit" name="Submit22" value=" Make " onclick="setDatas('7')">
					</td>
				</tr>-->
			</table>
		</form>
	</body>
</html>
