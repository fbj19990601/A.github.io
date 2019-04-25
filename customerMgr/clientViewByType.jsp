<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.groupInfoMgr.GroupInfo"%>
<html>
	<head>
		<title>group-data</title>
	</head>
	<body>
	<%
      String cust_id="",class_id="",group_type="",iStart="0";
      if(request.getParameter("cust_id") != null) {
		cust_id = request.getParameter("cust_id");
	   }
	   if(request.getParameter("class_id") != null) {
		class_id = request.getParameter("class_id");
	   }
	   if(request.getParameter("group_type") != null) {
		group_type = request.getParameter("group_type");
	   }
	    if(request.getParameter("iStart") != null) {
		 iStart = request.getParameter("iStart");
	   }
	   GroupInfo group=new GroupInfo();
	   ArrayList list=group.getGroupCusString(iStart,cust_id,class_id,group_type);
	   
	   int counter = group.getGroupCusString(cust_id,class_id,group_type);
	   int pages=counter/20+1;
	   int pageUp=0,pageDown=0;
	   int currenPage=Integer.valueOf(iStart).intValue();
	   if(pages>currenPage)
	      {
	         if(currenPage>0)
	         {
		        pageUp=currenPage-1;
	         }
		        pageDown=currenPage+1;
	         }
             else if(pages==currenPage)
	         {
	            pageUp=currenPage-1;
	            pageDown=currenPage;
	   }
	   ///ArrayList joinList=group.getGroupForJoin(cust_id,class_id,group_type);
	   int size=0,join=0;
	   String table = "<table width=100% border=0 cellspacing=1 cellpadding=0>";
	   table=table+"<tr>"+
	   "<td width='35%' align=center bgcolor=#efedef>客户名称</td><td width='20%' align=center bgcolor=#efefef>客户电话</td><td width='20%' align=center bgcolor=#efefef>E-mail</td></tr>";
	   if(list !=null && list.size()>0){
	     size=list.size();
	    for (int i = 0; i < list.size(); i++) {
			HashMap map = (HashMap) list.get(i);
			String obj_cust_id = "", cust_name = "", phone = "",email="";
			if (map.get("cust_id") != null) {
				obj_cust_id = map.get("cust_id").toString();
			}
			if (map.get("email") != null) {
				email = map.get("email").toString();
			}
			if (map.get("cust_name") != null) {
				cust_name = map.get("cust_name").toString();
				cust_name="<a href=/customerMgr/Custinfo.jsp?obj_cust_id="+obj_cust_id+"&user_id= target=_blank>"+cust_name+"</a>";
			}
			if (map.get("group_contact_phone") != null) {
				phone = map.get("group_contact_phone").toString();
			}if(i%2==0){
			 table=table+"<tr><td align=left>"+cust_name+"</td><td align=left>"+phone+"</td><td align=left>"+email+"</td></tr>";
		    }else{
			 table=table+"<tr><td align=left bgcolor=#efedef>"+cust_name+"</td><td align=left bgcolor=#efefef>"+phone+"</td><td align=left bgcolor=#efedef>"+email+"</td></tr>";
		    }
		}
	   }
	   
	   table=table+"</table><input type=hidden id=count name=count value="+size+"><input type=hidden id=join name=count value="+join+">";
	   out.print(table);
     %>
     <table>
     <tr>
		<td  align="left" colspan="2" style=" padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
		<td  align="left" colspan="4" style=" padding:2px 5px;">
		<a href="javascript:getpages('0')"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
		<a href="javascript:getpages('<%=pageUp%>')"><bean:message key="str1031"/></a>&nbsp;
		<a href="javascript:getpages('<%=pageDown%>')"> <bean:message key="str1032"/></a>&nbsp; 
		<a  href="javascript:getpages('<%=pages%>')"><bean:message key="str1033"/></a></td>
	</tr></table>
	</body>
</html>
