<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<title>My JSP 'sch_top.jsp' starting page</title>
<script type="text/javascript" src="/zone_b2b/js/index.js"></script>
<script type="text/javascript" src="/js/prototype.js"></script>
<script language="javascript">
		  function checkRelation(){
		    var keyWords=document.getElementById("keyword").value;
		    keyWords=delAllSpace(keyWords);
		    if(keyWords !="" || keyWords=="请输入你要查的关键字"){
		        return true;
		    }else if(keyWords.indexOf("公司")>0){
		        alert('请输入正确的关键字，否则会影响你的查询结果！');
		        return false;
		    }else{
		      alert('请输入关键字，否则会影响你的查询结果！');
		      document.getElementById("keyword").focus();
		      return false;
		    }
		  }
		  function checkKey(){
		    var keyWords=document.getElementById("keyword").value;
		    keyWords=delAllSpace(keyWords);
		    if(keyWords==""||keyWords==null){
		       document.getElementById("keyword").value="请输入你要查的关键字";
		    }
		  }
		  function delAllSpace(str) {
			return str.replace(/^\s+|\s+$/g, "")
		 }
		</script>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="23" align="center" background="/zone_b2b/images/ba_02.gif">
			<table width="980" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<a href=#
							onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.xsaas.com');">设为首页</a>
						|
						<a
							href="javascript:window.external.AddFavorite('http://www.xsaas.com', '玻璃巴巴')">把"玻璃巴巴"加入我的收藏夹</a>
						|
						<span id="date-time"></span>
					</td>
					<td align="right">
						<img src="/zone_b2b/images/Max.gif" width="15" height="12"
							align="absmiddle" />
						<a href="/service/vip.html"><bean:message key = "str3592"/></a> <bean:message key="str2107"/>
						<a href="/service/webad.html"><bean:message key="str2108"/></a> |
						<a href="/service/website.html"> <bean:message key = "str2109"/></a> |
						<a href="/huodong/jingbi/default.html"><bean:message key="str2110"/></a> |
						<a href="/index.jsp"><bean:message key="str2111"/></a><bean:message key="str5085"/>
						<a href="/service/contact.html"> <bean:message key="str2478"/></a> |
						<a href="/support/default.html"> <bean:message key="str3598"/></a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="980" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="50" valign="bottom">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="157">
						<img src="/zone_b2b/images/ba_13.gif" alt="" width="157"
							height="45" />
					</td>
					<td valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="5">
							<tr>
								<td>
									<bean:message key="str2518"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td align="right">
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right">
						<a href="/"><img src="/zone_b2b/images/ba_06.gif" width="56"
								height="21" border="0" alt="登录" />
						</a> &nbsp;
						<a href="/Newcregister.jsp"><img
								src="/zone_b2b/images/ba_08.gif" width="79" height="21"
								border="0" alt="免费注册" />
						</a> &nbsp;
						<img src="/zone_b2b/images/ba_10.gif" width="79" height="21"
							alt="" />
						&nbsp;
						<img src="/zone_b2b/images/mf.gif" width="23" height="12"
							align="top" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="980" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="358" height="27"
			background="/zone_b2b/images/xueyuan_03.gif">
			&nbsp;

		</td>
		<td width="622" background="/zone_b2b/images/xueyuan_04.gif">
			<table width="622" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="76" align="center">
						<a href="/" class="bt"><bean:message key="str1030"/></a>
					</td>
					<td width="76" align="center">
						<a href="/zone_b2b/supply" class="bt"><bean:message key="str2025"/></a>
					</td>
					<td width="76" align="center">
						<a href="/zone_b2b/stock" class="bt"><bean:message key="str2026"/></a>
					</td>
					<td width="76" align="center">
						<a href="/zone_b2b/enterprise" class="bt"><bean:message key="str2027"/></a>
					</td>
					<td width="77" align="center">
						<a href="/zone_b2b/news" class="bt"><bean:message key="str2028"/></a>
					</td>
					<td width="77" align="center">
						<a href="/zone_b2b/talents" class="bt"><bean:message key="str2029"/></a>
					</td>
					<td width="80" align="center">
						<a href="/zone_b2b/school/" class="bt"><bean:message key="str2030"/></a>
					</td>
					<td width="84" align="center">
						<a href="http://soft.xsaas.com/" class="bt"><bean:message key="str3605"/></a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="980" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="38" align="right"
			background="/zone_b2b/images/xueyuan_06.gif" class="lanse_renceitop">
			<a href="sch_list.jsp" class="lanse"><bean:message key="str5074"/></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="solveList.jsp" class="lanse"><bean:message key="str5076"/></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="sch_knowlist.jsp?repository_type=4" class="lanse"><bean:message key="str5032"/></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="sch_piclist.jsp" class="lanse"><bean:message key="str5084"/></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="sch_knowlist.jsp?repository_type=3" class="lanse"><bean:message key="str5086"/></a>
			&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>
<table width="980" height="72" border="0" align="center" cellpadding="0"
	cellspacing="0" background="/zone_b2b/images/xueyuan_07.gif">
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="55" background="/zone_b2b/images/xyuan_07.gif"
						class="lanse_renceibt">
						<form name="searchForm" id="searchForm" action="search_list.jsp"
							method="post">
							&nbsp;&nbsp;<bean:message key="str5082"/>
							<input name="keyword" type="text" class="cs" value="请输入您查找的关键字"
								size="48" onblur="checkKey()"
								onmousedown="javascript:this.value=''" />
							&nbsp;
							<input type="submit" name="Submit" value="搜 索" class="ss"
								onclick="return checkRelation()" />
						</form>
					</td>
					<td width="407" valign="top">
						<a href="sch_list_req.jsp"><img
								src="/zone_b2b/images/xyuan_08.gif" width="406" height="71" />
						</a>
						<map name="Map" id="Map">
							<area shape="rect" coords="5,22,89,47" href="sch_list_req.jsp" />
						</map>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

