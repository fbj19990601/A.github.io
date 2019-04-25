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
	  HttpSession  logsession = request.getSession(); 
      String cust_id="",class_id="",group_type="",user_id="";
      if (logsession.getAttribute("SESSION_USER_ID") != null)
	  {
	        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
	  }
      if(request.getParameter("cust_id") != null) {
		cust_id = request.getParameter("cust_id");
	   }
	   if(request.getParameter("class_id") != null) {
		class_id = request.getParameter("class_id");
	   }
	   if(request.getParameter("group_type") != null) {
		group_type = request.getParameter("group_type");
	   }
	   GroupInfo group=new GroupInfo();
	   ArrayList list=group.getGroupString(cust_id,class_id,group_type);
	   ArrayList joinList=group.getGroupForJoin(cust_id,class_id,group_type);
	    //����Ѵ��ڵ��û�ID
	   ArrayList isExistCust=new ArrayList();
	   int size=0,join=0;
	   String table = "<table width=100% border=0 cellspacing=1 cellpadding=0><tr style=text-align:left; font-weight:bold;margin-left: 5px;bgcolor=#B4B4B4><td bgcolor=#B4B4B4 colspan=3 width='90%' color=#FFFFFF><img src=/img/delUser.png border=0>����������ѡȺ�����Ѵ��ڵ���ϵ��,���Ҫ����ɾ����������ѡ��ɾ���ļ�¼�󣬵��ɾ����ť��</td><td align=right bgcolor=#B4B4B4 width='10%'><input type=button name=dbtn value=ɾ�� onclick=delCustomer()></td></tr>";
	   table=table+"<tr><td width='10%' align=center bgcolor=#efefef><input type=checkbox id=checkAll name=checkAll value=ȫѡ onclick=seleAll()>ȫѡ</td>"+
	   "<td width='35%' align=center bgcolor=#efedef>��ϵ������</td><td width='20%' align=center bgcolor=#efefef>��ϵ�˵绰</td><td width='20%' align=center bgcolor=#efefef>E-mail</td></tr>";
	   if(list !=null && list.size()>0){
	     size=list.size();
	    for (int i = 0; i < list.size(); i++) {
			HashMap map = (HashMap) list.get(i);
			String obj_cust_id = "", cust_name = "", phone = "",email="";
			if (map.get("cust_id") != null) {
				obj_cust_id = map.get("cust_id").toString();
			}
			isExistCust.add(obj_cust_id);
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
			 table=table+"<tr><td align=center ><input type=checkbox value="+obj_cust_id+" name=ckbx"+i+"  id=ckbx"+i+"</td><td align=left>"+cust_name+"</td><td align=left>"+phone+"</td><td align=left>"+email+"</td></tr>";
		    }else{
			 table=table+"<tr><td align=center bgcolor=#efefef><input type=checkbox value="+obj_cust_id+" name=ckbx"+i+"  id=ckbx"+i+"</td><td align=left bgcolor=#efedef>"+cust_name+"</td><td align=left bgcolor=#efefef>"+phone+"</td><td align=left bgcolor=#efedef>"+email+"</td></tr>";
		    }
		}
	   }
	   String tablej = "<tr style=text-align:left; font-weight:bold;margin-left: 5px;bgcolor=#B4B4B4><td bgcolor=#B4B4B4 colspan=3 width='90%' color=#FFFFFF><img src=/img/addUser.png border=0>����Խ�������ϵ����ӵ�����ѡ��Ⱥ����,��ѡ����ϵ�˼�¼�󣬵����Ӱ�ť��</td><td align=right  bgcolor=#B4B4B4 width='10%'><input type=button name=abtn value=��� onclick=addCustomer()></td></tr>"+
	   "<tr><td width='10%' align=center bgcolor=#efefef><input type=checkbox id=checkjoin name=checkjoin value=ȫѡ onclick=addAll()>ȫѡ</td>"+
	   "<td width='35%' align=center bgcolor=#efedef>��ϵ������</td><td width='20%' align=center bgcolor=#efefef>��ϵ�˵绰</td><td width='20%' align=center bgcolor=#efefef>E-mail</td></tr>";
	   if(joinList !=null && joinList.size()>0){
	     join=joinList.size();
	     for (int i = 0; i < joinList.size(); i++) {
			HashMap map = (HashMap) joinList.get(i);
			String obj_cust_id = "", cust_name = "", phone = "",email="";
			if (map.get("cust_id") != null) {
				obj_cust_id = map.get("cust_id").toString();
			}
			if(isExistCust.contains(obj_cust_id)){
			  continue;
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
			 tablej=tablej+"<tr><td align=center ><input type=checkbox value="+obj_cust_id+" name=ckbxj"+i+"  id=ckbxj"+i+"</td><td align=left>"+cust_name+"</td><td align=left>"+phone+"</td><td align=left>"+email+"</td></tr>";
		    }else{
			 tablej=tablej+"<tr><td align=center bgcolor=#efefef><input type=checkbox value="+obj_cust_id+" name=ckbxj"+i+"  id=ckbxj"+i+"</td><td align=left bgcolor=#efedef>"+cust_name+"</td><td align=left bgcolor=#efefef>"+phone+"</td><td align=left bgcolor=#efedef>"+email+"</td></tr>";
		    }
		}
	   }
	   table=table+tablej+"</table><input type=hidden id=count name=count value="+size+"><input type=hidden id=join name=count value="+join+">";
	   out.print(table);
     %>
	</body>
</html>
