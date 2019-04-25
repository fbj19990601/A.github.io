<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.custMgr.Custinfo" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!--------------------------------<bean:message key="str3284"/>------------------------------------------------->
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str4086"/></title>
	</head>
<script language="javascript">
  function chechIfo()
  {
	if(confirm('是否确认推荐招聘？')) 
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
<h1><bean:message key="str3284"/></h1>
<div class="line6">
                  <div class="img"><img src="/images/icon3_manager_rightbody.gif" /></div><span class="title"><bean:message key="str3284"/></span><br />
                                             <bean:message key="str3286"/><br />
                                             <bean:message key="str3287"/>                          
                                                                       </div>  
<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
  <tr>    
    <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="7%"><bean:message key="str3288"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align="center" width="25%"><bean:message key="str3289"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align="center" width="20%"><bean:message key="str3290"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align="center" width="35%"><bean:message key="str3291"/></td>
    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align="center" width="10%"><bean:message key="str3940"/></td>
  </tr>
<%
    Custinfo	  custEntity=new Custinfo();
    ArrayList custArray = custEntity.getCustListByResume();
	if(custArray != null  && custArray.size()>0)
	{
		int i=0;
		for (Iterator inIt = custArray.iterator(); inIt.hasNext();)
	    {
		    HashMap map = (HashMap) inIt.next();
		    String cust_id="";
		    String cust_name="";
		    String phone="";
		    String cust_addr="";
	   	    cust_id=map.get("cust_id").toString();
	   	    cust_name=map.get("cust_name").toString();
	   	    if(map.get("group_contact_phone")!=null)
	   	    {
	   	      phone=map.get("group_contact_phone").toString();
	   	    }
	   	    if(map.get("company_address")!=null)
	   	    {
	   	      cust_addr=map.get("company_address").toString();
	   	    }
   %>
	<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=cust_id%>" onMouseOver="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#ffffff','DIV')" onMouseOut="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#f9f9f9','DIV')">
	<td style=" color:#000000;" align="center"><%=String.valueOf(i+1)%></td>
    <td style=" color:#000000;" align="left"><%=cust_name%></td>
    <td style=" color:#000000;" align="left"><%=phone%></td>
     <td style=" color:#000000;" align="center"><%=cust_addr%></td>
	<td style=" color:#000000;" align="center"><a href=/doTradeReg.do?cust_id=<%=cust_id%>&trade_type_code=0331 target="_self"  onClick="return chechIfo()"><img src=/img/edit.gif width=16 height=16 border=0></a></td>
    </tr>
	<%
	   i++;
		}
	}
   %>
   <tr><td   colspan=7 >&nbsp;</td></tr>
</table>
	<body>
</html>
