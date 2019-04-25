<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<%@ page import="com.saas.biz.conUseMgr.ConUseInfo"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page contentType="text/html;charset=GBK"%>



<html>

<head>

<title><bean:message key="str1136"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GoodsInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
	.bord{
		border-style: none;
	}
</style>
</head>

<body>

<%

   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String menu_id="";

    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }

    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }

    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }

   UserInfo userInfo = new UserInfo();
   ConUseInfo useInfo = new ConUseInfo();
   ArrayList actionList =new ArrayList();
   actionList=useInfo.getAllConuse(Integer.valueOf(iStart).intValue(),cust_id);
   int counter=useInfo.getAllConuse(cust_id);
   
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

	<table width="100%" border="0" cellspacing="0" cellpadding="0">

	  <tr>

	    <td height="13" align="left">

	    </td>

	  </tr>

	  <tr>

	    <td>

		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">

		        <tr>

			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="70%">领用人<bean:message key="str1578"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%">回收<bean:message key="str1579"/></td>
		        </tr>

		       <%	
		            if(actionList != null && actionList.size()>0)
		            {    
		              	 for (int i=0;i<actionList.size();i++)
		                  {
						        HashMap map = (HashMap)actionList.get(i);
						        String con_id="",obj_cust_id="",con_date="",con_class="",con_class1="";
						        String user_name="";
						        if(map.get("con_id")!=null){
						         con_id=map.get("con_id").toString();
						        }
						        if(map.get("obj_cust_id")!=null){
						         obj_cust_id=map.get("obj_cust_id").toString();
						         user_name = userInfo.getUserNameById(obj_cust_id);
						        }
						        if(map.get("con_date")!=null){
						         con_date=map.get("con_date").toString();
						        }
						        if(map.get("con_class")!=null){
						         con_class=map.get("con_class").toString();
						        }
						        if(con_class.equals("0")){
						        	con_class1="人力资源";
						        }else if(con_class.equals("1")){
						        	con_class1="销售";
						        }else if(con_class.equals("2")){
						        	con_class1="采购";
						        }else if(con_class.equals("3")){
						        	con_class1="运输";
						        }			        %>
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000; padding:2px 5px;" align=left><%=user_name%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><a href="addConback.jsp?obj_cust_id=<%=obj_cust_id %>"><img src="/img/edit.png" style="cursor: hand;" border="0"></a></td>
					            </tr>
						        <%
					     }
					     %>
				         <tr>
								<td  align="left" colspan="1" style="font-weight:normal; padding:2px 5px;"><bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str1029"/></td>
								<td  align="right" colspan="1"  style=" padding:2px 5px;">
								<a href="index.jsp?iStart=0"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
								<% 
								if(Integer.parseInt(iStart)>0){
								%>
								<a href="index.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
								<%
								}
								if(Integer.parseInt(iStart)<pages-1){
								%>
								<a href="index.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/> </a>&nbsp; 
								<%
								}
								%>
								<a  href="index.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
						</tr>
					 <%}
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
	
</body>
</html>