<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><%@ 
taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%><%@ 
taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%><%@ 
page import="com.saas.biz.userMgr.*"%><%@ 
page contentType="text/html;charset=utf-8"%><% 

// ���ָ�����û����Ƿ���ڣ���ҳ������ AJAX
String username = request.getParameter("u");
if(username == null || username.length() == 0)
{
	out.print("0");
	out.close();
}
else
{
	UserCheckMgr userMgr = new UserCheckMgr();
	boolean result = userMgr.Exists(username);
	
	if(result)
		out.print("1");
	else
		out.print("0");
	
}
%>