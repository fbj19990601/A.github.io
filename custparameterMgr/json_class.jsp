<%@ page pageEncoding="GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.entityclassMgr.EntityClassInfo" scope="page" />
<%
	HttpSession htSe = request.getSession();
	String cust_id = (String) htSe.getAttribute("SESSION_CUST_ID");
	String type="";
	if(request.getParameter("type")!=null){
	 type=request.getParameter("type");
	}
	String json = bean.getJSONCheckBoxTreeData(cust_id, "000000000000000",type, "Tree-Img");
	out.print(json);
%>
