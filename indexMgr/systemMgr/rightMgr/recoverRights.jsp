<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<meta name="Generator"
			content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str3268"/>(http://soft.xsaas.com)</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认回收')) 
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>
	<body>
		<h5></h5>
		<br>
		<table width="100%" border="0" cellpadding="10" cellspacing="1"
			align="center" bordercolor="#D1D1D1">
			<tr>
				<td class="grayD" align="center" width="8%">
					<bean:message key="str3288"/>
				</td>
				<td class="grayD" align="center" width="30%">
					<bean:message key="str3939"/>
				</td>
				<td class="grayD" align="center" width="20%">
					<bean:message key="str3940"/>
				</td>
			</tr>
			<%
			    TradeInterface tradeInfo=new TradeInterface(); 
				ArrayList ClassList = new ArrayList();
				RightInfo rightsInfo = new RightInfo();
				String menu_id = request.getParameter("menu_id");
				String menu_class = request.getParameter("menu_class");
				ClassList = rightsInfo.getRightInfoByMenuId(menu_id);
				int xuhao = 0;
				if (ClassList != null && ClassList.size() > 0) 
				{
					for (Iterator its = ClassList.iterator(); its.hasNext();) 
					{
						xuhao = xuhao + 1;
						String class_code = "";
						String class_name = "";
						HashMap classMap = (HashMap) its.next();
						class_code = classMap.get("cust_class").toString();
						class_name = tradeInfo.codeToName("cust_class",class_code);
						%>
						<tr>
							<td class="grayBL" align="left">
								<%=xuhao%>
							</td>
							<td class="grayBL" align="left">〖<%=class_name%>〗
							</td>
							<td class="grayBL" align="left">
								<a	href="/doTradeReg.do?trade_type_code=0907&class_code=<%=class_code%>&menu_id=<%=menu_id%>&menu_class=<%=menu_class%>" target="_self" onClick="return confirmremove()">
									 <bean:message key="str3990"/></a>【<%=class_name%>】
							</td>
						</tr>
						<%
				     }
				}
			%>
		</table>
	<body>
</html>
