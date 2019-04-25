<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="com.saas.biz.entitypropMgr.EntitypropInfo"%>

<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />

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

   EntitypropInfo entity=new EntitypropInfo();

   ArrayList entityList =entity.getEntityPageByCustId(Integer.valueOf(iStart).intValue(),cust_id,"0");

   HashMap typeMap=bean.getCompareInfoByCode("CRM","entity_type");

    int counter=entity.getEntityCount(cust_id,"0");

    int pages=0;

    if(counter%20==0){

     pages=counter/20;

    }else{

     pages=counter/20+1;

    }

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

<title>电子商务平台<bean:message key="str182"/></title>



		    <link href="/style/layout.css" rel="stylesheet" type="text/css">

<script language="javascript">

  function chechIfo()

  {

	   if(confirm('是否确认删除分类属性？')) 

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

	<table width="100%" border="0" cellspacing="0" cellpadding="0">

	  <tr>

	    <td height="13">&nbsp;</td>

	  </tr>

	  <tr>

	    <td>

		     <table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">

		        <tr>

			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str2450"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str1292"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str1293"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str1294"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="35%"><bean:message key="str1295"/></td>

		        </tr>

		        <%

		            if(entityList != null && entityList.size()>0)

		            {

		              	 for (Iterator it = entityList.iterator(); it.hasNext();)

		                  {

						        HashMap map = (HashMap) it.next();

						        String attr_name="";

						        String entity_type="";

						        String default_value="";

						        String attr_code="";

						        String role_state="有效";

						        if(map.get("attr_name") != null)

						        {

						           attr_name=map.get("attr_name").toString();

						        }

						        if(map.get("attr_code") != null)

						        {

						           attr_code=map.get("attr_code").toString();

						        }

						        if(map.get("entity_type") != null)

						        {

						           entity_type=map.get("entity_type").toString();

						           if(typeMap!=null && typeMap.size()>0){

						             entity_type=typeMap.get(entity_type).toString();

						           }

						        }

						        if(map.get("default_value") != null)

						        {

						           default_value=map.get("default_value").toString();

						        }

						        

						        %>

						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=cust_id%>" onmouseover="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#f9f9f9','DIV')">

					              <td  style=" color:#000000; padding:3px 5px;" align=left><%=attr_name%></td>

					              <td  style=" color:#000000;" align=center><%=default_value%></td>

					              <td  style=" color:#000000;" align=center><%=entity_type%></td>

					              <td  style=" color:#000000;" align=center><%=role_state%></td>

					              <td  style=" color:#000000;" align=center>

					                <a href=updateEntity.jsp?attr_code=<%=attr_code%>&cust=<%=cust_id%> TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="修改属性"></a>&nbsp;&nbsp;&nbsp;

					                <a href=/doTradeReg.do?cust_id=<%=cust_id%>&trade_type_code=1041&attr_code=<%=attr_code%> target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="删除属性"></a>

					              </td>

					            </tr>

						        <%

					     }

					     %>

					     <tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="entityListIndex.jsp?iStart=0"> <bean:message key="str613"/> </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="entityListIndex.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="entityListIndex.jsp?iStart=<%=pageDown%>"><bean:message key="str615"/>  </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="entityListIndex.jsp?iStart=<%=pages-1%>"><bean:message key="str616"/></a></td>
											
															         </tr>


					     <%

		            }

		        %>

		    </table>

	     </td>

	  </tr>

	  <tr>

	    <td height="13">&nbsp;</td>

	  </tr>

	</table>

</body>

</html>