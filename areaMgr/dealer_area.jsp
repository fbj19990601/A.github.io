<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<title><bean:message key="str1200"/></title>
	</head>
	<body>
		<%
			HttpSession httpSess = request.getSession();
			String cust_id = (String) httpSess.getAttribute("SESSION_CUST_ID");
			String channels_id ="";
			if(request.getParameter("channels_id")!=null){
				channels_id = request.getParameter("channels_id");
			}
			RelationCcInfo area = new RelationCcInfo();
			ArrayList list = area.getCoustomerInfoByArea(cust_id, "0",channels_id);//ȡ���Ѽ�Ƭ���ľ�����
			ArrayList joinList = area.getCoustomerByArea(cust_id, "");//ȡ��δ��Ƭ���ľ�����
			
			int size = 0, join = 0;
			String table = "<table width=100% border=0 cellspacing=1 cellpadding=0><tr style=text-align:left; font-weight:bold;margin-left: 5px;bgcolor=#B4B4B4><td bgcolor=#B4B4B4 colspan=3 width='90%' color=#FFFFFF><img src=/img/delUser.png border=0>����������ѡ�������Ѵ��ڵľ�����,���Ҫ����ɾ����������ѡ��Ҫɾ���ļ�¼�󣬵��ɾ����ť��</td><td align=right bgcolor=#B4B4B4 width='10%'><input type=button name=dbtn value=ɾ�� onclick=delCustomer()></td></tr>";
			table = table
					+ "<tr><td width='10%' align=center bgcolor=#efefef><input type=checkbox id=checkAll name=checkAll value=ȫѡ onclick=seleAll()>ȫѡ</td>"
					+ "<td width='35%' align=center bgcolor=#efedef>����������</td><td width='20%' align=center bgcolor=#efefef>�����̵绰</td><td width='20%' align=center bgcolor=#efefef>E-mail</td></tr>";
			if (list != null && list.size() > 0) {
				size = list.size();
				for (int i = 0; i < list.size(); i++) {
					HashMap map = (HashMap) list.get(i);
					String obj_cust_id = "", cust_name = "", phone = "", email = "";
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
					}
					if (i % 2 == 0) {
				table = table
						+ "<tr><td align=center ><input type=checkbox value="
						+ obj_cust_id + " name=ckbx" + i + "  id=ckbx"
						+ i + "</td><td align=left>" + cust_name
						+ "</td><td align=left>" + phone
						+ "</td><td align=left>" + email + "</td></tr>";
					} else {
				table = table
						+ "<tr><td align=center bgcolor=#efefef><input type=checkbox value="
						+ obj_cust_id + " name=ckbx" + i + "  id=ckbx"
						+ i + "</td><td align=left bgcolor=#efedef>"
						+ cust_name
						+ "</td><td align=left bgcolor=#efefef>"
						+ phone
						+ "</td><td align=left bgcolor=#efedef>"
						+ email + "</td></tr>";
					}
				}
			}
			String tablej = "<tr style=text-align:left; font-weight:bold;margin-left: 5px;bgcolor=#B4B4B4><td bgcolor=#B4B4B4 colspan=3 width='90%' color=#FFFFFF><img src=/img/addUser.png border=0>����Խ����¾�������ӵ�����ѡ�ķ�����,���Ҫ���в�������ѡ�еľ����̼�¼�󣬵����Ӱ�ť��</td><td align=right  bgcolor=#B4B4B4 width='10%'><input type=button name=abtn value=��� onclick=addCustomer()></td></tr>"
					+ "<tr><td width='10%' align=center bgcolor=#efefef><input type=checkbox id=checkjoin name=checkjoin value=ȫѡ onclick=addAll()>ȫѡ</td>"
					+ "<td width='35%' align=center bgcolor=#efedef>����������</td><td width='20%' align=center bgcolor=#efefef>�����̵绰</td><td width='20%' align=center bgcolor=#efefef>E-mail</td></tr>";
			if (joinList != null && joinList.size() > 0) {
				join = joinList.size();
				for (int i = 0; i < joinList.size(); i++) {
					HashMap map = (HashMap) joinList.get(i);
					String obj_cust_id = "", cust_name = "", phone = "", email = "";
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
					}
					if (i % 2 == 0) {
				tablej = tablej
						+ "<tr><td align=center ><input type=checkbox value="
						+ obj_cust_id + " name=ckbxj" + i
						+ "  id=ckbxj" + i + "</td><td align=left>"
						+ cust_name + "</td><td align=left>" + phone
						+ "</td><td align=left>" + email + "</td></tr>";
					} else {
				tablej = tablej
						+ "<tr><td align=center bgcolor=#efefef><input type=checkbox value="
						+ obj_cust_id + " name=ckbxj" + i
						+ "  id=ckbxj" + i
						+ "</td><td align=left bgcolor=#efedef>"
						+ cust_name
						+ "</td><td align=left bgcolor=#efefef>"
						+ phone
						+ "</td><td align=left bgcolor=#efedef>"
						+ email + "</td></tr>";
					}
				}
			}
			table = table + tablej
					+ "</table><input type=hidden id=count name=count value="
					+ size + "><input type=hidden id=join name=join value="
					+ join + ">";
			out.print(table);
		%>
	</body>
</html>
