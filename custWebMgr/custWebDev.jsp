<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page contentType="text/html;charset=GBK"%>



<html>

<head>

<title><bean:message key="str4718"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">

</head>

<body>

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

    if( request.getParameter("menu_id")!= null)

    {

       meun_idx=request.getParameter("menu_id");

    }

    

   RelationCcInfo relation=new RelationCcInfo();

   ArrayList relationList =new ArrayList();

   ParamethodMgr paramObj=new ParamethodMgr();

   relationList=relation.getRelationByCustId(Integer.parseInt(iStart),cust_id);

    int counter=relation.getRelationNumber(cust_id);

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

			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=left width="17%"><bean:message key="str1225"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="14%"><bean:message key="str3531"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="19%"><bean:message key="str3432"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="41%"><bean:message key="str2319"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="9%"><bean:message key="str1954"/></td>

		        </tr>

		        <%

		            if(relationList != null && relationList.size()>0)

		            {    int i=0;

		              	 for (Iterator it = relationList.iterator(); it.hasNext();)

		                  {

						        HashMap map = (HashMap) it.next();

						        String act_Customer="";

						        if(map.get("cust_name")!=null){

						          act_Customer=map.get("cust_name").toString();

						        }

						        String act_Cust="";

						        if(map.get("obj_cust_id")!=null){

						          act_Cust=map.get("obj_cust_id").toString();

						        }

						        String act_Phone="";

						        if(map.get("group_contact_phone")!=null){

						          act_Phone=map.get("group_contact_phone").toString();

						        }

						        String act_Email="";

						        if(map.get("email")!=null){

						          act_Email=map.get("email").toString();

						        }

						        String act_Addr="";

						        if(map.get("company_address")!=null){

						          act_Addr=map.get("company_address").toString();

						        }

						        %>

						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">

					              <td  style=" color:#3300FF;font-weight: 12px; padding:2px 5px;" align=left><a href="/actionMgr/custActList.jsp?cust_id=<%=act_Cust%>&menu_id=<%=meun_idx%>"><%=act_Customer%></a></td>

					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=act_Phone%></td>

					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=act_Email%></td>

					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=act_Addr%></td>

					              <td  style=" color:#000000;" align=center><a href="search.jsp?user_id=&obj_cust_id=<%=act_Cust%>&cust_name=<%=act_Customer%>&email=<%=act_Email %>&phone=<%=act_Phone%>&com_addr=<%=act_Addr %>"><img src=/img/views.png width=16 height=16 border=0 alt="搜索客户动态情报"></a></td>

					            </tr>

						        <%i++;

					     }

					     %>

					     

					     <tr>

							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp; &nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>

							<td  align="right" colspan="3"  style=" padding:2px 5px;">
							<a href="custWebDev.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str1030"/></a>&nbsp; &nbsp;
							<% 
								if(Integer.parseInt(iStart)>0){
							%>
								<a href="custWebDev.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;
							<%
								}
								if(Integer.parseInt(iStart)<pages-1){
							%>
								<a href="custWebDev.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"><bean:message key="str1032"/> </a>&nbsp; 
							<%
								}
							%>
							<a  href="custWebDev.jsp?iStart=<%=pages-1%>&menu_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>

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