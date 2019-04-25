<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.ahbay.commenMgr.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.base.config.ProjectConfig"%>
<%
	String keyWord = "";
	ArrayList custArray = new ArrayList();
	if (request.getParameter("keyword") != null) {
		keyWord = request.getParameter("keyword");
		keyWord=new String(keyWord.getBytes("ISO-8859-1"),"GBK"); 
		Custinfo custEntity = new Custinfo();
		custArray = custEntity.getCustomByStockSeach(keyWord);
	}
	 String menu_idx = "";
    if (request.getParameter("menu_id") != null)
    {
        menu_idx = request.getParameter("menu_id");
    }
	ParamethodMgr comparList = new ParamethodMgr();
	HashMap compMap = comparList.getCompareInfoByCode("CRM", "cust_type");
%>

<html>
	<head>
		<title><bean:message key="str182"/></title>
	  <link href="/style/css.css" rel="stylesheet" type="text/css">
	  
	</head>
	<script language="javascript">
		function confirmremove()
		{
			if(confirm('是否确认修改客户级别？')) 
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		function checkInfo()
		{
			 var keys=document.getElementById("keyword").value;
			 if(keys==""||keys=="."||keys==",")
			 {
			  alert("请认真填写客户名称！");
			  return false;
			 }
		 return true;
		}
</script>

	<body>
		<div>
			<form action="index.jsp" method="post">
				<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center">
				  <tr>
					  <td align="right" width="40%">
								<bean:message key="str1271"/>
						</td>
						<td align="left" width="25%">
								<input type="text" name="keyword" id="keyword" size="30" maxlength="50">
					  </td>
					  <td align="left" width="25%">
								<input type="submit" value="提交" onclick="return checkInfo()">
								<input type="hidden"  name="menu_id" value="<%=menu_idx%>">
						</td>
						<td align="left" width="10%">
								&nbsp;
						</td>
					</tr>
				</table>
			</form>
		</div>
		<table width="727" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%" >
					<bean:message key="str3289"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="13%">
					<bean:message key="str3238"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="7%">
				<bean:message key="str1273"/>
				</td>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="10%">
					<bean:message key="str1257"/>
				</td>
			</tr>
			<% 
				if (custArray != null && custArray.size() > 0) 
				{ 
					int i = 0;
					for (Iterator inIt = custArray.iterator(); inIt.hasNext();)
					{
						HashMap map = (HashMap) inIt.next();
						String cust_id = "";
						String cust_name = "";
						String cust_type = "";
						String cust_state = "正常";
						String cust_addr = "";
						cust_id = map.get("cust_id").toString();
						cust_name = map.get("cust_name").toString();
						if (map.get("cust_type") != null) 
						{
					       cust_type = map.get("cust_type").toString();
						}
					 
					%>
					<tr style="background-color:#f9f9f9; " >
						<td class="ping1" style=" color:#000000;" align="left">
							<%=cust_name%>
						</td>
						<td style=" color:#000000;" align="center">
							<%=compMap.get(cust_type)%>
						</td>
						<td style=" color:#000000;" align="center">
							<%=cust_state%>
						</td>
						 
						<td style=" color:#000000;" align="center">
							<a
								href="modifyRank.jsp?cust_id=<%=cust_id%>&cust_name=<%=cust_name%>" target="_bank">
								<img src="/img/edit.gif" width="16" height="16"> </a>
						</td>
					</tr>
				<%
					i++;
					}
				}
			%>
		</table>
	<body>
</html>
