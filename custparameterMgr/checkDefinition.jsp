<%@ page pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.custDefinitionMgr.CustomerDefinitionInfo" scope="page" />
<%
	HttpSession htSe = request.getSession();
	String cust_id = (String) htSe.getAttribute("SESSION_CUST_ID");
	String code = "",result="0";
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	ArrayList list=bean.checkCustomerDefinition(cust_id,code);
	  if(list !=null && list.size()>0){
	     result="1";
	   }
	  out.print(result);
	 %>
