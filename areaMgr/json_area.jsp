<%@ page pageEncoding="GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.AreaInfoMgr.AreaInfo" scope="page" />
<%
	//HttpSession htSe = request.getSession();
	//String cust_id = (String) htSe.getAttribute("SESSION_CUST_ID");
	String json = bean.getJsonDataForTree("12", "Tree-Img");
	out.print(json);
%>
