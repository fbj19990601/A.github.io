<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationUuMgr.RelationUUInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str1652"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
   HttpSession  logsession = request.getSession(); 
    String user_id = "";
    String iStart ="0";
    String meun_idx="";
   
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
    
   RelationUUInfo relation=new RelationUUInfo();
   ArrayList relationList =new ArrayList();
   ParamethodMgr paramObj=new ParamethodMgr();
   relationList=relation.getContactList(Integer.parseInt(iStart),user_id,"1");
    int counter=relation.getContactSum(user_id,"1");
    int pages=counter/30+1;
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
			        	<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="14%"><bean:message key="str1765"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="8%"><bean:message key="str1766"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="17%"><bean:message key="str3290"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="18%"><bean:message key="str3432"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="32%" ><bean:message key="str3433"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" ><bean:message key="str156"/></td>
		        </tr>
		        <%
		            if(relationList != null && relationList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = relationList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String cust_name="";
						        String sex="";
						        String contact_phone="";
						        String email="";
						        String home_addr="";
						        String cust_id="";
						        String user="";
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("cust_id") != null)
						        {
						           
						           cust_id=map.get("cust_id").toString();
						        }
						        if(map.get("user_id") != null)
						        {
						           user=map.get("user_id").toString();
						        }
						        if(map.get("sex") != null)
						        {
						           sex=map.get("sex").toString();
						           if(sex=="0" || sex.equals("0")){
						             sex="ÄÐ";
						           }else{
						             sex="Å®";
						           }
						        }
						        if(map.get("phone") != null)
						        {
						           contact_phone=map.get("phone").toString();
						        }
						        if(map.get("email") != null)
						        {
						           email=map.get("email").toString();
						        }
						        if(map.get("home_addr") != null)
						        {
						           home_addr=map.get("home_addr").toString();
						        }
						        %>
						        
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td align="left"  style=" color:#000000;padding:2px 5px;"><a href="modifyUserInfo.jsp?cust_id=<%=cust_id%>&user_id=<%=user%>&view=view" target=blank><%=cust_name%></a></td>
					              <td  style=" color:#000000;" align=center><%=sex%></td>
					              <td  style=" color:#000000;padding:2px 5px;" align=left><%=contact_phone%></td>
					              <td align=left  style=" color:#000000;padding:2px 5px;"><%=email%></td>
					              <td  style=" color:#000000;padding:2px 5px;" align=left><%=home_addr%></td>
					              <td  style=" color:#000000;" align=center><a href="modifyUserInfo.jsp?cust_id=<%=cust_id%>&user_id=<%=user%>"  ><img src=/img/edit.gif width=16 height=16 border=0 style="cursor: hand"></a></td>
					            </tr>
						        
						        <%i++;
					     }
					     %>
					     
					    <tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="modify_index.jsp?iStart=0"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="modify_index.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="modify_index.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/></a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="modify_index.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
											
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
