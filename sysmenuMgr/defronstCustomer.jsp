<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.ahbay.commenMgr.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%
	String meun_idx = "";
	String iStart = "1";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	Custinfo custEntity = new Custinfo();
	ArrayList custArray = custEntity.getCustListByState(Integer
			.valueOf(iStart).intValue(), "1");
	int counter = custEntity.getCustStateNumber("1");
	int pages = counter / 30+1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage) {
		if (currenPage > 0) {
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
%>
<html>
	<head>
		<meta name="Generator"
			content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str182"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
			h1 {float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
		</style>
	</head>
	<script language="javascript">
  function chechIfo()
  {
	   if(confirm('Are you sure to Defrosting the member？')) 
	{
		return true;
	}
	else
	{
		return false;
	}
  }
</script>
<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
            WinLIKE.definewindows=mydefss;
            function mydefss() {
            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
            	j.Vis=false;
            	j.Nam='appwin';
            	WinLIKE.addwindow(j);
            };
</SCRIPT>
	<body>
		<table width="727" border="0" cellpadding="2" cellspacing="1"
			align="center" bgcolor="#e7e7e7">
			<tr>
				<td class="line1"style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"align="center" align="center" width="25%">
					<bean:message key="str617"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%">
					<bean:message key="str618"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%">
					<bean:message key="str607"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="30%">
					<bean:message key="str608"/>
				</td>
				<td
					style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"align="center" width="10%">
					<bean:message key="str621"/>
				</td>
			</tr>
			<%
			    if (custArray != null && custArray.size() > 0) {
					int i = 0;
					for (Iterator inIt = custArray.iterator(); inIt.hasNext();) {
						HashMap map = (HashMap) inIt.next();
						String cust_id = "";
						String cust_name = "";
						String phone = "";
						String website = "";
						String cust_addr = "";
						cust_id = map.get("cust_id").toString();
						cust_name = map.get("cust_name").toString();
						if (map.get("group_contact_phone") != null) {
					      phone = map.get("group_contact_phone").toString();
						}
						if (map.get("company_address") != null) {
					      cust_addr = map.get("company_address").toString();
						}
						if (map.get("website") != null) {
					      website = map.get("website").toString();
						}
					%>
					<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onMouseOver="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')"	onMouseOut="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
						<td style=" color:#000000;" align="left"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%></a></td>
						<td style=" color:#000000;" align="left"><%=phone%></td>
						<td style=" color:#000000;" align="left"><%=website%></td>
						<td style=" color:#000000;" align="left"><%=cust_addr%></td>
						<td style=" color:#000000;" align=center><a href="/doTradeReg.do?cust_id=<%=cust_id%>&cust_state=0&trade_type_code=0167" target="_self" onClick="return chechIfo()"><img src=/img/defrost.gif width=16	height=16 border=0 alt="Defrosting"></a></td>
					</tr>
					<%
					i++;
					}
					%>
					<tr>
						<td align="left" colspan="2" class="line1"style="font-weight:normal"><bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/></td>
						<td align="right" colspan="2"><a href="defronstIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str613"/> </a>&nbsp;&nbsp;<a href="defronstIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str614"/></a>	&nbsp;<a href="defronstIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str615"/></a>&nbsp;<a href="defronstIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str616"/></a></td>
					</tr>
					<%
			}
			%>
		</table>
	<body>
</html>
