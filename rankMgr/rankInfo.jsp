<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.custMgr.Custinfo" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%
    String iStart ="0";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
	ParamethodMgr comparList=new ParamethodMgr();
	 HashMap compMap=comparList.getCompareInfoByCode("CRM","cust_type");
    Custinfo	  custEntity=new Custinfo();
    ArrayList custArray = custEntity.getCustListByAll(Integer.valueOf(iStart).intValue());
    int counter=custEntity.getCustListNumber();
    int pages=counter/30;
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
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str4086"/></title>
		
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认注销本条记录？')) 
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
<h1><bean:message key="str3233"/></h1>
<div class="line6">
                         <div class="img"><img src="/images/icon3_manager_rightbody.gif" /></div><span class="title"><bean:message key="str3234"/></span><br />
                                             <bean:message key="str3235"/><br />
                                            <bean:message key="str3236"/>                          
                                                                       </div>
<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
  <tr>  
 
    <td class="line1" style=" background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str3227"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="13%"><bean:message key="str3238"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="7%"><bean:message key="str3239"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="35%"><bean:message key="str3240"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="10%"><bean:message key="str3226"/></td>
  </tr>
<%
	if(custArray != null  && custArray.size()>0)
	{
	            int i=0;
		for (Iterator inIt = custArray.iterator(); inIt.hasNext();)
	    {
		    HashMap map = (HashMap) inIt.next();
		    String cust_id="";
		    String cust_name="";
		    String cust_type="";
		    String cust_state="正常";
		    String cust_addr="";
	   	    cust_id=map.get("cust_id").toString();
	   	    cust_name=map.get("cust_name").toString();
	   	    if(map.get("cust_type")!=null)
	   	    {
	   	      cust_type=map.get("cust_type").toString();
	   	    }
	   	    if(map.get("company_address")!=null)
	   	    {
	   	      cust_addr=map.get("company_address").toString();
	   	    }
   %>
	<tr  style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onMouseOver="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onMouseOut="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	     <td style=" color:#000000;" align="left"><%=cust_name%></td>
	     <td style=" color:#000000;" align="center"><%=compMap.get(cust_type)%></td>
	     <td style=" color:#000000;" align="center"><%=cust_state%></td>
	     <td style=" color:#000000;" align="left" class="ping1"><%=cust_addr%></td>
		<td  style=" color:#000000;" align="center"><!--a href="modifyRank.jsp?cust_id=<%=cust_id%>&cust_name=<%=cust_name%>" target="_bank"-->
			<a href="javascript:void(window.open('modifyRank.jsp?cust_id=<%=cust_id%>&cust_name=<%=cust_name%>','_blank','toolbar=no,scrollbar=no,top=5,right=25,width=700,height=420'));" >
			<img src="/img/edit.gif"  width="16"  height="16" border="0"></a></td>
    </tr>
	<%
		i++;}
		%>
		<tr>
			<td  class="line1" style="font-weight:normal;" align="center" colspan="2"><bean:message key="str3988"/><%=counter%><bean:message key="str1028"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
			<td  align="left" colspan="3"><a href="index.jsp?iStart=0"><bean:message key="str1030"/> </a>&nbsp; &nbsp;<a href="index.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;<a href="index.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/> </a>&nbsp; <a  href="index.jsp?iStart=<%=pages%>"><bean:message key="str1033"/></a></td>
	    </tr>
		<%
	}
   %>
</table>
	<body>
</html>
