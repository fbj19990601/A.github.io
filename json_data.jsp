<%@ page pageEncoding="GBK"%>
<jsp:useBean id="vbean" class="com.saas.biz.productclassMgr.ProductclassMgr" scope="page" />
<%
	//HttpSession htSe = request.getSession();
	//String class_type = (String) htSe.getAttribute("SESSION_CLASS_TYPE");
	String json = vbean.getJsonDataForTree("1","000000000000000", "Tree-Img");
	out.print(json);
%>
