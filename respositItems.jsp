<%@ page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.sort.*"%>
<% 
String classid = request.getParameter("classid");
if(classid == null || classid.length() == 0)
	classid = "000000000000000";
custSortMgr sort = new custSortMgr();
ArrayList list = sort.getResposityTypes(classid);
if(list != null && list.size()>0)
{
	int count = list.size();
	//  class_id, up_class_id, class_level, class_name
	for(int index = 0; index < count; index++)
	{
		HashMap item = (HashMap)list.get(index);
		out.print(item.get("class_id"));
		out.print(",");
		out.print(item.get("up_class_id"));
		out.print(",");
		out.print(item.get("class_level"));
		out.print(",");
		out.print(item.get("class_name"));
		if(index < count - 1)
			out.println();
	}
}
%>