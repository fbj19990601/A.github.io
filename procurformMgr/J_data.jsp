<%@ page pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ListConvertToJSON" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.procurformMgr.ProcurformInfo" scope="page" />
<%
	HttpSession se = request.getSession();
	String cust_id = (String) se.getAttribute("SESSION_CUST_ID");
	ArrayList list = new ArrayList();
	list = formBean.getAllProcurform(cust_id);
	int size = 0;
	size=formBean.getProcurforSize(cust_id);
	String json = bean.getJSONByList(list,size);
	response.getWriter().write(json);
%>
