<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
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
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
  UserInfo userObj=new UserInfo();
  ArrayList userList =userObj.getUserListByCust(Integer.valueOf(iStart).intValue(),cust_id,"0");
  ParamethodMgr paramObj=new ParamethodMgr();
  HashMap sexMap=paramObj.getCompareInfoByCode("CRM","sex");
    int counter=userObj.getUserNumber(cust_id,"0");
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
<html>
<head>
<title>www.21oil.com</title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">

<script language="javascript">
  function chechIfo()
  {
	   if(confirm('To confirm whether or not to freeze the membership?')) 
	{
		return true;
	}
	else
	{
		return false;
	}
  }
</script>
</head>
<body>
<jsp:include page="/inc/linkMenuInclude.jsp">
<jsp:param name="menu_id" value="fBx626AK587h2t1lX536" />
</jsp:include>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13"></td>
	  </tr>
	  <tr>
	    <td>
		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">username </td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="10%">sex</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="15%">Phone</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="15%">birthday</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="25%">Address</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="10%" >update</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="10%" >delete</td>
		        </tr>
		        <%
		            if(userList != null && userList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = userList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String user_id=map.get("user_id").toString();
						        String user_name="";
						        String sex="";
						        String phone="";
						        String home_addr="";
						        String birthday="";
						        String cust_idx=map.get("cust_id").toString();
						        if(map.get("user_name") != null)
						        {
						           user_name=map.get("user_name").toString();
						        }
						         if(map.get("phone") != null)
						        {
						           phone=map.get("phone").toString();
						        }
						        if(map.get("sex") != null)
						        {
						           sex=map.get("sex").toString();
						           if(sexMap.get(sex)!=null)
						           {
						               sex=sexMap.get(sex).toString();
						           }
						        }
						        if(map.get("home_addr") != null)
						        {
						           home_addr=map.get("home_addr").toString();
						           home_addr=home_addr.replaceAll("<[^<>]+>","");
							      if(home_addr.length()>16)
							      {
							        home_addr=home_addr.substring(0,16)+"...";
							      }
						        }
						        if(map.get("birthday") != null)
						        {
						           birthday=map.get("birthday").toString();
						           if(birthday.length()>10)
						           {
						             birthday=birthday.substring(0,10);
						           }
						        }
						        %>
						        
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000; padding:2px 5px;" align=left><a href="modify.jsp?user_id=<%=user_id%>"target="_blank"><%=user_name%></a></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=center><%=sex%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=phone%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=center><%=birthday%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=home_addr%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=center><a href=modifyLianInfo.jsp?cust_id=<%=cust_idx%>&user_id=<%=user_id%> TARGET=_blank><img src=/img/edit.gif width=16 height=16 border=0 style="cursor: hand" alt="Edit user details"></a></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=center><a href="/doTradeReg.do?trade_type_code=6900&user_id=<%=user_id%>" target="_self"><img src="/img/del.gif" border="0" title="Click on the staff will write-off">					              		</a></td>
					            </tr>
						        
						        <%i++;
					     }
					     %>
					     
					    <tr>

																		<td  align="left" colspan="3" style="font-weight:normal; padding:2px 5px;">Total <%=counter%> Article  &nbsp; page <%=Integer.parseInt(iStart)+1 %>&nbsp;&nbsp; total <%=pages%> pages</td>
											
																		<td  align="right" colspan="4"  style=" padding:2px 5px;">
																		<a href="modifyUserIndex.jsp?iStart=0">first </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="modifyUserIndex.jsp?iStart=<%=pageUp%>">pre</a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="modifyUserIndex.jsp?iStart=<%=pageDown%>">next </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="modifyUserIndex.jsp?iStart=<%=pages-1%>">last</a></td>
											
															         </tr>

					     
					     <%
		          }else{
		          %>
		          	<tr bgcolor="white">
										<td colspan="7" align="center"><b>No employee records!</b></td>
							 </tr>
		          <%
		          }
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