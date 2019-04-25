<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.actionMgr.ActionMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="cust" class="com.saas.biz.custMgr.Custinfo" scope="page" />
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
	ActionMgr action = new ActionMgr();
	ArrayList custList = action.getNewAction(cust_id,"2");
%>


<!--最新竞争情报-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag4">
  <tr>
    <td><table width="708" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
          <tr>
            <td width="24%">&nbsp;<span class="biaoti"><bean:message key="str1842"/></span></td>
            <td width="60%" class="table_left_right_xian">&nbsp;<span class="biaoti"><bean:message key="str2268"/></span></td>
            <td width="16%" align="center"><span class="biaoti"><bean:message key="str1839"/></span></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="708" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td height="200" valign="top" bgcolor="#FFFFFF"><!--//重复-->
            <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
            	<% 
			  	String own_id="",title="",content="",publish_date="",cust_name="",entity_id="";
			  	if(custList!=null && custList.size()>0){
			  		for(int i = 0;i<custList.size();i++){
			  			HashMap custMap = (HashMap)custList.get(i);
			  			if(custMap.get("publish_date")!=null){publish_date=custMap.get("publish_date").toString().substring(0,10);}
			  			if(custMap.get("content")!=null){content=custMap.get("content").toString();}
			  			if(custMap.get("title")!=null){title=custMap.get("title").toString();}
			  			if(custMap.get("entity_id")!=null){entity_id=custMap.get("entity_id").toString();}
			  			if(custMap.get("own_id")!=null){
			  				own_id=custMap.get("own_id").toString();
			  				cust_name = cust.getCustNameById(own_id);
			  			}
			  %>
              <tr>
                <td width="24%">&nbsp;<span class="list_news"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=own_id %>" TARGET=appwin onclick="mydefss()"><%=cust_name %></a></span></td>
                <td width="60%" bgcolor="F9F9F9" class="table_left_right_xian">&nbsp;<span class="list_news">
                	<a href="/actionMgr/disAction.jsp?entity_id=<%=entity_id %>" TARGET=appwin onclick="mydefss()">
						<%=title %><img src="/images/new.gif">
					</a></span></td>
                <td width="16%" align="center"><%=publish_date %></td>
              </tr>
             <%
			  		}
			  	}
			  %>   
            </table>
            <!--重复//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>

</body>
</html>