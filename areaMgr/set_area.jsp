<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.setareaMgr.SetAreaList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<title>group-data</title>
	</head>
	<body>
	<%
       String channels_id="",cust_id="";
       HttpSession seion=request.getSession();
       if(seion.getAttribute("SESSION_CUST_ID")!=null){
         cust_id=(String)seion.getAttribute("SESSION_CUST_ID");       
       }
       HashMap channels=bean.getCompareInfoByCode("CRM","channels_type");
       if(request.getParameter("channels_id") != null) {
		channels_id = request.getParameter("channels_id");
	   }
	   SetAreaList group=new SetAreaList();
	   ArrayList list=group.getInfoById(cust_id,channels_id);
	   int size=0;
	   String table = "<table width=100% border=0 cellspacing=1 cellpadding=0><tr style=text-align:left; font-weight:bold;margin-left: 5px;bgcolor=#B4B4B4><td bgcolor=#B4B4B4 colspan=3 width='90%' color=#FFFFFF><img src=/img/delUser.png border=0>以下是你所选的片区,如果要进行删除操作，请选中要删除的记录后，点击删除按钮！</td><td align=right bgcolor=#B4B4B4 width='10%'><input type=button name=dbtn value=删除 onclick=delCustomer()></td></tr>";
	   table=table+"<tr><td width='10%' align=center bgcolor=#efefef><input type=checkbox id=checkAll name=checkAll value=全选 onclick=seleAll()>全选</td>"+
	   "<td width='35%' align=center bgcolor=#efedef>片区名称</td><td width='20%' align=center bgcolor=#efefef>渠道类型</td><td width='20%' align=center bgcolor=#efefef>是否排斥</td></tr></tr>";
	   if(list !=null && list.size()>0){
	     size=list.size();
	    for (int i = 0; i < list.size(); i++) {
	      HashMap map=(HashMap)list.get(i);
	      String channels_type="",area_name="",area_code="",exc_tag="";
	      if(map.get("channels_type")!=null){
	        channels_type=map.get("channels_type").toString();
	        if(channels.get(channels_type)!=null){
	          channels_type=channels.get(channels_type).toString();
	        }
	      }
	      if(map.get("area_name")!=null){area_name=map.get("area_name").toString();}
	      if(map.get("area_code")!=null){area_code=map.get("area_code").toString();}
	      if(map.get("exc_tag")!=null){
	         exc_tag=map.get("exc_tag").toString();
	         exc_tag=exc_tag.equals("0")?"不排斥":"排斥";
	      }
	      if(i%2==0){
			 table=table+"<tr><td align=center ><input type=checkbox value="+area_code+" name=ckbx"+i+"  id=ckbx"+i+"</td><td align=left>"+area_name+"</td><td align=left>"+channels_type+"</td><td align=left>"+exc_tag+"</td></tr>";
		    }else{
			 table=table+"<tr><td align=center bgcolor=#efefef><input type=checkbox value="+area_code+" name=ckbx"+i+"  id=ckbx"+i+"</td><td align=left bgcolor=#efedef>"+area_name+"</td><td align=left bgcolor=#efefef>"+channels_type+"</td><td align=left bgcolor=#efedef>"+exc_tag+"</td></tr>";
		  }
	    }
	   }
	   table=table+"<input type=hidden name=size id=size value="+size+"></table>";
	   out.print(table);
     %>
	</body>
</html>
