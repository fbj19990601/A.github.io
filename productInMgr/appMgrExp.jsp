<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<%@ page import="com.saas.biz.actionMgr.ActionMgr"%>
<%@ page import="com.saas.biz.appMgr.AppInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page contentType="text/html;charset=GBK"%>



<html>

<head>

<title><bean:message key="str2389"/></title>

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

   GoodsInfo goodsInfo = new GoodsInfo();
   AppInfo appInfo = new AppInfo();
   ArrayList actionList =new ArrayList();
   actionList=appInfo.getAllApp(Integer.valueOf(iStart).intValue(),cust_id,"2");
   int counter=appInfo.getAllApp(cust_id,"2");
   
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

			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str2390"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str2391"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str2392"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str2393"/></td>
		        </tr>

		       <%	
		            if(actionList != null && actionList.size()>0)
		            {    
		              	 for (int i=0;i<actionList.size();i++)
		                  {
						        HashMap map = (HashMap)actionList.get(i);
						        String app_id="",app_no="",goods_id="",app_date="",goods_name="";
						        if(map.get("app_id")!=null){
						         app_id=map.get("app_id").toString();
						        }
						        if(map.get("app_no")!=null){
						         app_no=map.get("app_no").toString();
						        }
						        if(map.get("goods_id")!=null){
						         goods_id=map.get("goods_id").toString();
						         HashMap map1 = goodsInfo.getOneGoods(cust_id,goods_id);
						         if(map1.get("goods_name")!=null){
						         	goods_name = map1.get("goods_name").toString();
						         }
						        }
						        if(map.get("app_date")!=null){
						         app_date=map.get("app_date").toString().substring(0,10);
						        }
						        
						        %>
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000; padding:2px 5px;" align=left><a href="/appMgr/disApp.jsp?app_id=<%=app_id %>"><%=app_no%></a></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=goods_name%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=app_date%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><a href="prodishouse.jsp?app_id=<%=app_id %>"><img src="/img/edit.png"></a></td>
					            </tr>
						        <%
					     }
					     %>
					     <tr>
							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str612"/></td>
							<td  align="right" colspan="2" style=" padding:2px 5px;"><a href="prodishouseIndex.jsp?iStart=0&menu_id=<%=menu_id%>"><bean:message key="str613"/> </a>&nbsp; &nbsp;<a href="prodishouseIndex.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_id%>"><bean:message key="str614"/></a> &nbsp;<a href="prodishouseIndex.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_id%>"><bean:message key="str615"/> </a>&nbsp; <a  href="prodishouseIndex.jsp?iStart=<%=pages%>&menu_id=<%=menu_id%>"><bean:message key="str616"/></a></td>
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