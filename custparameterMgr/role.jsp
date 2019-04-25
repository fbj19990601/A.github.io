<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.roleMgr.RoleInfo" scope="page" />
<%
	String enitity = "";
	if (request.getParameter("type") != null) {
		enitity = request.getParameter("type");
	}
	
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	ArrayList list = comm.getRoleInfoByType(cust_id,enitity);
	int size=0;
%>
<html>
	<head>
		<title><bean:message key="str1846"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		#tr{
		 background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;
		}
		#tr1{
		 background-color:#f6f6f6; color:#000000; font-size:12px;
		}
		#tr2{
		 background-color:#ffffff; color:#000000; font-size:12px;
		}
		</style>
	</head>
	<body>
		<table width=100% border=0 cellpadding=1 cellspacing=1 align=center bgcolor="#dddddd">
			<tr id="tr">
				<td align="center" width="50%"><bean:message key="str3359"/></td>
				<td align="center" width="50%"><bean:message key="str3359"/></td>
			</tr>
			<%if(list != null && list.size() > 0) {
			    size=list.size();
			    Iterator it = list.iterator();
			    int i=0;
				while(it.hasNext()) {
				    HashMap map1=new HashMap();
				    HashMap map2=new HashMap();
				    String level_code1="";
				    String level_name1="";
				    String level_code2="";
				    String level_name2="";
				    if(it.hasNext()){
				     map1=(HashMap)it.next();
				     if(map1.get("role_code")!=null){level_code1=map1.get("role_code").toString();}
				     if(map1.get("role_name")!=null){level_name1=map1.get("role_name").toString();}
				    }
				    if(it.hasNext()){
				     map2=(HashMap)it.next();
				     if(map2.get("role_code")!=null){level_code2=map2.get("role_code").toString();}
				     if(map2.get("role_name")!=null){level_name2=map2.get("role_name").toString();}
				    
				    }
					%>
			         <tr id="tr2">
				     <td align="left" width="50%" style="display: inline;text-align: left">
				     <%if(level_name1 !=null && !level_name1.equals("")){
				       i++;
				      %>
					   <input type="checkbox" value="<%=level_code1%>" name="role<%=i%>" id="role<%=i%>"><%=level_name1%>
					   <%}%>
				     </td>
				     <td align="left" width="50%" style="display: inline;float: left">
					  <%if(level_name2 !=null && !level_name2.equals("")){ 
					   i++;
					  %>
					   <input type="checkbox"  value="<%=level_code2%>" name="role<%=i%>" id="role<%=i%>"><%=level_name2%>
					   <%}%>
				     </td>
			       </tr>
			  <%}
			}
			%>
			<input type="hidden" name="role" id="role" value="<%=size%>">
		</table>
	</body>
</html>



