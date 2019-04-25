<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.warnparaMgr.WarnparaInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String user_id="",iStart ="0",warn_type="",mod_id="";
	if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (request.getParameter("warn_type") != null)
    {
        warn_type = request.getParameter("warn_type");
    }
     if (request.getParameter("user_id") != null)
    {
        user_id = request.getParameter("user_id");
    }
	
	HashMap paraMap=bean.getCompareInfoByCode("CRM","mod_type");
	ArrayList list = comm.getParamListByType(user_id,warn_type,Integer.parseInt(iStart));
	int counter=comm.getParamCountByType(user_id,warn_type);
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
%>
<html>
	<head>
		<title><bean:message key="str1368"/></title>
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
		<script type="text/javascript">
		  function deleteDefine(){
			 if(window.confirm("确定要删除所选择记录？")){
			  return true;
			 }else{
			 return false;
		 }
		}
		</script>
	</head>
	<body>
		<table width=100% border=0 cellpadding=1 cellspacing=1 align=center bgcolor="#dddddd">
		<tr id="tr" style="background-color:#f6f6f6; color:#000000;font-weight:bold; font-size:12px;">
			<td  align="center" width="20%"><bean:message key="str4152"/></td>
			<td  align="center" width="15%"><bean:message key="str4153"/></td>
			<td  align="center" width="10%"><bean:message key="str4162"/></td>
			<td  align="center" width="15%"><bean:message key="str4199"/></td>
			<td  align="center" width="10%"><bean:message key="str2677"/></td>
		</tr>
		<%
		 if(list !=null && list.size()>0){
		  for(int i=0;i<list.size();i++){
		   HashMap map=(HashMap)list.get(i);
		   String param_id=map.get("param_id").toString();
		   String param_name=map.get("param_name").toString();
		   String sum_type="",param_door="",mod_type="";
		   if(map.get("sum_type")!=null){
		   sum_type=map.get("sum_type").toString();
		   if(sum_type=="0" || sum_type.equals("0")){sum_type="E-mail";}
		    else if(sum_type=="1" || sum_type.equals("1")){sum_type="底部通知";}
		    else if(sum_type=="2" || sum_type.equals("2")){sum_type="手工查询";}
		   }
		   if(map.get("param_door")!=null){
		     param_door=map.get("param_door").toString();
		   }
		   if(map.get("mod_type")!=null){
		     mod_type=map.get("mod_type").toString();
		     if(paraMap.get(mod_type)!=null){
		       mod_type=paraMap.get(mod_type).toString();
		     }
		   }
		   if(i%2==0){
		    %><tr id="tr2" style="background-color:#f6f6f6; color:#000000; font-size:12px"><%
		   }else{
		    %><tr id="tr1" style="background-color:#ffffff; color:#000000;  font-size:12px;"><%
		   }
		%>
			<td  align="left" width="20%"><a href="viewWarnParam.jsp?param_id=<%=param_id%>" TARGET=appwin onclick="mydefss()"><%=param_name%></a></td>
			<td  align="left" width="15%"><%=mod_type%></td>
			<td  align="left" width="10%"><%=param_door%></td>
			<td  align="left" width="15%"><%=sum_type%></td>
			<td  align="center" width="10%"><a href="/doTradeReg.do?trade_type_code=1176&param_id=<%=param_id%>" target="_self" onclick="return deleteDefine()">
			<img src=/img/del.gif width=16 height=16 border=0 alt="删除"></a></td>
			</tr>
		<%}
		}%>
		<tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;">
																		<bean:message key="str1143"/><%=counter%>
																		<bean:message key="str1144"/> &nbsp;
																		<bean:message key="str1145"/><%=Integer.parseInt(iStart)+1 %>
																		<bean:message key="str1146"/>&nbsp;&nbsp;
																		<bean:message key="str1143"/><%=pages%>
																		<bean:message key="str1146"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="javascript:setparamList('<%=warn_type%>','0')">
																		<bean:message key="str1147"/> </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="javascript:setparamList('<%=warn_type%>','<%=pageUp%>')">
																			<bean:message key="str1148"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="javascript:setparamList('<%=warn_type%>','<%=pageDown%>')">
																			<bean:message key="str1149"/> </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="javascript:setparamList('<%=warn_type%>','<%=pages%>')">
																		<bean:message key="str1150"/></a></td>
											
															         </tr>
		
		
	</table>
	</body>
</html>
