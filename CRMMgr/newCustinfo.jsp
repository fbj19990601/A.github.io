<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str116"/></title>
</head>
<body>
<% 
	HttpSession logsession = request.getSession();
	String cust_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	Custinfo custInfo = new Custinfo();
	ArrayList custList = custInfo.getIncludeJspByCustId(cust_id,"1");
%>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag1">
  <tr>
    <td><table width="708" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
            <tr>
              <td width="40%">&nbsp;<span class="biaoti"><bean:message key="str167"/></span></td>
              <td width="20%" align="center" class="table_left_right_xian"><span class="biaoti"><bean:message key="str313"/></span></td>
              <td width="16%" align="center"><span class="biaoti"><bean:message key="str1141"/></span></td>
              <td width="24%" align="center" class="table_left_right_xian"><span class="biaoti"> Email</span></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <table width="708" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td height="200" valign="top" bgcolor="#FFFFFF"><!--//ÖØ¸´-->
              <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
              	<% 
			  	String obj_cust_id="",cust_name="",update_time="",phone="",com_addr="",email="",start_date="";
			  	if(custList!=null && custList.size()>0){
			  		for(int i = 0;i<custList.size();i++){
			  			HashMap custMap = (HashMap)custList.get(i);
			  			if(custMap.get("cust_id")!=null){obj_cust_id=custMap.get("cust_id").toString();}
			  			if(custMap.get("cust_name")!=null){cust_name=custMap.get("cust_name").toString();}
			  			if(custMap.get("update_time")!=null){update_time=custMap.get("update_time").toString();}
			  			if(custMap.get("group_contact_phone")!=null){phone=custMap.get("group_contact_phone").toString();}
			  			if(custMap.get("email")!=null){email=custMap.get("email").toString();}
			  			if(custMap.get("company_address")!=null){com_addr=custMap.get("company_address").toString();}
			  			if(custMap.get("start_date")!=null){start_date=custMap.get("start_date").toString().substring(0,10);}
			  %>
                <tr>
                  <td width="40%">&nbsp;<span class="list_news"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id %>" TARGET=appwin onclick="mydefss()"><%=cust_name %></a></span></td>
                  <td width="20%" align="center" bgcolor="F9F9F9" class="table_left_right_xian"><%=phone %></td>
                  <td width="16%" align="center"><%=start_date %></td>
                  <td width="24%" align="center" bgcolor="F9F9F9" class="table_left_right_xian"><span  class="shanchu"><a href=mailto:<%=email %>><%=email %></a></span></td>
                </tr>
                <%
			  		}
			  	}
			  %>   
              </table>
            <!--ÖØ¸´//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>

</body>
</html>