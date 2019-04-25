<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="java.util.*"%>
<%
	Custinfo in = new Custinfo();
	ArrayList List2 = in.getMaxCustByNo(); 
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="26" align="center" bgcolor="#FEF3DC" class="bthong">
			<bean:message key="str5108"/>
			<a href="#" class="lanse"></a>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFC367">
	<tr>
		<td height="180" align="center" bgcolor="#FFFFFF">
			<table width="94%" border="0" cellpadding="2" cellspacing="0">
				<tr>
					<td valign="top">
						¡¤
					</td>
					<td valign="top">
						Promotion of free products, free publicity, to find buyers, to make friends easily conduct online trade!
					</td>
				</tr>
			</table>
			<table width="82%" border="0" cellpadding="2" cellspacing="0">
				<tr>
					<td>
						<a href="/Newcregister.jsp"><img src="/zone_b2b/images/an_03.gif" width="119" height="27" alt="Sign up for free" border="0"></a>
					</td>
				</tr>
			</table>
			<table width="96%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="20" class="xian"></td>
				</tr>
			</table>
			<table width="94%" border="0" cellpadding="2" cellspacing="0">
				<tr>
					<td valign="top">
						¡¤
					</td>
					<td valign="top">
						Would like to quickly carry out on-line trade, enhance sales ?
					</td>
				</tr>
				<tr>
					<td valign="top">
						¡¤
					</td>
					<td valign="top">
						<bean:message key="str2222"/>
						<strong>0550-8*******</strong>
					</td>
				</tr>
			</table>
			<table width="82%" border="0" cellpadding="2" cellspacing="0">
				<tr>
					<td>&nbsp;
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="5"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="2" height="24">
			<img src="/zone_b2b/images/ba_132.gif" width="2" height="24" alt="">
		</td>
		<td align="center" background="/zone_b2b/images/ba_133.gif">
			<span class="bthong"><bean:message key="str5109"/></span>
		</td>
		<td width="2">
			<img src="/zone_b2b/images/ba_135.gif" width="2" height="24" alt="">
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="FFC367">
	<tr>
		<td height="180" valign="top" bgcolor="#FFFFFF">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<%
					if (List2 != null && List2.size() > 0) {
					for (int i = 0; i < List2.size() && i <6; i++) {
						HashMap map = (HashMap) List2.get(i);
						String cust_name = "", news_cust_id = "", class_name = "";
						if (map.get("cust_id") != null) {
							news_cust_id = map.get("cust_id").toString();
						}
						if (map.get("cust_name") != null) {
							cust_name = map.get("cust_name").toString();
							if(cust_name.length()>13){cust_name=cust_name.substring(0,13);}
						}
						if (map.get("class_name") != null) {
							class_name = map.get("class_name").toString();
						}
			%>
				<tr>
					<td>
						<a href="/enterpriseMgr/InterimPages.jsp?cust_id=<%=news_cust_id%>" target=_blank class="bt1"><%=cust_name%></a>
						<img src="/zone_b2b/images/Max.gif" width="15" height="12" align="middle" />
						<br>
						<span class="STYLE2"><bean:message key="str5110"/><%=class_name%>...</span>
					</td>
				</tr>
				<tr>
					<td height="1" class="xian"></td>
				</tr>
				<%
				}
			}
			%>
			</table>
		</td>
	</tr>
</table>
<table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
</table>
<table width="100%" height="90" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="90">
			<img src="/zone_b2b/images/160x200.gif" width="228" height="125">
		</td>
	</tr>
</table>
<table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
	<tr>
		<td height="120" align="center" bgcolor="#FFFFFF">
			Search google search engine advertising
		</td>
	</tr>
</table>
