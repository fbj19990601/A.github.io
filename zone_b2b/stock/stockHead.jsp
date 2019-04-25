<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="date" class="com.saas.biz.commen.DateFormatByString" scope="page" />
<%
String dateTime=date.getDateTimeNow();
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="23" align="center" background="/zone_b2b/images/ba_02.gif">
			<table width="980" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<a onclick="var strHref=window.location.href;this.style.behavior='url(http://www.xsaas.com)';this.setHomePage('http://www.xsaas.com');"  style="cursor:hand">set for Homepage</a> | <a href="javascript:window.external.AddFavorite('http://www.xsaas.com', 'Glass Baba')">put"Glass Baba"Add to Favorites</a> | <%=dateTime%>
					</td>
					<td align="right">
						<img src="/zone_b2b/images/Max.gif" width="15" height="12" align="absmiddle" />
						<bean:message key="str5096"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="70">
			<img src="/zone_b2b/images/ba_13.gif" alt="" width="148" height="42" />
		</td>
		<td align="right" valign="bottom">
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right">
						<img src="/zone_b2b/images/zx0.gif" width="73" height="19" border="0" />
						<img src="/zone_b2b/images/hd.gif" width="55" height="19" />
						<a href="/"><img src="/zone_b2b/images/ba_06.gif" width="56" height="21" alt="Login" /></a>
						&nbsp;
						<a href="/Newcregister.jsp"><img src="/zone_b2b/images/ba_08.gif" width="79" height="21" alt="Sign up for free" /></a>
						&nbsp;
						<img src="/zone_b2b/images/ba_10.gif" width="79" height="21" alt="" />
						&nbsp;
						<img src="/zone_b2b/images/mf.gif" width="23" height="12" align="top" />
					</td>
				</tr>
				<tr>
					<td height="36" align="right">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="86">
									<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DCDCDC">
										<tr>
											<td height="26" align="center" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
												<a href="#" class="cpbt"><bean:message key="str2722"/></a>
											</td>
										</tr>
									</table>
								</td>
								<td width="6"></td>
								<td width="86">
									<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DCDCDC">
										<tr>
											<td height="26" align="center" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
												<a href="#" class="cpbt"><bean:message key="str2727"/></a>
											</td>
										</tr>
									</table>
								</td>
								<td width="6"></td>
								<td width="86">
									<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DCDCDC">
										<tr>
											<td height="26" align="center" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
												<a href="#" class="cpbt"><bean:message key="str5098"/></a>
											</td>
										</tr>
									</table>
								</td>
								<td width="6"></td>
								<td width="86">
									<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DCDCDC">
										<tr>
											<td height="26" align="center" background="/zone_b2b/images/Content_03.gif" bgcolor="#FFFFFF">
												<a href="#" class="cpbt"><bean:message key="str5098"/></a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
