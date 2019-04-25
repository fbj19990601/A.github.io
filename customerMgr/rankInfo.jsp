<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.custMgr.Custinfo" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.rightMgr.TradeInterface "%>
<%
    String iStart ="0",menu_id="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    TradeInterface inter = new TradeInterface();
    Custinfo custEntity=new Custinfo();
    ArrayList custArray = custEntity.getCustListByAll(Integer.valueOf(iStart).intValue());
    int counter=custEntity.getCustListNumber();
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
	 
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str1918"/></title>

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
 
<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
  <tr>    
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" class="line1" align="center" width="30%"><bean:message key="str2320"/></td>     
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="23%"><bean:message key="str1255"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="27%"><bean:message key="str4715"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="25%"><bean:message key="str4098"/></td>
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
		    String group_contact_phone="";
		    String develope_channel="";
		    String publish_date="";
	   	    cust_id=map.get("cust_id").toString();
	   	    cust_name=map.get("cust_name").toString();
	   	    if(map.get("group_contact_phone")!=null)
	   	    {
	   	      group_contact_phone=map.get("group_contact_phone").toString();
	   	    }
	   	    if(map.get("develope_channel")!=null)
	   	    {
	   	      develope_channel=map.get("develope_channel").toString();
	   	      develope_channel = inter.comCodetoName("DEV_MAN",develope_channel);
	   	    }
	   	    if(map.get("publish_date")!=null)
	   	    {
	   	      publish_date=map.get("publish_date").toString();
	   	    }
	   	   
   %>
	<tr  style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onMouseOver="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onMouseOut="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	     <td style=" color:#000000;" align="left">
	        <a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=cust_id%>&user_id=" target="_blank" class="ping1"><%=cust_name%></a>
	     </td>
	     <td style=" color:#000000;" align="center"><%=group_contact_phone%></td>
	     <td style=" color:#000000;" align="center"><%=develope_channel%></td>
	     <td style=" color:#000000;" align="center"><%=publish_date%></td>
    </tr>
	<%
		i++;}
		%>
		<tr>

							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>&nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>

							<td  align="right" colspan="3"  style=" padding:2px 5px;">
							<a href="Custlist.jsp?iStart=0"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
							<% 
								if(Integer.parseInt(iStart)>0){
							%>
								<a href="Custlist.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
							<%
								}
								if(Integer.parseInt(iStart)<pages-1){
							%>
								<a href="Custlist.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/> </a>&nbsp; 
							<%
								}
							%>
							<a  href="Custlist.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>

				         </tr>
		<%
	}
   %>
</table>
	<body>
</html>
